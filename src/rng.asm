pushpc

org $0688E9 : JSL rng_pokey

org $01ED6EF : JSL rng_agahnim

org $01E8262 : JSL rng_helmasaur

org $1D9488 : JSL rng_ganon_warp_location
org $1D91E3 : JSL rng_ganon_warp

org $1DE5E4 : JSL choose_vitty_eye

org $1EC89C : JSL rng_eyegore

org $1EB5F7 : JSL rng_arrghus

org $1EB2A6 : JSL rng_turtles

org $05A3F4 : JSL rng_lanmola_1
org $05A401 : JSL rng_lanmola_2

org $09BD5D : JSL rng_conveyor_belt

pullpc

;===================================================================================================

rng_pokey:
	LDA.w SA1RAM.pokey_rng : BEQ JML_to_RNG

	DEC

	; left = 3 ; right = 5
	CPX.b #$05 : BNE ++

	LSR : LSR

++	RTL

;===================================================================================================

; Agahnim
rng_agahnim:
	LDA.w SA1RAM.agahnim_rng : BEQ JML_to_RNG

	CMP.b #$01 : BEQ .done

	LDA.b #$00

.done
	RTL

;===================================================================================================

rng_helmasaur:
	LDA.w SA1RAM.helmasaur_rng : BEQ JML_to_RNG
	DEC
	RTL

;===================================================================================================

rng_ganon_warp_location:
	LDA.w SA1RAM.ganon_warp_location_rng : BEQ JML_to_RNG
	DEC
	RTL

;===================================================================================================

rng_ganon_warp:
	LDA.w SA1RAM.ganon_warp_rng : BEQ JML_to_RNG
	DEC
	RTL

;===================================================================================================

rng_eyegore:
	LDA.w SA1RAM.eyegore_rng : BEQ JML_to_RNG
	DEC
	RTL

;===================================================================================================

rng_arrghus:
	LDA.w SA1RAM.arrghus_rng : BEQ JML_to_RNG

	TXY

	TAX : LDA.l .speeds-1,X

	TYX

	RTL

.speeds
	db $00, $10, $20, $30, $3F

;===================================================================================================

; In the middle for best access
JML_to_RNG:
	JML GetRandomInt

;===================================================================================================

rng_turtles:
	LDA.w SA1RAM.turtles_rng : BEQ JML_to_RNG
	DEC
	RTL

;===================================================================================================

rng_lanmola_1:
	LDA.w SA1RAM.lanmola_rng : BEQ JML_to_RNG
	DEC
	RTL

rng_lanmola_2:
	LDA.w SA1RAM.lanmola_rng : BEQ JML_to_RNG
	DEC
	LSR
	LSR
	LSR
	RTL

;===================================================================================================

rng_conveyor_belt:
	LDA.w SA1RAM.conveyor_rng : BEQ JML_to_RNG
	DEC
	RTL

;===================================================================================================

choose_vitty_eye:
	LDA.w SA1RAM.vitreous_rng : BEQ JML_to_RNG

	LDA.w $0E70,X : BNE JML_to_RNG

	INC : STA.w $0E70,X ; set to 1
	LDA.w SA1RAM.vitreous_rng
	DEC

	RTL
