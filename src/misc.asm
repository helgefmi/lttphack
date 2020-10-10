pushpc
; -----------------
; Ganon transition
; -----------------
org $02B793
	JML triforce_transition

;------------------
; Drop luck check
;------------------
org $06F99E
	JML dropluck ; can't JSL because we need an unbalanced PHA
afterdropluck:

;------------------
; Sword beams
;------------------
org $1CF640
	JSL swordbeams

;-------------------
; Fast moving walls
;-------------------

org $01CA66
	JSL set_moving_wall_speed
	RTS

;---------------------------------
; Visible guard search beams
;---------------------------------
org $05C21D
	JSL probe_draw

org $05C63D
	JSL set_probe_gfx

;---------------------------------------------
; Visible bonk prizes
;---------------------------------------------
org $06D25A
JML absorbable_check ; can't JSL because we potentially need to pull from stack

absorbexit_stop: RTS

absorbexit_continue:





; safety net for Somaria corruption
;org $01B840
;	JML SomariaJukeSafety

pullpc

;SomariaJukeSafety:
;	LDA.b $BA
;	BNE .uhoh
;
;	JML $01B844
;
;.uhoh



triforce_transition:
	LDA.w !ram_skip_triforce_toggle : BNE .skip_triforce
	JSL $02A0BE ; Dungeon_SaveRoomData_justKeys
	JML $02B797

.skip_triforce
	JML $02B7A1

dropluck:
	PHA ; overwrote PHA : LDY addr, so LEAVE UNBALANCED

	; use this value when it isn't 0 or "random"
	; use vanilla value when this is 0 so that it can be used
	; by people who want to test fairy stuff I guess
	LDY.w SA1RAM.drop_rng : BEQ .vanilla
	JML afterdropluck ; was hoping this coulda been simpler but luck needs to be in Y

.vanilla
	LDY $0CF9
	JML afterdropluck

swordbeams:
	LDY !disable_beams : BNE .nobeams
	JML $099D04 ; one less RTL

.nobeams
	SEC ; indicates failed to add an ancilla
	RTL

; sets some oam properties for the guard search beams
set_probe_gfx:
	TXA : STA $0DE0, Y
	LDA #%00001110 ; oam : vhoopppN
	STA $0F50, Y
	RTL

; basically just the normal draw routine, except
; it's not jumping to a routine because
;  1) it'd be a decent amount of lag, so every bit of optimization counts
;  2) Character seems to be based entirely on sprite id????
;     need to be explicit to get the correct gfx (also saves some cycles)
!sparks_gfx = #$AA
!bubble_gfx = #$CB
!vortex_gfx = #$EE
probe_draw:
	LDA $01 : ORA $03 : PHP ; storing the Z flag since we'll RTL to a BEQ

	LDA.w !ram_probe_toggle : BEQ .skip

	LDA $00 : STA ($90), Y
	LDA $01 : CMP #$01
	LDA #$01 : ROL : STA ($92)

	REP #$20
	LDA $02 : INY
	CLC : ADC #$0010 : CMP #$0100 : SEP #$20 : BCS .skip

	SBC #$0F : STA ($90), Y
	INY
	LDA.l !sparks_gfx : STA ($90), Y
	INY
	LDA $05 : STA ($90), Y

.skip
	PLP
	RTL

absorbable_check:
	LDA.w !ram_bonk_items_toggle : BNE .alwaysdraw ; always draw, if on

.vanilla
	LDA $0E90, X : BNE ++
	JML absorbexit_continue

++	PLA : PLA
	JML absorbexit_stop ; leads to an RTS

.alwaysdraw
	LDA $0E90, X : BEQ ++

	PLA : PLA
++	JML absorbexit_continue

set_moving_wall_speed:
	LDA.w !ram_fast_moving_walls : BEQ .normal
	LDA #$0008
	RTL
.normal
	LDA #$2200 : CLC : ADC $041C : STA $041C
	ROL : AND #$0001
	RTL

RoomHasPitDamage:
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x000
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x008
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x010
	db 0, 0, 1, 0, 1, 0, 0, 0 ; 0x018
	db 0, 0, 0, 0, 1, 0, 0, 0 ; 0x020
	db 0, 0, 1, 0, 0, 0, 0, 0 ; 0x028
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x030
	db 0, 0, 0, 0, 1, 0, 0, 0 ; 0x038
	db 1, 0, 0, 0, 1, 0, 0, 0 ; 0x040
	db 0, 1, 0, 1, 1, 0, 1, 0 ; 0x048
	db 0, 0, 0, 0, 0, 0, 1, 1 ; 0x050
	db 1, 0, 0, 0, 1, 0, 0, 0 ; 0x058
	db 0, 0, 0, 0, 0, 0, 0, 1 ; 0x060
	db 1, 0, 0, 0, 0, 0, 0, 0 ; 0x068
	db 0, 0, 1, 0, 0, 0, 0, 0 ; 0x070
	db 0, 0, 0, 1, 1, 1, 0, 1 ; 0x078
	db 0, 0, 1, 0, 0, 0, 0, 0 ; 0x080
	db 0, 0, 0, 1, 0, 1, 0, 0 ; 0x088
	db 0, 0, 1, 0, 0, 1, 1, 0 ; 0x090
	db 1, 0, 0, 1, 1, 1, 0, 0 ; 0x098
	db 1, 0, 1, 1, 0, 1, 0, 0 ; 0x0A0
	db 0, 0, 0, 0, 0, 0, 0, 1 ; 0x0A8
	db 0, 0, 0, 0, 1, 1, 0, 0 ; 0x0B0
	db 0, 0, 0, 0, 1, 0, 0, 0 ; 0x0B8
	db 1, 0, 0, 1, 0, 1, 1, 1 ; 0x0C0
	db 0, 1, 0, 0, 0, 0, 0, 0 ; 0x0C8
	db 0, 1, 0, 0, 0, 1, 1, 0 ; 0x0D0
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x0D8
	db 0, 0, 0, 0, 0, 0, 1, 1 ; 0x0E0
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x0E8
	db 1, 1, 0, 0, 0, 0, 0, 0 ; 0x0F0
	db 0, 0, 0, 1, 0, 0, 0, 0 ; 0x0F8
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x100
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x108
	db 0, 0, 1, 0, 0, 0, 0, 0 ; 0x110
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x118
	db 1, 0, 0, 1, 0, 0, 0, 0 ; 0x120
	db 0, 0, 0, 0, 0, 0, 0, 0 ; 0x128