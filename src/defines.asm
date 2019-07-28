; ==== RAM usage ====
;
; 04CB[0x25] (04F0)
; $7F7667[0x6719] (7FDD80)
; $7EC900[0x1F00] (7EE800)
;  * 7ED000 - 7ED780 = VRAM buffer backup in custom_menu.asm

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

!lowram_is_poverty_load = $04E6

!lowram_idle_frames = $04EA
!lowram_idle_frames_copy = $04EC

!lowram_nmi_counter = $04EE

; AXLR|....|BYSlSt|udlr
!ram_ctrl1 = $04E4
!ram_ctrl1_filtered = $7F7684
!ram_ctrl1_word_copy = $7F7686

!ram_gamemode_copy = $7F767E
!ram_submode_copy = $7F7680

!ram_received_item_copy = $7F7688
!ram_hex2dec_tmp = $7F768A
!ram_hex2dec_first_digit = $7F768C
!ram_hex2dec_second_digit = $7F768E
!ram_hex2dec_third_digit = $7F7690

!ram_qw_last_scroll = $7F76A2
!ram_lanmola_cycles = $7F7700 ; 3 bytes
!ram_rng_counter = $7F7704
!ram_pokey_rng = $7F7706
!ram_agahnim_rng = $7F7708
!ram_helmasaur_rng = $7F770A
!ram_ganon_warp_location_rng = $7F770C
!ram_ganon_warp_rng = $7F770E
!ram_eyegore_rng = $7F7712
!ram_arrghus_rng = $7F7714
!ram_turtles_rng = $7F7716
!ram_cannonballs_rng = $7F7718
!ram_soldiers_rng = $7F771A
!ram_lanmola_rng = $7F771C
!ram_conveyor_rng = $7F771E
!ram_drop_rng = $7F7720

!ram_ctrl_last_input = $7F7710

; Account for different SRAM layouts

if !FEATURE_SD2SNES
    !offset = $771000
else
    !offset = $701E00
endif

!ram_sram_initialized = !offset+0
!ram_input_display_toggle = !offset+4
!ram_enemy_hp_toggle = !offset+6
!ram_xy_toggle = !offset+8
!ram_qw_toggle = !offset+10
!ram_lit_rooms_toggle = !offset+12
!ram_oob_toggle = !offset+14
!ram_toggle_lanmola_cycles = !offset+16
!ram_subpixels_toggle = !offset+58
!ram_rerandomize_toggle = !offset+64
!ram_skip_triforce_toggle = !offset+75

!ram_previous_preset_destination = !offset+24
!ram_previous_preset_type = !offset+26
!ram_preset_category = !offset+60
!ram_can_load_pss = !offset+62
!ram_feature_music = !offset+28
!ram_secondary_counter_type = !offset+46
!ram_lagometer_toggle = !offset+56
!ram_sanctuary_heart = !offset+74
!ram_autoload_preset = !offset+76

!ram_ctrl_prachack_menu = !offset+30
!ram_ctrl_load_last_preset = !offset+32
!ram_ctrl_replay_last_movie = !offset+78
!ram_ctrl_save_state = !offset+34
!ram_ctrl_load_state = !offset+36
!ram_ctrl_toggle_oob = !offset+38
!ram_ctrl_skip_text = !offset+40
!ram_ctrl_disable_sprites = !offset+42
!ram_ctrl_reset_segment_timer = !offset+44
!ram_ctrl_fill_everything = !offset+70
!ram_ctrl_fix_vram = !offset+72

!ram_counters_real = !offset+48
!ram_counters_lag = !offset+50
!ram_counters_idle = !offset+52
!ram_counters_segment = !offset+54

!ram_rerandomize_framecount = !offset+66
!ram_rerandomize_accumulator = !offset+68

!lowram_oob_toggle = $037F

!ram_debug = $7F7777
!ram_debug2 = $7F7779

!ram_cm_old_gamemode = $7F76A0
!ram_cm_old_submode = $7F76A1
!ram_cm_menu_stack = $7F76B0 ; 0x10
!lowram_cm_cursor_stack = $0648 ; 0x10
!lowram_cm_stack_index = $0658
!ram_cm_last_frame_input = $7F76C6
!ram_cm_input_timer = $7F76C8
!ram_cm_opened_menu_maunally = $7F7702

!ram_cm_old_crystal_switch = $7F76CE

!sram_ss_dma_buffer = $770000
!sram_old_music_bank = $770080
!sram_pss_offset = $702000

;-------------------------
; Transition detection
;-------------------------

!TD_RESET = $00
!TD_SHOW = $01

;-------------------------
; Layers
;-------------------------
!disabled_layers = $35
!disabled_layers_temp = $AB ; 2 bytes

