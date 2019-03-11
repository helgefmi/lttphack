macro cm_header(title)
    table ../resources/header.tbl
        db #$24, "<title>", #$FF
    table ../resources/normal.tbl
endmacro

macro cm_preset(title, addr)
    dw !CM_ACTION_PRESET
    dw <addr>
    db #$24, "<title>", #$FF
endmacro

macro cm_toggle(title, addr)
    dw !CM_ACTION_TOGGLE
    dl #<addr>
    db #$24, "<title>", #$FF
endmacro

macro cm_toggle_jsr(title, addr)
    dw !CM_ACTION_TOGGLE_JSR
    dw .toggle
    dl <addr>
    db #$24, "<title>", #$FF
endmacro

macro cm_submenu(title, addr)
    dw !CM_ACTION_SUBMENU
    dw <addr>
    db #$24, "<title>", #$FF
endmacro

macro cm_numfield(title, addr, start, end, increment)
    dw !CM_ACTION_NUMFIELD
    dl <addr>
    db <start>, <end>, <increment>
    db #$24, "<title>", #$FF
endmacro

macro cm_toggle_bit(title, addr, mask)
    dw !CM_ACTION_TOGGLE_BIT
    dl <addr>
    db <mask>
    db #$24, "<title>", #$FF
endmacro

macro cm_jsr(title)
    dw !CM_ACTION_JSR
    dw .routine
    db #$24, "<title>", #$FF
endmacro

macro cm_ctrl_shortcut(title, addr)
    dw !CM_ACTION_CTRL_SHORTCUT
    dl <addr>
    db #$24, "<title>", #$FF
endmacro

macro cm_movie(title, slot)
    dw !CM_ACTION_MOVIE
    db #<slot>
    db #$00, "<title>", #$FF
endmacro

; MAIN MENU

cm_mainmenu_indices:
    dw cm_main_goto_presets
    dw cm_main_goto_items
    dw cm_main_goto_equipment
    dw cm_main_goto_game_state
    dw cm_main_goto_rng_control
    dw cm_main_goto_ctrl
    dw cm_main_goto_counters
    dw cm_main_goto_features
    dw cm_main_goto_movies
    dw #$0000
    %cm_header("LTTPHACK !VERSION")

