; Magic words
!SRAM_VERSION = $0025

!menu_end = #$0000
!list_end = #$FF

!pracmenu_shortcut = #$1010

!EMPTY = $207F
!QMARK = $212A
!BLANK_TILE = $24F5

!menu_dma_buffer = $7F8000 ; [0x800] reserved
!dg_hdma = $7F8800 ; [0x800] reserved
!dg_dma_buffer = $7F9000 ; [0x800] reserved
!dg_buffer = !dg_dma_buffer
!dg_buffer_r0 #= !dg_dma_buffer+(64*0)
!dg_buffer_r1 #= !dg_dma_buffer+(64*1)
!dg_buffer_r2 #= !dg_dma_buffer+(64*2)
!dg_buffer_r3 #= !dg_dma_buffer+(64*3)
!dg_buffer_r4 #= !dg_dma_buffer+(64*4)

!NUMBER_OF_COUNTERS = 6
!HUD_EXTRAS_BUFFER = $7ED000
!POS_MEM_INPUT_DISPLAY_TOP #= !HUD_EXTRAS_BUFFER+((!NUMBER_OF_COUNTERS+1)*16)
!POS_MEM_INPUT_DISPLAY_BOT #= !POS_MEM_INPUT_DISPLAY_TOP+12

!EXTRAS_SIZE #= 12+(!NUMBER_OF_COUNTERS*16)

!POS_MEM_INPUT_DISPLAY_TOP = $7EC728
!POS_MEM_INPUT_DISPLAY_BOT = $7EC768

!offsetWA = $7F7680
!offsetincWA = 0
macro def_wramA(name, size)
	!ram_<name> #= !offsetWA+!offsetincWA
	!offsetincWA #= !offsetincWA+<size>
endmacro

; ==== RAM usage ====
;
; 7C[0x08] (84)
; 8E[0x02] (90)
; AB[0x02]
; B6[0x01]
; 7A[0x01]
; 7C[0x02]
; 04CB[0x25] (04F0)
; $7F7667[0x6719] (7FDD80)
; $7EC900[0x1F00] (7EE800)
;  * 7ED000 - 7ED780 = VRAM buffer backup in custom_menu.asm

; timers BCD
!room_time_F = $0230 ; [0x2]
!room_time_S = $0232 ; [0x2]
!lag_frames = $0234 ; [0x2]
!idle_frames = $0236 ; [0x2]
!seg_time_F = $0238 ; [0x2]
!seg_time_S = $023A ; [0x2]
!seg_time_M = $023C ; [0x2]

!room_time_F_disp = $0240 ; [0x2]
!room_time_S_disp = $0242 ; [0x2]
!lag_frames_disp = $0244 ; [0x2]
!idle_frames_disp = $0246 ; [0x2]
!seg_time_F_disp = $0248 ; [0x2]
!seg_time_S_disp = $024A ; [0x2]
!seg_time_M_disp = $024C ; [0x2]

!lag_cache = $04CC
!do_heart_lag = $04CE

; old stuff
!lowram_room_gametime = $04CC

!lowram_last_frame_did_saveload = $04DA
!lowram_draw_tmp = $04DC
!lowram_draw_tmp2 = $04DE
!lowram_draw_tmp3 = $04E0

!lowram_is_poverty_load = $04E6

!lowram_idle_frames = $04EA
!lowram_idle_frames_copy = $04EC

!lowram_nmi_counter = $04EE

; AXLR|....|BYSlSt|udlr
!ram_ctrl1 = $04E4
%def_wramA("ctrl1_filtered", 2)
%def_wramA("ctrl1_word_copy", 2)

%def_wramA("gamemode_copy", 2)
%def_wramA("submode_copy", 2)
%def_wramA("received_item_copy", 2)

!ram_gamemode_copy = $6F
!ram_submode_copy = $70
!ram_received_item_copy = $71
!ram_can_reset_timer = $8E
!timer_allowed = !ram_can_reset_timer

