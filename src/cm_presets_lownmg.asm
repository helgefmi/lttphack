cm_lownmg_submenu_presets:
    dw cm_lownmg_presets_goto_escape
    dw cm_lownmg_presets_goto_eastern
    dw cm_lownmg_presets_goto_desert
    dw cm_lownmg_presets_goto_hera
    dw cm_lownmg_presets_goto_atower
    dw cm_lownmg_presets_goto_pod
    dw cm_lownmg_presets_goto_thieves
    dw cm_lownmg_presets_goto_skull
    dw cm_lownmg_presets_goto_mire
    dw cm_lownmg_presets_goto_swamp
    dw cm_lownmg_presets_goto_ice
    dw cm_lownmg_presets_goto_trock
    dw cm_lownmg_presets_goto_gtower
    dw cm_lownmg_presets_goto_ganon
    dw cm_lownmg_presets_goto_boss
    dw #$0000
    %cm_header("LOW PRESETS")

; HYRULE CASTLE

cm_lownmg_presets_goto_escape:
    %cm_submenu("Hyrule Castle", cm_lownmg_presets_escape)

cm_lownmg_presets_escape:
    dw cm_lownmg_esc_bed
    dw cm_lownmg_esc_courtyard
    dw cm_lownmg_esc_entrance
    dw cm_lownmg_esc_1st_keyguard
    dw cm_lownmg_esc_stealth_room
    dw cm_lownmg_esc_2nd_keyguard
    dw cm_lownmg_esc_ball_n_chains
    dw cm_lownmg_esc_backtracking
    dw cm_lownmg_esc_keyguard_revisited
    dw cm_lownmg_esc_throne_room
    dw cm_lownmg_esc_snake_avoidance_room
    dw cm_lownmg_esc_water_rooms
    dw cm_lownmg_esc_keyrat
    dw cm_lownmg_esc_last_two_screens
    dw #$0000
    %cm_header("HYRULE CASTLE")

cm_lownmg_esc_bed:
    %cm_preset("Link's Bed", preset_lownmg_esc_bed)

cm_lownmg_esc_courtyard:
    %cm_preset("Courtyard", preset_lownmg_esc_courtyard)

cm_lownmg_esc_entrance:
    %cm_preset("Entrance", preset_lownmg_esc_entrance)

cm_lownmg_esc_1st_keyguard:
    %cm_preset("1st Key Guard", preset_lownmg_esc_1st_keyguard)

cm_lownmg_esc_stealth_room:
    %cm_preset("Stealth Room", preset_lownmg_esc_stealth_room)

cm_lownmg_esc_2nd_keyguard:
    %cm_preset("2nd Key Guard", preset_lownmg_esc_2nd_keyguard)

cm_lownmg_esc_ball_n_chains:
    %cm_preset("Ball'n Chains", preset_lownmg_esc_ball_n_chains)

cm_lownmg_esc_backtracking:
    %cm_preset("Backtracking", preset_lownmg_esc_backtracking)

cm_lownmg_esc_keyguard_revisited:
    %cm_preset("Key Guard Revisited", preset_lownmg_esc_keyguard_revisited)

cm_lownmg_esc_throne_room:
    %cm_preset("Throne Room", preset_lownmg_esc_throne_room)

cm_lownmg_esc_snake_avoidance_room:
    %cm_preset("Snake Avoidance Room", preset_lownmg_esc_snake_avoidance_room)

cm_lownmg_esc_water_rooms:
    %cm_preset("Sewer Rooms", preset_lownmg_esc_water_rooms)

cm_lownmg_esc_keyrat:
    %cm_preset("Key Rat", preset_lownmg_esc_keyrat)

cm_lownmg_esc_last_two_screens:
    %cm_preset("Last Two Screens", preset_lownmg_esc_last_two_screens)

; EASTERN

cm_lownmg_presets_goto_eastern:
    %cm_submenu("Eastern Palace", cm_lownmg_presets_eastern)

cm_lownmg_presets_eastern:
    dw cm_lownmg_east_before_cutscene
    dw cm_lownmg_east_after_cutscene
    dw cm_lownmg_east_octoroc
    dw cm_lownmg_east_outside_palace
    dw cm_lownmg_east_entrance
    dw cm_lownmg_east_stalfos_room
    dw cm_lownmg_east_big_chest_room_1
    dw cm_lownmg_east_dark_key_room
    dw cm_lownmg_east_big_key_dmg_boost
    dw cm_lownmg_east_big_chest_room_2
    dw cm_lownmg_east_gwg
    dw cm_lownmg_east_pot_room
    dw cm_lownmg_east_zeldagamer_room
    dw cm_lownmg_east_armos
    dw #$0000
    %cm_header("EASTERN PALACE")

cm_lownmg_east_before_cutscene:
    %cm_preset("Before Cutscene", preset_lownmg_east_before_cutscene)

cm_lownmg_east_after_cutscene:
    %cm_preset("After Cutscene", preset_lownmg_east_after_cutscene)

cm_lownmg_east_octoroc:
    %cm_preset("Octoroc OW", preset_lownmg_east_octoroc)

cm_lownmg_east_outside_palace:
    %cm_preset("EP Overworld", preset_lownmg_east_outside_palace)

