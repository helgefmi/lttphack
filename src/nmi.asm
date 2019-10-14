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
	JSL nmi_hud_update
	NOP #2

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

org $00EA79 ; seems unused
NMI_UpdatePracticeHUD:
	REP #$20
	LDX #$80 : STX $2115
	LDA #$6C00 : STA $2116

	LDA #$1801 : STA $4300
	LDA.w #!menu_dma_buffer : STA $4302
	LDX.b #!menu_dma_buffer>>16 : STX $4304
	LDA #$0800 : STA $4305

	LDX #$01 : STX $420B
	SEP #$20
	RTS

warnpc $00EAE5

; The time this routine takes isn't relevant
; since it's never during game play
org $00E36A
	JSL LoadCustomHUDGFX
	PLB : RTL

pullpc
nmi_expand:
	; Enters AI=16
	%a8()

	INC !lowram_nmi_counter
	LDA !lowram_last_frame_did_saveload : BNE .dont_update_counters

	LDA !disabled_layers : TRB $AB : TRB $AC
	%a16()
	LDA $AB : STA $212C

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
	; Movie stuff commented out while it's not needed
;	LDX #$6360 : STX $2116

;	; $7EC700 is the WRAM buffer for this data
;	LDX.w #!ram_movie_hud : STX $4302
;	LDA.b #!ram_movie_hud>>16 : STA $4304
;	LDX #$0040 : STX $4305 ; number of bytes to transfer is 330
;	LDA #$01 : STA $420B ; refresh BG3 tilemap data with this transfer on channel 0

	LDA !ram_doorwatch_toggle : BEQ .noDoorWatch
	LDA #$80 : STA $2115
	LDX #$6500 : STX $2116

	LDX #$1801 : STX $4300
	LDX.w #!dg_dma_buffer : STX $4302
	LDA.b #!dg_dma_buffer>>16 : STA $4304
	LDX #$0100 : STX $4305

	LDA #$01 : STA $420B

.noDoorWatch

	LDX $0219 ; #$6040
	STX $2116

	RTL