%def_wramA("hex2dec_tmp", 2)
%def_wramA("hex2dec_first_digit", 2)
%def_wramA("hex2dec_second_digit", 2)
%def_wramA("hex2dec_third_digit", 2)

%def_wramA("qw_last_scroll", 2)
%def_wramA("lanmola_cycles", 2) ; 3 bytes
%def_wramA("lanmola_cycles3", 2)
%def_wramA("rng_counter", 2)
%def_wramA("pokey_rng", 2)
%def_wramA("agahnim_rng", 2)
%def_wramA("helmasaur_rng", 2)
%def_wramA("ganon_warp_location_rng", 2)
%def_wramA("ganon_warp_rng", 2)
%def_wramA("eyegore_rng", 2)
%def_wramA("arrghus_rng", 2)
%def_wramA("turtles_rng", 2)
%def_wramA("framerule", 2)
%def_wramA("lanmola_rng", 2)
%def_wramA("conveyor_rng", 2)
%def_wramA("drop_rng", 2)
%def_wramA("vitreous_rng", 2)

%def_wramA("ctrl_last_input", 2)

; Account for different SRAM layouts

if !FEATURE_SD2SNES
	!offset = $770100
	!statename = "State"
	!statename2 = "State"
else
	!offset = $701E00
	!statename = "Preset"
	!statename2 = "saved preset"
endif

!offsetinc = 0
!OFF = 0
!ON = 1
!HUDONLY = select(!FEATURE_HUD, !ON, !OFF)

macro def_sram(name, default)
	!ram_<name> #= !offset+!offsetinc
	!newval := "LDA.w #<default> : STA.l !ram_<name>"

	if defined("INIT_ASSEMBLY")
		!INIT_ASSEMBLY := "!INIT_ASSEMBLY : !newval"
	else
		!INIT_ASSEMBLY := "!newval"
	endif

	!offsetinc #= !offsetinc+2
endmacro

macro def_perm_sram(name, default)
	!ram_<name> #= !offset+!offsetinc
	!newval := "LDA.w #<default> : STA.l !ram_<name>"

	if defined("PERM_INIT")
		!PERM_INIT := "!PERM_INIT : !newval"
	else
		!PERM_INIT := "!newval"
	endif

	!offsetinc #= !offsetinc+2
endmacro

%def_sram("sram_initialized", !OFF)

; permanent SRAM that works across versions
; DO NOT CHANGE THE ORDER OF THESE
%def_perm_sram("ctrl_prachack_menu", $1010)
%def_perm_sram("ctrl_load_last_preset", $20A0)
%def_perm_sram("ctrl_replay_last_movie", $3020)
%def_perm_sram("ctrl_save_state", $1060)
%def_perm_sram("ctrl_load_state", $2060)
%def_perm_sram("ctrl_toggle_oob", !OFF)
%def_perm_sram("ctrl_skip_text", !OFF)
%def_perm_sram("ctrl_disable_sprites", !OFF)
%def_perm_sram("ctrl_reset_segment_timer", !OFF)
%def_perm_sram("ctrl_fill_everything", !OFF)
%def_perm_sram("ctrl_fix_vram", !OFF)
%def_perm_sram("ctrl_somaria_pits", !OFF)
%def_perm_sram("preset_category", $0000)
%def_perm_sram("hud_font", 0)
%def_perm_sram("feature_music", !ON)
%def_perm_sram("input_display", !HUDONLY)

