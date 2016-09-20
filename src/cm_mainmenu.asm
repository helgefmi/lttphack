; --------------
; INDICES
; --------------

table ../resources/header.tbl

cm_mainmenu_indices:
    dw cm_main_goto_presets
    dw cm_main_goto_items
    dw cm_main_goto_equipment
    dw cm_main_goto_features
    dw #$0000
    db #$2C, "MAIN MENU", #$FF

cm_submenu_presets:
    dw cm_presets_goto_escape
    dw cm_presets_goto_eastern
    dw cm_presets_goto_desert
    dw cm_presets_goto_hera
    dw cm_presets_goto_atower
    dw cm_presets_goto_pod
    dw cm_presets_goto_theives
    dw cm_presets_goto_skull
    dw cm_presets_goto_ice
    dw cm_presets_goto_swamp
    dw cm_presets_goto_mire
    dw cm_presets_goto_trock
    dw cm_presets_goto_gtower
    dw cm_presets_goto_ganon
    dw #$0000
    db #$2C, "PRESETS", #$FF

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
    dw cm_items_bottle
    dw cm_items_somaria
    dw cm_items_byrna
    dw cm_items_cape
    dw cm_items_mirror
    dw #$0000
    db #$2C, "ITEMS", #$FF

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

    dw #$0000
    db #$2C, "EQUIPMENT", #$FF

cm_submenu_gamestate:
    dw #$0000
    db #$2C, "GAME STATE", #$FF

cm_submenu_features:
    dw cm_feature_counters
    dw cm_feature_input_display
    dw cm_feature_enemy_hp
    dw cm_feature_xy
    dw cm_feature_qw
    dw cm_feature_lit_rooms
    dw cm_feature_oob
    dw cm_feature_los
    dw #$0000
    db #$2C, "FEATURES", #$FF

table ../resources/normal.tbl

; -----------------
; MAIN MENU
; -----------------

cm_main_goto_presets:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_presets
    db #$24, "Presets", #$FF

cm_main_goto_items:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_items
    db #$24, "Items", #$FF

cm_main_goto_equipment:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_equipment
    db #$24, "Equipment", #$FF

cm_main_goto_features:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_features
    db #$24, "Features", #$FF

; ------------------
; ITEMS
; ------------------

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
    ; 0 -> 1 -> 3
    ASL : BNE .end
    INC
  .end
    DEC
    STA !ram_item_bow
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
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_hook
    db #$24, "Hook", #$FF

cm_items_powder:
    dw !CM_ACTION_CHOICE
    dl #!ram_item_powder
    db #$24, "Powder", #$FF
    db #$24, "No", #$FF
    db #$24, "Shroom", #$FF
    db #$24, "Powder", #$FF
    db #$FF

cm_items_fire_rod:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_fire_rod
    db #$24, "Fire Rod", #$FF

cm_items_ice_rod:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_ice_rod
    db #$24, "Ice Rod", #$FF

cm_items_bombos:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_bombos
    db #$24, "Bombos", #$FF

cm_items_ether:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_ether
    db #$24, "Ether", #$FF

cm_items_quake:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_2quake
    db #$24, "Quake", #$FF

cm_items_lantern:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_lantern
    db #$24, "Lantern", #$FF

cm_items_hammer:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_hammer
    db #$24, "Hammer", #$FF

cm_items_flute:
    dw !CM_ACTION_CHOICE
    dl #!ram_item_flute
    db #$24, "Flute", #$FF
    db #$24, "No", #$FF
    db #$24, "Shovel", #$FF
    db #$24, "Flute", #$FF
    db #$FF

cm_items_net:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_net
    db #$24, "Net", #$FF

cm_items_book:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_book
    db #$24, "B of Medura", #$FF

