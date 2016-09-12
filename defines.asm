; ==== RAM usage ====

!lowram_room_realtime = $04CC
!lowram_room_gametime = $04CE
!lowram_seg_frames = $04D0
!lowram_seg_minutes = $04D2
!lowram_seg_seconds = $04D4

!lowram_room_realtime_copy = $04D6
!lowram_room_gametime_copy = $04D8

!lowram_last_frame_did_saveload = $04DA
!lowram_last_frame_hearts = $04DB
!lowram_draw_tmp = $04DC
!lowram_draw_tmp2 = $04DE
!lowram_draw_tmp3 = $04E0

!ram_gamemode_copy = $7F767E
!ram_submode_copy = $7F7680

!ram_ctrl1_word = $7F7682
!ram_ctrl1_byte2 = $7F7683
!ram_ctrl1_filtered = $7F7684
!ram_ctrl1_filtered_byte2 = $7F7685

!ram_ctrl1_word_copy = $7F7686
!ram_received_item_copy = $7F7688
!ram_hex2dec_tmp = $7F768A
!ram_hex2dec_first_digit = $7F768C
!ram_hex2dec_second_digit = $7F768E
!ram_hex2dec_third_digit = $7F7690

!ram_last_frame_xy_toggle = $7F7698

!ram_lit_rooms_toggle = $7F769A
!ram_qw_toggle = $7F769C
!ram_qw_last_scroll = $7F76A2
!ram_xy_toggle = $7F769E
!ram_enemy_hp_toggle = $7F76A4
!ram_counters_toggle = $7F76A6
!ram_input_display_toggle = $7F76A8
!lowram_oob_toggle = $037F
!ram_los_toggle = $7F76AC

!ram_debug = $7F7777
!ram_debug2 = $7F7779

!ram_cm_old_gamemode = $7F76A0
!ram_cm_old_submode = $7F76A1
!ram_cm_menu_stack = $7F76B0 ; 0x10
!lowram_cm_cursor_stack = $0648 ; 0x10
!lowram_cm_stack_index = $0658

;-------------------------
; HUD
;-------------------------

!POS_RT_ROOM = $36
!POS_LAG = $7A
!POS_RT_SEG = $B2
!POS_XY = $F4

!POS_MEM_HEART_GFX = $7EC790
!POS_HEARTS = $92

!POS_MEM_CONTAINER_GFX = $7EC79A
!POS_CONTAINERS = $9C

!POS_MEM_ENEMY_HEART_GFX = $7EC7A2
!POS_ENEMY_HEARTS = $A4

!POS_MEM_INPUT_DISPLAY_TOP = $7EC728
!POS_MEM_INPUT_DISPLAY_BOT = $7EC768

;-------------------------
; Custom menu
;-------------------------

!CM_ACTION_TOGGLE_BYTE = #$00
!CM_ACTION_JSR = #$02
!CM_ACTION_SUBMENU = #$04
!CM_ACTION_BACK = #$06
!CM_ACTION_CHOICE = #$08
!CM_ACTION_TOGGLE_BYTE_JSR = #$0A
!CM_ACTION_CHOICE_JSR = #$0C

;-------------------------
; From ROM
;-------------------------

!UseImplicitRegIndexedLocalJumpTable = $008781

!ram_item_bow = $7EF340
    !ram_cm_item_bow = $7F76C0
!ram_item_boom = $7EF341
!ram_item_hook = $7EF342
!ram_item_bombs = $7EF343
!ram_item_powder = $7EF344
!ram_item_fire_rod = $7EF345
!ram_item_ice_rod = $7EF346
!ram_item_bombos = $7EF347
!ram_item_ether = $7EF348
!ram_item_2quake = $7EF349
!ram_item_lantern = $7EF34A
!ram_item_hammer = $7EF34B
!ram_item_flute = $7EF34C
!ram_item_net = $7EF34D
!ram_item_book = $7EF34E
!ram_item_bottle = $7EF34F
    !ram_cm_item_bottle = $7F76C2
    !ram_item_bottle_array = $7EF35C
!ram_item_somaria = $7EF350
!ram_item_byrna = $7EF351
!ram_item_cape = $7EF352
!ram_item_mirror = $7EF353
    !ram_cm_item_mirror = $7F76C1

;-------------------------
; Macros
;-------------------------

macro a8()
    SEP #$20
endmacro

macro a16()
    REP #$20
endmacro

macro i8()
    SEP #$10
endmacro

macro i16()
    REP #$10
endmacro

macro ai8()
    SEP #$30
endmacro

macro ai16()
    REP #$30
endmacro


macro ppu_off()
    LDA.b #$80 : STA $2100 : STA $13
    STZ $420C : LDA $9B : PHA : STZ $9B
    STZ $4200
endmacro
  
macro ppu_on()
    LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
    PLA : STA $9B : STA $420C
endmacro
