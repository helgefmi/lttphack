cm_hundo_submenu_presets:
    dw cm_hundo_presets_goto_escape
    dw cm_hundo_presets_goto_eastern
    dw cm_hundo_presets_goto_desert
    dw cm_hundo_presets_goto_hera
    dw cm_hundo_presets_goto_atower
    dw cm_hundo_presets_goto_pod
    dw cm_hundo_presets_goto_thieves
    dw cm_hundo_presets_goto_skull
    dw cm_hundo_presets_goto_ice
    dw cm_hundo_presets_goto_mire
    dw cm_hundo_presets_goto_swamp
    dw cm_hundo_presets_goto_trock
    dw cm_hundo_presets_goto_gtower
    dw cm_hundo_presets_goto_ganon
    dw cm_hundo_presets_goto_boss
    dw #$0000
    %cm_header("PRESETS")

; HYRULE CASTLE

cm_hundo_presets_goto_escape:
    %cm_submenu("Hyrule Castle", cm_hundo_presets_escape)

cm_hundo_presets_escape:
    dw cm_hundo_esc_bed
    dw cm_hundo_esc_courtyard
    dw cm_hundo_esc_entrance
    dw cm_hundo_esc_1st_keyguard
    dw cm_hundo_esc_stealth_room
    dw cm_hundo_esc_2nd_keyguard
    dw cm_hundo_esc_ball_n_chains
    dw cm_hundo_esc_backtracking
    dw cm_hundo_esc_keyguard_revisited
    dw cm_hundo_esc_throne_room
    dw cm_hundo_esc_snake_avoidance_room
    dw cm_hundo_esc_water_rooms
    dw cm_hundo_esc_keyrat
    dw cm_hundo_esc_last_two_screens
    dw #$0000
    %cm_header("HYRULE CASTLE")

cm_hundo_esc_bed:
    %cm_preset("Link's Bed", preset_hundo_esc_bed)

cm_hundo_esc_courtyard:
    %cm_preset("Courtyard", preset_hundo_esc_courtyard)

cm_hundo_esc_entrance:
    %cm_preset("Entrance", preset_hundo_esc_entrance)

cm_hundo_esc_1st_keyguard:
    %cm_preset("1st Key Guard", preset_hundo_esc_1st_keyguard)

cm_hundo_esc_stealth_room:
    %cm_preset("Stealth Room", preset_hundo_esc_stealth_room)

cm_hundo_esc_2nd_keyguard:
    %cm_preset("2nd Key Guard", preset_hundo_esc_2nd_keyguard)

cm_hundo_esc_ball_n_chains:
    %cm_preset("Ball'n Chains", preset_hundo_esc_ball_n_chains)

cm_hundo_esc_backtracking:
    %cm_preset("Backtracking", preset_hundo_esc_backtracking)

cm_hundo_esc_keyguard_revisited:
    %cm_preset("Key Guard Revisited", preset_hundo_esc_keyguard_revisited)

cm_hundo_esc_throne_room:
    %cm_preset("Throne Room", preset_hundo_esc_throne_room)

cm_hundo_esc_snake_avoidance_room:
    %cm_preset("Snake Avoidance Room", preset_hundo_esc_snake_avoidance_room)

cm_hundo_esc_water_rooms:
    %cm_preset("Sewer Rooms", preset_hundo_esc_water_rooms)

cm_hundo_esc_keyrat:
    %cm_preset("Key Rat", preset_hundo_esc_keyrat)

cm_hundo_esc_last_two_screens:
    %cm_preset("Last Two Screens", preset_hundo_esc_last_two_screens)

; EASTERN

cm_hundo_presets_goto_eastern:
    %cm_submenu("Eastern", cm_hundo_presets_eastern)

cm_hundo_presets_eastern:
    dw cm_hundo_east_before_cutscene
    dw cm_hundo_east_after_cutscene
    dw cm_hundo_east_octoroc
    dw cm_hundo_east_outside_palace
    dw cm_hundo_east_entrance
    dw cm_hundo_east_stalfos_room
    dw cm_hundo_east_big_chest_room_1
    dw cm_hundo_east_dark_key_room
    dw cm_hundo_east_big_key_dmg_boost
    dw cm_hundo_east_big_chest_room_2
    dw cm_hundo_east_gwg
    dw cm_hundo_east_pot_room
    dw cm_hundo_east_zeldagamer_room
    dw cm_hundo_east_armos
    dw #$0000
    %cm_header("EASTERN")

cm_hundo_east_before_cutscene:
    %cm_preset("Before Cutscene", preset_hundo_east_before_cutscene)

cm_hundo_east_after_cutscene:
    %cm_preset("After Cutscene", preset_hundo_east_after_cutscene)

cm_hundo_east_octoroc:
    %cm_preset("Octoroc OW", preset_hundo_east_octoroc)

cm_hundo_east_outside_palace:
    %cm_preset("EP Overworld", preset_hundo_east_outside_palace)

cm_hundo_east_entrance:
    %cm_preset("Entrance", preset_hundo_east_entrance)

cm_hundo_east_stalfos_room:
    %cm_preset("Stalfos Room", preset_hundo_east_stalfos_room)

