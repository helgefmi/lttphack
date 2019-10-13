pushpc
; HUD
;
; Takes care of drawing the following:
; - Link's hearts and container
; - Enemy's hearts
; - Input display
; - Quick Warp Indicator
; - X/Y Coordinates

; ----------------
; FLOOR INDICATOR
; ----------------

; FloorIndicator quick RTL
;
; This can mess with the HUD, removing parts of it.

org $0AFD2C
	SEP #$30
	RTL


; FloorIndicator.noIndicator quick RTL
org $0AFDB0
	SEP #$30
	RTL

; -------------
; HUD TEMPLATE
; -------------

; HUD Template Hijack
;
; Overrides the following
; $0DFA8E: E2 30  SEP #$30
; $0DFA90: E6 16  INC $16
org $0DFAAE
	JSL hud_template_hook


; -----------------------
; UPDATE HEARTS TEMPLATE
; -----------------------

; UpdateHearts removal
;
; Since the game calls this function twice, once for containers, once for actual hearts,
; and since we do them both at the same time, we only need one call with a hook.
;
; Overriding the following:
; $0DFC26:  20 CB FD  JSR HandleHearts

org $0DFC26
	JSR UpdateHearts_NoHook

!HEART_LAG_EARLY_STOP = $18
; UpdateHearts Hijack
org $0DFDCB
	JSL update_hearts_hook

; Mostly vanilla, but modified to not mess with hud
; in such a way to perform the same number of cycles
; with a little compensation for prac hack lag
UpdateHearts_NoHook:
	LDX #$0000
.next
	LDA $00
	CMP.w #!HEART_LAG_EARLY_STOP+8 : BCC .lessthan1

	SBC #$0008 : STA $00
	LDY #$0004 : JSR .draw
	INX #2
	BRA .next

.lessthan1
	CMP.w #!HEART_LAG_EARLY_STOP+5 : BCC .half
	LDY #$0004
	BRA .draw

.half
	CMP.w #!HEART_LAG_EARLY_STOP+1 : BCC .empty
	LDY #$0002
	BRA .draw

.empty
	RTS

.draw
	CPX #$0014 : BCC .sameLine

	LDX #$0000
	; we need to save at least 4 bytes here (for the hook) without losing cycles
	; vanilla      bytes  cycles
	; LDA $07          2       4
	; CLC              1       2
	; ADC #$0040       3       3
	; STA $07          2       4
	;---------------------------
	;                  8      13

	PHD ;             1       4
	PLD ;             1       5
	NOP ;             1       2
	NOP ;             1       2
	;---------------------------
	;                 4      13
	; hey! we did it!

.sameLine
	; we need the same number of cycles but junk code that does nothing
	; vanilla       bytes  cycles
	; LDA [$0A], Y      2       7
	; TXY               1       2
	; STA [$07], Y      2       7
	;----------------------------
	;                   5      16

	; vanilla       bytes  cycles
	; JSL $BBAAAA       4       8
	; NOP               -       2
	; RTL               -       6
	;----------------------------
	;                   4      16
	; hey! we did it!
	JSL WasteTimeWithHearts
	RTS

!QMARK = $212A
!BLANK_TILE = $24F5
!EMPTY = $207F

macro what_item_is_this()
	fillword !BLANK_TILE : fill 16
	fillword !QMARK : fill 8
	fillword !BLANK_TILE : fill 8
endmacro

org $0DE876 ; Japanese "PENDANTS" text
	dw !BLANK_TILE, !BLANK_TILE, !BLANK_TILE, !BLANK_TILE, !BLANK_TILE

org $0DE928 ; Japanese "CRYSTALS" text
	dw !BLANK_TILE, !BLANK_TILE, !BLANK_TILE, !BLANK_TILE, !BLANK_TILE
org $0DF1C9
	rep 36 : %what_item_is_this()

; these clean up the messy menu tiles in the DO section
org $0DF96B
	dw !BLANK_TILE

org $0DF951
	fillword !BLANK_TILE : fill 12
	fillword !QMARK : fill 8

