pushpc
; movieformat
; BYST udlr | AXLR 0000 | NNNN NNNN | NNNN NNNN

; compact movieformat (not implemented, not sure if I will)
; BYST udlr | AXLR Pnnn | NNNN NNNN

;org RandomNumGen
;    PHX : PHP
;    JSL movie_rng
;    PLP : PLX
;    RTL

pullpc
; $00 and $01 aren't necessary anymore
; but i'm leaving them in just in case those addresses
; come up in some glitch related to controller input being there
movie_readjoypads:
	STZ $4016

	LDA $4218 : STA $00 : STA $F2 : TAY
	STA.w SA1IRAM.CONTROLLER_1+1
	EOR $FA : AND $F2
	STA $F6 : STY $FA
	STA.w SA1IRAM.CONTROLLER_1_FILTERED+1

	LDA $4219 : STA $01 : STA $F0 : TAY
	STA.w SA1IRAM.CONTROLLER_1+0
	EOR $F8 : AND $F0
	STA $F4 : STY $F8
	STA.w SA1IRAM.CONTROLLER_1_FILTERED+0

RTL

;---------------
	STZ $4016

	LDA $4218 : STA $00
	LDA $4219 : STA $01

	LDA !ram_movie_next_mode : BNE .done

	LDA !ram_movie_mode
	CMP #$01 : BEQ .recording
	CMP #$02 : BEQ .playback

	JSR .set_controller
	BRA .done

.recording
	JSR .set_controller
	JSR movie_record
	RTL

.playback
	JSR movie_playback
	JSR .set_controller

.done
	RTL

.set_controller
	LDA $00 : STA $F2 : TAY

	EOR $FA : AND $F2 : STA $F6 : STY $FA

	LDA $01 : STA $F0 : TAY
	EOR $F8 : AND $F0 : STA $F4 : STY $F8

	LDA $F0 : STA.w SA1IRAM.CONTROLLER_1
	LDA $F2 : STA.w SA1IRAM.CONTROLLER_1+1
	LDA $F4 : STA.w SA1IRAM.CONTROLLER_1_FILTERED
	LDA $F6 : STA.w SA1IRAM.CONTROLLER_1_FILTERED+1

	RTS


movie_record:
	REP #$30
	LDA #$3820 : STA !ram_movie_hud+44
	LDX !ram_movie_index : LDY #$5C00 : JSR movie_hud

	LDX !ram_movie_index : CPX !ram_movie_rng_index : BCS .too_big

	LDA.w SA1IRAM.CONTROLLER_1 : CMP !ram_prev_ctrl : BNE .save_input

	INC !ram_movie_timer
	SEP #$30
	RTS

.too_big
	LDA #$0000 : STA !ram_movie_mode
	JSL movie_clear_hud
	SEP #$30
	RTS

.save_input
	LDA !ram_movie_timer : STA !ram_movie, X
	LDA.l !ram_prev_ctrl : STA !ram_movie+2, X

	INX #4 : STX !ram_movie_index : STX !ram_movie_length
	LDA.w SA1IRAM.CONTROLLER_1 : STA.l !ram_prev_ctrl
	STZ !ram_movie_timer

	SEP #$30
	RTS


movie_playback:
	REP #$30
	LDA #$3C21 : STA !ram_movie_hud+44
	LDX !ram_movie_index : LDY !ram_movie_length : JSR movie_hud

	LDX !ram_movie_index : CPX !ram_movie_length : BCS .stop_playback

	LDA !ram_movie+2, X : XBA : STA $00
	DEC !ram_movie_timer : BMI .nextInput
	SEP #$30
	RTS

.nextInput
	INX #4 : STX !ram_movie_index
	LDA !ram_movie, X : STA !ram_movie_timer
	SEP #$30
	RTS

.stop_playback
	LDA #$0000 : STA !ram_movie_mode
	JSL movie_clear_hud
	STZ $00
	SEP #$30
	RTS


movie_rng:
	LDA !ram_movie_mode : BEQ .RandomNum
	CMP #$01 : BEQ .recording

	REP #$30
	DEC !ram_movie_rng_index
	LDX !ram_movie_rng_index
	LDA !ram_movie, X
	RTL

.recording
	REP #$30
	DEC !ram_movie_rng_index
	LDX !ram_movie_rng_index
	INC !ram_movie_rng_length

	SEP #$20
	JSL .RandomNum : STA !ram_movie, X
	RTL

.RandomNum
	LDA $2137
	LDA $213C : ADC $1A : ADC $0FA1 : STA $0FA1
	RTL


movie_preset_loaded:
	; Enter AI=16
	PHP
	JSL movie_clear_hud

	LDA #$0000 : STA !ram_movie_index : STA.l !ram_prev_ctrl
	LDA #$5CE0 : STA !ram_movie_rng_index ; 7FDD00 is the upper limit
	LDA #$FFFF : STA !ram_movie_timer

	LDA !ram_movie_next_mode : STA !ram_movie_mode
	LDA #$0000 : STA !ram_movie_next_mode

	LDA !ram_movie_mode : CMP #$0002 : BEQ .startPlayback

.startRecord
	LDA #$0000 : STA !ram_movie_rng_length
	SEP #$20 : LDA $1A : STA !ram_movie_framecounter : REP #$20

	PLP
	RTL

.startPlayback
	SEP #$20 : LDA !ram_movie_framecounter : STA $1A : REP #$20

	LDX #$0000
	LDA !ram_movie : CMP #$FFFF : BNE .done
	LDX #$0004 : STX !ram_movie_index

.done
	LDA !ram_movie, X : STA !ram_movie_timer
	PLP
	RTL


movie_hud:
	TYA
	LSR #3 : STA $02
	LSR : STA $04

	TXY
	LDX #$0000

.loop {
		LDA #$2C00
		CPX #$0000 : BEQ .left
		CPX #$000E : BEQ .right

		ORA #$0029 : STA $06
		BRA .size

	  .left
		ORA #$0023 : STA $06
		BRA .size

	  .right
		ORA #$0026 : STA $06

	  .size
		TYA
		BMI .draw
		CMP $02 : BCS .full
		CMP $04 : BCS .half
		BRA .draw

	  .full
		INC $06

	  .half
		INC $06

	  .draw
		SEC : SBC $02 : TAY
		LDA $06 : STA !ram_movie_hud+46, X
		INX #2 : CPX #$0010 : BCC .loop
	}

	RTS


movie_clear_hud:
	LDA #$007F
	LDX #$0040
.loop
	STA !ram_movie_hud, X
	DEX #2 : BPL .loop
	RTL