cm_hundo_east_big_chest_room_1:
    %cm_preset("Big Chest Room 1", preset_hundo_east_big_chest_room_1)

cm_hundo_east_dark_key_room:
    %cm_preset("Dark Key Room", preset_hundo_east_dark_key_room)

cm_hundo_east_big_key_dmg_boost:
    %cm_preset("Big Key DMG Boost", preset_hundo_east_big_key_dmg_boost)

cm_hundo_east_big_chest_room_2:
    %cm_preset("Big Chest Room 2", preset_hundo_east_big_chest_room_2)

cm_hundo_east_gwg:
    %cm_preset("Gifted With Greenies", preset_hundo_east_gwg)

cm_hundo_east_pot_room:
    %cm_preset("Pot Room", preset_hundo_east_pot_room)

cm_hundo_east_zeldagamer_room:
    %cm_preset("Zeldagamer Room", preset_hundo_east_zeldagamer_room)

cm_hundo_east_armos:
    %cm_preset("Armos", preset_hundo_east_armos)

; DESERT

cm_hundo_presets_goto_desert:
    %cm_submenu("Desert", cm_hundo_presets_desert)

cm_hundo_presets_desert:
    dw cm_hundo_desert_outside_eastern_palace
    dw cm_hundo_desert_ep_spinspeed
    dw cm_hundo_desert_bridge_screen
    dw cm_hundo_desert_unholy_spinspeed
    dw cm_hundo_desert_water_dash
    dw cm_hundo_desert_outside_desert_palace
    dw cm_hundo_desert_desert_entrance
    dw cm_hundo_desert_keybonk
    dw cm_hundo_desert_pre_cannonball_room
    dw cm_hundo_desert_pot_room
    dw cm_hundo_desert_desert2_spinspeed
    dw cm_hundo_desert_popo_genocide_room
    dw cm_hundo_desert_torches
    dw cm_hundo_desert_lanmolas
    dw #$0000
    %cm_header("DESERT")

cm_hundo_desert_outside_eastern_palace:
    %cm_preset("Outside Eastern Palace", preset_hundo_desert_outside_eastern_palace)

cm_hundo_desert_ep_spinspeed:
    %cm_preset("Eastern Palace Spinspeed", preset_hundo_desert_ep_spinspeed)

cm_hundo_desert_bridge_screen:
    %cm_preset("Bridge Screen", preset_hundo_desert_bridge_screen)

cm_hundo_desert_unholy_spinspeed:
    %cm_preset("Unholy Spinspeed", preset_hundo_desert_unholy_spinspeed)

cm_hundo_desert_water_dash:
    %cm_preset("Water Dash", preset_hundo_desert_water_dash)

cm_hundo_desert_outside_desert_palace:
    %cm_preset("Outside Desert Palace", preset_hundo_desert_outside_desert_palace)

cm_hundo_desert_desert_entrance:
    %cm_preset("Entrance", preset_hundo_desert_desert_entrance)

cm_hundo_desert_keybonk:
    %cm_preset("Key Bonk", preset_hundo_desert_keybonk)

cm_hundo_desert_pre_cannonball_room:
    %cm_preset("Pre Cannonball Room", preset_hundo_desert_pre_cannonball_room)

cm_hundo_desert_pot_room:
    %cm_preset("Pot Room", preset_hundo_desert_pot_room)

cm_hundo_desert_desert2_spinspeed:
    %cm_preset("Desert 2 Spinspeed", preset_hundo_desert_desert2_spinspeed)

cm_hundo_desert_popo_genocide_room:
    %cm_preset("Popo Genocide", preset_hundo_desert_popo_genocide_room)

cm_hundo_desert_torches:
    %cm_preset("Torches", preset_hundo_desert_torches)

cm_hundo_desert_lanmolas:
    %cm_preset("Lanmolas", preset_hundo_desert_lanmolas)

; HERA

cm_hundo_presets_goto_hera:
    %cm_submenu("Hera", cm_hundo_presets_hera)

cm_hundo_presets_hera:
    dw cm_hundo_hera_outside_desert_palace
    dw cm_hundo_hera_fake_flippers
    dw cm_hundo_hera_dm
    dw cm_hundo_hera_after_mirror
    dw cm_hundo_hera_quickhop
    dw cm_hundo_hera_entrance
    dw cm_hundo_hera_tile_room
    dw cm_hundo_hera_torches
    dw cm_hundo_hera_beetles
    dw cm_hundo_hera_petting_zoo
    dw cm_hundo_hera_moldorm
    dw #$0000
    %cm_header("HERA")

cm_hundo_hera_outside_desert_palace:
    %cm_preset("Outside Desert Palace", preset_hundo_hera_outside_desert_palace)

cm_hundo_hera_fake_flippers:
    %cm_preset("Fake Flippers", preset_hundo_hera_fake_flippers)

cm_hundo_hera_dm:
    %cm_preset("Death Mountain", preset_hundo_hera_dm)

cm_hundo_hera_after_mirror:
    %cm_preset("After Mirror", preset_hundo_hera_after_mirror)