;-------------------------
; Sword beams
;-------------------------
!disable_beams = $7A

;-------------------------
; HUD
;-------------------------

!POS_COUNTERS = $36

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

!CM_ACTION_TOGGLE = #$00
!CM_ACTION_JSR = #$02
!CM_ACTION_SUBMENU = #$04
!CM_ACTION_BACK = #$06
!CM_ACTION_CHOICE = #$08
!CM_ACTION_TOGGLE_JSR = #$0A
!CM_ACTION_CHOICE_JSR = #$0C
!CM_ACTION_NUMFIELD = #$0E
!CM_ACTION_PRESET = #$10
!CM_ACTION_TOGGLE_BIT = #$12
!CM_ACTION_CTRL_SHORTCUT = #$14
!CM_ACTION_SUBMENU_VARIABLE = #$16

!ram_react_counter = $7F76CA
!ram_react_frames = $7F76CC

!ram_mash_counter = $7F76D0
!ram_mash_inputs = $7F76D2


;-------------------------
; MUSIC
;-------------------------

!SPC_DATA_OVERWORLD = $3E8000
!SPC_DATA_UNDERWORLD = $3EC000
!SPC_DATA_CREDITS = $3F8000

;-------------------------
; PRESETS
;-------------------------

!PRESET_OVERWORLD = #$01
!PRESET_DUNGEON = #$02

!ram_preset_type = $04E2
!ram_preset_destination = $7F7900
!ram_preset_end_of_sram_state = $7F7902
!ram_preset_spotlight_timer = $7F7720

;-------------------------
; MOVIE
;-------------------------
!ram_movie_mode = $7F8000
!ram_movie_index = $7F8002
!ram_movie_timer = $7F8004
!ram_prev_ctrl = $7F8006
!ram_movie_framecounter = $7F800A
!ram_movie_next_mode = $7F800C
!ram_movie = $7F8010
!ram_movie_rng_index = $7FA000
!ram_movie_rng = $7FA010


;-------------------------
; From ROM
;-------------------------

!RandomNumGen = $0DBA71
!UseImplicitRegIndexedLocalJumpTable = $008781
!BirdTravel_LoadTargetAreaData = $02E99D
!BirdTravel_LoadTargetAreaData_AfterData = $02EA30
!Player_ResetState = $07F18C
!Tagalong_LoadGfx = $00D463
!Sprite_ResetAll = $09C44E
!Sprite_DisableAll = $09C44E
!Sprite_LoadGfxProperties = $00FC41
!UpdateBarrierTileChr = $0296AD ; $117B2-$117C7
!Dungeon_AnimateTrapDoors = $01D38D
!Dungeon_LoadEntrance = $D617

!DecompSwordGfx = $00D308
!Palette_Sword = $1BED03
!DecompShieldGfx = $00D348
!Palette_Shield = $1BED29
!Palette_Armor = $1BEDF9
!LoadGearPalettes_bunny = $02FD8A

; ITEM MENU

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

; EQUIPMENT MENU

!ram_equipment_boots_menu = $7EF355
    !ram_cm_equipment_boots = $7F76C3
!ram_equipment_gloves = $7EF354
!ram_equipment_flippers_menu = $7EF356
    !ram_cm_equipment_flippers = $7F76C4
!ram_equipment_moon_pearl = $7EF357
!ram_equipment_sword = $7EF359
!ram_equipment_shield = $7EF35A
!ram_equipment_armor = $7EF35B
!ram_equipment_maxhp = $7EF36C
    !ram_cm_equipment_maxhp = $7F76C5
!ram_equipment_curhp = $7EF36D
!ram_equipment_arrows_filler = $7EF377
!ram_equipment_arrows = $7EF377
!ram_equipment_keys = $7EF36F
!ram_equipment_half_magic = $7EF37B
!ram_equipment_magic_meter = $7EF36E

; OTHER

!ram_cm_armed_eg = $7EF380
!ram_cm_eg_strength = $7EF382
!ram_cm_crystal_switch = $7EF384

!ram_game_big_keys_1 = $7EF366
!ram_game_big_keys_2 = $7EF367

!ram_game_pendants = $7EF374
!ram_game_crystals = $7EF37A

!ram_game_progress = $7EF3C5
!ram_game_flags = $7EF3C6
!ram_game_map_indicator = $7EF3C7
!ram_capabilities = $7EF379

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
    LDA #$80 : STA $2100 : STA $13
    STZ $420C : LDA $9B : PHA : STZ $9B
    STZ $4200
endmacro

macro ppu_on()
    LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
    PLA : STA $9B : STA $420C
endmacro


macro wait_14_cycles()
    PHA : PLA : PHA : PLA
endmacro
