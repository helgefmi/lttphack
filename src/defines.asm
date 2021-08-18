!SRAM_VERSION = $0030
!INIT_SIGNATURE = $25A4

;===================================================================================================
; Memory map:
; Bank 40:
;    $0000..$1FFF - vanilla SRAM
;    $6000..$7FFF - mirrored to page $60 for SNES
;    $9000..$97FF - unused
;    $9800..$9EFF - SA-1 savestate for $3000..$36FF
; Bank 41: savestates
; Bank 42: savestates
;    $0000..$FFFF - vram mirror
;===================================================================================================
org $400000
SA1SRAM = $400000

struct SA1RAM $406000
	.HUD skip $800 ; bg3 HUD
	.MENU skip $800 ; practice menu

	org $407000 ; DO NOT CHANGE THIS
	.SETTINGS: skip $400

	.SNES_NMI_VECTOR: skip 4
	.SNES_NMI_args: skip 8

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
	.ganon_bats: skip 2

	.react_counter: skip 2
	.react_frames: skip 2

	.mash_counter: skip 2
	.mash_inputs: skip 2

	.CM_SubMenuIndex: skip 2
	.CM_SubMenuStack: skip 40

	.loadroomid: skip 2

	.disabled_layers: skip 2
	.layer_writer: skip 2

	.old_music: skip 1
.end_of_clearable_sa1ram:

	.cm_input_timer: skip 2
	.cm_last_input: skip 2
	.LayerCache: skip 2

	.cm_item_bow: skip 1
	.cm_equipment_maxhp: skip 1

	.movie_hud: skip $40

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
!QMARK = $252A
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

!ram_extra_sa1_required = $35

!offset = $407000
!offsetinc = 0
!OFF = 0
!ON = 1

macro def_sram(name, default)
	!ram_<name> #= !offset+!offsetinc
	!newval := "dw !ram_<name>, <default>"

	if defined("PERM_INIT")
		!PERM_INIT := "!PERM_INIT : !newval"
	else
		!PERM_INIT := "!newval"
	endif

	!offsetinc #= !offsetinc+2
endmacro

macro def_sram_long(name, size)
	!ram_<name> #= !offset+!offsetinc

	!offsetinc #= !offsetinc+<size>
endmacro

%def_sram("sram_initialized", !SRAM_VERSION)

; permanent SRAM that doesn't reinit across versions
; DO NOT CHANGE THE ORDER OF THESE
%def_sram("init_sig", !INIT_SIGNATURE)

%def_sram("cm_save_place", 0)

%def_sram("ctrl_load_last_preset", $A020)
%def_sram("ctrl_replay_last_movie", $3020)
%def_sram("ctrl_save_state", $6010)
%def_sram("ctrl_load_state", $6020)

%def_sram("ctrl_toggle_oob", !OFF)
%def_sram("ctrl_skip_text", !OFF)
%def_sram("ctrl_disable_sprites", !OFF)
%def_sram("ctrl_reset_segment_timer", !OFF)

%def_sram("ctrl_toggle_switch", !OFF)
%def_sram("ctrl_fill_everything", !OFF)
%def_sram("ctrl_fix_vram", !OFF)
%def_sram("ctrl_somaria_pits", !OFF)

%def_sram("preset_category", $0000)

%def_sram("hud_font", 0)

%def_sram("input_display", 1)
%def_sram("heart_display", 0)
%def_sram("feature_music", !ON)

%def_sram("counter1", 1) ; room time
%def_sram("counter2", 2) ; lag time
%def_sram("counter3", 3) ; idle time
%def_sram("counter4", !OFF)
%def_sram("counter5", 5) ; coords

%def_sram("linecounter1", !OFF)
%def_sram("linecounter2", !OFF)
%def_sram("linecounter3", !OFF)
%def_sram("linecounter4", !OFF)

%def_sram("ancprop1", 0)
%def_sram("ancprop2", 0)
%def_sram("ancprop3", 0)
%def_sram("ancprop4", 0)