cm_lownmg_east_entrance:
    %cm_preset("Entrance", preset_lownmg_east_entrance)

cm_lownmg_east_stalfos_room:
    %cm_preset("Stalfos Room", preset_lownmg_east_stalfos_room)

cm_lownmg_east_big_chest_room_1:
    %cm_preset("Big Chest Room 1", preset_lownmg_east_big_chest_room_1)

cm_lownmg_east_dark_key_room:
    %cm_preset("Dark Key Room", preset_lownmg_east_dark_key_room)

cm_lownmg_east_big_key_dmg_boost:
    %cm_preset("Big Key DMG Boost", preset_lownmg_east_big_key_dmg_boost)

cm_lownmg_east_big_chest_room_2:
    %cm_preset("Big Chest Room 2", preset_lownmg_east_big_chest_room_2)

cm_lownmg_east_gwg:
    %cm_preset("Gifted With Greenies", preset_lownmg_east_gwg)

cm_lownmg_east_pot_room:
    %cm_preset("Pot Room", preset_lownmg_east_pot_room)

cm_lownmg_east_zeldagamer_room:
    %cm_preset("Zeldagamer Room", preset_lownmg_east_zeldagamer_room)

cm_lownmg_east_armos:
    %cm_preset("Armos", preset_lownmg_east_armos)

; DESERT

cm_lownmg_presets_goto_desert:
    %cm_submenu("Desert Palace", cm_lownmg_presets_desert)

cm_lownmg_presets_desert:
    dw cm_lownmg_desert_outside_eastern_palace
    dw cm_lownmg_desert_ep_spinspeed
    dw cm_lownmg_desert_bridge_screen
    dw cm_lownmg_desert_unholy_spinspeed
    dw cm_lownmg_desert_water_dash
    dw cm_lownmg_desert_outside_desert_palace
    dw cm_lownmg_desert_desert_entrance
    dw cm_lownmg_desert_keybonk
    dw cm_lownmg_desert_pre_cannonball_room
    dw cm_lownmg_desert_pot_room
    dw cm_lownmg_desert_desert2_spinspeed
    dw cm_lownmg_desert_popo_genocide_room
    dw cm_lownmg_desert_torches
    dw cm_lownmg_desert_lanmolas
    dw #$0000
    %cm_header("DESERT PALACE")

cm_lownmg_desert_outside_eastern_palace:
    %cm_preset("Outside Eastern Palace", preset_lownmg_desert_outside_eastern_palace)

cm_lownmg_desert_ep_spinspeed:
    %cm_preset("Eastern Palace Spinspeed", preset_lownmg_desert_ep_spinspeed)

cm_lownmg_desert_bridge_screen:
    %cm_preset("Bridge Screen", preset_lownmg_desert_bridge_screen)

cm_lownmg_desert_unholy_spinspeed:
    %cm_preset("Unholy Spinspeed", preset_lownmg_desert_unholy_spinspeed)

cm_lownmg_desert_water_dash:
    %cm_preset("Water Dash", preset_lownmg_desert_water_dash)

cm_lownmg_desert_outside_desert_palace:
    %cm_preset("Outside Desert Palace", preset_lownmg_desert_outside_desert_palace)

cm_lownmg_desert_desert_entrance:
    %cm_preset("Entrance", preset_lownmg_desert_desert_entrance)

cm_lownmg_desert_keybonk:
    %cm_preset("Key Bonk", preset_lownmg_desert_keybonk)

cm_lownmg_desert_pre_cannonball_room:
    %cm_preset("Pre Cannonball Room", preset_lownmg_desert_pre_cannonball_room)

cm_lownmg_desert_pot_room:
    %cm_preset("Pot Room", preset_lownmg_desert_pot_room)

cm_lownmg_desert_desert2_spinspeed:
    %cm_preset("Desert 2 Spinspeed", preset_lownmg_desert_desert2_spinspeed)

cm_lownmg_desert_popo_genocide_room:
    %cm_preset("Popo Genocide", preset_lownmg_desert_popo_genocide_room)

cm_lownmg_desert_torches:
    %cm_preset("Torches", preset_lownmg_desert_torches)

cm_lownmg_desert_lanmolas:
    %cm_preset("Lanmolas", preset_lownmg_desert_lanmolas)

; HERA

cm_lownmg_presets_goto_hera:
    %cm_submenu("Tower of Hera", cm_lownmg_presets_hera)

cm_lownmg_presets_hera:
    dw cm_lownmg_hera_outside_desert_palace
    dw cm_lownmg_hera_lake_hylia
    dw cm_lownmg_hera_icerod_overworld
    dw cm_lownmg_hera_waterwalk
    dw cm_lownmg_hera_dm
    dw cm_lownmg_hera_after_mirror
    dw cm_lownmg_hera_quickhop
    dw cm_lownmg_hera_entrance
    dw cm_lownmg_hera_tile_room
    dw cm_lownmg_hera_minimoldorm_switch
    dw cm_lownmg_hera_torches
    dw cm_lownmg_hera_beetles
    dw cm_lownmg_hera_petting_zoo
    dw cm_lownmg_hera_moldorm
    dw #$0000
    %cm_header("TOWER OF HERA")

cm_lownmg_hera_outside_desert_palace:
    %cm_preset("Outside Desert Palace", preset_lownmg_hera_outside_desert_palace)