cm_hundo_hera_quickhop:
    %cm_preset("Quickhop", preset_hundo_hera_quickhop)

cm_hundo_hera_entrance:
    %cm_preset("Entrance", preset_hundo_hera_entrance)

cm_hundo_hera_tile_room:
    %cm_preset("Tile room", preset_hundo_hera_tile_room)

cm_hundo_hera_torches:
    %cm_preset("Torches", preset_hundo_hera_torches)

cm_hundo_hera_beetles:
    %cm_preset("Beetles", preset_hundo_hera_beetles)

cm_hundo_hera_petting_zoo:
    %cm_preset("Petting Zoo", preset_hundo_hera_petting_zoo)

cm_hundo_hera_moldorm:
    %cm_preset("Moldorm", preset_hundo_hera_moldorm)

; AGAHNIMS TOWER

cm_hundo_presets_goto_atower:
    %cm_submenu("Agahnim's Tower", cm_hundo_presets_atower)

cm_hundo_presets_atower:
    dw cm_hundo_aga_outside_hera
    dw cm_hundo_aga_first_rupee_tree
    dw cm_hundo_aga_lost_woods
    dw cm_hundo_aga_after_lost_woods
    dw cm_hundo_aga_castle_screen
    dw cm_hundo_aga_entrance
    dw cm_hundo_aga_fairy_skip
    dw cm_hundo_aga_dark_room_of_despair
    dw cm_hundo_aga_dark_room_of_melancholy
    dw cm_hundo_aga_spear_guards
    dw cm_hundo_aga_circle_of_pots
    dw cm_hundo_aga_pit_room
    dw cm_hundo_aga_agahnim
    dw #$0000
    %cm_header("AGAHNIMS TOWER")

cm_hundo_aga_outside_hera:
    %cm_preset("Outside Hera", preset_hundo_aga_outside_hera)

cm_hundo_aga_first_rupee_tree:
    %cm_preset("First Rupee Tree", preset_hundo_aga_first_rupee_tree)

cm_hundo_aga_lost_woods:
    %cm_preset("Lost Woods", preset_hundo_aga_lost_woods)

cm_hundo_aga_after_lost_woods:
    %cm_preset("After Lost Woods", preset_hundo_aga_after_lost_woods)

cm_hundo_aga_castle_screen:
    %cm_preset("Castle Screen", preset_hundo_aga_castle_screen)

cm_hundo_aga_entrance:
    %cm_preset("Entrance", preset_hundo_aga_entrance)

cm_hundo_aga_fairy_skip:
    %cm_preset("Fairy Skip", preset_hundo_aga_fairy_skip)

cm_hundo_aga_dark_room_of_despair:
    %cm_preset("Dark Room of Despair", preset_hundo_aga_dark_room_of_despair)

cm_hundo_aga_dark_room_of_melancholy:
    %cm_preset("Dark Room of Melancholy", preset_hundo_aga_dark_room_of_melancholy)

cm_hundo_aga_spear_guards:
    %cm_preset("Spear Guards", preset_hundo_aga_spear_guards)

cm_hundo_aga_circle_of_pots:
    %cm_preset("Circle of Pots", preset_hundo_aga_circle_of_pots)

cm_hundo_aga_pit_room:
    %cm_preset("Pit Room", preset_hundo_aga_pit_room)

cm_hundo_aga_agahnim:
    %cm_preset("Agahnim", preset_hundo_aga_agahnim)

; PALACE OF DARKNESS

cm_hundo_presets_goto_pod:
    %cm_submenu("Palace of Darkness", cm_hundo_presets_pod)

cm_hundo_presets_pod:
    dw cm_hundo_pod_pyramid
    dw cm_hundo_pod_pod_overworld
    dw cm_hundo_pod_entrance
    dw cm_hundo_pod_main_hub_small_key
    dw cm_hundo_pod_main_hub_bk
    dw cm_hundo_pod_main_hub_hammeryump
    dw cm_hundo_pod_hammeryump
    dw cm_hundo_pod_before_sexy_statue
    dw cm_hundo_pod_sexy_statue_room
    dw cm_hundo_pod_mimics
    dw cm_hundo_pod_statue
    dw cm_hundo_pod_basement
    dw cm_hundo_pod_turtle_room
    dw cm_hundo_pod_helma
    dw #$0000
    %cm_header("PALACE OF DARKNESS")

cm_hundo_pod_pyramid:
    %cm_preset("Pyramid", preset_hundo_pod_pyramid)

cm_hundo_pod_pod_overworld:
    %cm_preset("Palace Overworld Screen", preset_hundo_pod_pod_overworld)

cm_hundo_pod_entrance:
    %cm_preset("Entrance", preset_hundo_pod_entrance)

cm_hundo_pod_main_hub_small_key:
    %cm_preset("Main Hub (small key)", preset_hundo_pod_main_hub_small_key)

cm_hundo_pod_main_hub_bk:
    %cm_preset("Main Hub (bk)", preset_hundo_pod_main_hub_bk)

cm_hundo_pod_main_hub_hammeryump:
    %cm_preset("Main Hub (hammeryump)", preset_hundo_pod_main_hub_hammeryump)