%def_sram("qw_toggle", !ON)
%def_sram("heartlag_spinner", !ON)
%def_sram("toggle_boss_cycles", !ON)

%def_sram("lit_rooms_toggle", !OFF)
%def_sram("fast_moving_walls", !OFF)
%def_sram("probe_toggle", !OFF)

%def_sram("rerandomize_toggle", !ON)
%def_sram("skip_triforce_toggle", !OFF)
%def_sram("bonk_items_toggle", !OFF)

%def_sram("hud_bg", 0)
%def_sram("hud_header_fg", 1)
%def_sram("hud_header_hl", 10)
%def_sram("hud_header_bg", 0)
%def_sram("hud_sel_fg", 8)
%def_sram("hud_sel_bg", 9)
%def_sram("hud_dis_fg", 3)

%def_sram("death_reload", !OFF)

%def_sram("use_custom_load", !OFF)
%def_sram_long("custom_load", $22) ; 7EF340-7EF361
%def_sram_long("custom_load_2", 5)

%def_sram("safeties_nmg_sanc_heart", !OFF)
%def_sram("safeties_nmg_powder", !OFF)
%def_sram("safeties_nmg_gs", !OFF)
%def_sram("safeties_nmg_bottles", !OFF)
%def_sram("safeties_nmg_red_mail", !OFF)

%def_sram("safeties_hundo_trinexx_boom", !OFF)

%def_sram("safeties_ad2020_silvers", !OFF)

%def_sram("safeties_adold_silvers", !OFF)

%def_sram("safeties_anyrmg_hook", !OFF)