cm_lownmg_hera_lake_hylia:
    %cm_preset("Lake Hylia", preset_lownmg_hera_lake_hylia)

cm_lownmg_hera_icerod_overworld:
    %cm_preset("Ice Rod Overworld", preset_lownmg_hera_icerod_overworld)

cm_lownmg_hera_waterwalk:
    %cm_preset("Waterwalk", preset_lownmg_hera_waterwalk)

cm_lownmg_hera_dm:
    %cm_preset("Death Mountain", preset_lownmg_hera_dm)

cm_lownmg_hera_after_mirror:
    %cm_preset("After Mirror", preset_lownmg_hera_after_mirror)

cm_lownmg_hera_quickhop:
    %cm_preset("Quickhop", preset_lownmg_hera_quickhop)

cm_lownmg_hera_entrance:
    %cm_preset("Entrance", preset_lownmg_hera_entrance)

cm_lownmg_hera_tile_room:
    %cm_preset("Tile room", preset_lownmg_hera_tile_room)

cm_lownmg_hera_minimoldorm_switch:
    %cm_preset("Mini Moldorm Switch", preset_lownmg_hera_minimoldorm_switch)

cm_lownmg_hera_torches:
    %cm_preset("Torches", preset_lownmg_hera_torches)

cm_lownmg_hera_beetles:
    %cm_preset("Beetles", preset_lownmg_hera_beetles)

cm_lownmg_hera_petting_zoo:
    %cm_preset("Petting Zoo", preset_lownmg_hera_petting_zoo)

cm_lownmg_hera_moldorm:
    %cm_preset("Moldorm", preset_lownmg_hera_moldorm)

; AGAHNIMS TOWER

cm_lownmg_presets_goto_atower:
    %cm_submenu("Agahnim's Tower", cm_lownmg_presets_atower)

cm_lownmg_presets_atower:
    dw cm_lownmg_aga_outside_hera
    dw cm_lownmg_aga_first_rupee_tree
    dw cm_lownmg_aga_lost_woods
    dw cm_lownmg_aga_after_grove
    dw cm_lownmg_aga_after_lost_woods
    dw cm_lownmg_aga_castle_screen
    dw cm_lownmg_aga_entrance
    dw cm_lownmg_aga_fairy_skip
    dw cm_lownmg_aga_dark_room_of_despair
    dw cm_lownmg_aga_dark_room_of_melancholy
    dw cm_lownmg_aga_spear_guards
    dw cm_lownmg_aga_circle_of_pots
    dw cm_lownmg_aga_catwalk
    dw cm_lownmg_aga_agahnim
    dw #$0000
    %cm_header("AGAHNIMS TOWER")

cm_lownmg_aga_outside_hera:
    %cm_preset("Outside Hera", preset_lownmg_aga_outside_hera)

cm_lownmg_aga_first_rupee_tree:
    %cm_preset("First Rupee Tree", preset_lownmg_aga_first_rupee_tree)

cm_lownmg_aga_lost_woods:
    %cm_preset("Lost Woods", preset_lownmg_aga_lost_woods)

cm_lownmg_aga_after_grove:
    %cm_preset("After Grove", preset_lownmg_aga_after_grove)

cm_lownmg_aga_after_lost_woods:
    %cm_preset("After Lost Woods", preset_lownmg_aga_after_lost_woods)

cm_lownmg_aga_castle_screen:
    %cm_preset("Castle Screen", preset_lownmg_aga_castle_screen)

cm_lownmg_aga_entrance:
    %cm_preset("Entrance", preset_lownmg_aga_entrance)

cm_lownmg_aga_fairy_skip:
    %cm_preset("Fairy Skip", preset_lownmg_aga_fairy_skip)

cm_lownmg_aga_dark_room_of_despair:
    %cm_preset("Dark Room of Despair", preset_lownmg_aga_dark_room_of_despair)

cm_lownmg_aga_dark_room_of_melancholy:
    %cm_preset("Dark Room of Melancholy", preset_lownmg_aga_dark_room_of_melancholy)

cm_lownmg_aga_spear_guards:
    %cm_preset("Spear Guards", preset_lownmg_aga_spear_guards)

cm_lownmg_aga_circle_of_pots:
    %cm_preset("Circle of Pots", preset_lownmg_aga_circle_of_pots)

cm_lownmg_aga_catwalk:
    %cm_preset("Catwalk", preset_lownmg_aga_catwalk)

cm_lownmg_aga_agahnim:
    %cm_preset("Agahnim", preset_lownmg_aga_agahnim)

; PALACE OF DARKNESS

cm_lownmg_presets_goto_pod:
    %cm_submenu("Palace of Darkness", cm_lownmg_presets_pod)

cm_lownmg_presets_pod:
    dw cm_lownmg_pod_pyramid
    dw cm_lownmg_pod_pod_overworld
    dw cm_lownmg_pod_entrance
    dw cm_lownmg_pod_main_hub_small_key
    dw cm_lownmg_pod_main_hub_bk
    dw cm_lownmg_pod_main_hub_hammeryump
    dw cm_lownmg_pod_hammeryump
    dw cm_lownmg_pod_before_sexy_statue
    dw cm_lownmg_pod_sexy_statue_room
    dw cm_lownmg_pod_mimics
    dw cm_lownmg_pod_statue
    dw cm_lownmg_pod_basement
    dw cm_lownmg_pod_turtle_room
    dw cm_lownmg_pod_helma
    dw #$0000
    %cm_header("PALACE OF DARKNESS")