cm_items_bottle:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.toggle_bottles
    dl #!ram_cm_item_bottle
    db #$24, "Bottle", #$FF

  .toggle_bottles
    CMP #$00 : BEQ .no_bottles

    ; Creates 4 bottles of various colors
    LDA.b #$03 : STA !ram_item_bottle_array
    LDA.b #$04 : STA !ram_item_bottle_array+1
    LDA.b #$05 : STA !ram_item_bottle_array+2
    LDA.b #$06 : STA !ram_item_bottle_array+3
    LDA.b #$01 : STA !ram_item_bottle

    BRA .end

  .no_bottles
    LDA.b #$00 : STA !ram_item_bottle_array
                 STA !ram_item_bottle_array+1
                 STA !ram_item_bottle_array+2
                 STA !ram_item_bottle_array+3
    LDA.b #$00 : STA !ram_item_bottle
  .end
    RTS

cm_items_somaria:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_somaria
    db #$24, "C of Somaria", #$FF

cm_items_byrna:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_byrna
    db #$24, "C of Byrna", #$FF

cm_items_cape:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_cape
    db #$24, "Cape", #$FF

cm_items_mirror:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.toggle_mirror
    dl #!ram_cm_item_mirror
    db #$24, "Mirror", #$FF


  .toggle_mirror
    ; 0 -> 2
    ASL : STA !ram_item_mirror
    RTS

; ----------
; EQUIPMENT
; ----------

cm_equipment_boots:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.toggle_boots
    dl !ram_cm_equipment_boots
    db #$24, "Boots", #$FF

  .toggle_boots
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
    dw !CM_ACTION_TOGGLE_JSR
    dw #.toggle_flippers
    dl !ram_cm_equipment_flippers
    db #$24, "Flippers", #$FF

  .toggle_flippers
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
    dw !CM_ACTION_TOGGLE
    dl !ram_equipment_moon_pearl
    db #$24, "Moon Pearl", #$FF

cm_equipment_half_magic:
    dw !CM_ACTION_TOGGLE
    dl !ram_equipment_half_magic
    db #$24, "Half Magic", #$FF

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
    CMP.b #$00 : BEQ .reset_game_phase
    LDA !ram_game_phase : ORA.b #$01 : STA !ram_game_phase
    BRA .end

  .reset_game_phase
    LDA !ram_game_phase : AND.b #$FE : STA !ram_game_phase

  .end
    RTS

cm_equipment_shield:
    dw !CM_ACTION_CHOICE
    dl !ram_equipment_shield
    db #$24, "Shield", #$FF
    db #$24, "No", #$FF
    db #$24, "Fighter", #$FF
    db #$24, "Red", #$FF
    db #$24, "Mirror", #$FF
    db #$FF

cm_equipment_armor:
    dw !CM_ACTION_CHOICE
    dl !ram_equipment_armor
    db #$24, "Armor", #$FF
    db #$24, "Green", #$FF
    db #$24, "Blue", #$FF
    db #$24, "Red", #$FF
    db #$FF

cm_equipment_fill_magic:
    dw !CM_ACTION_JSR
    dw #.set_full_magic
    db #$24, "Fill Magic", #$FF

  .set_full_magic
    LDA #$80 : STA !ram_equipment_magic_meter
    RTS

cm_equipment_fill_rupees:
    dw !CM_ACTION_JSR
    dw #.set_full_rupees
    db #$24, "Fill Rupees", #$FF

  .set_full_rupees
  %a16()
    ; Sets 999 rupees.
    LDA #$03E7 : STA $7EF360
    RTS

cm_equipment_fill_hearts:
    dw !CM_ACTION_JSR
    dw #.set_full_hp
    db #$24, "Fill HP", #$FF

  .set_full_hp
    LDA !ram_equipment_maxhp : STA !ram_equipment_curhp
    RTS

