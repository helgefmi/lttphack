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
	JML dropluck
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
	JML probe_draw
after_probe_draw:

org $05C63D
	JML set_probe_gfx
after_probe_gfx:

;---------------------------------
; Lit rooms
;---------------------------------
org $01F473 : JSL GetLitRoom
org $01F50A : JSL GetLitRoom
org $028204 : JSL GetLitRoom
org $028A7E : JSL GetLitRoom
org $02A148 : JSL GetLitRoom

pullpc

;===================================================================================================

GetLitRoom:
	LDA.w !ram_lit_rooms_toggle : BNE ++
	LDA.l $02A0DC,X
	RTL

++	LDA.b #$00
	RTL

;===================================================================================================

triforce_transition:
	LDA.w !ram_skip_triforce_toggle : BNE .skip_triforce
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
	LDY $0CF9
	JML afterdropluck

;===================================================================================================

swordbeams:
	LDY !disable_beams : BNE .nobeams
	JML $099D04 ; one less RTL

.nobeams
	SEC ; indicates failed to add an ancilla
	RTL

;===================================================================================================

; sets some oam properties for the guard search beams
set_probe_gfx:
	TXA : STA.w $0DE0,Y
	LDA.w !ram_probe_toggle : BEQ ++
	LDA.b #%00001110 ; oam : vhoopppN
	STA.w $0F50,Y

++	JML after_probe_gfx

; basically just the normal draw routine, except
; it's not jumping to a routine because
;  1) it'd be a decent amount of lag, so every bit of optimization counts
;  2) need to be explicit to get the correct gfx (also saves some cycles)
!sparks_gfx = $AA
!bubble_gfx = $CB
!vortex_gfx = $EE
probe_draw:
	LDA.b $01 : ORA.b $03 : PHP ; storing the Z flag since we'll RTL to a BEQ

	LDA.w !ram_probe_toggle : BEQ .skip

	LDA.b $00 : STA.b ($90),Y
	LDA.b $01 : CMP.b #$01
	LDA.b #$01 : ROL : STA.b ($92)

	REP #$21
	LDA.b $02 : INY
	ADC.w #$0010 : CMP.w #$0100 : SEP #$20 : BCS .skip

	SBC.b #$0F : STA.b ($90),Y
	INY
	LDA.b #!sparks_gfx : STA.b ($90),Y
	INY
	LDA.b $05 : STA.b ($90),Y

.skip
	PLP
	JML after_probe_draw

;===================================================================================================

set_moving_wall_speed:
	LDA.w !ram_fast_moving_walls : BEQ .normal
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