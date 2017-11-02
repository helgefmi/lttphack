    ; Pokey rng manip
    ; ---------------
    ; 0688e9 jsl $0dba71
    ; 0688ed and #$03
    ; 0688ef tay
    ; 0688f0 lda $88d7,y
    ; 0688f3 sta $0d50,x
    ; 0688f6 lda $88db,y
    ; 0688f9 sta $0d40,x
    ; 0688fc rts
org $0688E9
    JSL pokey_rng_hook
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

pokey_rng_hook:
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