cm_equipment_maxhp:
    dw !CM_ACTION_CHOICE_JSR
    dw #.set_maxhp
    dl !ram_cm_equipment_maxhp
    db #$24, "Max HP", #$FF
    db #$24, "  3", #$FF
    db #$24, "  4", #$FF
    db #$24, "  5", #$FF
    db #$24, "  6", #$FF
    db #$24, "  7", #$FF
    db #$24, "  8", #$FF
    db #$24, "  9", #$FF
    db #$24, " 10", #$FF
    db #$24, " 11", #$FF
    db #$24, " 12", #$FF
    db #$24, " 13", #$FF
    db #$24, " 14", #$FF
    db #$24, " 15", #$FF
    db #$24, " 16", #$FF
    db #$24, " 17", #$FF
    db #$24, " 18", #$FF
    db #$24, " 19", #$FF
    db #$24, " 20", #$FF
    db #$FF

  .set_maxhp
    INC : INC : INC
    ASL : ASL : ASL
    ; Need to fill HP to get immediate effect
    STA !ram_equipment_maxhp : STA !ram_equipment_curhp
    RTS

cm_equipment_bombs:
    dw !CM_ACTION_NUMFIELD
    dl !ram_item_bombs
    db #$00, #$1E
    db #$05
    db #$24, "Bombs", #$FF

cm_equipment_arrows:
    dw !CM_ACTION_NUMFIELD
    dl !ram_equipment_arrows
    db #$00, #$1E
    db #$05
    db #$24, "Arrows", #$FF

cm_equipment_keys:
    dw !CM_ACTION_NUMFIELD
    dl !ram_equipment_keys
    db #$00, #$09
    db #$01
    db #$24, "Keys", #$FF

; -------------------
; PRESETS
; -------------------

; ESCAPE

cm_presets_goto_escape:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Escape", #$FF

cm_presets_escape:
    dw cm_escape_1
    dw cm_escape_2
    dw cm_escape_3
    dw cm_escape_4
    dw cm_escape_5
    dw cm_escape_6
    dw cm_escape_7
    dw cm_escape_8
    dw cm_escape_9
    dw cm_escape_10
    dw cm_escape_11
    dw cm_escape_12
    dw #$0000
    db #$2C, "ESCAPE", #$FF

cm_escape_1:
    dw !CM_ACTION_PRESET
	dw #preset_escape_links_bed
    db #$24, "Link's Bed", #$FF

cm_escape_2:
    dw !CM_ACTION_PRESET
	dw #preset_escape_courtyard
    db #$24, "Courtyard", #$FF

cm_escape_3:
    dw !CM_ACTION_PRESET
	dw #preset_escape_entrance
    db #$24, "Entrance", #$FF

cm_escape_4:
    dw !CM_ACTION_PRESET
	dw #preset_escape_1st_keyguard
    db #$24, "1st Key Guard", #$FF

cm_escape_5:
    dw !CM_ACTION_PRESET
	dw #preset_escape_big_room
    db #$24, "Big Room", #$FF

cm_escape_6:
    dw !CM_ACTION_PRESET
	dw #preset_escape_2nd_keyguard
    db #$24, "2nd Key Guard", #$FF

cm_escape_7:
    dw !CM_ACTION_PRESET
	dw #preset_escape_balln_chains
    db #$24, "Ball'n Chains", #$FF

cm_escape_8:
    dw !CM_ACTION_PRESET
	dw #preset_escape_keyguard_revisited
    db #$24, "Key Guard Revisited", #$FF

cm_escape_9:
    dw !CM_ACTION_PRESET
	dw #preset_escape_secret_passage
    db #$24, "Secret Passage", #$FF

cm_escape_10:
    dw !CM_ACTION_PRESET
	dw #preset_escape_snake_avoidance_room
    db #$24, "Snake Avoidance Room", #$FF

cm_escape_11:
    dw !CM_ACTION_PRESET
	dw #preset_escape_keyrat
    db #$24, "Key Rat", #$FF

cm_escape_12:
    dw !CM_ACTION_PRESET
	dw #preset_escape_last_two_screens
    db #$24, "Last Two Screens", #$FF

; EASTERN

cm_presets_goto_eastern:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_eastern
    db #$24, "Eastern", #$FF

