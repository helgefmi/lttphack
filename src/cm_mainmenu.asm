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
    dw cm_presets_goto_aga
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

cm_presets_goto_escape:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Escape", #$FF

cm_presets_escape:
    dw cm_escape_links_house
    dw cm_escape_courtyard
    dw cm_escape_entrance
    dw cm_escape_1st_keyguard
    dw #$0000
    db #$2C, "ESCAPE", #$FF

cm_escape_links_house:
    dw !CM_ACTION_PRESET
    db !PRESET_OVERWORLD
    dw #preset_data_ow_test1
    db #$24, "Link's House", #$FF

cm_escape_courtyard:
    dw !CM_ACTION_PRESET
    db !PRESET_OVERWORLD
    dw #preset_data_ow_test2
    db #$24, "Courtyard", #$FF

cm_escape_entrance:
    dw !CM_ACTION_PRESET
    db !PRESET_DUNGEON
    dw #preset_data_dng_test1
    db #$24, "Entrance", #$FF

cm_escape_1st_keyguard:
    dw !CM_ACTION_PRESET
    db !PRESET_DUNGEON
    dw #preset_data_dng_test2
    db #$24, "1st Keyguard", #$FF


cm_presets_goto_eastern:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Eastern", #$FF

cm_presets_goto_desert:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Desert", #$FF

cm_presets_goto_hera:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Hera", #$FF

cm_presets_goto_aga:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Agahnim's Tower", #$FF

cm_presets_goto_pod:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Palace of Darkness", #$FF

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
