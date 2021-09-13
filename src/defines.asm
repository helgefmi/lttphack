!SRAM_VERSION = $0030
!INIT_SIGNATURE = $25A4

function hexto555(h) = ((((h&$FF)/8)<<10)|(((h>>8&$FF)/8)<<5)|(((h>>16&$FF)/8)<<0))

;===================================================================================================
; Memory map:
; Bank 40:
;    $0000..$1FFF - vanilla SRAM
;    $2000..$5FFF - unused
;    $6000..$7FFF - mirrored to page $60 for SNES
;    $9000..$97FF - unused
;    $9800..$9EFF - SA-1 savestate for $3000..$36FF
; Bank 41: savestates
; Bank 42: savestates vram
; Bank 43:
;    $0000..$7FFF - Lite States
;===================================================================================================
org $400000
SA1SRAM = $400000
LiteStateData = $430000

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

	.old_music: skip 1
	.old_music_bank: skip 1

.clearable_sa1ram:
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

	.CM_SubMenuIndex: skip 2
	.CM_SubMenuStack: skip 40

	.loadroomid: skip 2
	.loadroomshutters: skip 2
	.loadroomkill: skip 2
	.loadroompegset: skip 2
	.loadroomdungeonset: skip 2
	.loadroomworldset: skip 2
	.loadroomequip: skip 2
	.loadroomdungeon: skip 1
	.loadroompegstate: skip 1
	.loadroomeg: skip 1

	.disabled_layers: skip 2
	.layer_writer: skip 2

.end_of_clearable_sa1ram:

	.cm_input_timer: skip 2
	.cm_last_input: skip 2

	.cm_item_bow: skip 1
	.cm_equipment_maxhp: skip 1

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

!config_extra_sa1_required = $35

!offset = $407000
!offsetinc = 0
!OFF = 0
!ON = 1

macro def_sram(name, default)
	!config_<name> #= !offset+!offsetinc
	!newval := "dw !config_<name>, <default>"

	if defined("PERM_INIT")
		!PERM_INIT := "!PERM_INIT : !newval"
	else
		!PERM_INIT := "!newval"
	endif

	!offsetinc #= !offsetinc+2
	!last_config #= !offsetinc
endmacro

macro def_sram_long(name, size)
	!config_<name> #= !offset+!offsetinc

	!offsetinc #= !offsetinc+<size>
	!last_config #= !offsetinc
endmacro

%def_sram("sram_initialized", !SRAM_VERSION)

; permanent SRAM that doesn't reinit across versions
; DO NOT CHANGE THE ORDER OF THESE
%def_sram("init_sig", !INIT_SIGNATURE)

%def_sram("cm_save_place", 0)

%def_sram("ctrl_load_last_preset", $A020)
%def_sram("ctrl_unused", $0000)
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

%def_sram("sentry1", 1) ; room time
%def_sram("sentry2", 2) ; lag time
%def_sram("sentry3", 3) ; idle time
%def_sram("sentry4", !OFF)
%def_sram("sentry5", 5) ; coords

%def_sram("linesentry1", !OFF)
%def_sram("linesentry2", !OFF)
%def_sram("linesentry3", !OFF)
%def_sram("linesentry4", !OFF)

%def_sram("ancprop1", 0)
%def_sram("ancprop2", 0)
%def_sram("ancprop3", 0)
%def_sram("ancprop4", 0)

%def_sram("qw_toggle", !ON)
%def_sram("hudlag_spinner", !ON)
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

%def_sram("safeties_100nmg_trinexx_boom", !OFF)

%def_sram("safeties_ad2020_silvers", !OFF)

%def_sram("safeties_adold_silvers", !OFF)

%def_sram("safeties_anyrmg_hook", !OFF)

%def_sram("state_icons", !OFF)

%def_sram("somaria_pits", !OFF)

print ""
print "Config end: $", hex(!last_config,3)

if !last_config > $3FF
	error "Too many config settings!"
endif


;-------------------------
; Sword beams
;-------------------------
!disable_beams = $7A

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