cm_presets_eastern:
    dw cm_eastern_1
    dw cm_eastern_2
    dw cm_eastern_3
    dw cm_eastern_4
    dw cm_eastern_5
    dw cm_eastern_6
    dw cm_eastern_7
    dw cm_eastern_8
    dw cm_eastern_9
    dw cm_eastern_10
    dw cm_eastern_11
    dw cm_eastern_12
    dw #$0000
    db #$2C, "EASTERN", #$FF

cm_eastern_1:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_before_cutscene
    db #$24, "Before Cutscene", #$FF

cm_eastern_2:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_after_cutscene
    db #$24, "After Cutscene", #$FF

cm_eastern_3:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_octoroc
    db #$24, "Octoroc", #$FF

cm_eastern_4:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_entrance
    db #$24, "Entrance", #$FF

cm_eastern_5:
    dw !CM_ACTION_PRESET
	dw #preset_stalfos_room
    db #$24, "Stalfos Room", #$FF

cm_eastern_6:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_dark_key_room
    db #$24, "Dark Key Room", #$FF

cm_eastern_7:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_bk_dmg_boost
    db #$24, "BK Dmg Boost", #$FF

cm_eastern_8:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_big_chest_room
    db #$24, "Big Chest Room", #$FF

cm_eastern_9:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_gwg
    db #$24, "Gifted With Greenies", #$FF

cm_eastern_10:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_pot_room
    db #$24, "Pot Room", #$FF

cm_eastern_11:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_zgr
    db #$24, "Zeldagamer Room", #$FF

cm_eastern_12:
    dw !CM_ACTION_PRESET
	dw #preset_eastern_armos
    db #$24, "Armos", #$FF

; DESERT

cm_presets_goto_desert:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_desert
    db #$24, "Desert", #$FF

cm_presets_desert:
    dw cm_desert_1
    dw cm_desert_2
    dw cm_desert_3
    dw cm_desert_4
    dw cm_desert_5
    dw cm_desert_6
    dw cm_desert_7
    dw cm_desert_8
    dw cm_desert_9
    dw cm_desert_10
    dw cm_desert_11
    dw cm_desert_12
    dw #$0000
    db #$2C, "DESERT", #$FF

cm_desert_1:
    dw !CM_ACTION_PRESET
	dw #preset_desert_outside_ep
    db #$24, "Outside Eastern Palace", #$FF

cm_desert_2:
    dw !CM_ACTION_PRESET
	dw #preset_desert_ep_spinspeed
    db #$24, "Eastern Palace Spinspeed", #$FF

cm_desert_3:
    dw !CM_ACTION_PRESET
	dw #preset_desert_unholy_spinspeed
    db #$24, "Unhold Spinspeed", #$FF

cm_desert_4:
    dw !CM_ACTION_PRESET
	dw #preset_desert_water_dash
    db #$24, "Water Dash", #$FF

cm_desert_5:
    dw !CM_ACTION_PRESET
	dw #preset_desert_entrance
    db #$24, "Entrance", #$FF

cm_desert_6:
    dw !CM_ACTION_PRESET
	dw #preset_desert_keybonk
    db #$24, "Key Bonk", #$FF

cm_desert_7:
    dw !CM_ACTION_PRESET
	dw #preset_desert_pre_cannonball_room
    db #$24, "Cannonball Room", #$FF

cm_desert_8:
    dw !CM_ACTION_PRESET
	dw #preset_desert_pot_room
    db #$24, "Pot Room", #$FF

cm_desert_9:
    dw !CM_ACTION_PRESET
	dw #preset_desert_desert2_spinspeed
    db #$24, "Desert 2 Spinspeed", #$FF

cm_desert_10:
    dw !CM_ACTION_PRESET
	dw #preset_desert_popo_genocide
    db #$24, "Popo Genocide", #$FF

cm_desert_11:
    dw !CM_ACTION_PRESET
	dw #preset_desert_torches
    db #$24, "Torches", #$FF