cm_lownmg_pod_pyramid:
    %cm_preset("Pyramid", preset_lownmg_pod_pyramid)

cm_lownmg_pod_pod_overworld:
    %cm_preset("Palace Overworld Screen", preset_lownmg_pod_pod_overworld)

cm_lownmg_pod_entrance:
    %cm_preset("Entrance", preset_lownmg_pod_entrance)

cm_lownmg_pod_main_hub_small_key:
    %cm_preset("Main Hub (small key)", preset_lownmg_pod_main_hub_small_key)

cm_lownmg_pod_main_hub_bk:
    %cm_preset("Main Hub (bk)", preset_lownmg_pod_main_hub_bk)

cm_lownmg_pod_main_hub_hammeryump:
    %cm_preset("Main Hub (hammerjump)", preset_lownmg_pod_main_hub_hammeryump)

cm_lownmg_pod_hammeryump:
    %cm_preset("Hammerjump", preset_lownmg_pod_hammeryump)

cm_lownmg_pod_before_sexy_statue:
    %cm_preset("Archery Contest", preset_lownmg_pod_before_sexy_statue)

cm_lownmg_pod_sexy_statue_room:
    %cm_preset("Sexy Statue Room", preset_lownmg_pod_sexy_statue_room)

cm_lownmg_pod_mimics:
    %cm_preset("Mimics", preset_lownmg_pod_mimics)

cm_lownmg_pod_statue:
    %cm_preset("Statue", preset_lownmg_pod_statue)

cm_lownmg_pod_basement:
    %cm_preset("Basement", preset_lownmg_pod_basement)

cm_lownmg_pod_turtle_room:
    %cm_preset("Turtle Room", preset_lownmg_pod_turtle_room)

cm_lownmg_pod_helma:
    %cm_preset("Helma", preset_lownmg_pod_helma)

; THIEVES TOWN

cm_lownmg_presets_goto_thieves:
    %cm_submenu("Thieves' Town", cm_lownmg_presets_thieves)

cm_lownmg_presets_thieves:
    dw cm_lownmg_thieves_outside_pod
    dw cm_lownmg_thieves_ow_hammerdash
    dw cm_lownmg_thieves_grove
    dw cm_lownmg_thieves_usain_bolt
    dw cm_lownmg_thieves_after_activating_flute
    dw cm_lownmg_thieves_darkworld
    dw cm_lownmg_thieves_entrance
    dw cm_lownmg_thieves_after_big_key
    dw cm_lownmg_thieves_blind_hallway
    dw cm_lownmg_thieves_conveyor_gibos
    dw cm_lownmg_thieves_hellway
    dw cm_lownmg_thieves_bombable_floor
    dw cm_lownmg_thieves_backtracking_1
    dw cm_lownmg_thieves_basement
    dw cm_lownmg_thieves_prison
    dw cm_lownmg_thieves_after_gloves
    dw cm_lownmg_thieves_backtracking_2
    dw cm_lownmg_thieves_pot_hammerdash
    dw cm_lownmg_thieves_blind
    dw #$0000
    %cm_header("THIEVES TOWN")

cm_lownmg_thieves_outside_pod:
    %cm_preset("Outside PoD", preset_lownmg_thieves_outside_pod)

cm_lownmg_thieves_ow_hammerdash:
    %cm_preset("Overworld Hammerdash", preset_lownmg_thieves_ow_hammerdash)

cm_lownmg_thieves_grove:
    %cm_preset("Grove", preset_lownmg_thieves_grove)

cm_lownmg_thieves_usain_bolt:
    %cm_preset("Usain Bolt", preset_lownmg_thieves_usain_bolt)

cm_lownmg_thieves_after_activating_flute:
    %cm_preset("After Activating Flute", preset_lownmg_thieves_after_activating_flute)

cm_lownmg_thieves_darkworld:
    %cm_preset("After Warp", preset_lownmg_thieves_darkworld)

cm_lownmg_thieves_entrance:
    %cm_preset("Entrance", preset_lownmg_thieves_entrance)

cm_lownmg_thieves_after_big_key:
    %cm_preset("After Big Key", preset_lownmg_thieves_after_big_key)

cm_lownmg_thieves_blind_hallway:
    %cm_preset("Stalfos Hallway", preset_lownmg_thieves_blind_hallway)

cm_lownmg_thieves_conveyor_gibos:
    %cm_preset("Conveyor Gibos", preset_lownmg_thieves_conveyor_gibos)

cm_lownmg_thieves_hellway:
    %cm_preset("Hellway", preset_lownmg_thieves_hellway)

cm_lownmg_thieves_bombable_floor:
    %cm_preset("Bombable Floor", preset_lownmg_thieves_bombable_floor)

cm_lownmg_thieves_backtracking_1:
    %cm_preset("Backtracking", preset_lownmg_thieves_backtracking_1)

cm_lownmg_thieves_basement:
    %cm_preset("Basement", preset_lownmg_thieves_basement)