; Placeholders for future SRAM
; this way, future updates will end up in one of these
; instead of say, a preset thing
%def_sram("PLACEHOLDER_0", 0)
%def_sram("PLACEHOLDER_1", 0)
%def_sram("PLACEHOLDER_2", 0)
%def_sram("PLACEHOLDER_3", 0)
%def_sram("PLACEHOLDER_4", 0)
%def_sram("PLACEHOLDER_5", 0)
%def_sram("PLACEHOLDER_6", 0)
%def_sram("PLACEHOLDER_7", 0)
%def_sram("PLACEHOLDER_8", 0)
%def_sram("PLACEHOLDER_9", 0)
%def_sram("PLACEHOLDER_A", 0)
%def_sram("PLACEHOLDER_B", 0)
%def_sram("PLACEHOLDER_C", 0)
%def_sram("PLACEHOLDER_D", 0)
%def_sram("PLACEHOLDER_E", 0)
%def_sram("PLACEHOLDER_F", 0)
%def_sram("PLACEHOLDER_G", 0)
%def_sram("PLACEHOLDER_H", 0)
%def_sram("PLACEHOLDER_I", 0)
%def_sram("PLACEHOLDER_J", 0)
%def_sram("PLACEHOLDER_K", 0)
%def_sram("PLACEHOLDER_L", 0)
%def_sram("PLACEHOLDER_M", 0)
%def_sram("PLACEHOLDER_N", 0)
%def_sram("PLACEHOLDER_O", 0)
%def_sram("PLACEHOLDER_P", 0)
%def_sram("PLACEHOLDER_Q", 0)
%def_sram("PLACEHOLDER_R", 0)
%def_sram("PLACEHOLDER_S", 0)
%def_sram("PLACEHOLDER_T", 0)
%def_sram("PLACEHOLDER_U", 0)
%def_sram("PLACEHOLDER_V", 0)
%def_sram("PLACEHOLDER_W", 0)
%def_sram("PLACEHOLDER_X", 0)
%def_sram("PLACEHOLDER_Y", 0)
%def_sram("PLACEHOLDER_Z", 0)

; Non permanent SRAM
; these can be moved around
%def_sram("qw_toggle", !OFF)

%def_sram("can_load_pss", !OFF)
%def_sram("previous_preset_destination", !OFF)
%def_sram("previous_preset_type", !OFF)
%def_sram("autoload_preset", !OFF)

%def_sram("lagometer_toggle", !OFF)
%def_sram("secondary_counter_type", !OFF)
%def_sram("toggle_lanmola_cycles", !HUDONLY)

%def_sram("xy_toggle", !HUDONLY)
%def_sram("counters_real", !HUDONLY)
%def_sram("counters_lag", !HUDONLY)
%def_sram("counters_idle", !HUDONLY)
%def_sram("counters_segment", !OFF)
%def_sram("heartlag_spinner", !OFF)
%def_sram("extra_ram_watch", !OFF)
%def_sram("superwatch", !OFF)

%def_sram("rerandomize_framecount", 0)
%def_sram("rerandomize_accumulator", 0)

%def_sram("enemy_hp_toggle", !OFF)
%def_sram("lit_rooms_toggle", !OFF)
%def_sram("fast_moving_walls", !OFF)
%def_sram("probe_toggle", !OFF)
%def_sram("sanctuary_heart",!OFF )
%def_sram("rerandomize_toggle", !ON)
%def_sram("skip_triforce_toggle", !OFF)
%def_sram("bonk_items_toggle", !OFF)

!lowram_oob_toggle = $037F
!ram_eg_strength = $7E044A

%def_wramA("debug", 2)
%def_wramA("debug2", 2)

%def_wramA("cm_old_gamemode", 1)
%def_wramA("cm_old_submode", 1)

%def_wramA("cm_menu_stack", $10) ; 0x10
%def_wramA("cm_menu_bank_stack", $10) ; 0x10
!lowram_cm_cursor_stack = $0648 ; 0x10
!lowram_cm_stack_index = $0658
%def_wramA("cm_last_frame_input", 2)
%def_wramA("cm_input_timer", 2)
%def_wramA("cm_opened_menu_maunally", 2)

%def_wramA("cm_old_crystal_switch", 2)

!sram_ss_dma_buffer = $770000
!sram_old_music_bank = $770080
!sram_pss_offset = $702000

;-------------------------
; Transition detection
;-------------------------
!ram_linkOAMpos = $7C

;-------------------------
; Transition detection
;-------------------------

!TD_RESET = $00
!TD_SHOW = $01

