pushpc
; HUD
;
; Takes care of drawing the following:
; - Link's hearts and container
; - Enemy's hearts

; ----------------
; FLOOR INDICATOR
; ----------------

; FloorIndicator quick RTL
;
; This can mess with the HUD, removing parts of it
; just replacing the STA with LDA so we can keep vanilla lag
org $0AFD48
	LDA $7EC7F2 : INC
	LDA $7EC834 : INC
	LDA $7EC832
	LDA #$250F : LDA $7EC7F4

org $0AFD9F
	LDA $7EC7F2, X

org $0AFDA6
	LDA $7EC832, X

; probably leave the INC $16 in
org $0AFDB5 ; change clear location of the timer
	STA $7EC7AA
	STA $7EC7AC
	STA $7EC7EA
	STA $7EC7EC

; Super Bomb/Dig Timers
org $0AFE25 : STA $7EC7AA, X
org $0AFE2C : STA $7EC7EA, X

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

org $0DF195 ; remove heart refill animation
	; vanilla op: STA [$00], Y
	; we have to replace 2 bytes and use 6 cycles
	; contents of accumulator don't matter here
	; while a useless set of ops like XBA : XBA
	; would work, they don't take the super minute
	; difference in memory access speeds into account
	; changing the STA to an LDA does, and it will do it
	; perfectly
	LDA [$00], Y 

org $0DF19C ; ditto above
	LDA [$00], Y

org $0DFC26
	JSR UpdateHearts_NoHook

!HEART_LAG_EARLY_STOP = $19
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

; remove -LIFE- from HUD
org $0DFEC3
	dw !EMPTY, !EMPTY, !EMPTY, !EMPTY, !EMPTY, !EMPTY

pullpc

; Hud Template Hook
hud_template_hook:
	; Makes sure to redraw hearts.
	%a8()
	INC $16
	RTL

WasteTimeWithHearts:
	NOP ; never remove this, it's part of vanilla cycle count
	RTL

heart_lag_extra:

update_hearts_hook:

	%ai8()
	JSL UpdateGlitchedWindow

++	%ai16()
	; Enters: AI=16
	; Keep AI=16 throughout (let subroutines change back/forth)
	JSR hud_draw_hearts

	%a16()
	LDA !ram_enemy_hp_toggle : BEQ .dont_draw_enemy_hp

	JSR hud_draw_enemy_hp

.dont_draw_enemy_hp

	;LDA !ram_misslots_toggle : BEQ .dont_update_misslots

	;JSR hud_draw_misslots

.dont_update_misslots
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
	LDA !ram_lanmola_cycles : INC : STA !ram_lanmola_cycles+0

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
	LDA !ram_lanmola_cycles+0 : AND #$00FF : ORA #$2010 : STA $7EC810
	LDA !ram_lanmola_cycles+1 : AND #$00FF : ORA #$2010 : STA $7EC812
	LDA !ram_lanmola_cycles+2 : AND #$00FF : ORA #$2010 : STA $7EC814
	RTS

hud_draw_hearts:
	; Assumes: X=16

	; Check if we have full hp
	SEP #$21
	LDA !ram_equipment_maxhp : SBC !ram_equipment_curhp : CMP.b #$04

	%a16()
	LDA #$24A0 ; keep cycles similar
	ADC #$0000 ; give us $2A41 if carry was set for not full HP

	; Heart gfx
	STA !POS_MEM_HEART_GFX

	; Full hearts
	LDA !ram_equipment_curhp : AND #$00FF : LSR #3 : JSL hex_to_dec
	LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700+!POS_HEARTS
	LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC702+!POS_HEARTS

	; Quarters
	LDA !ram_equipment_curhp : AND #$0007 : ORA #$3490 : STA $7EC704+!POS_HEARTS

	; Heart lag spinner
	LDA $1A : AND #$000C
	XBA : ASL #4
	ORA #$253F
	TAY
	LDA.l !ram_heartlag_spinner : BEQ ++
	TYA
	STA !POS_MEM_HEARTLAG
	BRA +

++	; 9 cycles from STA long and BRA
	; -1 cycle from taking the BEQ branch
	; so let's waste 8 cycles
	TYA
	ORA (1,S), Y ; this is for Lui; 8 cycles in m=16

	; Container gfx
+	LDA #$24A2 : STA !POS_MEM_CONTAINER_GFX
	LDA #$0101 : STA !do_heart_lag

	; Container
	LDA !ram_equipment_maxhp : AND #$00FF : LSR #3 : JSL hex_to_dec

	LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700+!POS_CONTAINERS
	LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC702+!POS_CONTAINERS

	RTS

hud_draw_enemy_hp:
	; Assumes: I=16
	; Draw over Enemy Heart stuff in case theres no enemies
	LDA #!EMPTY : STA !POS_MEM_ENEMY_HEART_GFX
	STA $7EC700+!POS_ENEMY_HEARTS
	STA $7EC702+!POS_ENEMY_HEARTS
	STA $7EC704+!POS_ENEMY_HEARTS

	SEP #$30
	LDX #$FF

--	INX : CPX #$10 : BEQ .end
	LDA $0DD0, X : CMP #$09 : BEQ ++
	CMP #$0B : BNE --
++	BIT $0E60, X : BVC --

	LDA $0E50, X
	REP #$30
	AND #$00FF
	; Enemy HP should be in A
	JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw3_white_aligned_left_lttp

	; Enemy Heart GFX
	LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

.end
--	RTS

hud_draw_misslots:

	; Search index / EG (03A4)
	REP #$30
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
	; LDX.w #$182

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