cm_lownmg_thieves_prison:
    %cm_preset("Prison", preset_lownmg_thieves_prison)

cm_lownmg_thieves_after_gloves:
    %cm_preset("Gloves", preset_lownmg_thieves_after_gloves)

cm_lownmg_thieves_backtracking_2:
    %cm_preset("Backtracking", preset_lownmg_thieves_backtracking_2)

cm_lownmg_thieves_pot_hammerdash:
    %cm_preset("Pot Hammerdash", preset_lownmg_thieves_pot_hammerdash)

cm_lownmg_thieves_blind:
    %cm_preset("Blind", preset_lownmg_thieves_blind)

; SKULL WOODS

cm_lownmg_presets_goto_skull:
    %cm_submenu("Skull Woods", cm_lownmg_presets_skull)

cm_lownmg_presets_skull:
    dw cm_lownmg_sw_outside_thieves
    dw cm_lownmg_sw_dash_to_sw
    dw cm_lownmg_sw_mummy_room
    dw cm_lownmg_sw_bomb_jump
    dw cm_lownmg_sw_key_pot
    dw cm_lownmg_sw_skull_entrance
    dw cm_lownmg_sw_mummy_hellway
    dw cm_lownmg_sw_mummy_key
    dw cm_lownmg_sw_mothula
    dw #$0000
    %cm_header("SKULL WOODS")

cm_lownmg_sw_outside_thieves:
    %cm_preset("Outside Thieves", preset_lownmg_sw_outside_thieves)

cm_lownmg_sw_dash_to_sw:
    %cm_preset("Dash to Skull Woods", preset_lownmg_sw_dash_to_sw)

cm_lownmg_sw_mummy_room:
    %cm_preset("Mummy Room", preset_lownmg_sw_mummy_room)

cm_lownmg_sw_bomb_jump:
    %cm_preset("Bomb Jump", preset_lownmg_sw_bomb_jump)

cm_lownmg_sw_key_pot:
    %cm_preset("Key Pot", preset_lownmg_sw_key_pot)

cm_lownmg_sw_skull_entrance:
    %cm_preset("Skull Entrance", preset_lownmg_sw_skull_entrance)

cm_lownmg_sw_mummy_hellway:
    %cm_preset("Mummy Hellway", preset_lownmg_sw_mummy_hellway)

cm_lownmg_sw_mummy_key:
    %cm_preset("Mummy Key", preset_lownmg_sw_mummy_key)

cm_lownmg_sw_mothula:
    %cm_preset("Mothula", preset_lownmg_sw_mothula)

; MISERY MIRE

cm_lownmg_presets_goto_mire:
    %cm_submenu("Misery Mire", cm_lownmg_presets_mire)

cm_lownmg_presets_mire:
    dw cm_lownmg_mire_outside_skull
    dw cm_lownmg_mire_dm
    dw cm_lownmg_mire_bridge_warp
    dw cm_lownmg_mire_lottery
    dw cm_lownmg_mire_medallion
    dw cm_lownmg_mire_zoras_domain
    dw cm_lownmg_mire_darkworld_warp
    dw cm_lownmg_mire_entrance
    dw cm_lownmg_mire_mire2
    dw cm_lownmg_mire_main_hub
    dw cm_lownmg_mire_beat_the_fireball
    dw cm_lownmg_mire_bari_key
    dw cm_lownmg_mire_sluggulas
    dw cm_lownmg_mire_torches
    dw cm_lownmg_mire_spark_avoidance
    dw cm_lownmg_mire_big_chest_room
    dw cm_lownmg_mire_wizzrobe
    dw cm_lownmg_mire_basement
    dw cm_lownmg_mire_spooky_action_1
    dw cm_lownmg_mire_spooky_action_2
    dw cm_lownmg_mire_vitty
    dw #$0000
    %cm_header("MISERY MIRE")

cm_lownmg_mire_outside_skull:
    %cm_preset("Outside Skull", preset_lownmg_mire_outside_skull)

cm_lownmg_mire_dm:
    %cm_preset("Death Mountain", preset_lownmg_mire_dm)

cm_lownmg_mire_bridge_warp:
    %cm_preset("Bridge Warp", preset_lownmg_mire_bridge_warp)

cm_lownmg_mire_lottery:
    %cm_preset("Lottery", preset_lownmg_mire_lottery)

cm_lownmg_mire_medallion:
    %cm_preset("Medallion", preset_lownmg_mire_medallion)

cm_lownmg_mire_zoras_domain:
    %cm_preset("Zoras Domain", preset_lownmg_mire_zoras_domain)

cm_lownmg_mire_darkworld_warp:
    %cm_preset("Mire Overworld Screen", preset_lownmg_mire_darkworld_warp)

cm_lownmg_mire_entrance:
    %cm_preset("Mire Entrance", preset_lownmg_mire_entrance)

cm_lownmg_mire_mire2:
    %cm_preset("Mire 2", preset_lownmg_mire_mire2)

cm_lownmg_mire_main_hub:
    %cm_preset("Main Hub", preset_lownmg_mire_main_hub)

cm_lownmg_mire_beat_the_fireball:
    %cm_preset("Beat the Fireball", preset_lownmg_mire_beat_the_fireball)