cm_hundo_pod_hammeryump:
    %cm_preset("Hammeryump", preset_hundo_pod_hammeryump)

cm_hundo_pod_before_sexy_statue:
    %cm_preset("Pre Sexy Statue", preset_hundo_pod_before_sexy_statue)

cm_hundo_pod_sexy_statue_room:
    %cm_preset("Sexy Statue Room", preset_hundo_pod_sexy_statue_room)

cm_hundo_pod_mimics:
    %cm_preset("Mimics", preset_hundo_pod_mimics)

cm_hundo_pod_statue:
    %cm_preset("Statue", preset_hundo_pod_statue)

cm_hundo_pod_basement:
    %cm_preset("Basement", preset_hundo_pod_basement)

cm_hundo_pod_turtle_room:
    %cm_preset("Turtle Room", preset_hundo_pod_turtle_room)

cm_hundo_pod_helma:
    %cm_preset("Helma", preset_hundo_pod_helma)

; THIEVES TOWN

cm_hundo_presets_goto_thieves:
    %cm_submenu("Thieves' Town", cm_hundo_presets_thieves)

cm_hundo_presets_thieves:
    dw cm_hundo_thieves_outside_pod
    dw cm_hundo_thieves_ow_hammerdash
    dw cm_hundo_thieves_grove
    dw cm_hundo_thieves_usain_bolt
    dw cm_hundo_thieves_after_activating_flute
    dw cm_hundo_thieves_darkworld
    dw cm_hundo_thieves_entrance
    dw cm_hundo_thieves_after_big_key
    dw cm_hundo_thieves_blind_hallway
    dw cm_hundo_thieves_conveyor_gibos
    dw cm_hundo_thieves_hellway
    dw cm_hundo_thieves_bombable_floor
    dw cm_hundo_thieves_backtracking_1
    dw cm_hundo_thieves_basement
    dw cm_hundo_thieves_prison
    dw cm_hundo_thieves_after_gloves
    dw cm_hundo_thieves_backtracking_2
    dw cm_hundo_thieves_pot_hammerdash
    dw cm_hundo_thieves_blind
    dw #$0000
    %cm_header("THIEVES TOWN")

cm_hundo_thieves_outside_pod:
    %cm_preset("Outside PoD", preset_hundo_thieves_outside_pod)

cm_hundo_thieves_ow_hammerdash:
    %cm_preset("Overworld Hammerdash", preset_hundo_thieves_ow_hammerdash)

cm_hundo_thieves_grove:
    %cm_preset("Grove", preset_hundo_thieves_grove)

cm_hundo_thieves_usain_bolt:
    %cm_preset("Usain Bolt", preset_hundo_thieves_usain_bolt)

cm_hundo_thieves_after_activating_flute:
    %cm_preset("After Activating Flute", preset_hundo_thieves_after_activating_flute)

cm_hundo_thieves_darkworld:
    %cm_preset("After Warp", preset_hundo_thieves_darkworld)

cm_hundo_thieves_entrance:
    %cm_preset("Entrance", preset_hundo_thieves_entrance)

cm_hundo_thieves_after_big_key:
    %cm_preset("After Big Key", preset_hundo_thieves_after_big_key)

cm_hundo_thieves_blind_hallway:
    %cm_preset("Stalfos Hallway", preset_hundo_thieves_blind_hallway)

cm_hundo_thieves_conveyor_gibos:
    %cm_preset("Conveyor Gibos", preset_hundo_thieves_conveyor_gibos)

cm_hundo_thieves_hellway:
    %cm_preset("Hellway", preset_hundo_thieves_hellway)

cm_hundo_thieves_bombable_floor:
    %cm_preset("Bombable Floor", preset_hundo_thieves_bombable_floor)

cm_hundo_thieves_backtracking_1:
    %cm_preset("Backtracking", preset_hundo_thieves_backtracking_1)

cm_hundo_thieves_basement:
    %cm_preset("Basement", preset_hundo_thieves_basement)

cm_hundo_thieves_prison:
    %cm_preset("Prison", preset_hundo_thieves_prison)

cm_hundo_thieves_after_gloves:
    %cm_preset("Gloves", preset_hundo_thieves_after_gloves)

cm_hundo_thieves_backtracking_2:
    %cm_preset("Backtracking", preset_hundo_thieves_backtracking_2)

cm_hundo_thieves_pot_hammerdash:
    %cm_preset("Pot Hammerdash", preset_hundo_thieves_pot_hammerdash)

cm_hundo_thieves_blind:
    %cm_preset("Blind", preset_hundo_thieves_blind)

; SKULL WOODS

cm_hundo_presets_goto_skull:
    %cm_submenu("Skull Woods", cm_hundo_presets_skull)

