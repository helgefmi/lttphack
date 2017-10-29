; MAIN MENU

cm_mainmenu_indices:
    dw cm_main_goto_presets
    dw cm_main_goto_items
    dw cm_main_goto_equipment
    dw cm_main_goto_features
    ; dw cm_main_goto_minigames
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "LTTPHACK MENU", #$FF
  table ../resources/normal.tbl

; ITEMS {{{

cm_main_goto_items:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_items
    db #$24, "Items", #$FF

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
  table ../resources/header.tbl
    db #$2C, "ITEMS", #$FF
  table ../resources/normal.tbl

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
    db #$24, "Flute (no)", #$FF
    db #$24, "Flute", #$FF
    db #$FF

cm_items_net:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_net
    db #$24, "Net", #$FF

cm_items_book:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_book
    db #$24, "Book", #$FF

cm_items_somaria:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_somaria
    db #$24, "Somaria", #$FF

cm_items_byrna:
    dw !CM_ACTION_TOGGLE
    dl #!ram_item_byrna
    db #$24, "Byrna", #$FF

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


; Bottles submenu

cm_items_submenu_bottles:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_bottles
    db #$24, "Bottles", #$FF

cm_submenu_bottles:
    dw cm_items_bottle_1
    dw cm_items_bottle_2
    dw cm_items_bottle_3
    dw cm_items_bottle_4
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "BOTTLES", #$FF
  table ../resources/normal.tbl

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
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_equipment
    db #$24, "Equipment", #$FF

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
  table ../resources/header.tbl
    db #$2C, "EQUIPMENT", #$FF
  table ../resources/normal.tbl

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
    dw !CM_ACTION_NUMFIELD
    dl !ram_item_bombs
    db #$00, #$1E
    db #$05
    db #$24, "Bombs", #$FF

cm_equipment_arrows:
    dw !CM_ACTION_NUMFIELD
    dl !ram_equipment_arrows_filler
    db #$00, #$1E
    db #$05
    db #$24, "Arrows", #$FF

cm_equipment_keys:
    dw !CM_ACTION_NUMFIELD
    dl !ram_equipment_keys
    db #$00, #$09
    db #$01
    db #$24, "Keys", #$FF

; }}}
; PRESETS {{{

cm_main_goto_presets:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_presets
    db #$24, "Presets", #$FF

cm_submenu_presets:
    dw cm_presets_goto_escape
    dw cm_presets_goto_eastern
    dw cm_presets_goto_desert
    dw cm_presets_goto_hera
    dw cm_presets_goto_atower
    dw cm_presets_goto_pod
    dw cm_presets_goto_thieves
    dw cm_presets_goto_skull
    dw cm_presets_goto_ice
    dw cm_presets_goto_swamp
    dw cm_presets_goto_mire
    dw cm_presets_goto_trock
    dw cm_presets_goto_gtower
    dw cm_presets_goto_ganon
    dw cm_presets_goto_bosses
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "PRESETS", #$FF
  table ../resources/normal.tbl


; ESCAPE

cm_presets_goto_escape:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_escape
    db #$24, "Escape", #$FF

cm_presets_escape:
    dw cm_esc_bed
    dw cm_esc_courtyard
    dw cm_esc_entrance
    dw cm_esc_1st_keyguard
    dw cm_esc_big_room
    dw cm_esc_2nd_keyguard
    dw cm_esc_ball_n_chains
    dw cm_esc_keyguard_revisited
    dw cm_esc_secret_passage
    dw cm_esc_snake_avoidance_room
    dw cm_esc_keyrat
    dw cm_esc_last_two_screens
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "ESCAPE", #$FF
  table ../resources/normal.tbl

cm_esc_bed:
    dw !CM_ACTION_PRESET
    dw #preset_esc_bed
    db #$24, "Link's Bed", #$FF

cm_esc_courtyard:
    dw !CM_ACTION_PRESET
    dw #preset_esc_courtyard
    db #$24, "Courtyard", #$FF

cm_esc_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_esc_entrance
    db #$24, "Entrance", #$FF

cm_esc_1st_keyguard:
    dw !CM_ACTION_PRESET
    dw #preset_esc_1st_keyguard
    db #$24, "1st Key Guard", #$FF

cm_esc_big_room:
    dw !CM_ACTION_PRESET
    dw #preset_esc_big_room
    db #$24, "Big Room", #$FF

cm_esc_2nd_keyguard:
    dw !CM_ACTION_PRESET
    dw #preset_esc_2nd_keyguard
    db #$24, "2nd Key Guard", #$FF

cm_esc_ball_n_chains:
    dw !CM_ACTION_PRESET
    dw #preset_esc_ball_n_chains
    db #$24, "Ball'n Chains", #$FF

cm_esc_keyguard_revisited:
    dw !CM_ACTION_PRESET
    dw #preset_esc_keyguard_revisited
    db #$24, "Key Guard Revisited", #$FF

cm_esc_secret_passage:
    dw !CM_ACTION_PRESET
    dw #preset_esc_secret_passage
    db #$24, "Secret Passage", #$FF

cm_esc_snake_avoidance_room:
    dw !CM_ACTION_PRESET
    dw #preset_esc_snake_avoidance_room
    db #$24, "Snake Avoidance Room", #$FF

cm_esc_keyrat:
    dw !CM_ACTION_PRESET
    dw #preset_esc_keyrat
    db #$24, "Key Rat", #$FF

cm_esc_last_two_screens:
    dw !CM_ACTION_PRESET
    dw #preset_esc_last_two_screens
    db #$24, "Last Two Screens", #$FF

; EASTERN

cm_presets_goto_eastern:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_eastern
    db #$24, "Eastern", #$FF

cm_presets_eastern:
    dw cm_east_before_cutscene
    dw cm_east_after_cutscene
    dw cm_east_octoroc
    dw cm_east_outside_palace
    dw cm_east_entrance
    dw cm_east_stalfos_room
    dw cm_east_dark_key_room
    dw cm_east_big_key_dmg_boost
    dw cm_east_big_chest_room
    dw cm_east_gwg
    dw cm_east_pot_room
    dw cm_east_zeldagamer_room
    dw cm_east_armos
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "EASTERN", #$FF
  table ../resources/normal.tbl

cm_east_before_cutscene:
    dw !CM_ACTION_PRESET
    dw #preset_east_before_cutscene
    db #$24, "Before Cutscene", #$FF

cm_east_after_cutscene:
    dw !CM_ACTION_PRESET
    dw #preset_east_after_cutscene
    db #$24, "After Cutscene", #$FF

cm_east_octoroc:
    dw !CM_ACTION_PRESET
    dw #preset_east_octoroc
    db #$24, "Octoroc OW", #$FF

cm_east_outside_palace:
    dw !CM_ACTION_PRESET
    dw #preset_east_outside_palace
    db #$24, "EP Overworld", #$FF

cm_east_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_east_entrance
    db #$24, "Entrance", #$FF

cm_east_stalfos_room:
    dw !CM_ACTION_PRESET
    dw #preset_east_stalfos_room
    db #$24, "Stalfos Room", #$FF

cm_east_dark_key_room:
    dw !CM_ACTION_PRESET
    dw #preset_east_dark_key_room
    db #$24, "Dark Key Room", #$FF

cm_east_big_key_dmg_boost:
    dw !CM_ACTION_PRESET
    dw #preset_east_big_key_dmg_boost
    db #$24, "Big Key DMG Boost", #$FF

cm_east_big_chest_room:
    dw !CM_ACTION_PRESET
    dw #preset_east_big_chest_room
    db #$24, "Big Chest Room", #$FF

cm_east_gwg:
    dw !CM_ACTION_PRESET
    dw #preset_east_gwg
    db #$24, "Gifted With Greenies", #$FF

cm_east_pot_room:
    dw !CM_ACTION_PRESET
    dw #preset_east_pot_room
    db #$24, "Pot Room", #$FF

cm_east_zeldagamer_room:
    dw !CM_ACTION_PRESET
    dw #preset_east_zeldagamer_room
    db #$24, "Zeldagamer Room", #$FF

cm_east_armos:
    dw !CM_ACTION_PRESET
    dw #preset_east_armos
    db #$24, "Armos", #$FF

; DESERT

cm_presets_goto_desert:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_desert
    db #$24, "Desert", #$FF

cm_presets_desert:
    dw cm_desert_outside_eastern_palace
    dw cm_desert_ep_spinspeed
    dw cm_desert_unholy_spinspeed
    dw cm_desert_water_dash
    dw cm_desert_desert_entrance
    dw cm_desert_keybonk
    dw cm_desert_pre_cannonball_room
    dw cm_desert_pot_room
    dw cm_desert_desert2_spinspeed
    dw cm_desert_popo_genocide_room
    dw cm_desert_torches
    dw cm_desert_lanmolas
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "DESERT", #$FF
  table ../resources/normal.tbl

cm_desert_outside_eastern_palace:
    dw !CM_ACTION_PRESET
    dw #preset_desert_outside_eastern_palace
    db #$24, "Outside Eastern Palace", #$FF

cm_desert_ep_spinspeed:
    dw !CM_ACTION_PRESET
    dw #preset_desert_ep_spinspeed
    db #$24, "Eastern Palace Spinspeed", #$FF

cm_desert_unholy_spinspeed:
    dw !CM_ACTION_PRESET
    dw #preset_desert_unholy_spinspeed
    db #$24, "Unholy Spinspeed", #$FF

cm_desert_water_dash:
    dw !CM_ACTION_PRESET
    dw #preset_desert_water_dash
    db #$24, "Water Dash", #$FF

cm_desert_desert_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_desert_desert_entrance
    db #$24, "Entrance", #$FF

cm_desert_keybonk:
    dw !CM_ACTION_PRESET
    dw #preset_desert_keybonk
    db #$24, "Key Bonk", #$FF

cm_desert_pre_cannonball_room:
    dw !CM_ACTION_PRESET
    dw #preset_desert_pre_cannonball_room
    db #$24, "Cannonball Room", #$FF

cm_desert_pot_room:
    dw !CM_ACTION_PRESET
    dw #preset_desert_pot_room
    db #$24, "Pot Room", #$FF

cm_desert_desert2_spinspeed:
    dw !CM_ACTION_PRESET
    dw #preset_desert_desert2_spinspeed
    db #$24, "Desert 2 Spinspeed", #$FF

cm_desert_popo_genocide_room:
    dw !CM_ACTION_PRESET
    dw #preset_desert_popo_genocide_room
    db #$24, "Popo Genocide", #$FF

cm_desert_torches:
    dw !CM_ACTION_PRESET
    dw #preset_desert_torches
    db #$24, "Torches", #$FF

cm_desert_lanmolas:
    dw !CM_ACTION_PRESET
    dw #preset_desert_lanmolas
    db #$24, "Lanmolas", #$FF

; HERA

cm_presets_goto_hera:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_hera
    db #$24, "Hera", #$FF

cm_presets_hera:
    dw cm_hera_outside_desert_palace
    dw cm_hera_fake_flippers
    dw cm_hera_dm
    dw cm_hera_after_mirror
    dw cm_hera_entrance
    dw cm_hera_tile_room
    dw cm_hera_torches
    dw cm_hera_beetles
    dw cm_hera_petting_zoo
    dw cm_hera_moldorm
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "HERA", #$FF
  table ../resources/normal.tbl

cm_hera_outside_desert_palace:
    dw !CM_ACTION_PRESET
    dw #preset_hera_outside_desert_palace
    db #$24, "Outside Desert Palace", #$FF

cm_hera_fake_flippers:
    dw !CM_ACTION_PRESET
    dw #preset_hera_fake_flippers
    db #$24, "Fake Flippers", #$FF

cm_hera_dm:
    dw !CM_ACTION_PRESET
    dw #preset_hera_dm
    db #$24, "Death Mountain", #$FF

cm_hera_after_mirror:
    dw !CM_ACTION_PRESET
    dw #preset_hera_after_mirror
    db #$24, "After Mirror", #$FF

cm_hera_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_hera_entrance
    db #$24, "Entrance", #$FF

cm_hera_tile_room:
    dw !CM_ACTION_PRESET
    dw #preset_hera_tile_room
    db #$24, "Tile room", #$FF

cm_hera_torches:
    dw !CM_ACTION_PRESET
    dw #preset_hera_torches
    db #$24, "Torches", #$FF

cm_hera_beetles:
    dw !CM_ACTION_PRESET
    dw #preset_hera_beetles
    db #$24, "Beetles", #$FF

cm_hera_petting_zoo:
    dw !CM_ACTION_PRESET
    dw #preset_hera_petting_zoo
    db #$24, "Petting Zoo", #$FF

cm_hera_moldorm:
    dw !CM_ACTION_PRESET
    dw #preset_hera_moldorm
    db #$24, "Moldorm", #$FF

; ATOWER

cm_presets_goto_atower:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_atower
    db #$24, "Agahnim's Tower", #$FF

cm_presets_atower:
    dw cm_aga_outside_hera
    dw cm_aga_first_rupee_tree
    dw cm_aga_lost_woods
    dw cm_aga_after_lost_woods
    dw cm_aga_tower_entrance
    dw cm_aga_dark_room_of_despair
    dw cm_aga_dark_room_of_melancholy
    dw cm_aga_red_spears
    dw cm_aga_circle_of_pot
    dw cm_aga_agahnim
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "AGAHNIMS TOWER", #$FF
  table ../resources/normal.tbl

cm_aga_outside_hera:
    dw !CM_ACTION_PRESET
    dw #preset_aga_outside_hera
    db #$24, "Outside Hera", #$FF

cm_aga_first_rupee_tree:
    dw !CM_ACTION_PRESET
    dw #preset_aga_first_rupee_tree
    db #$24, "First Rupee Tree", #$FF

cm_aga_lost_woods:
    dw !CM_ACTION_PRESET
    dw #preset_aga_lost_woods
    db #$24, "Lost Woods", #$FF

cm_aga_after_lost_woods:
    dw !CM_ACTION_PRESET
    dw #preset_aga_after_lost_woods
    db #$24, "After Lost Woods", #$FF

cm_aga_tower_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_aga_tower_entrance
    db #$24, "Entrance", #$FF

cm_aga_dark_room_of_despair:
    dw !CM_ACTION_PRESET
    dw #preset_aga_dark_room_of_despair
    db #$24, "Dark Room of Despair", #$FF

cm_aga_dark_room_of_melancholy:
    dw !CM_ACTION_PRESET
    dw #preset_aga_dark_room_of_melancholy
    db #$24, "Dark Room of Melancholy", #$FF

cm_aga_red_spears:
    dw !CM_ACTION_PRESET
    dw #preset_aga_red_spears
    db #$24, "Red Spears", #$FF

cm_aga_circle_of_pot:
    dw !CM_ACTION_PRESET
    dw #preset_aga_circle_of_pot
    db #$24, "Circle of Pot", #$FF

cm_aga_agahnim:
    dw !CM_ACTION_PRESET
    dw #preset_aga_agahnim
    db #$24, "Agahnim", #$FF

; POD

cm_presets_goto_pod:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_pod
    db #$24, "Palace of Darkness", #$FF

cm_presets_pod:
    dw cm_pod_pyramid
    dw cm_pod_pod_overworld
    dw cm_pod_entrance
    dw cm_pod_main_hub
    dw cm_pod_hammeryump
    dw cm_pod_before_sexy_statue
    dw cm_pod_turtle_room
    dw cm_pod_helma
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "PALACE OF DARKNESS", #$FF
  table ../resources/normal.tbl

cm_pod_pyramid:
    dw !CM_ACTION_PRESET
    dw #preset_pod_pyramid
    db #$24, "Pyramid", #$FF

cm_pod_pod_overworld:
    dw !CM_ACTION_PRESET
    dw #preset_pod_pod_overworld
    db #$24, "Palace Overworld Screen", #$FF

cm_pod_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_pod_entrance
    db #$24, "Entrance", #$FF

cm_pod_main_hub:
    dw !CM_ACTION_PRESET
    dw #preset_pod_main_hub
    db #$24, "Main Hub", #$FF

cm_pod_hammeryump:
    dw !CM_ACTION_PRESET
    dw #preset_pod_hammeryump
    db #$24, "Hammeryump", #$FF

cm_pod_before_sexy_statue:
    dw !CM_ACTION_PRESET
    dw #preset_pod_before_sexy_statue
    db #$24, "Pre Sexy Statue", #$FF

cm_pod_turtle_room:
    dw !CM_ACTION_PRESET
    dw #preset_pod_turtle_room
    db #$24, "Turtle Room", #$FF

cm_pod_helma:
    dw !CM_ACTION_PRESET
    dw #preset_pod_helma
    db #$24, "Helma", #$FF

; Thieves

cm_presets_goto_thieves:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_thieves
    db #$24, "Thieves's Town", #$FF

cm_presets_thieves:
    dw cm_thieves_outside_pod
    dw cm_thieves_ow_hammerdash
    dw cm_thieves_getting_flute
    dw cm_thieves_usain_bolt
    dw cm_thieves_after_activating_flute
    dw cm_thieves_darkworld
    dw cm_thieves_entrance
    dw cm_thieves_after_big_key
    dw cm_thieves_fire_room
    dw cm_thieves_hellway
    dw cm_thieves_bombable_floor
    dw cm_thieves_prison
    dw cm_thieves_after_gloves
    dw cm_thieves_pot_hammerdash
    dw cm_thieves_blind
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "THIEVES TOWN", #$FF
  table ../resources/normal.tbl

cm_thieves_outside_pod:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_outside_pod
    db #$24, "Outside PoD", #$FF

cm_thieves_ow_hammerdash:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_ow_hammerdash
    db #$24, "Overworld Hammerdash", #$FF

cm_thieves_getting_flute:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_getting_flute
    db #$24, "Getting Flute", #$FF

cm_thieves_usain_bolt:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_usain_bolt
    db #$24, "Usain Bolt", #$FF

cm_thieves_after_activating_flute:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_after_activating_flute
    db #$24, "After Activating Flute", #$FF

cm_thieves_darkworld:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_darkworld
    db #$24, "After Warp", #$FF

cm_thieves_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_entrance
    db #$24, "Entrance", #$FF

cm_thieves_after_big_key:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_after_big_key
    db #$24, "After Big Key", #$FF

cm_thieves_fire_room:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_fire_room
    db #$24, "Fire Room", #$FF

cm_thieves_hellway:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_hellway
    db #$24, "Hellway", #$FF

cm_thieves_bombable_floor:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_bombable_floor
    db #$24, "Bombable Floor", #$FF

cm_thieves_prison:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_prison
    db #$24, "Prison", #$FF

cm_thieves_after_gloves:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_after_gloves
    db #$24, "Gloves", #$FF

cm_thieves_pot_hammerdash:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_pot_hammerdash
    db #$24, "Pot Hammerdash", #$FF

cm_thieves_blind:
    dw !CM_ACTION_PRESET
    dw #preset_thieves_blind
    db #$24, "Blind", #$FF

; Skull Woods

cm_presets_goto_skull:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_skull
    db #$24, "Skull Woods", #$FF

cm_presets_skull:
    dw cm_sw_outside_thieves
    dw cm_sw_cursed_dwarf
    dw cm_sw_got_tempered
    dw cm_sw_dash_to_sw
    dw cm_sw_mummy_room
    dw cm_sw_bomb_jump
    dw cm_sw_key_pot
    dw cm_sw_skull_entrance
    dw cm_sw_mummy_hellway
    dw cm_sw_mummy_key
    dw cm_sw_mothula
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "SKULL WOODS", #$FF
  table ../resources/normal.tbl

cm_sw_outside_thieves:
    dw !CM_ACTION_PRESET
    dw #preset_sw_outside_thieves
    db #$24, "Outside Thieves", #$FF

cm_sw_cursed_dwarf:
    dw !CM_ACTION_PRESET
    dw #preset_sw_cursed_dwarf
    db #$24, "Cursed Dwarf", #$FF

cm_sw_got_tempered:
    dw !CM_ACTION_PRESET
    dw #preset_sw_got_tempered
    db #$24, "Got Tempered", #$FF

cm_sw_dash_to_sw:
    dw !CM_ACTION_PRESET
    dw #preset_sw_dash_to_sw
    db #$24, "Dash to Skull Woods", #$FF

cm_sw_mummy_room:
    dw !CM_ACTION_PRESET
    dw #preset_sw_mummy_room
    db #$24, "Mummy Room", #$FF

cm_sw_bomb_jump:
    dw !CM_ACTION_PRESET
    dw #preset_sw_bomb_jump
    db #$24, "Bomb Jump", #$FF

cm_sw_key_pot:
    dw !CM_ACTION_PRESET
    dw #preset_sw_key_pot
    db #$24, "Key Pot", #$FF

cm_sw_skull_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_sw_skull_entrance
    db #$24, "Skull Entrance", #$FF

cm_sw_mummy_hellway:
    dw !CM_ACTION_PRESET
    dw #preset_sw_mummy_hellway
    db #$24, "Mummy Hellway", #$FF

cm_sw_mummy_key:
    dw !CM_ACTION_PRESET
    dw #preset_sw_mummy_key
    db #$24, "Mummy Key", #$FF

cm_sw_mothula:
    dw !CM_ACTION_PRESET
    dw #preset_sw_mothula
    db #$24, "Mothula", #$FF

; Ice Palace

cm_presets_goto_ice:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_ice
    db #$24, "Ice Palace", #$FF

cm_presets_ice:
    dw cm_ice_outside_skull
    dw cm_ice_bridge_warp
    dw cm_ice_lottery
    dw cm_ice_medallion
    dw cm_ice_zoras_domain
    dw cm_ice_tiny_warp
    dw cm_ice_ice_entrance
    dw cm_ice_ice2
    dw cm_ice_penguin_switch_room
    dw cm_ice_bombable_floor
    dw cm_ice_conveyor_room
    dw cm_ice_ipbj
    dw cm_ice_penguin_room
    dw cm_ice_lonely_firebar
    dw cm_ice_kholdstare
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "ICE PALACE", #$FF
  table ../resources/normal.tbl

cm_ice_outside_skull:
    dw !CM_ACTION_PRESET
    dw #preset_ice_outside_skull
    db #$24, "Outside Skull", #$FF

cm_ice_bridge_warp:
    dw !CM_ACTION_PRESET
    dw #preset_ice_bridge_warp
    db #$24, "Bridge Warp", #$FF

cm_ice_lottery:
    dw !CM_ACTION_PRESET
    dw #preset_ice_lottery
    db #$24, "Lottery", #$FF

cm_ice_medallion:
    dw !CM_ACTION_PRESET
    dw #preset_ice_medallion
    db #$24, "Medallion", #$FF

cm_ice_zoras_domain:
    dw !CM_ACTION_PRESET
    dw #preset_ice_zoras_domain
    db #$24, "Zoras Domain", #$FF

cm_ice_tiny_warp:
    dw !CM_ACTION_PRESET
    dw #preset_ice_tiny_warp
    db #$24, "Tiny Warp Dik", #$FF

cm_ice_ice_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_ice_ice_entrance
    db #$24, "Entrance", #$FF

cm_ice_ice2:
    dw !CM_ACTION_PRESET
    dw #preset_ice_ice2
    db #$24, "Ice 2", #$FF

cm_ice_penguin_switch_room:
    dw !CM_ACTION_PRESET
    dw #preset_ice_penguin_switch_room
    db #$24, "Penguin Switch Room", #$FF

cm_ice_bombable_floor:
    dw !CM_ACTION_PRESET
    dw #preset_ice_bombable_floor
    db #$24, "Bombable Floor", #$FF

cm_ice_conveyor_room:
    dw !CM_ACTION_PRESET
    dw #preset_ice_conveyor_room
    db #$24, "Conveyor Room", #$FF

cm_ice_ipbj:
    dw !CM_ACTION_PRESET
    dw #preset_ice_ipbj
    db #$24, "IPBJ", #$FF

cm_ice_penguin_room:
    dw !CM_ACTION_PRESET
    dw #preset_ice_penguin_room
    db #$24, "Penguin Lineup Room", #$FF

cm_ice_lonely_firebar:
    dw !CM_ACTION_PRESET
    dw #preset_ice_lonely_firebar
    db #$24, "Lonely Firebar", #$FF

cm_ice_kholdstare:
    dw !CM_ACTION_PRESET
    dw #preset_ice_kholdstare
    db #$24, "Kholdstare", #$FF

; Swamp

cm_presets_goto_swamp:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_swamp
    db #$24, "Swamp Palace", #$FF

cm_presets_swamp:
    dw cm_swamp_outside_ice
    dw cm_swamp_links_house
    dw cm_swamp_swamp_overworld
    dw cm_swamp_antifairy_room
    dw cm_swamp_entrance
    dw cm_swamp_first_key
    dw cm_swamp_main_hub
    dw cm_swamp_switch_room
    dw cm_swamp_sociable_firebar
    dw cm_swamp_backtracking
    dw cm_swamp_hook_shot
    dw cm_swamp_hookdash
    dw cm_swamp_restock
    dw cm_swamp_arrghus
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "SWAMP PALACE", #$FF
  table ../resources/normal.tbl

cm_swamp_outside_ice:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_outside_ice
    db #$24, "Outside Ice", #$FF

cm_swamp_links_house:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_links_house
    db #$24, "Link's House", #$FF

cm_swamp_swamp_overworld:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_swamp_overworld
    db #$24, "Swamp Overworld", #$FF

cm_swamp_antifairy_room:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_antifairy_room
    db #$24, "Antifairy Room", #$FF

cm_swamp_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_entrance
    db #$24, "Entrance", #$FF

cm_swamp_first_key:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_first_key
    db #$24, "Tiny Hallway Key", #$FF

cm_swamp_main_hub:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_main_hub
    db #$24, "Main Hub", #$FF

cm_swamp_switch_room:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_switch_room
    db #$24, "Switch Room", #$FF

cm_swamp_sociable_firebar:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_sociable_firebar
    db #$24, "Sociable Firebar", #$FF

cm_swamp_backtracking:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_backtracking
    db #$24, "Backtracking", #$FF

cm_swamp_hook_shot:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_hook_shot
    db #$24, "Hookshot", #$FF

cm_swamp_hookdash:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_hookdash
    db #$24, "Hookdash", #$FF

cm_swamp_restock:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_restock
    db #$24, "Restock Room", #$FF

cm_swamp_arrghus:
    dw !CM_ACTION_PRESET
    dw #preset_swamp_arrghus
    db #$24, "Arrghus", #$FF

; Misery Mire

cm_presets_goto_mire:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_mire
    db #$24, "Misery Mire", #$FF

cm_presets_mire:
    dw cm_mire_outside_swamp
    dw cm_mire_mire_darkworld_warp
    dw cm_mire_mire_entrance
    dw cm_mire_mire2
    dw cm_mire_left_dash
    dw cm_mire_dodongos
    dw cm_mire_spark_gamble
    dw cm_mire_spike_key
    dw cm_mire_basement
    dw cm_mire_cane_dash
    dw cm_mire_bombable_wall
    dw cm_mire_vitty
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "MISERY MIRE", #$FF
  table ../resources/normal.tbl

cm_mire_outside_swamp:
    dw !CM_ACTION_PRESET
    dw #preset_mire_outside_swamp
    db #$24, "Outside Swamp", #$FF

cm_mire_mire_darkworld_warp:
    dw !CM_ACTION_PRESET
    dw #preset_mire_mire_darkworld_warp
    db #$24, "Mire Overworld Screen", #$FF

cm_mire_mire_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_mire_mire_entrance
    db #$24, "Mire Entrance", #$FF

cm_mire_mire2:
    dw !CM_ACTION_PRESET
    dw #preset_mire_mire2
    db #$24, "Mire 2", #$FF

cm_mire_left_dash:
    dw !CM_ACTION_PRESET
    dw #preset_mire_left_dash
    db #$24, "Beat the Fireball", #$FF

cm_mire_dodongos:
    dw !CM_ACTION_PRESET
    dw #preset_mire_dodongos
    db #$24, "Dodongos", #$FF

cm_mire_spark_gamble:
    dw !CM_ACTION_PRESET
    dw #preset_mire_spark_gamble
    db #$24, "Spark Gamble", #$FF

cm_mire_spike_key:
    dw !CM_ACTION_PRESET
    dw #preset_mire_spike_key
    db #$24, "Spike Key", #$FF

cm_mire_basement:
    dw !CM_ACTION_PRESET
    dw #preset_mire_basement
    db #$24, "Basement", #$FF

cm_mire_cane_dash:
    dw !CM_ACTION_PRESET
    dw #preset_mire_cane_dash
    db #$24, "Cane Dash", #$FF

cm_mire_bombable_wall:
    dw !CM_ACTION_PRESET
    dw #preset_mire_bombable_wall
    db #$24, "Bombable Wall", #$FF

cm_mire_vitty:
    dw !CM_ACTION_PRESET
    dw #preset_mire_vitty
    db #$24, "Vitreous", #$FF

; Turtle Rock

cm_presets_goto_trock:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_trock
    db #$24, "Turtle Rock", #$FF

cm_presets_trock:
    dw cm_trock_ouside_mire
    dw cm_trock_icerod_overworld
    dw cm_trock_peg_puzzle
    dw cm_trock_entrance
    dw cm_trock_lanterns
    dw cm_trock_roller_room
    dw cm_trock_chomps
    dw cm_trock_pokies_1
    dw cm_trock_pokies_2
    dw cm_trock_roller_key
    dw cm_trock_lazer_skip
    dw cm_trock_switch_room
    dw cm_trock_trinexx
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "TURTLE ROCK", #$FF
  table ../resources/normal.tbl

cm_trock_ouside_mire:
    dw !CM_ACTION_PRESET
    dw #preset_trock_ouside_mire
    db #$24, "Outside Mire", #$FF

cm_trock_icerod_overworld:
    dw !CM_ACTION_PRESET
    dw #preset_trock_icerod_overworld
    db #$24, "Ice Rod Overworld", #$FF

cm_trock_peg_puzzle:
    dw !CM_ACTION_PRESET
    dw #preset_trock_peg_puzzle
    db #$24, "Peg Puzzle", #$FF

cm_trock_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_trock_entrance
    db #$24, "Entrance", #$FF

cm_trock_lanterns:
    dw !CM_ACTION_PRESET
    dw #preset_trock_lanterns
    db #$24, "Torches", #$FF

cm_trock_roller_room:
    dw !CM_ACTION_PRESET
    dw #preset_trock_roller_room
    db #$24, "Roller Room", #$FF

cm_trock_chomps:
    dw !CM_ACTION_PRESET
    dw #preset_trock_chomps
    db #$24, "Chomps", #$FF

cm_trock_pokies_1:
    dw !CM_ACTION_PRESET
    dw #preset_trock_pokies_1
    db #$24, "Pokeys 1", #$FF

cm_trock_pokies_2:
    dw !CM_ACTION_PRESET
    dw #preset_trock_pokies_2
    db #$24, "Pokeys 2", #$FF

cm_trock_roller_key:
    dw !CM_ACTION_PRESET
    dw #preset_trock_roller_key
    db #$24, "Roller Key", #$FF

cm_trock_lazer_skip:
    dw !CM_ACTION_PRESET
    dw #preset_trock_lazer_skip
    db #$24, "Lazer Skip", #$FF

cm_trock_switch_room:
    dw !CM_ACTION_PRESET
    dw #preset_trock_switch_room
    db #$24, "Switch Room", #$FF

cm_trock_trinexx:
    dw !CM_ACTION_PRESET
    dw #preset_trock_trinexx
    db #$24, "Trinexx", #$FF

; Ganon's Tower

cm_presets_goto_gtower:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_gtower
    db #$24, "Ganon's Tower", #$FF

cm_presets_gtower:
    dw cm_gtower_outside_trock
    dw cm_gtower_entrance
    dw cm_gtower_spike_skip
    dw cm_gtower_pre_firesnakes_room
    dw cm_gtower_bombable_floor
    dw cm_gtower_ice_armos
    dw cm_gtower_floor_2
    dw cm_gtower_mimics1
    dw cm_gtower_mimics2
    dw cm_gtower_spike_room
    dw cm_gtower_gauntlet
    dw cm_gtower_lanmola2
    dw cm_gtower_wizz2
    dw cm_gtower_torches2
    dw cm_gtower_helma_key
    dw cm_gtower_bombable_wall
    dw cm_gtower_moldorm_2
    dw cm_gtower_agahnim_2
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "GANONS TOWER", #$FF
  table ../resources/normal.tbl

cm_gtower_outside_trock:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_outside_trock
    db #$24, "Outside Turtle Rock", #$FF

cm_gtower_entrance:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_entrance
    db #$24, "Entrance", #$FF

cm_gtower_spike_skip:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_spike_skip
    db #$24, "Spike Skip", #$FF

cm_gtower_pre_firesnakes_room:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_pre_firesnakes_room
    db #$24, "Pre Firesnakes Room", #$FF

cm_gtower_bombable_floor:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_bombable_floor
    db #$24, "Bombable Floor", #$FF

cm_gtower_ice_armos:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_ice_armos
    db #$24, "Ice Armos", #$FF

cm_gtower_floor_2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_floor_2
    db #$24, "Floor 2", #$FF

cm_gtower_mimics1:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_mimics1
    db #$24, "Mimics 1", #$FF

cm_gtower_mimics2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_mimics2
    db #$24, "Mimics 2", #$FF

cm_gtower_spike_room:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_spike_room
    db #$24, "Spike Room", #$FF

cm_gtower_gauntlet:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_gauntlet
    db #$24, "Gauntlet", #$FF

cm_gtower_lanmola2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_lanmola2
    db #$24, "Lanmola 2", #$FF

cm_gtower_wizz2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_wizz2
    db #$24, "Wizzrobes 2", #$FF

cm_gtower_torches2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_torches2
    db #$24, "Torches 2", #$FF

cm_gtower_helma_key:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_helma_key
    db #$24, "Helma Key", #$FF

cm_gtower_bombable_wall:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_bombable_wall
    db #$24, "Bombable Wall", #$FF

cm_gtower_moldorm_2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_moldorm_2
    db #$24, "Moldorm 2", #$FF

cm_gtower_agahnim_2:
    dw !CM_ACTION_PRESET
    dw #preset_gtower_agahnim_2
    db #$24, "Agahnim 2", #$FF

; Ganon

cm_presets_goto_ganon:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_ganon
    db #$24, "Ganon", #$FF

cm_presets_ganon:
    dw cm_ganon_pyramid
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "GANON", #$FF
  table ../resources/normal.tbl

cm_ganon_pyramid:
    dw !CM_ACTION_PRESET
    dw #preset_ganon_pyramid
    db #$24, "Pyramid", #$FF

; BOSS

cm_presets_goto_bosses:
    dw !CM_ACTION_SUBMENU
    dw cm_presets_bosses
    db #$24, "Bosses", #$FF

cm_presets_bosses:
    dw cm_east_armos
    dw cm_desert_lanmolas
    dw cm_hera_moldorm
    dw cm_aga_agahnim
    dw cm_pod_helma
    dw cm_thieves_blind
    dw cm_sw_mothula
    dw cm_ice_kholdstare
    dw cm_swamp_arrghus
    dw cm_mire_vitty
    dw cm_trock_trinexx
    dw cm_gtower_agahnim_2
    dw cm_ganon_pyramid
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "BOSSES", #$FF
  table ../resources/normal.tbl

; }}}
; FEATURES {{{

cm_main_goto_features:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_features
    db #$24, "Features", #$FF

cm_submenu_features:
    dw cm_feature_counters
    dw cm_feature_input_display
    dw cm_feature_enemy_hp
    dw cm_feature_xy
    dw cm_feature_qw
    dw cm_feature_lit_rooms
    dw cm_feature_oob
    dw cm_feature_savestate_controller
    dw cm_feature_lanmola_cycle_count
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "FEATURES", #$FF
  table ../resources/normal.tbl

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
    
cm_feature_savestate_controller:
    dw !CM_ACTION_CHOICE_JSR
    dw #.toggle_save_control
    dl !ram_savestate_controller
    db #$24, "SState ctrl", #$FF
    db #$24, "Player 1", #$FF
    db #$24, "Player 2", #$FF
    db #$FF
    
    .toggle_save_control
        %ai16()
        AND #$00FF : CMP #$0000 : BEQ .p1

        LDA !SHORTCUT_LOAD_P2 : STA !ram_savestate_load_shortcut
        LDA !SHORTCUT_SAVE_P2 : STA !ram_savestate_save_shortcut
        LDA #!ram_ctrl2_word
        JMP .end

      .p1
        LDA !SHORTCUT_LOAD_P1 : STA !ram_savestate_load_shortcut
        LDA !SHORTCUT_SAVE_P1 : STA !ram_savestate_save_shortcut
        LDA #!ram_ctrl1_word

      .end
        STA !ram_savestate_ctrl_to_use
        %ai8()
        RTS

cm_feature_lanmola_cycle_count:
    dw !CM_ACTION_TOGGLE_JSR
    dw #.turn_off_xy
    dl !ram_toggle_lanmola_cycles
    db #$24, "Lanmola Cycs", #$FF

  .turn_off_xy
  %a8()
    LDA #$00 : STA !ram_lanmola_cycles
               STA !ram_lanmola_cycles+1
               STA !ram_lanmola_cycles+2
    RTS


; }}}
; MINIGAMES {{{

cm_main_goto_minigames:
    dw !CM_ACTION_SUBMENU
    dw cm_submenu_minigames
    db #$24, "Minigames", #$FF

cm_submenu_minigames:
    dw cm_minigame_react
    dw cm_minigame_mash
    dw #$0000
  table ../resources/header.tbl
    db #$2C, "MINIGAMES", #$FF
  table ../resources/normal.tbl

cm_minigame_react:
    dw !CM_ACTION_JSR
    dw #.start_react_minigame
    db #$24, "Reaction", #$FF

  .start_react_minigame
    LDA #1 : STA $B0
    LDA #0 : STA !ram_minigame_submode
    RTS

cm_minigame_mash:
    dw !CM_ACTION_JSR
    dw #.start_mashing_minigame
    db #$24, "Mashing", #$FF

  .start_mashing_minigame
    LDA #2 : STA $B0
    LDA #0 : STA !ram_minigame_submode
    RTS

; }}}
