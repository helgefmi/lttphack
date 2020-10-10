!SRAM_VERSION = $0030
!INIT_SIGNATURE = $25A4

;==============================================================================
; Memory map:
; Bank 40:
;    $0000..$1FFF - vanilla SRAM
;    $6000..$7FFF - mirrored to page $60 for SNES
;    $9000..$97FF - unused
;    $9800..$9EFF - SA-1 savestate for $3000..$36FF
; Bank 41: savestates
;    $0000..$5FFF - 7E:0000..7E:5FFF
;    $6000..$68FF - 7E:C000..7E:C8FF
;    $6900..$80FF - 7E:E800..7E:FFFF
;    $8100..$E0FF - 7F:0000..7F:5FFF
;    $E100..$F2FF - 7F:DD80..7F:EF80
;    $F300..$FAFF - 7F:EF80..7F:FFFF
; Bank 42: savestates
;    $0000..$FFFF - vram mirror
;==============================================================================
org $400000
SA1SRAM = $400000

struct SA1RAM $406000
	.HUD skip $800 ; bg3 HUD
	.MENU skip $800 ; practice menu

	.SETTINGS: skip $400

	.SNES_NMI_VECTOR: skip 4
	.SNES_NMI_args: skip 8

	; stuff
	.hex2dec_tmp: skip 2
	.hex2dec_first_digit: skip 2
	.hex2dec_second_digit: skip 2
	.hex2dec_third_digit: skip 2

.clearable_sa1ram:
	.rng_counter: skip 2
	.rng_cache: skip 1
	.frame_cache: skip 1
	.pokey_rng: skip 2
	.agahnim_rng: skip 2
	.helmasaur_rng: skip 2
	.ganon_warp_location_rng: skip 2
	.ganon_warp_rng: skip 2
	.eyegore_rng: skip 2
	.arrghus_rng: skip 2
	.turtles_rng: skip 2
	.framerule: skip 2
	.lanmola_rng: skip 2
	.conveyor_rng: skip 2
	.drop_rng: skip 2
	.vitreous_rng: skip 2

	.react_counter: skip 2
	.react_frames: skip 2

	.mash_counter: skip 2
	.mash_inputs: skip 2

	.preset_end_of_sram_state: skip 2
	.preset_spotlight_timer: skip 2

	.CM_SubMenuIndex: skip 2
	.CM_SubMenuStack: skip 40

	.loadroomid: skip 2

	.disabled_layers: skip 2

	.old_music: skip 1
.end_of_clearable_sa1ram:

	.cm_input_timer: skip 2
	.cm_last_input: skip 2
	.LayerCache: skip 2

	.cm_item_bow: skip 1
	.cm_equipment_maxhp: skip 1

	.movie_hud: skip $40

	.ss_dma_buffer: skip $80
	.ss_old_music_bank: skip 2

	warnpc $407FFF
endstruct

macro MVN(src, dest) ; why asar
	MVN <dest>, <src>
endmacro

macro MVP(src, dest)
	MVP <dest>, <src>
endmacro


; Magic words
!EMPTY = $207F
!QMARK = $212A
!BLANK_TILE = $24F5

; special stuff

function color(h) = ((((h&$FF)/8)<<10)|(((h>>8&$FF)/8)<<5)|(((h>>16&$FF)/8)<<0))

; ==== RAM usage ====
;
; 7C[0x08] (84)
; 8E[0x02] (90)
; B6[0x01]
; 7A[0x01]
; 7C[0x02]
; 04CB[0x25] (04F0)

; old stuff
!ram_extra_sa1_required = $6F

!offset = $407000
!offsetinc = 0
!OFF = 0
!ON = 1

macro def_sram(name, default)
	!ram_<name> #= !offset+!offsetinc
	!newval := "dw !ram_<name>, <default>"

	if defined("TEMP_INIT")
		!TEMP_INIT := "!TEMP_INIT : !newval"
	else
		!TEMP_INIT := "!newval"
	endif

	!offsetinc #= !offsetinc+2
endmacro

macro def_perm_sram(name, default)
	!ram_<name> #= !offset+!offsetinc
	!newval := "dw !ram_<name>, <default>"

	if defined("PERM_INIT")
		!PERM_INIT := "!PERM_INIT : !newval"
	else
		!PERM_INIT := "!newval"
	endif

	!offsetinc #= !offsetinc+2
endmacro

%def_sram("sram_initialized", !SRAM_VERSION)

; permanent SRAM that doesn't reinit across versions
; DO NOT CHANGE THE ORDER OF THESE
%def_perm_sram("init_sig", !INIT_SIGNATURE)
%def_perm_sram("cm_save_place", 0)

%def_perm_sram("ctrl_load_last_preset", $20A0)
%def_perm_sram("ctrl_replay_last_movie", $3020)
%def_perm_sram("ctrl_save_state", $1060)
%def_perm_sram("ctrl_load_state", $2060)

%def_perm_sram("ctrl_toggle_oob", !OFF)
%def_perm_sram("ctrl_skip_text", !OFF)
%def_perm_sram("ctrl_disable_sprites", !OFF)
%def_perm_sram("ctrl_reset_segment_timer", !OFF)

%def_perm_sram("ctrl_toggle_switch", !OFF)
%def_perm_sram("ctrl_fill_everything", !OFF)
%def_perm_sram("ctrl_fix_vram", !OFF)
%def_perm_sram("ctrl_somaria_pits", !OFF)

%def_perm_sram("preset_category", $0000)