cm_hundo_presets_skull:
    dw cm_hundo_sw_outside_thieves
    dw cm_hundo_sw_cursed_dwarf
    dw cm_hundo_sw_getting_tempered
    dw cm_hundo_sw_fence_dash
    dw cm_hundo_sw_dash_to_sw
    dw cm_hundo_sw_mummy_room
    dw cm_hundo_sw_bomb_jump
    dw cm_hundo_sw_key_pot
    dw cm_hundo_sw_skull_entrance
    dw cm_hundo_sw_mummy_hellway
    dw cm_hundo_sw_mummy_key
    dw cm_hundo_sw_mothula
    dw #$0000
    %cm_header("SKULL WOODS")

cm_hundo_sw_outside_thieves:
    %cm_preset("Outside Thieves", preset_hundo_sw_outside_thieves)

cm_hundo_sw_cursed_dwarf:
    %cm_preset("Cursed Dwarf", preset_hundo_sw_cursed_dwarf)

cm_hundo_sw_getting_tempered:
    %cm_preset("Getting Tempered", preset_hundo_sw_getting_tempered)

cm_hundo_sw_fence_dash:
    %cm_preset("Fencedash", preset_hundo_sw_fence_dash)

cm_hundo_sw_dash_to_sw:
    %cm_preset("Dash to Skull Woods", preset_hundo_sw_dash_to_sw)

cm_hundo_sw_mummy_room:
    %cm_preset("Mummy Room", preset_hundo_sw_mummy_room)

cm_hundo_sw_bomb_jump:
    %cm_preset("Bomb Jump", preset_hundo_sw_bomb_jump)

cm_hundo_sw_key_pot:
    %cm_preset("Key Pot", preset_hundo_sw_key_pot)

cm_hundo_sw_skull_entrance:
    %cm_preset("Skull Entrance", preset_hundo_sw_skull_entrance)

cm_hundo_sw_mummy_hellway:
    %cm_preset("Mummy Hellway", preset_hundo_sw_mummy_hellway)

cm_hundo_sw_mummy_key:
    %cm_preset("Mummy Key", preset_hundo_sw_mummy_key)

cm_hundo_sw_mothula:
    %cm_preset("Mothula", preset_hundo_sw_mothula)

; ICE PALACE

cm_hundo_presets_goto_ice:
    %cm_submenu("Ice Palace", cm_hundo_presets_ice)

cm_hundo_presets_ice:
    dw cm_hundo_ice_outside_skull
    dw cm_hundo_ice_bridge_warp
    dw cm_hundo_ice_lottery
    dw cm_hundo_ice_medallion
    dw cm_hundo_ice_zoras_domain
    dw cm_hundo_ice_tiny_warp
    dw cm_hundo_ice_ice_entrance
    dw cm_hundo_ice_ice2
    dw cm_hundo_ice_penguin_switch_room
    dw cm_hundo_ice_bombable_floor
    dw cm_hundo_ice_conveyor_room
    dw cm_hundo_ice_ipbj
    dw cm_hundo_ice_penguin_room
    dw cm_hundo_ice_lonely_firebar
    dw cm_hundo_ice_last_two_screens
    dw cm_hundo_ice_kholdstare
    dw #$0000
    %cm_header("ICE PALACE")

cm_hundo_ice_outside_skull:
    %cm_preset("Outside Skull", preset_hundo_ice_outside_skull)

cm_hundo_ice_bridge_warp:
    %cm_preset("Bridge Warp", preset_hundo_ice_bridge_warp)

cm_hundo_ice_lottery:
    %cm_preset("Lottery", preset_hundo_ice_lottery)

cm_hundo_ice_medallion:
    %cm_preset("Medallion", preset_hundo_ice_medallion)

cm_hundo_ice_zoras_domain:
    %cm_preset("Zoras Domain", preset_hundo_ice_zoras_domain)

cm_hundo_ice_tiny_warp:
    %cm_preset("Tiny Warp Dik", preset_hundo_ice_tiny_warp)

cm_hundo_ice_ice_entrance:
    %cm_preset("Entrance", preset_hundo_ice_ice_entrance)

cm_hundo_ice_ice2:
    %cm_preset("Ice 2", preset_hundo_ice_ice2)

cm_hundo_ice_penguin_switch_room:
    %cm_preset("Penguin Switch Room", preset_hundo_ice_penguin_switch_room)

cm_hundo_ice_bombable_floor:
    %cm_preset("Bombable Floor", preset_hundo_ice_bombable_floor)

cm_hundo_ice_conveyor_room:
    %cm_preset("Conveyor Room", preset_hundo_ice_conveyor_room)

cm_hundo_ice_ipbj:
    %cm_preset("IPBJ", preset_hundo_ice_ipbj)

cm_hundo_ice_penguin_room:
    %cm_preset("Penguin Lineup Room", preset_hundo_ice_penguin_room)

cm_hundo_ice_lonely_firebar:
    %cm_preset("Lonely Firebar", preset_hundo_ice_lonely_firebar)

cm_hundo_ice_last_two_screens:
    %cm_preset("Last Two Screens", preset_hundo_ice_last_two_screens)

cm_hundo_ice_kholdstare:
    %cm_preset("Kholdstare", preset_hundo_ice_kholdstare)

; MISERY MIRE

cm_hundo_presets_goto_mire:
    %cm_submenu("Misery Mire", cm_hundo_presets_mire)

