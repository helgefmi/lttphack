macro cm_header(title)
    table ../resources/header.tbl
        db #$2C, "<title>", #$FF
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

; MAIN MENU

cm_mainmenu_indices:
    dw cm_main_goto_presets
    dw cm_main_goto_items
    dw cm_main_goto_equipment
    dw cm_main_goto_game_state
    dw cm_main_goto_rng_control
    dw cm_main_goto_ctrl
    dw cm_main_goto_features
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
    %cm_toggle_bit("TRock", !ram_game_big_keys_1, #$08)

cm_big_keys_gtower:
    %cm_toggle_bit("GTower", !ram_game_big_keys_1, #$04)

; }}}
; PRESETS {{{

cm_main_goto_presets:
    %cm_submenu("Presets", cm_submenu_presets)

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
    %cm_header("PRESETS")

; ESCAPE

cm_presets_goto_escape:
    %cm_submenu("Escape", cm_presets_escape)

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
    %cm_header("ESCAPE")

cm_esc_bed:
    %cm_preset("Link's Bed", preset_esc_bed)

cm_esc_courtyard:
    %cm_preset("Courtyard", preset_esc_courtyard)

cm_esc_entrance:
    %cm_preset("Entrance", preset_esc_entrance)

cm_esc_1st_keyguard:
    %cm_preset("1st Key Guard", preset_esc_1st_keyguard)

cm_esc_big_room:
    %cm_preset("Big Room", preset_esc_big_room)

cm_esc_2nd_keyguard:
    %cm_preset("2nd Key Guard", preset_esc_2nd_keyguard)

cm_esc_ball_n_chains:
    %cm_preset("Ball'n Chains", preset_esc_ball_n_chains)

cm_esc_keyguard_revisited:
    %cm_preset("Key Guard Revisited", preset_esc_keyguard_revisited)

cm_esc_secret_passage:
    %cm_preset("Secret Passage", preset_esc_secret_passage)

cm_esc_snake_avoidance_room:
    %cm_preset("Snake Avoidance Room", preset_esc_snake_avoidance_room)

cm_esc_keyrat:
    %cm_preset("Key Rat", preset_esc_keyrat)

cm_esc_last_two_screens:
    %cm_preset("Last Two Screens", preset_esc_last_two_screens)

; EASTERN

cm_presets_goto_eastern:
    %cm_submenu("Eastern", cm_presets_eastern)

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
    %cm_header("EASTERN")

cm_east_before_cutscene:
    %cm_preset("Before Cutscene", preset_east_before_cutscene)

cm_east_after_cutscene:
    %cm_preset("After Cutscene", preset_east_after_cutscene)

cm_east_octoroc:
    %cm_preset("Octoroc OW", preset_east_octoroc)

cm_east_outside_palace:
    %cm_preset("EP Overworld", preset_east_outside_palace)

cm_east_entrance:
    %cm_preset("Entrance", preset_east_entrance)

cm_east_stalfos_room:
    %cm_preset("Stalfos Room", preset_east_stalfos_room)

cm_east_dark_key_room:
    %cm_preset("Dark Key Room", preset_east_dark_key_room)

cm_east_big_key_dmg_boost:
    %cm_preset("Big Key DMG Boost", preset_east_big_key_dmg_boost)

cm_east_big_chest_room:
    %cm_preset("Big Chest Room", preset_east_big_chest_room)

cm_east_gwg:
    %cm_preset("Gifted With Greenies", preset_east_gwg)

cm_east_pot_room:
    %cm_preset("Pot Room", preset_east_pot_room)

cm_east_zeldagamer_room:
    %cm_preset("Zeldagamer Room", preset_east_zeldagamer_room)

cm_east_armos:
    %cm_preset("Armos", preset_east_armos)

; DESERT

cm_presets_goto_desert:
    %cm_submenu("Desert", cm_presets_desert)

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
    %cm_header("DESERT")

cm_desert_outside_eastern_palace:
    %cm_preset("Outside Eastern Palace", preset_desert_outside_eastern_palace)

cm_desert_ep_spinspeed:
    %cm_preset("Eastern Palace Spinspeed", preset_desert_ep_spinspeed)

cm_desert_unholy_spinspeed:
    %cm_preset("Unholy Spinspeed", preset_desert_unholy_spinspeed)

cm_desert_water_dash:
    %cm_preset("Water Dash", preset_desert_water_dash)

cm_desert_desert_entrance:
    %cm_preset("Entrance", preset_desert_desert_entrance)

cm_desert_keybonk:
    %cm_preset("Key Bonk", preset_desert_keybonk)

cm_desert_pre_cannonball_room:
    %cm_preset("Cannonball Room", preset_desert_pre_cannonball_room)

cm_desert_pot_room:
    %cm_preset("Pot Room", preset_desert_pot_room)

cm_desert_desert2_spinspeed:
    %cm_preset("Desert 2 Spinspeed", preset_desert_desert2_spinspeed)

cm_desert_popo_genocide_room:
    %cm_preset("Popo Genocide", preset_desert_popo_genocide_room)

cm_desert_torches:
    %cm_preset("Torches", preset_desert_torches)

cm_desert_lanmolas:
    %cm_preset("Lanmolas", preset_desert_lanmolas)

; HERA

cm_presets_goto_hera:
    %cm_submenu("Hera", cm_presets_hera)

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
    %cm_header("HERA")

cm_hera_outside_desert_palace:
    %cm_preset("Outside Desert Palace", preset_hera_outside_desert_palace)

cm_hera_fake_flippers:
    %cm_preset("Fake Flippers", preset_hera_fake_flippers)

cm_hera_dm:
    %cm_preset("Death Mountain", preset_hera_dm)

cm_hera_after_mirror:
    %cm_preset("After Mirror", preset_hera_after_mirror)

cm_hera_entrance:
    %cm_preset("Entrance", preset_hera_entrance)

cm_hera_tile_room:
    %cm_preset("Tile room", preset_hera_tile_room)

cm_hera_torches:
    %cm_preset("Torches", preset_hera_torches)

cm_hera_beetles:
    %cm_preset("Beetles", preset_hera_beetles)

cm_hera_petting_zoo:
    %cm_preset("Petting Zoo", preset_hera_petting_zoo)

cm_hera_moldorm:
    %cm_preset("Moldorm", preset_hera_moldorm)

; ATOWER

cm_presets_goto_atower:
    %cm_submenu("Agahnim's Tower", cm_presets_atower)

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
    %cm_header("AGAHNIMS TOWER")

cm_aga_outside_hera:
    %cm_preset("Outside Hera", preset_aga_outside_hera)

cm_aga_first_rupee_tree:
    %cm_preset("First Rupee Tree", preset_aga_first_rupee_tree)

cm_aga_lost_woods:
    %cm_preset("Lost Woods", preset_aga_lost_woods)

cm_aga_after_lost_woods:
    %cm_preset("After Lost Woods", preset_aga_after_lost_woods)

cm_aga_tower_entrance:
    %cm_preset("Entrance", preset_aga_tower_entrance)

cm_aga_dark_room_of_despair:
    %cm_preset("Dark Room of Despair", preset_aga_dark_room_of_despair)

cm_aga_dark_room_of_melancholy:
    %cm_preset("Dark Room of Melancholy", preset_aga_dark_room_of_melancholy)

cm_aga_red_spears:
    %cm_preset("Red Spears", preset_aga_red_spears)

cm_aga_circle_of_pot:
    %cm_preset("Circle of Pot", preset_aga_circle_of_pot)

cm_aga_agahnim:
    %cm_preset("Agahnim", preset_aga_agahnim)

; POD

cm_presets_goto_pod:
    %cm_submenu("Palace of Darkness", cm_presets_pod)

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
    %cm_header("PALACE OF DARKNESS")

cm_pod_pyramid:
    %cm_preset("Pyramid", preset_pod_pyramid)

cm_pod_pod_overworld:
    %cm_preset("Palace Overworld Screen", preset_pod_pod_overworld)

cm_pod_entrance:
    %cm_preset("Entrance", preset_pod_entrance)

cm_pod_main_hub:
    %cm_preset("Main Hub", preset_pod_main_hub)

cm_pod_hammeryump:
    %cm_preset("Hammeryump", preset_pod_hammeryump)

cm_pod_before_sexy_statue:
    %cm_preset("Pre Sexy Statue", preset_pod_before_sexy_statue)

cm_pod_turtle_room:
    %cm_preset("Turtle Room", preset_pod_turtle_room)

cm_pod_helma:
    %cm_preset("Helma", preset_pod_helma)

; Thieves

cm_presets_goto_thieves:
    %cm_submenu("Thieves's Town", cm_presets_thieves)

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
    %cm_header("THIEVES TOWN")

cm_thieves_outside_pod:
    %cm_preset("Outside PoD", preset_thieves_outside_pod)

cm_thieves_ow_hammerdash:
    %cm_preset("Overworld Hammerdash", preset_thieves_ow_hammerdash)

cm_thieves_getting_flute:
    %cm_preset("Getting Flute", preset_thieves_getting_flute)

cm_thieves_usain_bolt:
    %cm_preset("Usain Bolt", preset_thieves_usain_bolt)

cm_thieves_after_activating_flute:
    %cm_preset("After Activating Flute", preset_thieves_after_activating_flute)

cm_thieves_darkworld:
    %cm_preset("After Warp", preset_thieves_darkworld)

cm_thieves_entrance:
    %cm_preset("Entrance", preset_thieves_entrance)

cm_thieves_after_big_key:
    %cm_preset("After Big Key", preset_thieves_after_big_key)

cm_thieves_fire_room:
    %cm_preset("Fire Room", preset_thieves_fire_room)

cm_thieves_hellway:
    %cm_preset("Hellway", preset_thieves_hellway)

cm_thieves_bombable_floor:
    %cm_preset("Bombable Floor", preset_thieves_bombable_floor)

cm_thieves_prison:
    %cm_preset("Prison", preset_thieves_prison)

cm_thieves_after_gloves:
    %cm_preset("Gloves", preset_thieves_after_gloves)

cm_thieves_pot_hammerdash:
    %cm_preset("Pot Hammerdash", preset_thieves_pot_hammerdash)

cm_thieves_blind:
    %cm_preset("Blind", preset_thieves_blind)

; Skull Woods

cm_presets_goto_skull:
    %cm_submenu("Skull Woods", cm_presets_skull)

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
    %cm_header("SKULL WOODS")

cm_sw_outside_thieves:
    %cm_preset("Outside Thieves", preset_sw_outside_thieves)

cm_sw_cursed_dwarf:
    %cm_preset("Cursed Dwarf", preset_sw_cursed_dwarf)

cm_sw_got_tempered:
    %cm_preset("Got Tempered", preset_sw_got_tempered)

cm_sw_dash_to_sw:
    %cm_preset("Dash to Skull Woods", preset_sw_dash_to_sw)

cm_sw_mummy_room:
    %cm_preset("Mummy Room", preset_sw_mummy_room)

cm_sw_bomb_jump:
    %cm_preset("Bomb Jump", preset_sw_bomb_jump)

cm_sw_key_pot:
    %cm_preset("Key Pot", preset_sw_key_pot)

cm_sw_skull_entrance:
    %cm_preset("Skull Entrance", preset_sw_skull_entrance)

cm_sw_mummy_hellway:
    %cm_preset("Mummy Hellway", preset_sw_mummy_hellway)

cm_sw_mummy_key:
    %cm_preset("Mummy Key", preset_sw_mummy_key)

cm_sw_mothula:
    %cm_preset("Mothula", preset_sw_mothula)

; Ice Palace

cm_presets_goto_ice:
    %cm_submenu("Ice Palace", cm_presets_ice)

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
    %cm_header("ICE PALACE")

cm_ice_outside_skull:
    %cm_preset("Outside Skull", preset_ice_outside_skull)

cm_ice_bridge_warp:
    %cm_preset("Bridge Warp", preset_ice_bridge_warp)

cm_ice_lottery:
    %cm_preset("Lottery", preset_ice_lottery)

cm_ice_medallion:
    %cm_preset("Medallion", preset_ice_medallion)

cm_ice_zoras_domain:
    %cm_preset("Zoras Domain", preset_ice_zoras_domain)

cm_ice_tiny_warp:
    %cm_preset("Tiny Warp Dik", preset_ice_tiny_warp)

cm_ice_ice_entrance:
    %cm_preset("Entrance", preset_ice_ice_entrance)

cm_ice_ice2:
    %cm_preset("Ice 2", preset_ice_ice2)

cm_ice_penguin_switch_room:
    %cm_preset("Penguin Switch Room", preset_ice_penguin_switch_room)

cm_ice_bombable_floor:
    %cm_preset("Bombable Floor", preset_ice_bombable_floor)

cm_ice_conveyor_room:
    %cm_preset("Conveyor Room", preset_ice_conveyor_room)

cm_ice_ipbj:
    %cm_preset("IPBJ", preset_ice_ipbj)

cm_ice_penguin_room:
    %cm_preset("Penguin Lineup Room", preset_ice_penguin_room)

cm_ice_lonely_firebar:
    %cm_preset("Lonely Firebar", preset_ice_lonely_firebar)

cm_ice_kholdstare:
    %cm_preset("Kholdstare", preset_ice_kholdstare)

; Swamp

cm_presets_goto_swamp:
    %cm_submenu("Swamp Palace", cm_presets_swamp)

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
    %cm_header("SWAMP PALACE")

cm_swamp_outside_ice:
    %cm_preset("Outside Ice", preset_swamp_outside_ice)

cm_swamp_links_house:
    %cm_preset("Link's House", preset_swamp_links_house)

cm_swamp_swamp_overworld:
    %cm_preset("Swamp Overworld", preset_swamp_swamp_overworld)

cm_swamp_antifairy_room:
    %cm_preset("Antifairy Room", preset_swamp_antifairy_room)

cm_swamp_entrance:
    %cm_preset("Entrance", preset_swamp_entrance)

cm_swamp_first_key:
    %cm_preset("Tiny Hallway Key", preset_swamp_first_key)

cm_swamp_main_hub:
    %cm_preset("Main Hub", preset_swamp_main_hub)

cm_swamp_switch_room:
    %cm_preset("Switch Room", preset_swamp_switch_room)

cm_swamp_sociable_firebar:
    %cm_preset("Sociable Firebar", preset_swamp_sociable_firebar)

cm_swamp_backtracking:
    %cm_preset("Backtracking", preset_swamp_backtracking)

cm_swamp_hook_shot:
    %cm_preset("Hookshot", preset_swamp_hook_shot)

cm_swamp_hookdash:
    %cm_preset("Hookdash", preset_swamp_hookdash)

cm_swamp_restock:
    %cm_preset("Restock Room", preset_swamp_restock)

cm_swamp_arrghus:
    %cm_preset("Arrghus", preset_swamp_arrghus)

; Misery Mire

cm_presets_goto_mire:
    %cm_submenu("Misery Mire", cm_presets_mire)

cm_presets_mire:
    dw cm_mire_outside_swamp
    dw cm_mire_mire_darkworld_warp
    dw cm_mire_mire_entrance
    dw cm_mire_mire2
    dw cm_mire_left_dash
    dw cm_mire_sluggulas
    dw cm_mire_spark_gamble
    dw cm_mire_spike_key
    dw cm_mire_basement
    dw cm_mire_cane_dash
    dw cm_mire_bombable_wall
    dw cm_mire_vitty
    dw #$0000
    %cm_header("MISERY MIRE")

cm_mire_outside_swamp:
    %cm_preset("Outside Swamp", preset_mire_outside_swamp)

cm_mire_mire_darkworld_warp:
    %cm_preset("Mire Overworld Screen", preset_mire_mire_darkworld_warp)

cm_mire_mire_entrance:
    %cm_preset("Mire Entrance", preset_mire_mire_entrance)

cm_mire_mire2:
    %cm_preset("Mire 2", preset_mire_mire2)

cm_mire_left_dash:
    %cm_preset("Beat the Fireball", preset_mire_left_dash)

cm_mire_sluggulas:
    %cm_preset("Sluggulas", preset_mire_sluggulas)

cm_mire_spark_gamble:
    %cm_preset("Spark Gamble", preset_mire_spark_gamble)

cm_mire_spike_key:
    %cm_preset("Spike Key", preset_mire_spike_key)

cm_mire_basement:
    %cm_preset("Basement", preset_mire_basement)

cm_mire_cane_dash:
    %cm_preset("Cane Dash", preset_mire_cane_dash)

cm_mire_bombable_wall:
    %cm_preset("Bombable Wall", preset_mire_bombable_wall)

cm_mire_vitty:
    %cm_preset("Vitreous", preset_mire_vitty)

; Turtle Rock

cm_presets_goto_trock:
    %cm_submenu("Turtle Rock", cm_presets_trock)

cm_presets_trock:
    dw cm_trock_ouside_mire
    dw cm_trock_icerod_overworld
    dw cm_trock_peg_puzzle
    dw cm_trock_entrance
    dw cm_trock_lanterns
    dw cm_trock_roller_room
    dw cm_trock_chomps
    dw cm_trock_pokey_1
    dw cm_trock_pokeys_2
    dw cm_trock_roller_key
    dw cm_trock_lazer_skip
    dw cm_trock_switch_room
    dw cm_trock_trinexx
    dw #$0000
    %cm_header("TURTLE ROCK")

cm_trock_ouside_mire:
    %cm_preset("Outside Mire", preset_trock_ouside_mire)

cm_trock_icerod_overworld:
    %cm_preset("Ice Rod Overworld", preset_trock_icerod_overworld)

cm_trock_peg_puzzle:
    %cm_preset("Peg Puzzle", preset_trock_peg_puzzle)

cm_trock_entrance:
    %cm_preset("Entrance", preset_trock_entrance)

cm_trock_lanterns:
    %cm_preset("Torches", preset_trock_lanterns)

cm_trock_roller_room:
    %cm_preset("Roller Room", preset_trock_roller_room)

cm_trock_chomps:
    %cm_preset("Chomps", preset_trock_chomps)

cm_trock_pokey_1:
    %cm_preset("Pokey 1", preset_trock_pokey_1)

cm_trock_pokeys_2:
    %cm_preset("Pokeys 2", preset_trock_pokeys_2)

cm_trock_roller_key:
    %cm_preset("Roller Key", preset_trock_roller_key)

cm_trock_lazer_skip:
    %cm_preset("Lazer Skip", preset_trock_lazer_skip)

cm_trock_switch_room:
    %cm_preset("Switch Room", preset_trock_switch_room)

cm_trock_trinexx:
    %cm_preset("Trinexx", preset_trock_trinexx)

; Ganon's Tower

cm_presets_goto_gtower:
    %cm_submenu("Ganon's Tower", cm_presets_gtower)

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
    %cm_header("GANONS TOWER")

cm_gtower_outside_trock:
    %cm_preset("Outside Turtle Rock", preset_gtower_outside_trock)

cm_gtower_entrance:
    %cm_preset("Entrance", preset_gtower_entrance)

cm_gtower_spike_skip:
    %cm_preset("Spike Skip", preset_gtower_spike_skip)

cm_gtower_pre_firesnakes_room:
    %cm_preset("Pre Firesnakes Room", preset_gtower_pre_firesnakes_room)

cm_gtower_bombable_floor:
    %cm_preset("Bombable Floor", preset_gtower_bombable_floor)

cm_gtower_ice_armos:
    %cm_preset("Ice Armos", preset_gtower_ice_armos)

cm_gtower_floor_2:
    %cm_preset("Floor 2", preset_gtower_floor_2)

cm_gtower_mimics1:
    %cm_preset("Mimics 1", preset_gtower_mimics1)

cm_gtower_mimics2:
    %cm_preset("Mimics 2", preset_gtower_mimics2)

cm_gtower_spike_room:
    %cm_preset("Spike Room", preset_gtower_spike_room)

cm_gtower_gauntlet:
    %cm_preset("Gauntlet", preset_gtower_gauntlet)

cm_gtower_lanmola2:
    %cm_preset("Lanmola 2", preset_gtower_lanmola2)

cm_gtower_wizz2:
    %cm_preset("Wizzrobes 2", preset_gtower_wizz2)

cm_gtower_torches2:
    %cm_preset("Torches 2", preset_gtower_torches2)

cm_gtower_helma_key:
    %cm_preset("Helma Key", preset_gtower_helma_key)

cm_gtower_bombable_wall:
    %cm_preset("Bombable Wall", preset_gtower_bombable_wall)

cm_gtower_moldorm_2:
    %cm_preset("Moldorm 2", preset_gtower_moldorm_2)

cm_gtower_agahnim_2:
    %cm_preset("Agahnim 2", preset_gtower_agahnim_2)

; Ganon

cm_presets_goto_ganon:
    %cm_submenu("Ganon", cm_presets_ganon)

cm_presets_ganon:
    dw cm_ganon_pyramid
    dw cm_ganon_pyramid_magic
    dw #$0000
    %cm_header("GANON")

cm_ganon_pyramid:
    %cm_preset("Pyramid", preset_ganon_pyramid)

cm_ganon_pyramid_magic:
    %cm_preset("Pyramid (magic)", preset_ganon_pyramid_magic)

; BOSS

cm_presets_goto_bosses:
    %cm_submenu("Bosses", cm_presets_bosses)

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
    %cm_header("BOSSES")

; }}}
; FEATURES {{{

cm_main_goto_features:
    %cm_submenu("Features", cm_submenu_features)

cm_submenu_features:
    dw cm_feature_counters
    dw cm_feature_input_display
    dw cm_feature_enemy_hp
    dw cm_feature_music
    dw cm_feature_xy
    dw cm_feature_qw
    dw cm_feature_lit_rooms
    dw cm_feature_oob
    dw cm_feature_lanmola_cycle_count
    dw #$0000
    %cm_header("FEATURES")

cm_feature_counters:
    %cm_toggle_jsr("Counters", !ram_counters_toggle)

  .toggle
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
    BEQ .mute_music
    RTS

  .mute_music
    STZ $012C : STZ $012D
    RTS

cm_feature_enemy_hp:
    %cm_toggle_jsr("Enemy HP", !ram_enemy_hp_toggle)

  .toggle
  %ai16()
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x
    RTS

cm_feature_xy:
    %cm_toggle_jsr("Coordinates", !ram_xy_toggle)

  .toggle
  %ai16()
    LDA #$207F : LDX.w #!POS_XY
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x : STA $7EC70A,x
    RTS

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

; }}}
; GAME STATE {{{

cm_main_goto_game_state:
    %cm_submenu("Game state", cm_submenu_game_state)

cm_submenu_game_state:
    dw cm_game_state_reset_screen
    dw cm_game_state_goto_bosses_submenu
    dw cm_game_state_goto_crystals_submenu
    dw cm_game_state_goto_flags_submenu
    dw cm_game_state_progress
    dw cm_game_state_map_indicator
    dw cm_game_state_armed_eg
    dw cm_game_state_eg_strength
    dw #$0000
    %cm_header("GAME STATE")

cm_game_state_armed_eg:
    %cm_toggle_jsr("Armed EG", !ram_cm_armed_eg)

  .toggle
    LDA !ram_cm_armed_eg : BEQ .not_set

    LDA #$00 : STA $7E047A
    RTS

  .not_set
    LDA #$01 : STA $7E047A
    RTS

cm_game_state_eg_strength:
    %cm_toggle_jsr("Strong EG", !ram_cm_eg_strength)

  .toggle
    LDA !ram_cm_eg_strength : BEQ .weak

    LDA #$02 : STA $7E044A
    RTS

  .weak
    LDA #$01 : STA $7E044A
    RTS

cm_game_state_reset_screen:
    %cm_jsr("Reset screen state")

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
    dw cm_game_state_flags_not_used
    dw cm_game_state_flags_uncle_left_home
    dw cm_game_state_flags_talked_to_aginah
    dw cm_game_state_flags_fortune_teller_cycle
    dw cm_game_state_flags_not_used_2
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
    %cm_submenu("Bosses defeated", cm_game_state_bosses_submenu)

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
    %cm_toggle_bit("TRock", !ram_game_crystals, #$08)

; }}}
; RECONFIGURE CONTROLS {{{

cm_main_goto_ctrl:
    %cm_submenu("Controls", cm_submenu_ctrl)

cm_submenu_ctrl:
    dw cm_ctrl_open_lttphack_menu
    dw cm_ctrl_load_last_preset
    if !FEATURE_SS
        dw cm_ctrl_save_state
        dw cm_ctrl_load_state
    endif
    dw cm_ctrl_toggle_oob
    dw #$0000
    %cm_header("CONTROLS")

cm_ctrl_open_lttphack_menu:
    %cm_ctrl_shortcut("Open menu", !ram_ctrl_prachack_menu)

cm_ctrl_load_last_preset:
    %cm_ctrl_shortcut("Load preset", !ram_ctrl_load_last_preset)

if !FEATURE_SS
    cm_ctrl_save_state:
        %cm_ctrl_shortcut("Save state", !ram_ctrl_save_state)

    cm_ctrl_load_state:
        %cm_ctrl_shortcut("Load state", !ram_ctrl_load_state)
endif

cm_ctrl_toggle_oob:
    %cm_ctrl_shortcut("Toggle OoB", !ram_ctrl_toggle_oob)

; }}}
; RNG CONTROL {{{

cm_main_goto_rng_control:
    %cm_submenu("RNG Control", cm_submenu_rng_control)

cm_submenu_rng_control:
    dw cm_rng_pokey
    dw cm_rng_agahnim
    dw cm_rng_helmasaur
    dw cm_rng_ganon_warp
    dw cm_rng_ganon_warp_location
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

; }}}
