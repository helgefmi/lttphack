pushpc

org $02B793 : JML triforce_transition

org $06F99E : JML dropluck
afterdropluck:

org $1CF640 : JSL swordbeams

org $01CA66
	JSL set_moving_wall_speed
	RTS

org $01F473 : JSL GetLitRoom
org $01F50A : JSL GetLitRoom
org $028204 : JSL GetLitRoom
org $028A7E : JSL GetLitRoom
org $02A148 : JSL GetLitRoom

pullpc

;===================================================================================================

GetLitRoom:
	LDA.w !config_lit_rooms_toggle : BNE ++
	LDA.l $02A0DC,X
	RTL

++	LDA.b #$00
	RTL

;===================================================================================================

triforce_transition:
	LDA.w !config_skip_triforce_toggle : BNE .skip_triforce
	JSL $02A0BE ; Dungeon_SaveRoomData_justKeys
	JML $02B797

.skip_triforce
	JML $02B7A1

;===================================================================================================

dropluck:
	PHA ; overwrote PHA : LDY addr, so LEAVE UNBALANCED

	; use this value when it isn't 0 or "random"
	; use vanilla value when this is 0 so that it can be used
	; by people who want to test fairy stuff I guess
	LDY.w SA1RAM.drop_rng : BEQ .vanilla
	JML afterdropluck ; was hoping this coulda been simpler but luck needs to be in Y

.vanilla
	LDY.w $0CF9
	JML afterdropluck

;===================================================================================================

swordbeams:
	LDY !disable_beams : BNE .nobeams
	JML $099D04

.nobeams
	SEC ; indicates failed to add an ancilla
	RTL

;===================================================================================================

set_moving_wall_speed:
	LDA.w !config_fast_moving_walls : BEQ .normal
	LDA.w #$0008
	RTL

.normal
	LDA.w #$2200 : CLC : ADC.w $041C : STA.w $041C
	ROL : AND.w #$0001
	RTL

;===================================================================================================

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