; ITEMS {{{

cm_main_goto_items:
    %cm_submenu("Items", cm_submenu_items)

cm_submenu_items:
    dw cm_items_bow
    dw cm_items_boom
    dw cm_items_hook
    dw cm_equipment_bombs
    dw cm_items_powder
    dw cm_items_fire_rod
    dw cm_items_ice_rod
    dw cm_items_bombos
    dw cm_items_ether
    dw cm_items_quake
    dw cm_items_lantern
    dw cm_items_hammer
    dw cm_items_flute
    dw cm_items_net
    dw cm_items_book
    dw cm_items_submenu_bottles
    dw cm_items_somaria
    dw cm_items_byrna
    dw cm_items_cape
    dw cm_items_mirror
    dw #$0000
    %cm_header("ITEMS")

cm_items_bow:
    dw !CM_ACTION_CHOICE_JSR
    dw #.set_ram_value
    dl #!ram_cm_item_bow
    db #$24, "Bow", #$FF
    db #$24, "No", #$FF
    db #$24, "Normal", #$FF
    db #$24, "Silver", #$FF
    db #$FF

  .set_ram_value
    ; 0 = No bow
    ; 1/2 = Normal bow without/with arrows
    ; 3/4 = Silver bow without/with arrows
    ASL : TAX : BEQ .end

    LDA !ram_equipment_arrows : BNE .end
    DEX
  .end
    TXA : STA !ram_item_bow
    RTS

cm_items_boom:
    dw !CM_ACTION_CHOICE
    dl #!ram_item_boom
    db #$24, "Boom", #$FF
    db #$24, "No", #$FF
    db #$24, "Blue", #$FF
    db #$24, "Red", #$FF
    db #$FF

cm_items_hook:
    %cm_toggle("Hook", !ram_item_hook)

cm_items_powder:
    dw !CM_ACTION_CHOICE
    dl #!ram_item_powder
    db #$24, "Powder", #$FF
    db #$24, "No", #$FF
    db #$24, "Shroom", #$FF
    db #$24, "Powder", #$FF
    db #$FF

cm_items_fire_rod:
    %cm_toggle("Fire Rod", !ram_item_fire_rod)

cm_items_ice_rod:
    %cm_toggle("Ice Rod", !ram_item_ice_rod)

cm_items_bombos:
    %cm_toggle("Bombos", !ram_item_bombos)

cm_items_ether:
    %cm_toggle("Ether", !ram_item_ether)

cm_items_quake:
    %cm_toggle("Quake", !ram_item_2quake)

cm_items_lantern:
    %cm_toggle("Lantern", !ram_item_lantern)

cm_items_hammer:
    %cm_toggle("Hammer", !ram_item_hammer)

cm_items_flute:
    dw !CM_ACTION_CHOICE
    dl #!ram_item_flute
    db #$24, "Flute", #$FF
    db #$24, "No", #$FF
    db #$24, "Shovel", #$FF
    db #$24, "Flute (no)", #$FF
    db #$24, "Flute", #$FF
    db #$FF

cm_items_net:
    %cm_toggle("Net", !ram_item_net)

cm_items_book:
    %cm_toggle("Book", !ram_item_book)

cm_items_somaria:
    %cm_toggle("Somaria", !ram_item_somaria)

cm_items_byrna:
    %cm_toggle("Byrna", !ram_item_byrna)

cm_items_cape:
    %cm_toggle("Cape", !ram_item_cape)

cm_items_mirror:
    %cm_toggle_jsr("Mirror", !ram_cm_item_mirror)

  .toggle
    ; 0 -> 2
    ASL : STA !ram_item_mirror
    RTS

; Bottles submenu

cm_items_submenu_bottles:
    %cm_submenu("Bottles", cm_submenu_bottles)

cm_submenu_bottles:
    dw cm_items_bottle_1
    dw cm_items_bottle_2
    dw cm_items_bottle_3
    dw cm_items_bottle_4
    dw #$0000
    %cm_header("BOTTLES")

macro bottle_contents()
    db #$24, "No bottle", #$FF
    db #$24, "Shroooom", #$FF
    db #$24, "Empty", #$FF
    db #$24, "Red", #$FF
    db #$24, "Green", #$FF
    db #$24, "Blue", #$FF
    db #$24, "Fairy", #$FF
    db #$24, "Bee", #$FF
    db #$24, "Golden bee", #$FF
    db #$FF
endmacro

cm_items_bottle_1:
    dw !CM_ACTION_CHOICE
    dl !ram_item_bottle_array
    db #$24, "Bottle 1", #$FF
    %bottle_contents()

cm_items_bottle_2:
    dw !CM_ACTION_CHOICE
    dl !ram_item_bottle_array+1
    db #$24, "Bottle 2", #$FF
    %bottle_contents()

cm_items_bottle_3:
    dw !CM_ACTION_CHOICE
    dl !ram_item_bottle_array+2
    db #$24, "Bottle 3", #$FF
    %bottle_contents()

cm_items_bottle_4:
    dw !CM_ACTION_CHOICE
    dl !ram_item_bottle_array+3
    db #$24, "Bottle 4", #$FF
    %bottle_contents()

; }}}
; EQUIPMENT {{{

cm_main_goto_equipment:
    %cm_submenu("Equipment", cm_submenu_equipment)

cm_submenu_equipment:
    dw cm_equipment_fill_magic
    dw cm_equipment_fill_hearts
    dw cm_equipment_fill_rupees

    dw cm_equipment_sword
    dw cm_equipment_shield
    dw cm_equipment_armor

    dw cm_equipment_gloves
    dw cm_equipment_boots
    dw cm_equipment_flippers
    dw cm_equipment_moon_pearl
    dw cm_equipment_half_magic

    dw cm_equipment_maxhp
    dw cm_equipment_bombs
    dw cm_equipment_arrows
    dw cm_equipment_keys
    dw cm_equipment_goto_big_keys_submenu

    dw #$0000
    %cm_header("EQUIPMENT")

cm_equipment_boots:
    %cm_toggle_jsr("Boots", !ram_cm_equipment_boots)

  .toggle
    CMP #$00 : BEQ .set_no_boots

    LDA #$04 : ORA !ram_capabilities : STA !ram_capabilities
    LDA #$01 : STA !ram_equipment_boots_menu

     BRA .end

  .set_no_boots

    LDA !ram_capabilities : AND #$FB : STA !ram_capabilities
    LDA #$00 : STA !ram_equipment_boots_menu

  .end
    RTS

cm_equipment_gloves:
    dw !CM_ACTION_CHOICE
    dl !ram_equipment_gloves
    db #$24, "Gloves", #$FF
    db #$24, "No", #$FF
    db #$24, "Power Glove", #$FF
    db #$24, "Titan's Mitts", #$FF
    db #$FF

cm_equipment_flippers:
    %cm_toggle_jsr("Flippers", !ram_cm_equipment_flippers)

  .toggle
    CMP #$00 : BEQ .set_no_flippers

    LDA #$02 : ORA !ram_capabilities : STA !ram_capabilities
    LDA #$01 : STA !ram_equipment_flippers_menu

     BRA .end

  .set_no_flippers

    LDA !ram_capabilities : AND #$FD : STA !ram_capabilities
    LDA #$00 : STA !ram_equipment_flippers_menu

  .end
    RTS

cm_equipment_moon_pearl:
    %cm_toggle("Moon Pearl", !ram_equipment_moon_pearl)

cm_equipment_half_magic:
    %cm_toggle("Half Magic", !ram_equipment_half_magic)

cm_equipment_sword:
    dw !CM_ACTION_CHOICE_JSR
    dw #.toggle_sword
    dl !ram_equipment_sword
    db #$24, "Sword", #$FF
    db #$24, "No", #$FF
    db #$24, "Fighter", #$FF
    db #$24, "Master", #$FF
    db #$24, "Tempered", #$FF
    db #$24, "Gold", #$FF
    db #$FF

  .toggle_sword
    JSL !DecompSwordGfx
    JSL !Palette_Sword
    RTS

cm_equipment_shield:
    dw !CM_ACTION_CHOICE_JSR
    dw #.toggle_shield
    dl !ram_equipment_shield
    db #$24, "Shield", #$FF
    db #$24, "No", #$FF
    db #$24, "Fighter", #$FF
    db #$24, "Red", #$FF
    db #$24, "Mirror", #$FF
    db #$FF

  .toggle_shield
    JSL !DecompShieldGfx
    JSL !Palette_Shield
    RTS

cm_equipment_armor:
    dw !CM_ACTION_CHOICE_JSR
    dw #.toggle_armor
    dl !ram_equipment_armor
    db #$24, "Armor", #$FF
    db #$24, "Green", #$FF
    db #$24, "Blue", #$FF
    db #$24, "Red", #$FF
    db #$FF

  .toggle_armor
    JSL !Palette_Armor
    RTS

cm_equipment_fill_magic:
    %cm_jsr("Fill Magic")

  .routine
    LDA #$80 : STA !ram_equipment_magic_meter
    RTS

cm_equipment_fill_rupees:
    %cm_jsr("Fill Rupees")

  .routine
  %a16()
    ; Sets 999 rupees.
    LDA #$03E7 : STA $7EF360
    RTS

cm_equipment_fill_hearts:
    %cm_jsr("Fill HP")

  .routine
    LDA !ram_equipment_maxhp : STA !ram_equipment_curhp
    RTS

cm_equipment_maxhp:
    dw !CM_ACTION_CHOICE_JSR
    dw #.set_maxhp
    dl !ram_cm_equipment_maxhp
    db #$24, "Max HP", #$FF
    db #$24, "3", #$FF
    db #$24, "4", #$FF
    db #$24, "5", #$FF
    db #$24, "6", #$FF
    db #$24, "7", #$FF
    db #$24, "8", #$FF
    db #$24, "9", #$FF
    db #$24, "10", #$FF
    db #$24, "11", #$FF
    db #$24, "12", #$FF
    db #$24, "13", #$FF
    db #$24, "14", #$FF
    db #$24, "15", #$FF
    db #$24, "16", #$FF
    db #$24, "17", #$FF
    db #$24, "18", #$FF
    db #$24, "19", #$FF
    db #$24, "20", #$FF
    db #$FF

  .set_maxhp
    INC : INC : INC
    ASL : ASL : ASL
    ; Need to fill HP to get immediate effect
    STA !ram_equipment_maxhp : STA !ram_equipment_curhp
    RTS

cm_equipment_bombs:
    %cm_numfield("Bombs", !ram_item_bombs, #$00, #$1E, #$05)

cm_equipment_arrows:
    %cm_numfield("Arrows", !ram_equipment_arrows_filler, #$00, #$1E, #$05)

cm_equipment_keys:
    %cm_numfield("Keys", !ram_equipment_keys, #$00, #$09, #$01)

cm_equipment_goto_big_keys_submenu:
    %cm_submenu("Big keys", cm_submenu_big_keys)

cm_submenu_big_keys:
    dw cm_big_keys_sewers
    dw cm_big_keys_hc
    dw cm_big_keys_eastern
    dw cm_big_keys_desert
    dw cm_big_keys_hera
    dw cm_big_keys_aga
    dw cm_big_keys_pod
    dw cm_big_keys_thieves
    dw cm_big_keys_skull
    dw cm_big_keys_ice
    dw cm_big_keys_swamp
    dw cm_big_keys_mire
    dw cm_big_keys_trock
    dw cm_big_keys_gtower

    dw #$0000
    %cm_header("BIG KEYS")

cm_big_keys_sewers:
    %cm_toggle_bit("Sewers", !ram_game_big_keys_2, #$80)

cm_big_keys_hc:
    %cm_toggle_bit("Hyrule Castle", !ram_game_big_keys_2, #$40)

cm_big_keys_eastern:
    %cm_toggle_bit("Eastern", !ram_game_big_keys_2, #$20)

cm_big_keys_desert:
    %cm_toggle_bit("Desert", !ram_game_big_keys_2, #$10)

cm_big_keys_aga:
    %cm_toggle_bit("ATower", !ram_game_big_keys_2, #$08)

cm_big_keys_swamp:
    %cm_toggle_bit("Swamp", !ram_game_big_keys_2, #$04)

cm_big_keys_pod:
    %cm_toggle_bit("Darkness", !ram_game_big_keys_2, #$02)

cm_big_keys_mire:
    %cm_toggle_bit("Mire", !ram_game_big_keys_2, #$01)

cm_big_keys_skull:
    %cm_toggle_bit("Skull", !ram_game_big_keys_1, #$80)

cm_big_keys_ice:
    %cm_toggle_bit("Ice", !ram_game_big_keys_1, #$40)

cm_big_keys_hera:
    %cm_toggle_bit("Hera", !ram_game_big_keys_1, #$20)

cm_big_keys_thieves:
    %cm_toggle_bit("Thieves", !ram_game_big_keys_1, #$10)

cm_big_keys_trock:
    %cm_toggle_bit("Turtle Rock", !ram_game_big_keys_1, #$08)

cm_big_keys_gtower:
    %cm_toggle_bit("GTower", !ram_game_big_keys_1, #$04)

; }}}
; PRESETS {{{

cm_main_goto_presets:
    dw !CM_ACTION_SUBMENU_VARIABLE
    dl !ram_preset_category
    db $03
    dw cm_nmg_submenu_presets
    dw cm_hundo_submenu_presets
    dw cm_low_submenu_presets
    db #$24, "Presets", #$FF

incsrc cm_presets_nmg.asm
incsrc cm_presets_hundo.asm
incsrc cm_presets_low.asm

; }}}
; FEATURES {{{

cm_main_goto_features:
    %cm_submenu("Features", cm_submenu_features)

cm_submenu_features:
    dw cm_feature_lagometer
    dw cm_feature_input_display
    dw cm_feature_enemy_hp
    dw cm_feature_music
    dw cm_feature_rerandomize
    dw cm_feature_qw
    dw cm_feature_lit_rooms
    dw cm_feature_oob
    dw cm_feature_lanmola_cycle_count
    dw cm_feature_autoload_preset
    dw cm_feature_preset_category
    dw cm_feature_sanctuary
    dw #$0000
    %cm_header("FEATURES")

cm_feature_lagometer:
    %cm_toggle_jsr("Lagometer", !ram_lagometer_toggle)

  .toggle
    %a16()
      LDA #$207F : STA $7EC742 : STA $7EC782 : STA $7EC7C2 : STA $7EC802
    RTS

cm_feature_input_display:
    %cm_toggle_jsr("Input Display", !ram_input_display_toggle)

  .toggle
  %a16()
    LDA #$207F
    STA !POS_MEM_INPUT_DISPLAY_TOP+0 : STA !POS_MEM_INPUT_DISPLAY_TOP+2
    STA !POS_MEM_INPUT_DISPLAY_TOP+4 : STA !POS_MEM_INPUT_DISPLAY_TOP+6
    STA !POS_MEM_INPUT_DISPLAY_TOP+8 : STA !POS_MEM_INPUT_DISPLAY_BOT+0
    STA !POS_MEM_INPUT_DISPLAY_BOT+2 : STA !POS_MEM_INPUT_DISPLAY_BOT+4
    STA !POS_MEM_INPUT_DISPLAY_BOT+6 : STA !POS_MEM_INPUT_DISPLAY_BOT+8

    RTS

cm_feature_music:
    %cm_toggle_jsr("Music", !ram_feature_music)

  .toggle
    JSL music_reload

    LDA $0130 : CMP #$FF : BEQ .muted

    STA $012C : STZ $0133

  .muted

    RTS


cm_feature_enemy_hp:
    %cm_toggle_jsr("Enemy HP", !ram_enemy_hp_toggle)

  .toggle
  %ai16()
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x
    RTS

cm_feature_rerandomize:
    %cm_toggle("Rerandomize", !ram_rerandomize_toggle)

cm_feature_qw:
    %cm_toggle_jsr("QW Indicator", !ram_qw_toggle)

  .toggle
  %a16()
    LDA #$207F : STA $7EC80A
    LDA #$207F : STA $7EC80C
    RTS

cm_feature_lit_rooms:
    %cm_toggle("Lit Rooms", !ram_lit_rooms_toggle)

cm_feature_oob:
    %cm_toggle("OoB Mode", !ram_oob_toggle)

cm_feature_lanmola_cycle_count:
    %cm_toggle_jsr("Lanmola Cycs", !ram_toggle_lanmola_cycles)

  .toggle
  %a8()
    LDA #$00 : STA !ram_lanmola_cycles
               STA !ram_lanmola_cycles+1
               STA !ram_lanmola_cycles+2
    RTS

cm_feature_autoload_preset:
    %cm_toggle("Auto Preset", !ram_autoload_preset)

cm_feature_preset_category:
    dw !CM_ACTION_CHOICE
    dl !ram_preset_category
    db #$24, "Preset Cat", #$FF
    db #$24, "NMG", #$FF
    db #$24, "Hundo", #$FF
    db #$24, "Low", #$FF
    db #$FF

cm_feature_sanctuary:
    %cm_toggle("Sanc Heart", !ram_sanctuary_heart)

; }}}
; MOVIES {{{

cm_main_goto_movies:
    %cm_submenu("Movies", cm_submenu_movies)

cm_submenu_movies:
    dw cm_movie_1
    dw cm_movie_2
    dw cm_movie_3
    dw cm_movie_4
    dw cm_movie_5
    dw cm_movie_6
    dw cm_movie_7
    dw cm_movie_8
    dw cm_movie_9
    dw cm_movie_10
    dw cm_movie_11
    dw cm_movie_12
    dw cm_movie_13
    dw cm_movie_14
    dw cm_movie_15
    dw cm_movie_16
    dw #$0000
    %cm_header("MOVIES")

cm_movie_1:
    %cm_movie("Movie 01 (0000 bytes)", 0)

cm_movie_2:
    %cm_movie("Movie 02 (0000 bytes)", 1)

cm_movie_3:
    %cm_movie("Movie 03 (0000 bytes)", 2)

cm_movie_4:
    %cm_movie("Movie 04 (0000 bytes)", 3)

cm_movie_5:
    %cm_movie("Movie 05 (0000 bytes)", 4)

cm_movie_6:
    %cm_movie("Movie 06 (0000 bytes)", 5)

cm_movie_7:
    %cm_movie("Movie 07 (0000 bytes)", 6)

cm_movie_8:
    %cm_movie("Movie 08 (0000 bytes)", 7)

cm_movie_9:
    %cm_movie("Movie 09 (0000 bytes)", 8)

cm_movie_10:
    %cm_movie("Movie 10 (0000 bytes)", 9)

cm_movie_11:
    %cm_movie("Movie 11 (0000 bytes)", 10)

cm_movie_12:
    %cm_movie("Movie 12 (0000 bytes)", 11)

cm_movie_13:
    %cm_movie("Movie 13 (0000 bytes)", 12)

cm_movie_14:
    %cm_movie("Movie 14 (0000 bytes)", 13)

cm_movie_15:
    %cm_movie("Movie 15 (0000 bytes)", 14)

cm_movie_16:
    %cm_movie("Movie 16 (0000 bytes)", 15)

; }}}
; COUNTERS {{{

cm_main_goto_counters:
    %cm_submenu("Counters", cm_submenu_counters)

cm_submenu_counters:
    dw cm_counter_real
    dw cm_counter_lag
    dw cm_counter_idle
    dw cm_counter_segment
    dw cm_counter_xy
    dw cm_counter_subpixels
    dw #$0000
    %cm_header("COUNTERS")

cm_counter_real:
    %cm_toggle("Counter Room", !ram_counters_real)

cm_counter_lag:
    %cm_toggle("Counter Lag", !ram_counters_lag)

cm_counter_idle:
    %cm_toggle("Counter Idle", !ram_counters_idle)

cm_counter_segment:
    %cm_toggle("Counter Segm", !ram_counters_segment)

cm_counter_xy:
    dw !CM_ACTION_CHOICE
    dl #!ram_xy_toggle
    db #$24, "Coordinates", #$FF
    db #$24, "No", #$FF
    db #$24, "Hexadecimal", #$FF
    db #$24, "Decimal", #$FF
    db #$FF

cm_counter_subpixels:
    dw !CM_ACTION_CHOICE
    dl #!ram_subpixels_toggle
    db #$24, "Subpixels", #$FF
    db #$24, "No", #$FF
    db #$24, "Subpixels", #$FF
    db #$24, "Speed", #$FF
    db #$FF

; }}}
; GAME STATE {{{

cm_main_goto_game_state:
    %cm_submenu("Game state", cm_submenu_game_state)

cm_submenu_game_state:
    dw cm_game_state_skip_text
    dw cm_game_state_disable_sprites
    dw cm_game_state_reset_screen
    dw cm_game_state_goto_bosses_submenu
    dw cm_game_state_goto_crystals_submenu
    dw cm_game_state_goto_flags_submenu
    dw cm_game_state_progress
    dw cm_game_state_map_indicator
    dw cm_game_state_crystal_switch
    dw cm_game_state_armed_eg
    dw cm_game_state_eg_strength
    dw #$0000
    %cm_header("GAME STATE")

cm_game_state_crystal_switch:
    dw !CM_ACTION_CHOICE_JSR
    dw #.update_tilemap
    dl #!ram_cm_crystal_switch
    db #$24, "Switch Color", #$FF
    db #$24, "Red", #$FF
    db #$24, "Blue", #$FF
    db #$FF

  .update_tilemap
    STA $7EC172
    CMP !ram_cm_old_crystal_switch : BEQ .skip

    LDA !ram_cm_old_gamemode : CMP #$07 : BNE .done
    LDA !ram_cm_old_submode : BNE .done

    LDA #$16 : STA !ram_cm_old_submode

    RTS

  .skip
    LDA #$00 : STA !ram_cm_old_submode

  .done
    RTS

cm_game_state_armed_eg:
    %cm_toggle_jsr("Armed EG", !ram_cm_armed_eg)

  .toggle
    LDA !ram_cm_armed_eg : STA $7E047A
    RTS

cm_game_state_eg_strength:
    %cm_toggle_jsr("Strong EG", !ram_cm_eg_strength)

  .toggle
    LDA !ram_cm_eg_strength : BEQ .weak

    LDA #$01 : STA $7E044A
    RTS

  .weak
    LDA #$02 : STA $7E044A
    RTS

cm_game_state_reset_screen:
    %cm_jsr("Reset current room")

  .routine
    LDA $1B : BEQ .overworld

    STZ $0400 : STZ $0401 : STZ $0402 : STZ $0403 : STZ $0408
    LDA $A0 : ASL : TAX
    LDA #$00 : STA $7EF000, X
    BRA .end

  .overworld
    LDX $8A
    LDA #$00 : STA $7EF280, X

  .end
    RTS

cm_game_state_progress:
    dw !CM_ACTION_CHOICE
    dl !ram_game_progress
    db #$24, "Progress", #$FF
    db #$24, "Started", #$FF
    db #$24, "Uncle", #$FF
    db #$24, "Zelda", #$FF
    db #$24, "Agahnim", #$FF
    db #$FF

cm_game_state_map_indicator:
    dw !CM_ACTION_CHOICE
    dl !ram_game_map_indicator
    db #$24, "Map Indicator", #$FF
    db #$24, "Castle", #$FF
    db #$24, "Kakariko", #$FF
    db #$24, "Sahashrala", #$FF
    db #$24, "Pendants", #$FF
    db #$24, "MS", #$FF
    db #$24, "ATower", #$FF
    db #$24, "Darkness", #$FF
    db #$24, "Crystals", #$FF
    db #$24, "GTower", #$FF
    db #$FF

cm_game_state_goto_flags_submenu:
    %cm_submenu("Game flags", cm_submenu_game_state_flags)

cm_submenu_game_state_flags:
    dw cm_game_state_flags_uncle
    dw cm_game_state_flags_sanc_priest
    dw cm_game_state_flags_escaped
    dw cm_game_state_flags_uncle_left_home
    dw cm_game_state_flags_talked_to_aginah
    dw cm_game_state_flags_fortune_teller_cycle
    dw #$0000
    %cm_header("GAME FLAGS")

cm_game_state_flags_uncle:
    %cm_toggle_bit("Uncle dead", !ram_game_flags, #$01)

cm_game_state_flags_sanc_priest:
    %cm_toggle_bit("Sanc priest", !ram_game_flags, #$02)

cm_game_state_flags_escaped:
    %cm_toggle_bit("Escaped", !ram_game_flags, #$04)

cm_game_state_flags_uncle_left_home:
    %cm_toggle_bit("Uncle left", !ram_game_flags, #$10)

cm_game_state_flags_talked_to_aginah:
    %cm_toggle_bit("Aginah", !ram_game_flags, #$20)

cm_game_state_flags_fortune_teller_cycle:
    %cm_toggle_bit("Fortune cycle", !ram_game_flags, #$40)

cm_game_state_goto_bosses_submenu:
    %cm_submenu("Toggle bosses defeated", cm_game_state_bosses_submenu)

cm_game_state_bosses_submenu:
    dw cm_game_state_bosses_armos
    dw cm_game_state_bosses_lanmolas
    dw cm_game_state_bosses_moldorm
    dw cm_game_state_bosses_agahnim
    dw cm_game_state_bosses_helma
    dw cm_game_state_bosses_blind
    dw cm_game_state_bosses_mothula
    dw cm_game_state_bosses_kholdstare
    dw cm_game_state_bosses_arrghus
    dw cm_game_state_bosses_vitty
    dw cm_game_state_bosses_trinexx
    dw cm_game_state_bosses_agahnim_2
    dw #$0000
    %cm_header("BOSSES DEFEATED")

cm_game_state_bosses_armos:
    %cm_toggle_bit("Armos", $7EF191, #$08)

cm_game_state_bosses_lanmolas:
    %cm_toggle_bit("Lanmola", $7EF067, #$08)

cm_game_state_bosses_moldorm:
    %cm_toggle_bit("Moldorm", $7EF00F, #$08)

cm_game_state_bosses_agahnim:
    %cm_toggle_bit("Agahnim", $7EF041, #$08)

cm_game_state_bosses_helma:
    %cm_toggle_bit("Helmasaur", $7EF0B5, #$08)

cm_game_state_bosses_blind:
    %cm_toggle_bit("Blind", $7EF159, #$08)

cm_game_state_bosses_mothula:
    %cm_toggle_bit("Mothula", $7EF053, #$08)

cm_game_state_bosses_kholdstare:
    %cm_toggle_bit("Kholdstare", $7EF1BD, #$08)

cm_game_state_bosses_arrghus:
    %cm_toggle_bit("Arrghus", $7EF00D, #$08)

cm_game_state_bosses_vitty:
    %cm_toggle_bit("Vitreous", $7EF121, #$08)

cm_game_state_bosses_trinexx:
    %cm_toggle_bit("Trinexx", $7EF149, #$08)

cm_game_state_bosses_agahnim_2:
    %cm_toggle_bit("Agahnim 2", $7EF01B, #$08)

cm_game_state_goto_crystals_submenu:
    %cm_submenu("Pendants and crystals", cm_game_state_crystals_submenu)

cm_game_state_crystals_submenu:
    dw cm_game_state_pendant_eastern
    dw cm_game_state_pendant_desert
    dw cm_game_state_pendant_hera
    dw cm_game_state_crystal_pod
    dw cm_game_state_crystal_theives
    dw cm_game_state_crystal_skull
    dw cm_game_state_crystal_ice
    dw cm_game_state_crystal_swamp
    dw cm_game_state_crystal_mire
    dw cm_game_state_crystal_trock
    dw #$0000
    %cm_header("PENDANTS AND CRYSTALS")

cm_game_state_pendant_eastern:
    %cm_toggle_bit("Eastern", !ram_game_pendants, #$04)

cm_game_state_pendant_desert:
    %cm_toggle_bit("Desert", !ram_game_pendants, #$02)

cm_game_state_pendant_hera:
    %cm_toggle_bit("Hera", !ram_game_pendants, #$01)

cm_game_state_crystal_pod:
    %cm_toggle_bit("Darkness", !ram_game_crystals, #$02)

cm_game_state_crystal_theives:
    %cm_toggle_bit("Thieves", !ram_game_crystals, #$20)

cm_game_state_crystal_skull:
    %cm_toggle_bit("Skull", !ram_game_crystals, #$40)

cm_game_state_crystal_ice:
    %cm_toggle_bit("Ice", !ram_game_crystals, #$04)

cm_game_state_crystal_swamp:
    %cm_toggle_bit("Swamp", !ram_game_crystals, #$10)

cm_game_state_crystal_mire:
    %cm_toggle_bit("Mire", !ram_game_crystals, #$01)

cm_game_state_crystal_trock:
    %cm_toggle_bit("Turtle Rock", !ram_game_crystals, #$08)

cm_game_state_disable_sprites:
    %cm_jsr("Remove sprites")

  .routine
  %ai8()
    JSL !Sprite_DisableAll
    RTS

cm_game_state_skip_text:
    %cm_jsr("Skip text")

  .routine
    LDA #$04 : STA $1CD4
    RTS

; }}}
; RECONFIGURE CONTROLS {{{

cm_main_goto_ctrl:
    %cm_submenu("Shortcuts", cm_submenu_ctrl)

cm_submenu_ctrl:
    dw cm_ctrl_open_lttphack_menu
    dw cm_ctrl_load_last_preset
    dw cm_ctrl_replay_last_movie
    dw cm_ctrl_save_state
    dw cm_ctrl_load_state
    dw cm_ctrl_reset_segment_timer
    dw cm_ctrl_toggle_oob
    dw cm_ctrl_skip_text
    dw cm_ctrl_disable_sprites
    dw cm_ctrl_fill_everything
    dw #$0000
    %cm_header("CONTROLLER SHORTCUTS")

cm_ctrl_open_lttphack_menu:
    %cm_ctrl_shortcut("LTTPHack menu", !ram_ctrl_prachack_menu)

cm_ctrl_load_last_preset:
    %cm_ctrl_shortcut("Load last preset", !ram_ctrl_load_last_preset)

cm_ctrl_replay_last_movie:
    %cm_ctrl_shortcut("Replay last movie", !ram_ctrl_replay_last_movie)

if !FEATURE_SD2SNES
    cm_ctrl_save_state:
        %cm_ctrl_shortcut("Save state", !ram_ctrl_save_state)

    cm_ctrl_load_state:
        %cm_ctrl_shortcut("Load state", !ram_ctrl_load_state)
else
    cm_ctrl_save_state:
        %cm_ctrl_shortcut("Save preset", !ram_ctrl_save_state)

    cm_ctrl_load_state:
        %cm_ctrl_shortcut("Load saved preset", !ram_ctrl_load_state)
endif

cm_ctrl_reset_segment_timer:
    %cm_ctrl_shortcut("Reset seg timer", !ram_ctrl_reset_segment_timer)

cm_ctrl_toggle_oob:
    %cm_ctrl_shortcut("Toggle OoB", !ram_ctrl_toggle_oob)

cm_ctrl_skip_text:
    %cm_ctrl_shortcut("Skip text", !ram_ctrl_skip_text)

cm_ctrl_disable_sprites:
    %cm_ctrl_shortcut("Remove sprites", !ram_ctrl_disable_sprites)

cm_ctrl_fill_everything:
    %cm_ctrl_shortcut("Fill everything", !ram_ctrl_fill_everything)

; }}}
; RNG CONTROL {{{

cm_main_goto_rng_control:
    %cm_submenu("RNG control", cm_submenu_rng_control)

cm_submenu_rng_control:
    dw cm_rng_pokey
    dw cm_rng_agahnim
    dw cm_rng_helmasaur
    dw cm_rng_ganon_warp
    dw cm_rng_ganon_warp_location
    dw cm_rng_eyegore
    dw cm_rng_arrghus
    dw cm_rng_turtles
    dw cm_rng_cannonballs
    dw cm_rng_soldiers
    dw cm_rng_lanmola
    dw cm_rng_conveyor
    dw #$0000
    %cm_header("RNG CONTROL")

cm_rng_pokey:
    dw !CM_ACTION_CHOICE
    dl !ram_pokey_rng
    db #$24, "Pokeys", #$FF
    db #$24, "Random", #$FF
    db #$24, "ul ul", #$FF
    db #$24, "ur ul", #$FF
    db #$24, "dr ul", #$FF
    db #$24, "dl ul", #$FF
    db #$24, "ul ur", #$FF
    db #$24, "ur ur", #$FF
    db #$24, "dr ur", #$FF
    db #$24, "dl ur", #$FF
    db #$24, "ul dr", #$FF
    db #$24, "ur dr", #$FF
    db #$24, "dr dr", #$FF
    db #$24, "dl dr", #$FF
    db #$24, "ul dl", #$FF
    db #$24, "ur dl", #$FF
    db #$24, "dr dl", #$FF
    db #$24, "dl dl", #$FF
    db #$FF

cm_rng_agahnim:
    dw !CM_ACTION_CHOICE
    dl !ram_agahnim_rng
    db #$24, "Agahnim", #$FF
    db #$24, "Random", #$FF
    db #$24, "Yellow", #$FF
    db #$24, "Blue", #$FF
    db #$FF

cm_rng_helmasaur:
    dw !CM_ACTION_CHOICE
    dl !ram_helmasaur_rng
    db #$24, "Helmasaur", #$FF
    db #$24, "Random", #$FF
    db #$24, "No fireball", #$FF
    db #$24, "Fireball", #$FF
    db #$FF

cm_rng_ganon_warp:
    dw !CM_ACTION_CHOICE
    dl !ram_ganon_warp_rng
    db #$24, "Ganon warps", #$FF
    db #$24, "Random", #$FF
    db #$24, "No warp", #$FF
    db #$24, "Warp", #$FF
    db #$FF

cm_rng_ganon_warp_location:
    dw !CM_ACTION_CHOICE
    dl !ram_ganon_warp_location_rng
    db #$24, "Ganon warp to", #$FF
    db #$24, "Random", #$FF
    db #$24, "Far left", #$FF
    db #$24, "Bottom left", #$FF
    db #$24, "Bottom right", #$FF
    db #$24, "Far right", #$FF
    db #$FF

cm_rng_eyegore:
    dw !CM_ACTION_CHOICE
    dl !ram_eyegore_rng
    db #$24, "Eyegore walk", #$FF
    db #$24, "Random", #$FF
    db #$24, "Short", #$FF
    db #$24, "Medium", #$FF
    db #$24, "Long", #$FF
    db #$FF

cm_rng_arrghus:
    dw !CM_ACTION_CHOICE
    dl !ram_arrghus_rng
    db #$24, "Arrghus walk", #$FF
    db #$24, "Random", #$FF
    db #$24, "Shortest", #$FF
    db #$24, "Short", #$FF
    db #$24, "Medium", #$FF
    db #$24, "Long", #$FF
    db #$24, "Longest", #$FF
    db #$FF

cm_rng_turtles:
    dw !CM_ACTION_CHOICE
    dl !ram_turtles_rng
    db #$24, "Turtles walk", #$FF
    db #$24, "Random", #$FF
    db #$24, "Shortest", #$FF
    db #$24, "01", #$FF
    db #$24, "02", #$FF
    db #$24, "03", #$FF
    db #$24, "04", #$FF
    db #$24, "05", #$FF
    db #$24, "06", #$FF
    db #$24, "07", #$FF
    db #$24, "08", #$FF
    db #$24, "09", #$FF
    db #$24, "0A", #$FF
    db #$24, "0B", #$FF
    db #$24, "0C", #$FF
    db #$24, "0D", #$FF
    db #$24, "0E", #$FF
    db #$24, "0F", #$FF
    db #$24, "10", #$FF
    db #$24, "11", #$FF
    db #$24, "12", #$FF
    db #$24, "13", #$FF
    db #$24, "14", #$FF
    db #$24, "15", #$FF
    db #$24, "16", #$FF
    db #$24, "17", #$FF
    db #$24, "18", #$FF
    db #$24, "19", #$FF
    db #$24, "1A", #$FF
    db #$24, "1B", #$FF
    db #$24, "1C", #$FF
    db #$24, "1D", #$FF
    db #$24, "1E", #$FF
    db #$24, "Slowest", #$FF
    db #$FF

cm_rng_cannonballs:
    dw !CM_ACTION_CHOICE
    dl !ram_cannonballs_rng
    db #$24, "Cannonballs", #$FF
    db #$24, "Random", #$FF
    db #$24, "00", #$FF
    db #$24, "01", #$FF
    db #$24, "02", #$FF
    db #$24, "03", #$FF
    db #$24, "04", #$FF
    db #$24, "05", #$FF
    db #$24, "06", #$FF
    db #$24, "07", #$FF
    db #$24, "08", #$FF
    db #$24, "09", #$FF
    db #$24, "0A", #$FF
    db #$24, "0B", #$FF
    db #$24, "0C", #$FF
    db #$24, "0D", #$FF
    db #$24, "0E", #$FF
    db #$24, "0F", #$FF
    db #$24, "10", #$FF
    db #$24, "11", #$FF
    db #$24, "12", #$FF
    db #$24, "13", #$FF
    db #$24, "14", #$FF
    db #$24, "15", #$FF
    db #$24, "16", #$FF
    db #$24, "17", #$FF
    db #$24, "18", #$FF
    db #$24, "19", #$FF
    db #$24, "1A", #$FF
    db #$24, "1B", #$FF
    db #$24, "1C", #$FF
    db #$24, "1D", #$FF
    db #$24, "1E", #$FF
    db #$24, "1F", #$FF
    db #$FF

cm_rng_soldiers:
    dw !CM_ACTION_CHOICE
    dl !ram_soldiers_rng
    db #$24, "Soldiers", #$FF
    db #$24, "Random", #$FF
    db #$24, "00", #$FF
    db #$24, "01", #$FF
    db #$24, "02", #$FF
    db #$24, "03", #$FF
    db #$24, "04", #$FF
    db #$24, "05", #$FF
    db #$24, "06", #$FF
    db #$24, "07", #$FF
    db #$24, "08", #$FF
    db #$24, "09", #$FF
    db #$24, "0A", #$FF
    db #$24, "0B", #$FF
    db #$24, "0C", #$FF
    db #$24, "0D", #$FF
    db #$24, "0E", #$FF
    db #$24, "0F", #$FF
    db #$24, "10", #$FF
    db #$24, "11", #$FF
    db #$24, "12", #$FF
    db #$24, "13", #$FF
    db #$24, "14", #$FF
    db #$24, "15", #$FF
    db #$24, "16", #$FF
    db #$24, "17", #$FF
    db #$24, "18", #$FF
    db #$24, "19", #$FF
    db #$24, "1A", #$FF
    db #$24, "1B", #$FF
    db #$24, "1C", #$FF
    db #$24, "1D", #$FF
    db #$24, "1E", #$FF
    db #$24, "1F", #$FF
    db #$FF


cm_rng_lanmola:
    dw !CM_ACTION_CHOICE
    dl !ram_lanmola_rng
    db #$24, "Lanmola exit", #$FF
    db #$24, "Random", #$FF
    db #$24, "0,0", #$FF
    db #$24, "0,1", #$FF
    db #$24, "0,2", #$FF
    db #$24, "0,3", #$FF
    db #$24, "0,4", #$FF
    db #$24, "0,5", #$FF
    db #$24, "0,6", #$FF
    db #$24, "0,7", #$FF
    db #$24, "1,0", #$FF
    db #$24, "1,1", #$FF
    db #$24, "1,2", #$FF
    db #$24, "1,3", #$FF
    db #$24, "1,4", #$FF
    db #$24, "1,5", #$FF
    db #$24, "1,6", #$FF
    db #$24, "1,7", #$FF
    db #$24, "2,0", #$FF
    db #$24, "2,1", #$FF
    db #$24, "2,2", #$FF
    db #$24, "2,3", #$FF
    db #$24, "2,4", #$FF
    db #$24, "2,5", #$FF
    db #$24, "2,6", #$FF
    db #$24, "2,7", #$FF
    db #$24, "3,0", #$FF
    db #$24, "3,1", #$FF
    db #$24, "3,2", #$FF
    db #$24, "3,3", #$FF
    db #$24, "3,4", #$FF
    db #$24, "3,5", #$FF
    db #$24, "3,6", #$FF
    db #$24, "3,7", #$FF
    db #$24, "4,0", #$FF
    db #$24, "4,1", #$FF
    db #$24, "4,2", #$FF
    db #$24, "4,3", #$FF
    db #$24, "4,4", #$FF
    db #$24, "4,5", #$FF
    db #$24, "4,6", #$FF
    db #$24, "4,7", #$FF
    db #$24, "5,0", #$FF
    db #$24, "5,1", #$FF
    db #$24, "5,2", #$FF
    db #$24, "5,3", #$FF
    db #$24, "5,4", #$FF
    db #$24, "5,5", #$FF
    db #$24, "5,6", #$FF
    db #$24, "5,7", #$FF
    db #$24, "6,0", #$FF
    db #$24, "6,1", #$FF
    db #$24, "6,2", #$FF
    db #$24, "6,3", #$FF
    db #$24, "6,4", #$FF
    db #$24, "6,5", #$FF
    db #$24, "6,6", #$FF
    db #$24, "6,7", #$FF
    db #$24, "7,0", #$FF
    db #$24, "7,1", #$FF
    db #$24, "7,2", #$FF
    db #$24, "7,3", #$FF
    db #$24, "7,4", #$FF
    db #$24, "7,5", #$FF
    db #$24, "7,6", #$FF
    db #$24, "7,7", #$FF
    db #$FF

cm_rng_conveyor:
    dw !CM_ACTION_CHOICE
    dl !ram_conveyor_rng
    db #$24, "Conveyor Belt", #$FF
    db #$24, "Random", #$FF
    db #$24, "right", #$FF
    db #$24, "left", #$FF
    db #$24, "down", #$FF
    db #$24, "up", #$FF
    db #$FF

; }}}