org $0DF965
	fillword !BLANK_TILE : fill 12
	fillword !QMARK : fill 8

org $0DF979
	fillword !BLANK_TILE : fill 12
	fillword !QMARK : fill 8

org $0DF99B
	dw !QMARK, !QMARK

org $0DF9AF
	dw !QMARK, !QMARK, !QMARK

org $0DF9CD
	dw !BLANK_TILE

org $0DF9D3
	dw !QMARK, !QMARK, !QMARK, !QMARK

org $0DF9E9
	dw !QMARK, !QMARK, !QMARK

org $0DF9F7
	dw !BLANK_TILE

org $0DF9FD
	dw !QMARK, !QMARK, !QMARK

org $0DFA07
	dw !EMPTY

org $0DFA11
	dw !EMPTY

org $0DF829 ; boots location moved
	dw $3521, $3522, $3523, $3524

; remove -LIFE- from HUD
org $0DFEC3
	dw !EMPTY, !EMPTY, !EMPTY, !EMPTY, !EMPTY, !EMPTY

pullpc

; Hud Template Hook
hud_template_hook:
	; Makes sure to redraw hearts.
	STZ !lowram_last_frame_hearts

	%a16()
	JSL draw_counters

	LDA !ram_qw_toggle : BEQ .dont_update_qw
	JSR hud_draw_qw

.dont_update_qw
	SEP #$30
	INC $16
	RTL

WasteTimeWithHearts:
	NOP ; never remove this, it's part of vanilla cycle count
	RTL

heart_lag_extra:

update_hearts_hook:
	LDA !ram_LAG : ASL #5

--	DEC : BNE --

	%ai8()
	LDA.l !ram_doorwatch_toggle : AND $1B : LSR ; set or clear clarry
	LDA #$20 ; HDMA bit
	BCC .noDoorWatch
	LDX $10 : CPX #$0E : BEQ .noDoorWatch
	CPX #$0C : BEQ .noDoorWatch
	TSB $9B
	JSL UpdateGlitchedWindow
	BRA ++

.noDoorWatch
	TRB $9B

++	%i16()
	; Enters: AI=16
	; Keep AI=16 throughout (let subroutines change back/forth)
	%a8()
	LDA !ram_equipment_curhp : CMP !lowram_last_frame_hearts : BEQ .dont_update_hearts
	STA !lowram_last_frame_hearts
	%a16()
	JSR hud_draw_hearts
.dont_update_hearts
	%a16()
	LDA !ram_qw_toggle : BEQ .dont_update_qw
	LDA $E2 : CMP !ram_qw_last_scroll : BEQ .dont_update_qw
	STA !ram_qw_last_scroll

.dont_update_qw

	LDA !ram_enemy_hp_toggle : BEQ .dont_draw_enemy_hp

	JSR hud_draw_enemy_hp

.dont_draw_enemy_hp

	LDA !ram_input_display_toggle : BEQ .dont_update_input_display

	JSR hud_draw_input_display

.dont_update_input_display

	LDA !ram_subpixels_toggle : BEQ .dont_update_subpixels

	JSR hud_draw_subpixels

.dont_update_subpixels

	LDA !ram_misslots_toggle : BEQ .dont_update_misslots

	JSR hud_draw_misslots

.dont_update_misslots
	LDA !ram_xy_toggle : BEQ .dont_update_xy

	JSR hud_draw_xy_display

.dont_update_xy
	%a8()
	LDA !ram_lit_rooms_toggle : BEQ .dont_update_lit_rooms
	LDA #$03 : STA $045A

.dont_update_lit_rooms
	LDA !ram_toggle_lanmola_cycles : BEQ .end

	; Make sure we're indoors and in the boss fight room
	LDA $A0 : CMP.b #$33 : BNE .end
	LDA $1B : BEQ .end

	LDA $0DF0 : CMP.b #$01 : BNE .lanmola2
	LDA $0D80 : CMP.b #$01 : BNE .lanmola2
	LDA !ram_lanmola_cycles : INC : STA !ram_lanmola_cycles