%def_perm_sram("hud_font", 1)
%def_perm_sram("input_display", !ON)
%def_perm_sram("heart_display", 0)
%def_perm_sram("feature_music", !ON)

%def_perm_sram("counter1", 1) ; room time
%def_perm_sram("counter2", 2) ; lag time
%def_perm_sram("counter3", 3) ; idle time
%def_perm_sram("counter4", !OFF)
%def_perm_sram("counter5", 5) ; coords

%def_perm_sram("linecounter1", !OFF)
%def_perm_sram("linecounter2", !OFF)
%def_perm_sram("linecounter3", !OFF)
%def_perm_sram("linecounter4", !OFF)

%def_perm_sram("ancprop1", 0)
%def_perm_sram("ancprop2", 0)
%def_perm_sram("ancprop3", 0)
%def_perm_sram("ancprop4", 0)

%def_perm_sram("qw_toggle", !ON)
%def_perm_sram("heartlag_spinner", !OFF)

%def_perm_sram("enemy_hp_toggle", !OFF)
%def_perm_sram("lit_rooms_toggle", !OFF)
%def_perm_sram("fast_moving_walls", !OFF)
%def_perm_sram("probe_toggle", !OFF)

%def_perm_sram("nmg_sanctuary_heart",!OFF)
%def_perm_sram("nmg_powder",!OFF)
%def_perm_sram("rerandomize_toggle", !ON)
%def_perm_sram("skip_triforce_toggle", !OFF)
%def_perm_sram("bonk_items_toggle", !OFF)

%def_perm_sram("hud_bg", 0)
%def_perm_sram("hud_header_fg", 1)
%def_perm_sram("hud_header_hl", 10)
%def_perm_sram("hud_header_bg", 0)
%def_perm_sram("hud_sel_fg", 8)
%def_perm_sram("hud_sel_bg", 9)
%def_perm_sram("hud_dis_fg", 3)

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

; Non permanent SRAM
; these can be moved around
%def_sram("previous_preset_destination", !OFF)
%def_sram("previous_preset_type", !OFF)
%def_sram("autoload_preset", !OFF)

%def_sram("lagometer_toggle", !OFF)
%def_sram("toggle_lanmola_cycles", !ON)

%def_sram("superwatch", !OFF)

!lowram_oob_toggle = $037F

;-------------------------
; Transition detection
;-------------------------
!ram_linkOAMpos = $7C

;-------------------------
; Sword beams
;-------------------------
!disable_beams = $7A

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

!sram_movies = $771000
!sram_movie_data = $771100
!sram_movie_data_size = $6F00

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

RandomNumGen = $0DBA71
UseImplicitRegIndexedLocalJumpTable = $008781
BirdTravel_LoadTargetAreaData = $02E99D
BirdTravel_LoadTargetAreaData_AfterData = $02EA30
Player_ResetState = $07F18C
Tagalong_LoadGfx = $00D463
Sprite_ResetAll = $09C44E
Sprite_DisableAll = $09C44E
Sprite_LoadGfxProperties = $00FC41
UpdateBarrierTileChr = $0296AD ; $117B2-$117C7
Dungeon_AnimateTrapDoors = $01D38D
Dungeon_LoadEntrance = $02D617

DecompSwordGfx = $00D308
Palette_Sword = $1BED03
DecompShieldGfx = $00D348
Palette_Shield = $1BED29
Palette_Armor = $1BEDF9
LoadGearPalettes_bunny = $02FD8A

; ITEM MENU

!ram_item_bow = $7EF340
!ram_item_boom = $7EF341
!ram_item_hook = $7EF342
!ram_item_bombs = $7EF343
!ram_item_powder = $7EF344
!ram_item_fire_rod = $7EF345
!ram_item_ice_rod = $7EF346
!ram_item_bombos = $7EF347
!ram_item_ether = $7EF348
!ram_item_quake = $7EF349
!ram_item_lantern = $7EF34A
!ram_item_hammer = $7EF34B
!ram_item_flute = $7EF34C
!ram_item_net = $7EF34D
!ram_item_book = $7EF34E
!ram_item_bottle = $7EF34F
	!ram_item_bottle_1 = $7EF35C
	!ram_item_bottle_2 = $7EF35D
	!ram_item_bottle_3 = $7EF35E
	!ram_item_bottle_4 = $7EF35F
!ram_item_somaria = $7EF350
!ram_item_byrna = $7EF351
!ram_item_cape = $7EF352
!ram_item_mirror = $7EF353

; EQUIPMENT MENU

!ram_equipment_boots = $7EF355
!ram_equipment_gloves = $7EF354
!ram_equipment_flippers = $7EF356
!ram_equipment_moon_pearl = $7EF357
!ram_equipment_sword = $7EF359
!ram_equipment_shield = $7EF35A
!ram_equipment_armor = $7EF35B
!ram_equipment_maxhp = $7EF36C
!ram_equipment_curhp = $7EF36D
!ram_equipment_arrows_filler = $7EF377
!ram_equipment_arrows = $7EF377
!ram_equipment_keys = $7EF36F
!ram_equipment_half_magic = $7EF37B
!ram_equipment_magic_meter = $7EF36E

; OTHER

!ram_gamestate_world = $7EF3CA

!ram_game_big_keys_1 = $7EF366
!ram_game_big_keys_2 = $7EF367

!ram_game_pendants = $7EF374
!ram_game_crystals = $7EF37A

!ram_game_progress = $7EF3C5
!ram_game_flags = $7EF3C6
!ram_game_map_indicator = $7EF3C7
!ram_capabilities = $7EF379