;-------------------------
; Layers
;-------------------------
!disabled_layers = $B6
!disabled_layers_temp = $AB ; 2 bytes

;-------------------------
; Sword beams
;-------------------------
!disable_beams = $7A

;-------------------------
; HUD
;-------------------------

!POS_COUNTERS = $34

!POS_HEARTS = $92
!POS_MEM_HEART_GFX = $7EC790

!POS_MEM_HEARTLAG = $7EC798

!POS_CONTAINERS = $9C
!POS_MEM_CONTAINER_GFX = $7EC79A

!POS_ENEMY_HEARTS = $A4
!POS_MEM_ENEMY_HEART_GFX = $7EC7A2

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
!CM_ACTION_MOVIE = #$18
!CM_ACTION_TOGGLE_BIT_TEXT = #$1A

%def_wramA("react_counter", 2)
%def_wramA("react_frames", 2)

%def_wramA("mash_counter", 2)
%def_wramA("mash_inputs", 2)


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
%def_wramA("preset_destination", 2)
%def_wramA("preset_end_of_sram_state", 2)
%def_wramA("preset_spotlight_timer", 2)

;-------------------------
; MOVIE
;-------------------------

!ram_movie_mode = $7F8000
!ram_movie_index = $0000
!ram_movie_timer = $7E
!ram_movie_length = $80
!ram_movie_rng_index = $82
!ram_movie_rng_length = $0258
!ram_prev_ctrl = $7F8006
!ram_movie_framecounter = $7F8002
!ram_movie_next_mode = $7F8004
!ram_movie = $7F8020
%def_wramA("movie_hud", $40) ; [0x40]

if !FEATURE_SD2SNES
	!sram_movies = $771000
	!sram_movie_data = $771100
	!sram_movie_data_size = $6F00
else
	!sram_movies = $703000
	!sram_movie_data = $703200
	!sram_movie_data_size = $4E00
endif

!sram_movies_length = !sram_movies+0
!sram_movies_input_length = !sram_movies+2
!sram_movies_rng_length = !sram_movies+4
!sram_movies_offset = !sram_movies+6
!sram_movies_prev_slot = !sram_movies+8
!sram_movies_next_slot = !sram_movies+10
!sram_movies_frame_counter = !sram_movies+12
!sram_movies_preset_type = !sram_movies+13
!sram_movies_preset_destination = !sram_movies+14

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
	%def_wramA("cm_item_bow", 1)
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
	%def_wramA("cm_item_bottle", 1)
	!ram_item_bottle_array = $7EF35C
!ram_item_somaria = $7EF350
!ram_item_byrna = $7EF351
!ram_item_cape = $7EF352
!ram_item_mirror = $7EF353
	%def_wramA("cm_item_mirror", 1)

; EQUIPMENT MENU

!ram_equipment_boots = $7EF355
!ram_equipment_gloves = $7EF354
!ram_equipment_flippers = $7EF356
!ram_equipment_moon_pearl = $7EF357
!ram_equipment_sword = $7EF359
!ram_equipment_shield = $7EF35A
!ram_equipment_armor = $7EF35B
!ram_equipment_maxhp = $7EF36C
	%def_wramA("cm_equipment_maxhp", 1)
!ram_equipment_curhp = $7EF36D
!ram_equipment_arrows_filler = $7EF377
!ram_equipment_arrows = $7EF377
!ram_equipment_keys = $7EF36F
!ram_equipment_half_magic = $7EF37B
!ram_equipment_magic_meter = $7EF36E

; OTHER

!ram_cm_gamestate_world = $7EF3CA

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
	LDA #$81 : STA $4200
	LDA #$0F : STA $13 : STA $2100
	PLA : STA $9B : STA $420C
endmacro

; 13 cycles
; next opcode takes 1 cycle to fetch
; that makes 14
macro wait_14_cycles()
	NOP : PHD : PLD : NOP
	NOP ; I think it needs to be 15+1 for 16?
endmacro