.lanmola2
	LDA $0DF1 : CMP.b #$01 : BNE .lanmola3
	LDA $0D81 : CMP.b #$01 : BNE .lanmola3
	LDA !ram_lanmola_cycles+1 : INC : STA !ram_lanmola_cycles+1

.lanmola3
	LDA $0DF2 : CMP.b #$01 : BNE .draw_cycles
	LDA $0D82 : CMP.b #$01 : BNE .draw_cycles
	LDA !ram_lanmola_cycles+2 : INC : STA !ram_lanmola_cycles+2

.draw_cycles
	%a16()
	JSR hud_draw_lanmola_cycles

.end
	%ai16()
	RTL


hud_draw_lanmola_cycles:
	LDA !ram_lanmola_cycles+0 : AND #$00FF : ORA #$2090 : STA $7EC810
	LDA !ram_lanmola_cycles+1 : AND #$00FF : ORA #$2090 : STA $7EC812
	LDA !ram_lanmola_cycles+2 : AND #$00FF : ORA #$2090 : STA $7EC814
	RTS



hud_draw_hearts:
	; Assumes: X=16

	; Check if we have full hp
	%a8()
	LDA !ram_equipment_maxhp : SEC : SBC !ram_equipment_curhp : CMP.b #$04 : BCS .not_full_hp

	%a16()
	LDA #$24A0
	BRA .draw_hearts

.not_full_hp
	%a16()
	LDA #$24A1

.draw_hearts
	; Heart gfx
	STA !POS_MEM_HEART_GFX

	; Full hearts
	LDA !ram_equipment_curhp : AND #$00FF : LSR #3 : JSL hex_to_dec : LDX.w #!POS_HEARTS : JSL draw2_white_lttp

	; Quarters
	LDA !ram_equipment_curhp : AND #$0007 : ORA #$3490 : STA $7EC704, X

	; Container gfx
	LDA #$24A2 : STA !POS_MEM_CONTAINER_GFX

	; Container
	LDA !ram_equipment_maxhp : AND #$00FF : LSR #3 : JSL hex_to_dec : LDX.w #!POS_CONTAINERS : JSL draw2_white_lttp

	RTS


hud_draw_qw:
	LDA $E2 : AND.b #$0006 : CMP.b #$0006 : BEQ .is_qw

	LDA #!EMPTY : STA $7EC80A
	LDA #!EMPTY : STA $7EC80C
	RTS

.is_qw
	LDA #$340C : STA $7EC80A
	LDA #$340D : STA $7EC80C
	RTS


hud_draw_enemy_hp:
	; Assumes: I=16
	; Draw over Enemy Heart stuff in case theres no enemies
	LDA #!EMPTY : STA !POS_MEM_ENEMY_HEART_GFX
	LDX.w #!POS_ENEMY_HEARTS : STA $7EC700, X : STA $7EC702, X : STA $7EC704, X

	LDX #$FFFF

.loop
	INX : CPX #$0010 : BEQ .end
	LDA $0DD0, X : AND #$00FF : CMP #$0009 : BNE .loop
	LDA $0E60, X : AND #$0040 : BNE .loop
	LDA $0E50, X : AND #$00FF : BEQ .loop : CMP #$00FF : BEQ .loop

	; Enemy HP should be in A.
	JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw3_white_aligned_left_lttp

	; Enemy Heart GFX
	LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

.end
	RTS


hud_draw_input_display:
	; Assumes: I=16

	LDA !ram_ctrl1 : CMP !ram_ctrl1_word_copy : BEQ .end

	STA !ram_ctrl1_word_copy : TAY
	LDX #$0000

-	TYA : AND.l ctrl_top_bit_table, X : BEQ +
	LDA.l ctrl_top_gfx_table, X
	BRA ++
+	LDA #!EMPTY
++	STA !POS_MEM_INPUT_DISPLAY_TOP, X
	INX #2 : CPX.w #$000C : BNE -

	LDX #$0000

-	TYA : AND.l ctrl_bot_bit_table, X : BEQ +
	LDA.l ctrl_bot_gfx_table, X
	BRA ++