cm_lownmg_mire_bari_key:
    %cm_preset("Bari Key", preset_lownmg_mire_bari_key)

cm_lownmg_mire_sluggulas:
    %cm_preset("Sluggulas", preset_lownmg_mire_sluggulas)

cm_lownmg_mire_torches:
    %cm_preset("Torches", preset_lownmg_mire_torches)

cm_lownmg_mire_spark_avoidance:
    %cm_preset("Spark Avoidance", preset_lownmg_mire_spark_avoidance)

cm_lownmg_mire_big_chest_room:
    %cm_preset("Big Chest Room", preset_lownmg_mire_big_chest_room)

cm_lownmg_mire_wizzrobe:
    %cm_preset("Wizzrobe", preset_lownmg_mire_wizzrobe)

cm_lownmg_mire_basement:
    %cm_preset("Basement", preset_lownmg_mire_basement)

cm_lownmg_mire_spooky_action_1:
    %cm_preset("Spooky Action 1", preset_lownmg_mire_spooky_action_1)

cm_lownmg_mire_spooky_action_2:
    %cm_preset("Spooky Action 2", preset_lownmg_mire_spooky_action_2)

cm_lownmg_mire_vitty:
    %cm_preset("Vitreous", preset_lownmg_mire_vitty)

; SWAMP PALACE

cm_lownmg_presets_goto_swamp:
    %cm_submenu("Swamp Palace", cm_lownmg_presets_swamp)

cm_lownmg_presets_swamp:
    dw cm_lownmg_swamp_outside_mire
    dw cm_lownmg_swamp_links_house
    dw cm_lownmg_swamp_swamp_overworld
    dw cm_lownmg_swamp_antifairy_room
    dw cm_lownmg_swamp_entrance
    dw cm_lownmg_swamp_first_key_pot
    dw cm_lownmg_swamp_hallway_key_1
    dw cm_lownmg_swamp_water_lever_1
    dw cm_lownmg_swamp_main_hub
    dw cm_lownmg_swamp_water_lever_2
    dw cm_lownmg_swamp_sociable_firebar
    dw cm_lownmg_swamp_backtracking
    dw cm_lownmg_swamp_hook_shot
    dw cm_lownmg_swamp_hookdash
    dw cm_lownmg_swamp_water_lever_3
    dw cm_lownmg_swamp_restock
    dw cm_lownmg_swamp_phelps_way
    dw cm_lownmg_swamp_arrghus
    dw #$0000
    %cm_header("SWAMP PALACE")

cm_lownmg_swamp_outside_mire:
    %cm_preset("Outside Mire", preset_lownmg_swamp_outside_mire)

cm_lownmg_swamp_links_house:
    %cm_preset("Link's House", preset_lownmg_swamp_links_house)

cm_lownmg_swamp_swamp_overworld:
    %cm_preset("Swamp Overworld", preset_lownmg_swamp_swamp_overworld)

cm_lownmg_swamp_antifairy_room:
    %cm_preset("Antifairy Room", preset_lownmg_swamp_antifairy_room)

cm_lownmg_swamp_entrance:
    %cm_preset("Entrance", preset_lownmg_swamp_entrance)

cm_lownmg_swamp_first_key_pot:
    %cm_preset("First Key Pot", preset_lownmg_swamp_first_key_pot)

cm_lownmg_swamp_hallway_key_1:
    %cm_preset("Tiny Hallway Key", preset_lownmg_swamp_hallway_key_1)

cm_lownmg_swamp_water_lever_1:
    %cm_preset("Water Lever 1", preset_lownmg_swamp_water_lever_1)

cm_lownmg_swamp_main_hub:
    %cm_preset("Main Hub", preset_lownmg_swamp_main_hub)

cm_lownmg_swamp_water_lever_2:
    %cm_preset("Water Lever 2", preset_lownmg_swamp_water_lever_2)

cm_lownmg_swamp_sociable_firebar:
    %cm_preset("Sociable Firebar", preset_lownmg_swamp_sociable_firebar)

cm_lownmg_swamp_backtracking:
    %cm_preset("Backtracking", preset_lownmg_swamp_backtracking)

cm_lownmg_swamp_hook_shot:
    %cm_preset("Hookshot", preset_lownmg_swamp_hook_shot)

cm_lownmg_swamp_hookdash:
    %cm_preset("Hookdash", preset_lownmg_swamp_hookdash)

cm_lownmg_swamp_water_lever_3:
    %cm_preset("Water Lever 3", preset_lownmg_swamp_water_lever_3)

cm_lownmg_swamp_restock:
    %cm_preset("Restock Room", preset_lownmg_swamp_restock)

cm_lownmg_swamp_phelps_way:
    %cm_preset("Phelps Way", preset_lownmg_swamp_phelps_way)

cm_lownmg_swamp_arrghus:
    %cm_preset("Arrghus", preset_lownmg_swamp_arrghus)

; ICE PALACE

cm_lownmg_presets_goto_ice:
    %cm_submenu("Ice Palace", cm_lownmg_presets_ice)