; Placeholders for future SRAM
; this way, future updates will end up in one of these
; instead of say, a preset thing
%def_sram("PLACEHOLDER_00", 0)
%def_sram("PLACEHOLDER_01", 0)
%def_sram("PLACEHOLDER_02", 0)
%def_sram("PLACEHOLDER_03", 0)
%def_sram("PLACEHOLDER_04", 0)
%def_sram("PLACEHOLDER_05", 0)
%def_sram("PLACEHOLDER_06", 0)
%def_sram("PLACEHOLDER_07", 0)
%def_sram("PLACEHOLDER_08", 0)
%def_sram("PLACEHOLDER_09", 0)
%def_sram("PLACEHOLDER_0A", 0)
%def_sram("PLACEHOLDER_0B", 0)
%def_sram("PLACEHOLDER_0C", 0)
%def_sram("PLACEHOLDER_0D", 0)
%def_sram("PLACEHOLDER_0E", 0)
%def_sram("PLACEHOLDER_0F", 0)
%def_sram("PLACEHOLDER_0G", 0)
%def_sram("PLACEHOLDER_0H", 0)
%def_sram("PLACEHOLDER_0I", 0)
%def_sram("PLACEHOLDER_0J", 0)
%def_sram("PLACEHOLDER_0K", 0)
%def_sram("PLACEHOLDER_0L", 0)
%def_sram("PLACEHOLDER_0M", 0)
%def_sram("PLACEHOLDER_0N", 0)
%def_sram("PLACEHOLDER_0O", 0)
%def_sram("PLACEHOLDER_0P", 0)
%def_sram("PLACEHOLDER_0Q", 0)
%def_sram("PLACEHOLDER_0R", 0)
%def_sram("PLACEHOLDER_0S", 0)
%def_sram("PLACEHOLDER_0T", 0)
%def_sram("PLACEHOLDER_0U", 0)
%def_sram("PLACEHOLDER_0V", 0)
%def_sram("PLACEHOLDER_0W", 0)
%def_sram("PLACEHOLDER_0X", 0)
%def_sram("PLACEHOLDER_0Y", 0)
%def_sram("PLACEHOLDER_0Z", 0)
%def_sram("PLACEHOLDER_10", 0)
%def_sram("PLACEHOLDER_11", 0)
%def_sram("PLACEHOLDER_12", 0)
%def_sram("PLACEHOLDER_13", 0)
%def_sram("PLACEHOLDER_14", 0)
%def_sram("PLACEHOLDER_15", 0)
%def_sram("PLACEHOLDER_16", 0)
%def_sram("PLACEHOLDER_17", 0)
%def_sram("PLACEHOLDER_18", 0)
%def_sram("PLACEHOLDER_19", 0)
%def_sram("PLACEHOLDER_1A", 0)
%def_sram("PLACEHOLDER_1B", 0)
%def_sram("PLACEHOLDER_1C", 0)
%def_sram("PLACEHOLDER_1D", 0)
%def_sram("PLACEHOLDER_1E", 0)
%def_sram("PLACEHOLDER_1F", 0)
%def_sram("PLACEHOLDER_1G", 0)
%def_sram("PLACEHOLDER_1H", 0)
%def_sram("PLACEHOLDER_1I", 0)
%def_sram("PLACEHOLDER_1J", 0)
%def_sram("PLACEHOLDER_1K", 0)
%def_sram("PLACEHOLDER_1L", 0)
%def_sram("PLACEHOLDER_1M", 0)
%def_sram("PLACEHOLDER_1N", 0)
%def_sram("PLACEHOLDER_1O", 0)
%def_sram("PLACEHOLDER_1P", 0)
%def_sram("PLACEHOLDER_1Q", 0)
%def_sram("PLACEHOLDER_1R", 0)
%def_sram("PLACEHOLDER_1S", 0)
%def_sram("PLACEHOLDER_1T", 0)
%def_sram("PLACEHOLDER_1U", 0)
%def_sram("PLACEHOLDER_1V", 0)
%def_sram("PLACEHOLDER_1W", 0)
%def_sram("PLACEHOLDER_1X", 0)
%def_sram("PLACEHOLDER_1Y", 0)
%def_sram("PLACEHOLDER_1Z", 0)
%def_sram("PLACEHOLDER_20", 0)
%def_sram("PLACEHOLDER_21", 0)
%def_sram("PLACEHOLDER_22", 0)
%def_sram("PLACEHOLDER_23", 0)
%def_sram("PLACEHOLDER_24", 0)
%def_sram("PLACEHOLDER_25", 0)
%def_sram("PLACEHOLDER_26", 0)
%def_sram("PLACEHOLDER_27", 0)
%def_sram("PLACEHOLDER_28", 0)
%def_sram("PLACEHOLDER_29", 0)
%def_sram("PLACEHOLDER_2A", 0)
%def_sram("PLACEHOLDER_2B", 0)
%def_sram("PLACEHOLDER_2C", 0)
%def_sram("PLACEHOLDER_2D", 0)
%def_sram("PLACEHOLDER_2E", 0)
%def_sram("PLACEHOLDER_2F", 0)
%def_sram("PLACEHOLDER_2G", 0)
%def_sram("PLACEHOLDER_2H", 0)
%def_sram("PLACEHOLDER_2I", 0)
%def_sram("PLACEHOLDER_2J", 0)
%def_sram("PLACEHOLDER_2K", 0)
%def_sram("PLACEHOLDER_2L", 0)
%def_sram("PLACEHOLDER_2M", 0)
%def_sram("PLACEHOLDER_2N", 0)
%def_sram("PLACEHOLDER_2O", 0)
%def_sram("PLACEHOLDER_2P", 0)
%def_sram("PLACEHOLDER_2Q", 0)
%def_sram("PLACEHOLDER_2R", 0)
%def_sram("PLACEHOLDER_2S", 0)
%def_sram("PLACEHOLDER_2T", 0)
%def_sram("PLACEHOLDER_2U", 0)
%def_sram("PLACEHOLDER_2V", 0)
%def_sram("PLACEHOLDER_2W", 0)
%def_sram("PLACEHOLDER_2X", 0)
%def_sram("PLACEHOLDER_2Y", 0)
%def_sram("PLACEHOLDER_2Z", 0)

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

GetRandomInt = $0DBA71
UseImplicitRegIndexedLocalJumpTable = $008781
BirdTravel_LoadTargetAreaData = $02E99D
BirdTravel_LoadTargetAreaData_AfterData = $02EA30
Player_ResetState = $07F18C
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