+	LDA #!EMPTY
++	STA !POS_MEM_INPUT_DISPLAY_BOT, X
	INX #2 : CPX.w #$000C : BNE -

.end
	RTS


hud_draw_xy_display:
	; Assumes: I=16
	%a8()
	LDA #$00
	CLC
	ADC !ram_counters_real
	ADC !ram_counters_lag
	ADC !ram_counters_idle
	ADC !ram_counters_segment
	%a16()
	AND.w #$00FF
	TAX : JSR hud_set_counter_position

	LDA $22 : TAX
	LDA $20 : TAY

	LDA !ram_xy_toggle : CMP #$0001 : BEQ .hex

.dec
	TXA : JSL hex_to_dec_a : TAX
	TYA : JSL hex_to_dec_a : TAY

.hex
	JSL draw_coordinates_3
	RTS


hud_draw_subpixels:
	; Assumes: I=16
	%a8()
	LDA #$00
	CLC
	ADC !ram_counters_real
	ADC !ram_counters_lag
	ADC !ram_counters_idle
	ADC !ram_counters_segment
	ADC !ram_xy_toggle
	%a16()
	AND.w #$00FF
	TAX : JSR hud_set_counter_position

	LDA !ram_subpixels_toggle : AND #$00FF : CMP #$0002 : BEQ .speed

.subpix
	LDA $2A
	JSL draw_xy_single
	RTS

.speed
	LDA $27
	JSL draw_xy_single
	RTS


hud_draw_misslots:

	; Search index / EG (03A4)

	LDX.w #$00C8
	LDA $03C4 : LSR #4 : AND #$000F : ORA #$3010 : STA $7EC708, X
	LDA $03C4 : AND #$000F : ORA #$3010 : STA $7EC70A, X

	LDX.w #$00CC
	LDA $03A4 : LSR #4 : AND #$000F : ORA #$3810 : STA $7EC708, X
	LDA $03A4 : AND #$000F : ORA #$3810 : STA $7EC70A, X


	; Slots

	LDX.w #$0102
	LDY.w #$0000
	LDA #$3C10 : STA !lowram_draw_tmp

.loop
	LDA $0C4A, Y : LSR #4 : AND #$000F : ORA !lowram_draw_tmp : STA $7EC708, X
	LDA $0C4A, Y : AND #$000F : ORA !lowram_draw_tmp : STA $7EC70A, X
	INX #4

	INY
	CPY.w #$0005 : BNE .dont_update_colors
	LDA #$2010 : STA !lowram_draw_tmp

.dont_update_colors
	CPY.w #$000A : BNE .loop


	; Hook timer

	LDX.w #$00D0
	LDY.w #$0000

.loop_2
	LDA $0C5E, Y : LSR #4 : AND #$000F : ORA #$3410 : STA $7EC708, X
	LDA $0C5E, Y : AND #$000F : ORA #$3410 : STA $7EC70A, X
	INX #4
	INY : CPY.w #$0004 : BNE .loop_2

	RTS


hud_set_counter_position:
	LDA.w #!POS_COUNTERS-2

	CPX #$0000 : BEQ .done

.loop
	CLC : ADC #$0040 : DEX : BNE .loop

.done
	STA !lowram_draw_tmp
	RTS


; This is just temprary for the misslots hack
hud_play_error:
	; AI=8
	LDA #$0C : STA $012E
	LDX $039D
	STZ $0C4A,x
	RTL

; L, u, R, Y, X, SL
ctrl_top_bit_table:
	dw #$2000, #$0008, #$1000, #$0040, #$4000, #$0020
ctrl_top_gfx_table:
	dw #$2404, #$2406, #$2405, #$2403, #$2402, #$240A

; l, d, r, B, A, ST
ctrl_bot_bit_table:
	dw #$0002, #$0004, #$0001, #$0080, #$8000, #$0010
ctrl_bot_gfx_table:
	dw #$2409, #$2407, #$2408, #$2401, #$2400, #$240B