cm_lownmg_presets_ice:
    dw cm_lownmg_ice_outside_swamp
    dw cm_lownmg_ice_swim_pumping
    dw cm_lownmg_ice_ice_entrance
    dw cm_lownmg_ice_ice2
    dw cm_lownmg_ice_penguin_switch_room
    dw cm_lownmg_ice_bombable_floor
    dw cm_lownmg_ice_conveyor_room
    dw cm_lownmg_ice_ipbj
    dw cm_lownmg_ice_penguin_room
    dw cm_lownmg_ice_lonely_firebar
    dw cm_lownmg_ice_last_two_screens
    dw cm_lownmg_ice_kholdstare
    dw #$0000
    %cm_header("ICE PALACE")

cm_lownmg_ice_outside_swamp:
    %cm_preset("Outside Swamp", preset_lownmg_ice_outside_swamp)

cm_lownmg_ice_swim_pumping:
    %cm_preset("Swim Pumping", preset_lownmg_ice_swim_pumping)

cm_lownmg_ice_ice_entrance:
    %cm_preset("Entrance", preset_lownmg_ice_ice_entrance)

cm_lownmg_ice_ice2:
    %cm_preset("Ice 2", preset_lownmg_ice_ice2)

cm_lownmg_ice_penguin_switch_room:
    %cm_preset("Penguin Switch Room", preset_lownmg_ice_penguin_switch_room)

cm_lownmg_ice_bombable_floor:
    %cm_preset("Bombable Floor", preset_lownmg_ice_bombable_floor)

cm_lownmg_ice_conveyor_room:
    %cm_preset("Conveyor Room", preset_lownmg_ice_conveyor_room)

cm_lownmg_ice_ipbj:
    %cm_preset("IPBJ", preset_lownmg_ice_ipbj)

cm_lownmg_ice_penguin_room:
    %cm_preset("Penguin Lineup Room", preset_lownmg_ice_penguin_room)

cm_lownmg_ice_lonely_firebar:
    %cm_preset("Lonely Firebar", preset_lownmg_ice_lonely_firebar)

cm_lownmg_ice_last_two_screens:
    %cm_preset("Last Two Screens", preset_lownmg_ice_last_two_screens)

cm_lownmg_ice_kholdstare:
    %cm_preset("Kholdstare", preset_lownmg_ice_kholdstare)

; TURTLE ROCK

cm_lownmg_presets_goto_trock:
    %cm_submenu("Turtle Rock", cm_lownmg_presets_trock)

cm_lownmg_presets_trock:
    dw cm_lownmg_trock_outside_ice
    dw cm_lownmg_trock_dm
    dw cm_lownmg_trock_squirrels
    dw cm_lownmg_trock_peg_puzzle
    dw cm_lownmg_trock_entrance
    dw cm_lownmg_trock_torches
    dw cm_lownmg_trock_roller_room
    dw cm_lownmg_trock_pokey_0
    dw cm_lownmg_trock_chomps
    dw cm_lownmg_trock_pokey_1
    dw cm_lownmg_trock_pokeys_2
    dw cm_lownmg_trock_crystal_roller
    dw cm_lownmg_trock_dark_room
    dw cm_lownmg_trock_laser_skip
    dw cm_lownmg_trock_switch_room
    dw cm_lownmg_trock_trinexx
    dw #$0000
    %cm_header("TURTLE ROCK")

cm_lownmg_trock_outside_ice:
    %cm_preset("Outside Ice", preset_lownmg_trock_outside_ice)

cm_lownmg_trock_dm:
    %cm_preset("Death Mountain", preset_lownmg_trock_dm)

cm_lownmg_trock_squirrels:
    %cm_preset("Squirrels", preset_lownmg_trock_squirrels)

cm_lownmg_trock_peg_puzzle:
    %cm_preset("Peg Puzzle", preset_lownmg_trock_peg_puzzle)

cm_lownmg_trock_entrance:
    %cm_preset("Entrance", preset_lownmg_trock_entrance)

cm_lownmg_trock_torches:
    %cm_preset("Torches", preset_lownmg_trock_torches)

cm_lownmg_trock_roller_room:
    %cm_preset("Roller Room", preset_lownmg_trock_roller_room)

cm_lownmg_trock_pokey_0:
    %cm_preset("Pokey 0", preset_lownmg_trock_pokey_0)

cm_lownmg_trock_chomps:
    %cm_preset("Chomps", preset_lownmg_trock_chomps)

cm_lownmg_trock_pokey_1:
    %cm_preset("Pokey 1", preset_lownmg_trock_pokey_1)

cm_lownmg_trock_pokeys_2:
    %cm_preset("Pokeys 2", preset_lownmg_trock_pokeys_2)

cm_lownmg_trock_crystal_roller:
    %cm_preset("Crystal Roller", preset_lownmg_trock_crystal_roller)

cm_lownmg_trock_dark_room:
    %cm_preset("Dark Room", preset_lownmg_trock_dark_room)

cm_lownmg_trock_laser_skip:
    %cm_preset("Laser Skip", preset_lownmg_trock_laser_skip)

cm_lownmg_trock_switch_room:
    %cm_preset("Switch Room", preset_lownmg_trock_switch_room)

cm_lownmg_trock_trinexx:
    %cm_preset("Trinexx", preset_lownmg_trock_trinexx)

; GANONS TOWER

cm_lownmg_presets_goto_gtower:
    %cm_submenu("Ganon's Tower", cm_lownmg_presets_gtower)