cm_hundo_presets_mire:
    dw cm_hundo_mire_outside_swamp
    dw cm_hundo_mire_dm
    dw cm_hundo_mire_free_flutedash
    dw cm_hundo_mire_darkworld_warp
    dw cm_hundo_mire_entrance
    dw cm_hundo_mire_mire2
    dw cm_hundo_mire_main_hub
    dw cm_hundo_mire_beat_the_fireball
    dw cm_hundo_mire_bari_key
    dw cm_hundo_mire_sluggulas
    dw cm_hundo_mire_torches
    dw cm_hundo_mire_spark_gamble
    dw cm_hundo_mire_big_chest_room
    dw cm_hundo_mire_spike_key
    dw cm_hundo_mire_wizzrobe
    dw cm_hundo_mire_basement
    dw cm_hundo_mire_spooky_action_1
    dw cm_hundo_mire_spooky_action_2
    dw cm_hundo_mire_vitty
    dw #$0000
    %cm_header("MISERY MIRE")

cm_hundo_mire_outside_swamp:
    %cm_preset("Outside Ice", preset_hundo_mire_outside_swamp)

cm_hundo_mire_dm:
    %cm_preset("Death Mountain", preset_hundo_mire_dm)

cm_hundo_mire_free_flutedash:
    %cm_preset("Free Flutedash", preset_hundo_mire_free_flutedash)

cm_hundo_mire_darkworld_warp:
    %cm_preset("Mire Overworld Screen", preset_hundo_mire_darkworld_warp)

cm_hundo_mire_entrance:
    %cm_preset("Mire Entrance", preset_hundo_mire_entrance)

cm_hundo_mire_mire2:
    %cm_preset("Mire 2", preset_hundo_mire_mire2)

cm_hundo_mire_main_hub:
    %cm_preset("Main Hub", preset_hundo_mire_main_hub)

cm_hundo_mire_beat_the_fireball:
    %cm_preset("Beat the Fireball", preset_hundo_mire_beat_the_fireball)

cm_hundo_mire_bari_key:
    %cm_preset("Bari Key", preset_hundo_mire_bari_key)

cm_hundo_mire_sluggulas:
    %cm_preset("Sluggulas", preset_hundo_mire_sluggulas)

cm_hundo_mire_torches:
    %cm_preset("Torches", preset_hundo_mire_torches)

cm_hundo_mire_spark_gamble:
    %cm_preset("Spark Gamble", preset_hundo_mire_spark_gamble)

cm_hundo_mire_big_chest_room:
    %cm_preset("Big Chest Room", preset_hundo_mire_big_chest_room)

cm_hundo_mire_spike_key:
    %cm_preset("Spike Key", preset_hundo_mire_spike_key)

cm_hundo_mire_wizzrobe:
    %cm_preset("Wizzrobe", preset_hundo_mire_wizzrobe)

cm_hundo_mire_basement:
    %cm_preset("Basement", preset_hundo_mire_basement)

cm_hundo_mire_spooky_action_1:
    %cm_preset("Spooky Action 1", preset_hundo_mire_spooky_action_1)

cm_hundo_mire_spooky_action_2:
    %cm_preset("Spooky Action 2", preset_hundo_mire_spooky_action_2)

cm_hundo_mire_vitty:
    %cm_preset("Vitreous", preset_hundo_mire_vitty)

; SWAMP PALACE

cm_hundo_presets_goto_swamp:
    %cm_submenu("Swamp Palace", cm_hundo_presets_swamp)

cm_hundo_presets_swamp:
    dw cm_hundo_swamp_outside_ice
    dw cm_hundo_swamp_links_house
    dw cm_hundo_swamp_swamp_overworld
    dw cm_hundo_swamp_antifairy_room
    dw cm_hundo_swamp_entrance
    dw cm_hundo_swamp_first_key_pot
    dw cm_hundo_swamp_hallway_key_1
    dw cm_hundo_swamp_water_lever_1
    dw cm_hundo_swamp_main_hub
    dw cm_hundo_swamp_water_lever_2
    dw cm_hundo_swamp_sociable_firebar
    dw cm_hundo_swamp_backtracking
    dw cm_hundo_swamp_hook_shot
    dw cm_hundo_swamp_hookdash
    dw cm_hundo_swamp_water_lever_3
    dw cm_hundo_swamp_restock
    dw cm_hundo_swamp_phelps_way
    dw cm_hundo_swamp_arrghus
    dw #$0000
    %cm_header("SWAMP PALACE")

cm_hundo_swamp_outside_ice:
    %cm_preset("Outside Mire", preset_hundo_swamp_outside_ice)

cm_hundo_swamp_links_house:
    %cm_preset("Link's House", preset_hundo_swamp_links_house)

cm_hundo_swamp_swamp_overworld:
    %cm_preset("Swamp Overworld", preset_hundo_swamp_swamp_overworld)

cm_hundo_swamp_antifairy_room:
    %cm_preset("Antifairy Room", preset_hundo_swamp_antifairy_room)

cm_hundo_swamp_entrance:
    %cm_preset("Entrance", preset_hundo_swamp_entrance)

