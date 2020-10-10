pushpc
; Pokeys
org $0688E9
	; 0688e9 jsl $0dba71
	; 0688ed and #$03
	; 0688ef tay
	; 0688f0 lda $88d7,y
	; 0688f3 sta $0d50,x
	; 0688f6 lda $88db,y
	; 0688f9 sta $0d40,x
	; 0688fc rts
	JSL rng_pokey_hook
	RTS

; Agahnim
org $01ED6EF
	; 1ed6ef jsl $0dba71
	JSL rng_agahnim_hook

; Helmasaur
org $01E8262
	; 1e8262 jsl $0dba71
	JSL rng_helmasaur_hook

; Ganon warp location
org $1D9488
	; 1d9488 jsl $0dba71
	JSL rng_ganon_warp_location

; Ganon warp
org $1D91E3
	; 1d91e3 jsl $0dba71
	JSL rng_ganon_warp

; vitreous first eye
org $1DE5E4
	JSL choose_vitty_eye

; Eyegore
org $1EC89C
	;1ec89c jsl $0dba71
	JSL rng_eyegore

; Arrghus
org $1EB5F7
	;1eb5f7 jsl $0dba71
	JSL rng_arrghus

; Turtles
org $1EB2A6
	;1eb2a6 jsl $0dba71
	JSL rng_turtles

; Lanmola
; 05a3f4 jsl $0dba71
; 05a3f8 and #$07
; 05a3fa tay
; 05a3fb lda $a3d6,y
; 05a3fe sta $0da0,x
; 05a401 jsl $0dba71
; 05a405 and #$07
; 05a407 tay
; 05a408 lda $a3de,y
; 05a40b sta $0db0,x
org $05A3F4
	JSL rng_lanmola_1

org $05A401
	JSL rng_lanmola_2


; Conveyor belt
org $09BD5D
	; 09bd5d jsl $0dba71
	; 09bd61 and #$03
	; 09bd63 ldy $0b08,x
	JSL rng_conveyor_belt

pullpc

tbl_pokey_speed:
	; 00
	db -16, -16, -16, -16 ; ul ul
	db -16,  16, -16, -16 ; ur ul
	db  16,  16, -16, -16 ; dr ul
	db  16, -16, -16, -16 ; dl ul

	; 10
	db -16, -16, -16,  16 ; ul ur
	db -16,  16, -16,  16 ; ur ur
	db  16,  16, -16,  16 ; dr ur
	db  16, -16, -16,  16 ; dl ur

	; 20
	db -16, -16,  16,  16 ; ul dr
	db -16,  16,  16,  16 ; ur dr
	db  16,  16,  16,  16 ; dr dr
	db  16, -16,  16,  16 ; dl dr

	; 30
	db -16, -16,  16, -16 ; ul dl
	db -16,  16,  16, -16 ; ur dl
	db  16,  16,  16, -16 ; dr dl
	db  16, -16,  16, -16 ; dl dl

tbl_real_pokey_x:
	db 16, -16,  16, -16

tbl_real_pokey_y:
	db 16,  16, -16, -16

rng_pokey_hook:
	PHB : PHK : PLB

	LDA.w SA1RAM.pokey_rng : BEQ .random

	LDA.w SA1RAM.rng_counter : ASL : STA $72
	LDA.w SA1RAM.pokey_rng : DEC : ASL #2 : CLC : ADC $72 : TAY

	LDA.w tbl_pokey_speed+0, Y : STA $0D40, X
	LDA.w tbl_pokey_speed+1, Y : STA $0D50, X

	LDA.w SA1RAM.rng_counter : INC : STA.w SA1RAM.rng_counter
	BRA .done

.random
	JSL RandomNumGen : AND #$03 : TAY
	LDA.w tbl_real_pokey_x, Y : STA $0D50, X
	LDA.w tbl_real_pokey_y, Y : STA $0D40, X

.done
	PLB
	RTL

; == Agahnim ==

rng_agahnim_hook:
	LDA.w SA1RAM.agahnim_rng : BEQ JML_to_RNG

	CMP #$01 : BEQ .done
	LDA #$00

.done
	RTL

; == Helmasaur ==

rng_helmasaur_hook:
	LDA.w SA1RAM.helmasaur_rng : BEQ JML_to_RNG
	DEC
	RTL

; == Ganon Warp Location ==

rng_ganon_warp_location:
	LDA.w SA1RAM.ganon_warp_location_rng : BEQ JML_to_RNG
	DEC
	RTL

; == Ganon Warp ==

rng_ganon_warp:
	LDA.w SA1RAM.ganon_warp_rng : BEQ JML_to_RNG
	DEC
	RTL

; == Eyegore ==

rng_eyegore:
	LDA.w SA1RAM.eyegore_rng : BEQ JML_to_RNG
	DEC
	RTL

; == Arrghus ==

arrghus_speeds:
	db $00, $10, $20, $30, $3F

rng_arrghus:
	LDA.w SA1RAM.arrghus_rng : BEQ JML_to_RNG
	PHX
	DEC
	TAX : LDA.l arrghus_speeds, X
	PLX
	RTL

; In the middle for best access
JML_to_RNG:
	JML RandomNumGen

; == Turtles ==

rng_turtles:
	LDA.w SA1RAM.turtles_rng : BEQ JML_to_RNG
	DEC
	RTL

; == Lanmola ==

rng_lanmola_1:
	LDA.w SA1RAM.lanmola_rng : BEQ JML_to_RNG
	DEC
	RTL

rng_lanmola_2:
	LDA.w SA1RAM.lanmola_rng : BEQ JML_to_RNG
	DEC : LSR #3
	RTL

; Conveyor Belt
rng_conveyor_belt:
	LDA.w SA1RAM.conveyor_rng : BEQ JML_to_RNG
	DEC
	RTL

; Vitreous
choose_vitty_eye:
	LDA.w SA1RAM.vitreous_rng : BEQ JML_to_RNG
	LDA $0E70, X : BNE JML_to_RNG

	INC : STA $0E70, X ; set to 1
	LDA.w SA1RAM.vitreous_rng
	DEC
	RTL