cm_lownmg_presets_gtower:
    dw cm_lownmg_gtower_outside_trock
    dw cm_lownmg_gtower_entrance
    dw cm_lownmg_gtower_spike_skip
    dw cm_lownmg_gtower_pre_firesnakes_room
    dw cm_lownmg_gtower_bombable_floor
    dw cm_lownmg_gtower_ice_armos
    dw cm_lownmg_gtower_floor_2
    dw cm_lownmg_gtower_mimics1
    dw cm_lownmg_gtower_mimics2
    dw cm_lownmg_gtower_spike_room
    dw cm_lownmg_gtower_gauntlet
    dw cm_lownmg_gtower_gauntlet_3
    dw cm_lownmg_gtower_lanmola2
    dw cm_lownmg_gtower_wizz1
    dw cm_lownmg_gtower_wizz2
    dw cm_lownmg_gtower_torches1
    dw cm_lownmg_gtower_torches2
    dw cm_lownmg_gtower_helma_key
    dw cm_lownmg_gtower_bombable_wall
    dw cm_lownmg_gtower_moldorm_2
    dw cm_lownmg_gtower_agahnim_2
    dw #$0000
    %cm_header("GANONS TOWER")

cm_lownmg_gtower_outside_trock:
    %cm_preset("Outside Turtle Rock", preset_lownmg_gtower_outside_trock)

cm_lownmg_gtower_entrance:
    %cm_preset("Entrance", preset_lownmg_gtower_entrance)

cm_lownmg_gtower_spike_skip:
    %cm_preset("Spike Skip", preset_lownmg_gtower_spike_skip)

cm_lownmg_gtower_pre_firesnakes_room:
    %cm_preset("Pre Firesnakes Room", preset_lownmg_gtower_pre_firesnakes_room)

cm_lownmg_gtower_bombable_floor:
    %cm_preset("Bombable Floor", preset_lownmg_gtower_bombable_floor)

cm_lownmg_gtower_ice_armos:
    %cm_preset("Ice Armos", preset_lownmg_gtower_ice_armos)

cm_lownmg_gtower_floor_2:
    %cm_preset("Floor 2", preset_lownmg_gtower_floor_2)

cm_lownmg_gtower_mimics1:
    %cm_preset("Mimics 1", preset_lownmg_gtower_mimics1)

cm_lownmg_gtower_mimics2:
    %cm_preset("Mimics 2", preset_lownmg_gtower_mimics2)

cm_lownmg_gtower_spike_room:
    %cm_preset("Spike Pit", preset_lownmg_gtower_spike_room)

cm_lownmg_gtower_gauntlet:
    %cm_preset("Gauntlet 1", preset_lownmg_gtower_gauntlet)

cm_lownmg_gtower_gauntlet_3:
    %cm_preset("Gauntlet 3", preset_lownmg_gtower_gauntlet_3)

cm_lownmg_gtower_lanmola2:
    %cm_preset("Lanmola 2", preset_lownmg_gtower_lanmola2)

cm_lownmg_gtower_wizz1:
    %cm_preset("Wizzrobes 1", preset_lownmg_gtower_wizz1)

cm_lownmg_gtower_wizz2:
    %cm_preset("Wizzrobes 2", preset_lownmg_gtower_wizz2)

cm_lownmg_gtower_torches1:
    %cm_preset("Torches 1", preset_lownmg_gtower_torches1)

cm_lownmg_gtower_torches2:
    %cm_preset("Torches 2", preset_lownmg_gtower_torches2)

cm_lownmg_gtower_helma_key:
    %cm_preset("Helma Key", preset_lownmg_gtower_helma_key)

cm_lownmg_gtower_bombable_wall:
    %cm_preset("Bombable Wall", preset_lownmg_gtower_bombable_wall)

cm_lownmg_gtower_moldorm_2:
    %cm_preset("Moldorm 2", preset_lownmg_gtower_moldorm_2)

cm_lownmg_gtower_agahnim_2:
    %cm_preset("Agahnim 2", preset_lownmg_gtower_agahnim_2)

; GANON

cm_lownmg_presets_goto_ganon:
    %cm_submenu("Ganon", cm_lownmg_presets_ganon)

cm_lownmg_presets_ganon:
    dw cm_lownmg_ganon_pyramid
    dw #$0000
    %cm_header("GANON")

cm_lownmg_ganon_pyramid:
    %cm_preset("Pyramid", preset_lownmg_ganon_pyramid)

; BOSSES

cm_lownmg_presets_goto_boss:
    %cm_submenu("Bosses", cm_lownmg_presets_boss)

cm_lownmg_presets_boss:
    dw cm_lownmg_east_armos
    dw cm_lownmg_desert_lanmolas
    dw cm_lownmg_hera_moldorm
    dw cm_lownmg_aga_agahnim
    dw cm_lownmg_pod_helma
    dw cm_lownmg_thieves_blind
    dw cm_lownmg_sw_mothula
    dw cm_lownmg_mire_vitty
    dw cm_lownmg_swamp_arrghus
    dw cm_lownmg_ice_kholdstare
    dw cm_lownmg_trock_trinexx
    dw cm_lownmg_gtower_agahnim_2
    dw cm_lownmg_ganon_pyramid
    dw #$0000
    %cm_header("BOSSES")