cm_hundo_swamp_first_key_pot:
    %cm_preset("First Key Pot", preset_hundo_swamp_first_key_pot)

cm_hundo_swamp_hallway_key_1:
    %cm_preset("Tiny Hallway Key", preset_hundo_swamp_hallway_key_1)

cm_hundo_swamp_water_lever_1:
    %cm_preset("Water Lever 1", preset_hundo_swamp_water_lever_1)

cm_hundo_swamp_main_hub:
    %cm_preset("Main Hub", preset_hundo_swamp_main_hub)

cm_hundo_swamp_water_lever_2:
    %cm_preset("Water Lever 2", preset_hundo_swamp_water_lever_2)

cm_hundo_swamp_sociable_firebar:
    %cm_preset("Sociable Firebar", preset_hundo_swamp_sociable_firebar)

cm_hundo_swamp_backtracking:
    %cm_preset("Backtracking", preset_hundo_swamp_backtracking)

cm_hundo_swamp_hook_shot:
    %cm_preset("Hookshot", preset_hundo_swamp_hook_shot)

cm_hundo_swamp_hookdash:
    %cm_preset("Hookdash", preset_hundo_swamp_hookdash)

cm_hundo_swamp_water_lever_3:
    %cm_preset("Water Lever 3", preset_hundo_swamp_water_lever_3)

cm_hundo_swamp_restock:
    %cm_preset("Restock Room", preset_hundo_swamp_restock)

cm_hundo_swamp_phelps_way:
    %cm_preset("Phelps Way", preset_hundo_swamp_phelps_way)

cm_hundo_swamp_arrghus:
    %cm_preset("Arrghus", preset_hundo_swamp_arrghus)

; TURTLE ROCK

cm_hundo_presets_goto_trock:
    %cm_submenu("Turtle Rock", cm_hundo_presets_trock)

cm_hundo_presets_trock:
    dw cm_hundo_trock_outside_mire
    dw cm_hundo_trock_icerod_overworld
    dw cm_hundo_trock_dm
    dw cm_hundo_trock_squirrels
    dw cm_hundo_trock_peg_puzzle
    dw cm_hundo_trock_entrance
    dw cm_hundo_trock_torches
    dw cm_hundo_trock_roller_room
    dw cm_hundo_trock_pokey_0
    dw cm_hundo_trock_chomps
    dw cm_hundo_trock_pokey_1
    dw cm_hundo_trock_pokeys_2
    dw cm_hundo_trock_crystal_roller
    dw cm_hundo_trock_dark_room
    dw cm_hundo_trock_laser_skip
    dw cm_hundo_trock_switch_room
    dw cm_hundo_trock_trinexx
    dw #$0000
    %cm_header("TURTLE ROCK")

cm_hundo_trock_outside_mire:
    %cm_preset("Outside Swamp", preset_hundo_trock_outside_mire)

cm_hundo_trock_icerod_overworld:
    %cm_preset("Ice Rod Overworld", preset_hundo_trock_icerod_overworld)

cm_hundo_trock_dm:
    %cm_preset("Death Mountain", preset_hundo_trock_dm)

cm_hundo_trock_squirrels:
    %cm_preset("Squirrels", preset_hundo_trock_squirrels)

cm_hundo_trock_peg_puzzle:
    %cm_preset("Peg Puzzle", preset_hundo_trock_peg_puzzle)

cm_hundo_trock_entrance:
    %cm_preset("Entrance", preset_hundo_trock_entrance)

cm_hundo_trock_torches:
    %cm_preset("Torches", preset_hundo_trock_torches)

cm_hundo_trock_roller_room:
    %cm_preset("Roller Room", preset_hundo_trock_roller_room)

cm_hundo_trock_pokey_0:
    %cm_preset("Pokey 0", preset_hundo_trock_pokey_0)

cm_hundo_trock_chomps:
    %cm_preset("Chomps", preset_hundo_trock_chomps)

cm_hundo_trock_pokey_1:
    %cm_preset("Pokey 1", preset_hundo_trock_pokey_1)

cm_hundo_trock_pokeys_2:
    %cm_preset("Pokeys 2", preset_hundo_trock_pokeys_2)

cm_hundo_trock_crystal_roller:
    %cm_preset("Crystal Roller", preset_hundo_trock_crystal_roller)

cm_hundo_trock_dark_room:
    %cm_preset("Dark Room", preset_hundo_trock_dark_room)

cm_hundo_trock_laser_skip:
    %cm_preset("Laser Skip", preset_hundo_trock_laser_skip)

cm_hundo_trock_switch_room:
    %cm_preset("Switch Room", preset_hundo_trock_switch_room)

cm_hundo_trock_trinexx:
    %cm_preset("Trinexx", preset_hundo_trock_trinexx)

; GANONS TOWER

cm_hundo_presets_goto_gtower:
    %cm_submenu("Ganon's Tower", cm_hundo_presets_gtower)