cm_desert_12:
    dw !CM_ACTION_PRESET
	dw #preset_desert_lanmolas
    db #$24, "Lanmolas", #$FF

; HERA

cm_presets_goto_hera:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_hera
    db #$24, "Hera", #$FF

cm_presets_hera:
    dw cm_hera_1
    dw cm_hera_2
    dw cm_hera_3
    dw cm_hera_4
    dw cm_hera_5
    dw cm_hera_6
    dw cm_hera_7
    dw cm_hera_8
    dw cm_hera_9
    dw cm_hera_10
    dw #$0000
    db #$2C, "HERA", #$FF

cm_hera_1:
    dw !CM_ACTION_PRESET
	dw #preset_hera_outside_desert
    db #$24, "Outside Desert Palace", #$FF

cm_hera_2:
    dw !CM_ACTION_PRESET
	dw #preset_hera_fake_flippers
    db #$24, "Fake Flippers", #$FF

cm_hera_3:
    dw !CM_ACTION_PRESET
	dw #preset_hera_dm
    db #$24, "Death Mountain", #$FF

cm_hera_4:
    dw !CM_ACTION_PRESET
	dw #preset_hera_after_mirror
    db #$24, "After Mirror", #$FF

cm_hera_5:
    dw !CM_ACTION_PRESET
	dw #preset_hera_entrance
    db #$24, "Entrance", #$FF

cm_hera_6:
    dw !CM_ACTION_PRESET
	dw #preset_hera_tile_room
    db #$24, "Tile room", #$FF

cm_hera_7:
    dw !CM_ACTION_PRESET
	dw #preset_hera_torches
    db #$24, "Torches", #$FF

cm_hera_8:
    dw !CM_ACTION_PRESET
	dw #preset_hera_beetles
    db #$24, "Beetles", #$FF

cm_hera_9:
    dw !CM_ACTION_PRESET
	dw #preset_hera_petting_zoo
    db #$24, "Petting Zoo", #$FF

cm_hera_10:
    dw !CM_ACTION_PRESET
	dw #preset_hera_moldorm
    db #$24, "Moldorm", #$FF

cm_atower_1:
    dw !CM_ACTION_PRESET
	dw #preset_atower_outside_hera
    db #$24, "Outside Hera", #$FF

cm_atower_2:
    dw !CM_ACTION_PRESET
	dw #preset_atower_first_rupee_tree
    db #$24, "First Rupee Tree", #$FF

; ATOWER

cm_presets_goto_atower:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_atower
    db #$24, "Agahnim's Tower", #$FF

cm_presets_atower:
    dw cm_atower_1
    dw cm_atower_2
    dw cm_atower_3
    dw cm_atower_4
    dw cm_atower_5
    dw cm_atower_6
    dw cm_atower_7
    dw cm_atower_8
    dw cm_atower_9
    dw cm_atower_10
    dw #$0000
    db #$2C, "AGAHNIM'S TOWER", #$FF

cm_atower_3:
    dw !CM_ACTION_PRESET
	dw #preset_atower_lost_woods
    db #$24, "Lost Woods", #$FF

cm_atower_4:
    dw !CM_ACTION_PRESET
	dw #preset_atower_after_lost_woods
    db #$24, "After Lost Woods", #$FF

cm_atower_5:
    dw !CM_ACTION_PRESET
	dw #preset_atower_tower_entrance
    db #$24, "Tower Entrance", #$FF

cm_atower_6:
    dw !CM_ACTION_PRESET
	dw #preset_atower_dark_room_despair
    db #$24, "Dark Room of Despair", #$FF

cm_atower_7:
    dw !CM_ACTION_PRESET
	dw #preset_atower_dark_room_melancholy
    db #$24, "Dark Room of Melancholy", #$FF

cm_atower_8:
    dw !CM_ACTION_PRESET
	dw #preset_atower_red_spears
    db #$24, "Red Spear Guards", #$FF

