pushpc
; NMI
;
; Expands the NMI (code run at the end of each frame)

; NMI hook
org $0080D4
	; 0080D1 LDA #$0000
	; 0080D4 TCD
	; 0080D5 PHK
	; 0080D6 PLB
	JSR nmi_hook

org $008174
LDA $1C : STA $AB : NOP
LDA $1D : STA $AC : NOP

; HUD update hook
org $008B6B
	; 008b6b ldx $0219
	; 008b6e stx $2116
	;JSL nmi_hud_update
	;NOP #2

; NMI HOOK
org $0089C2
nmi_hook:
	TCD : PHK : PLB
	JSL nmi_expand
	RTS

warnpc $0089DF
; Unused $17 function repurposed
org $008C8A
	dw NMI_UpdatePracticeHUD ; $17=0x06

org $00D5C5 ; please be unused
NMI_UpdatePracticeHUD:
	LDX $0116 : LDA $9888, X : STA $2117
	LDA.b #!menu_dma_buffer>>16 : STA $4304
	REP #$20
	LDA #$0080 : STA $2115
	LDA #$1801 : STA $4300
	LDA.w #!menu_dma_buffer : STA $4302
	LDA #$0800 : STA $4305
	LDY #$01 : STY $420B
	TDC : STA.l !menu_dma_buffer
	SEP #$20
	RTS

warnpc $00D60A

org $0098AB : db $64
pullpc
nmi_expand:
	; Enters AI=16
	%a8()

	INC !lowram_nmi_counter
	LDA !lowram_last_frame_did_saveload : BNE .dont_update_counters

	LDA !disabled_layers : TRB $AB : TRB $AC
	%a16()
	LDA $AB : STA $212C
	;LDA $AC : STA $212D

	INC !lowram_room_realtime
	INC !lowram_seg_frames

	; Check if frames == 60
	LDA.w #60
	CMP !lowram_seg_frames : BNE .end

	; If so, reset frames and +1 secs
	STZ !lowram_seg_frames : INC !lowram_seg_seconds

	; Check if secs == 60
	CMP !lowram_seg_seconds : BNE .end

	; If so, reset secs and +1 mins.
	STZ !lowram_seg_seconds : INC !lowram_seg_minutes

.end
	%a8()

	RTL

.dont_update_counters
	STZ !lowram_last_frame_did_saveload
	RTL

nmi_hud_update:
	LDX #$6360 : STX $2116

	; $7EC700 is the WRAM buffer for this data
	LDX.w #!ram_movie_hud : STX $4302
	LDA.b #!ram_movie_hud>>16 : STA $4304

	; number of bytes to transfer is 330
	LDX #$0040 : STX $4305

	; refresh BG3 tilemap data with this transfer on channel 0
	LDA #$01 : STA $420B

	LDX #$6040
	STX $2116
	RTL