cm_hundo_presets_gtower:
    dw cm_hundo_gtower_outside_trock
    dw cm_hundo_gtower_entrance
    dw cm_hundo_gtower_spike_skip
    dw cm_hundo_gtower_pre_firesnakes_room
    dw cm_hundo_gtower_bombable_floor
    dw cm_hundo_gtower_ice_armos
    dw cm_hundo_gtower_floor_2
    dw cm_hundo_gtower_mimics1
    dw cm_hundo_gtower_mimics2
    dw cm_hundo_gtower_spike_room
    dw cm_hundo_gtower_gauntlet
    dw cm_hundo_gtower_gauntlet_3
    dw cm_hundo_gtower_lanmola2
    dw cm_hundo_gtower_wizz1
    dw cm_hundo_gtower_wizz2
    dw cm_hundo_gtower_torches1
    dw cm_hundo_gtower_torches2
    dw cm_hundo_gtower_helma_key
    dw cm_hundo_gtower_bombable_wall
    dw cm_hundo_gtower_moldorm_2
    dw cm_hundo_gtower_agahnim_2
    dw #$0000
    %cm_header("GANONS TOWER")

cm_hundo_gtower_outside_trock:
    %cm_preset("Outside Turtle Rock", preset_hundo_gtower_outside_trock)

cm_hundo_gtower_entrance:
    %cm_preset("Entrance", preset_hundo_gtower_entrance)

cm_hundo_gtower_spike_skip:
    %cm_preset("Spike Skip", preset_hundo_gtower_spike_skip)

cm_hundo_gtower_pre_firesnakes_room:
    %cm_preset("Pre Firesnakes Room", preset_hundo_gtower_pre_firesnakes_room)

cm_hundo_gtower_bombable_floor:
    %cm_preset("Bombable Floor", preset_hundo_gtower_bombable_floor)

cm_hundo_gtower_ice_armos:
    %cm_preset("Ice Armos", preset_hundo_gtower_ice_armos)

cm_hundo_gtower_floor_2:
    %cm_preset("Floor 2", preset_hundo_gtower_floor_2)

cm_hundo_gtower_mimics1:
    %cm_preset("Mimics 1", preset_hundo_gtower_mimics1)

cm_hundo_gtower_mimics2:
    %cm_preset("Mimics 2", preset_hundo_gtower_mimics2)

cm_hundo_gtower_spike_room:
    %cm_preset("Spike Room", preset_hundo_gtower_spike_room)

cm_hundo_gtower_gauntlet:
    %cm_preset("Gauntlet 1", preset_hundo_gtower_gauntlet)

cm_hundo_gtower_gauntlet_3:
    %cm_preset("Gauntlet 3", preset_hundo_gtower_gauntlet_3)

cm_hundo_gtower_lanmola2:
    %cm_preset("Lanmola 2", preset_hundo_gtower_lanmola2)

cm_hundo_gtower_wizz1:
    %cm_preset("Wizzrobes 1", preset_hundo_gtower_wizz1)

cm_hundo_gtower_wizz2:
    %cm_preset("Wizzrobes 2", preset_hundo_gtower_wizz2)

cm_hundo_gtower_torches1:
    %cm_preset("Torches 1", preset_hundo_gtower_torches1)

cm_hundo_gtower_torches2:
    %cm_preset("Torches 2", preset_hundo_gtower_torches2)

cm_hundo_gtower_helma_key:
    %cm_preset("Helma Key", preset_hundo_gtower_helma_key)

cm_hundo_gtower_bombable_wall:
    %cm_preset("Bombable Wall", preset_hundo_gtower_bombable_wall)

cm_hundo_gtower_moldorm_2:
    %cm_preset("Moldorm 2", preset_hundo_gtower_moldorm_2)

cm_hundo_gtower_agahnim_2:
    %cm_preset("Agahnim 2", preset_hundo_gtower_agahnim_2)

; GANON

cm_hundo_presets_goto_ganon:
    %cm_submenu("Ganon", cm_hundo_presets_ganon)

cm_hundo_presets_ganon:
    dw cm_hundo_ganon_pyramid
    dw cm_hundo_ganon_pyramid_magic
    dw #$0000
    %cm_header("GANON")

cm_hundo_ganon_pyramid:
    %cm_preset("Ganon", preset_hundo_ganon_pyramid)

cm_hundo_ganon_pyramid_magic:
    %cm_preset("Ganon (full magic)", preset_hundo_ganon_pyramid_magic)

; BOSSES

cm_hundo_presets_goto_boss:
    %cm_submenu("Bosses", cm_hundo_presets_boss)

cm_hundo_presets_boss:
    dw cm_hundo_east_armos
    dw cm_hundo_desert_lanmolas
    dw cm_hundo_hera_moldorm
    dw cm_hundo_aga_agahnim
    dw cm_hundo_pod_helma
    dw cm_hundo_thieves_blind
    dw cm_hundo_sw_mothula
    dw cm_hundo_ice_kholdstare
    dw cm_hundo_swamp_arrghus
    dw cm_hundo_mire_vitty
    dw cm_hundo_trock_trinexx
    dw cm_hundo_gtower_agahnim_2
    dw cm_hundo_ganon_pyramid
    dw cm_hundo_ganon_pyramid_magic
    dw #$0000
    %cm_header("BOSSES")