cm_atower_9:
    dw !CM_ACTION_PRESET
	dw #preset_atower_cop
    db #$24, "Circle of Pot", #$FF

cm_atower_10:
    dw !CM_ACTION_PRESET
	dw #preset_atower_agahnim
    db #$24, "Agahnim", #$FF

; POD

cm_presets_goto_pod:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_pod
    db #$24, "Palace of Darkness", #$FF

cm_presets_pod:
    dw cm_pod_1
    dw #$0000
    db #$2C, "PALACE OF DARKNESS", #$FF

cm_pod_1:
    dw !CM_ACTION_PRESET
	dw #preset_pod_pyramid
    db #$24, "Pyramid", #$FF

; --

cm_presets_goto_theives:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Theive's Town", #$FF

cm_presets_goto_skull:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Skull Woods", #$FF

cm_presets_goto_ice:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Ice Palace", #$FF

cm_presets_goto_swamp:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Swamp Palace", #$FF

cm_presets_goto_mire:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Misery Mire", #$FF

cm_presets_goto_trock:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "T-Rock", #$FF

cm_presets_goto_gtower:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Ganon's Tower", #$FF

cm_presets_goto_ganon:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Ganon", #$FF

; -------------------
; FEATURES
; -------------------

cm_feature_counters:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.turn_off_counters
    dl !ram_counters_toggle
    db #$24, "Counters", #$FF

  .turn_off_counters
  %a16()
    LDA #$207F : STA $7EC734

    LDX.b #!POS_RT_ROOM
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x

    LDX.b #!POS_LAG
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x

    LDX.b #!POS_RT_SEG
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x
    STA $7EC70A,x : STA $7EC70C,x

    RTS

cm_feature_input_display:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.turn_off_input_display
    dl !ram_input_display_toggle
    db #$24, "Input Display", #$FF

  .turn_off_input_display
  %a16()
    LDA #$207F
    STA !POS_MEM_INPUT_DISPLAY_TOP+0 : STA !POS_MEM_INPUT_DISPLAY_TOP+2
    STA !POS_MEM_INPUT_DISPLAY_TOP+4 : STA !POS_MEM_INPUT_DISPLAY_TOP+6
    STA !POS_MEM_INPUT_DISPLAY_TOP+8 : STA !POS_MEM_INPUT_DISPLAY_BOT+0
    STA !POS_MEM_INPUT_DISPLAY_BOT+2 : STA !POS_MEM_INPUT_DISPLAY_BOT+4
    STA !POS_MEM_INPUT_DISPLAY_BOT+6 : STA !POS_MEM_INPUT_DISPLAY_BOT+8

    RTS

cm_feature_enemy_hp:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.turn_off_enemy_hp
    dl !ram_enemy_hp_toggle
    db #$24, "Enemy HP", #$FF

  .turn_off_enemy_hp
  %ai16()
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x
    RTS

cm_feature_xy:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.turn_off_xy
    dl !ram_xy_toggle
    db #$24, "Coordinates", #$FF

  .turn_off_xy
  %ai16()
    LDA #$207F : LDX.w #!POS_XY
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x : STA $7EC70A,x
    RTS

cm_feature_qw:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.turn_off_qw
    dl !ram_qw_toggle
    db #$24, "QW Indicator", #$FF

  .turn_off_qw
  %a16()
    LDA #$207F : STA $7EC80A
    LDA #$207F : STA $7EC80C
    RTS


cm_feature_lit_rooms:
    dw !CM_ACTION_TOGGLE
    dl !ram_lit_rooms_toggle
    db #$24, "Lit Rooms", #$FF

cm_feature_oob:
    dw !CM_ACTION_TOGGLE
    dl !lowram_oob_toggle
    db #$24, "OoB Mode", #$FF

cm_feature_los:
    ; \todo implement
    dw !CM_ACTION_TOGGLE
    dl !ram_los_toggle
    db #$24, "LoS Sprites", #$FF
