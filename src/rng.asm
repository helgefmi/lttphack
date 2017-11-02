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
    ; 1ed6f3 and #$01
    ; 1ed6f5 bne $d701
    ; 1ed6f7 lda #$01
    ; 1ed6f9 sta $0da0,y
    ; 1ed6fc lda #$20
    ; 1ed6fe sta $0df0,y
    ; 1ed701 rts
    JSL rng_agahnim_hook
    RTS

; Helmasaur
org $01E8262
	; 1e8262 jsl $0dba71
	; 1e8266 and #$01
	; 1e8268 beq $8276
	; 1e826a lda #$7f
	; 1e826c sta $0e10,x
	; 1e826f lda #$2a
	; 1e8271 jsl $0dbb8a
	; 1e8275 rts
	; 1e8276 lda #$a0
	; 1e8278 sta $0e00,x
	; 1e827b rts
	JSL rng_helmasaur_hook
    RTS

org $288000

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

    LDA !ram_pokey_rng : BEQ .random

    LDA !ram_rng_counter : ASL : STA !lowram_draw_tmp
    LDA !ram_pokey_rng : DEC : ASL #2 : CLC : ADC !lowram_draw_tmp : TAY

    LDA tbl_pokey_speed, Y : STA $0D40, X
    LDA tbl_pokey_speed+1, Y : STA $0D50, X

    LDA !ram_rng_counter : INC : STA !ram_rng_counter
    BRA .done

  .random
    JSL !RandomNumGen : AND #$03 : TAY
    LDA tbl_real_pokey_x, Y : STA $0D50, X
    LDA tbl_real_pokey_y, Y : STA $0D40, X

  .done
    PLB
    RTL


; == Agahnim ==

rng_agahnim_hook:
    LDA !ram_agahnim_rng : BEQ .random
    CMP #$01 : BEQ .done
	BRA .yellow

  .random
	JSL !RandomNumGen : AND #$01 : BNE .done

  .yellow
	LDA #$01 : STA $0DA0, Y
	LDA #$20 : STA $0DF0, Y

  .done
    RTL


; == Helmasaur ==
rng_helmasaur_hook:
    LDA !ram_helmasaur_rng : BEQ .random
    CMP #$01 : BEQ .no_fireball
	BRA .fireball

  .random
	; 1e8262 jsl $0dba71
	; 1e8266 and #$01
	; 1e8268 beq $8276
	JSL !RandomNumGen : AND #$01 : BEQ .no_fireball

  .fireball
	LDA #$A0 : STA $0E00,x
    RTL

  .no_fireball
	LDA #$7F : STA $0E10,x
	LDA #$2A : JSL $0DBB8A
    RTL
