cm_adold_submenu_presets:
	dw cm_adold_presets_goto_escape
	dw cm_adold_presets_goto_eastern
	dw cm_adold_presets_goto_pod
	dw cm_adold_presets_goto_hera
	dw cm_adold_presets_goto_thieves
	dw cm_adold_presets_goto_skull
	dw cm_adold_presets_goto_desert
	dw cm_adold_presets_goto_mire
	dw cm_adold_presets_goto_swamp
	dw cm_adold_presets_goto_ice
	dw cm_adold_presets_goto_trock
	dw cm_adold_presets_goto_gtower
	dw cm_adold_presets_goto_aga
	dw cm_adold_presets_goto_ganon
	dw cm_adold_presets_goto_boss
	dw $0000
	%menu_header("AD 2014 PRESETS")

; HYRULE CASTLE

cm_adold_presets_goto_escape:
	%submenu("Hyrule Castle", cm_adold_presets_escape)

cm_adold_presets_escape:
	dw cm_adold_escape_links_bed
	dw cm_adold_escape_courtyard
	dw cm_adold_escape_entrance
	dw cm_adold_escape_1st_key_guard
	dw cm_adold_escape_stealth_room
	dw cm_adold_escape_2nd_key_guard
	dw cm_adold_escape_ball_n_chains
	dw cm_adold_escape_backtracking
	dw cm_adold_escape_key_guard_revisit
	dw cm_adold_escape_throne_room
	dw cm_adold_escape_snake_avoidance
	dw cm_adold_escape_sewer_rooms
	dw cm_adold_escape_keyrat
	dw cm_adold_escape_last_two
	dw $0000
	%menu_header("HYRULE CASTLE")

cm_adold_escape_links_bed:
	%preset("Link's Bed", preset_adold_escape_links_bed)

cm_adold_escape_courtyard:
	%preset("Courtyard", preset_adold_escape_courtyard)

cm_adold_escape_entrance:
	%preset("Entrance", preset_adold_escape_entrance)

cm_adold_escape_1st_key_guard:
	%preset("1st Key Guard", preset_adold_escape_1st_key_guard)

cm_adold_escape_stealth_room:
	%preset("Stealth Room", preset_adold_escape_stealth_room)

cm_adold_escape_2nd_key_guard:
	%preset("2nd Key Guard", preset_adold_escape_2nd_key_guard)

cm_adold_escape_ball_n_chains:
	%preset("Ball 'n Chains", preset_adold_escape_ball_n_chains)

cm_adold_escape_backtracking:
	%preset("Backtracking", preset_adold_escape_backtracking)

cm_adold_escape_key_guard_revisit:
	%preset("Key Guard Revisit", preset_adold_escape_key_guard_revisit)

cm_adold_escape_throne_room:
	%preset("Throne Room", preset_adold_escape_throne_room)

cm_adold_escape_snake_avoidance:
	%preset("Snake Avoidance", preset_adold_escape_snake_avoidance)

cm_adold_escape_sewer_rooms:
	%preset("Sewer Rooms", preset_adold_escape_sewer_rooms)

cm_adold_escape_keyrat:
	%preset("Keyrat", preset_adold_escape_keyrat)

cm_adold_escape_last_two:
	%preset("Last Two", preset_adold_escape_last_two)

; EASTERN

cm_adold_presets_goto_eastern:
	%submenu("Eastern Palace", cm_adold_presets_eastern)

cm_adold_presets_eastern:
	dw cm_adold_eastern_before_cutscene
	dw cm_adold_eastern_links_house
	dw cm_adold_eastern_ep_overworld
	dw cm_adold_eastern_entrance
	dw cm_adold_eastern_stalfos_room
	dw cm_adold_eastern_big_chest_room_1
	dw cm_adold_eastern_dark_key_room
	dw cm_adold_eastern_big_key_dmg_boost
	dw cm_adold_eastern_big_chest_room_2
	dw cm_adold_eastern_gifted_with_greenies
	dw cm_adold_eastern_pot_room
	dw cm_adold_eastern_zeldagamer_room
	dw cm_adold_eastern_armos
	dw $0000
	%menu_header("EASTERN")

cm_adold_eastern_before_cutscene:
	%preset("Before Cutscene", preset_adold_eastern_before_cutscene)

cm_adold_eastern_links_house:
	%preset("Link's House", preset_adold_eastern_links_house)

cm_adold_eastern_ep_overworld:
	%preset("EP Overworld", preset_adold_eastern_ep_overworld)

cm_adold_eastern_entrance:
	%preset("Entrance", preset_adold_eastern_entrance)

cm_adold_eastern_stalfos_room:
	%preset("Stalfos Room", preset_adold_eastern_stalfos_room)

cm_adold_eastern_big_chest_room_1:
	%preset("Big Chest Room 1", preset_adold_eastern_big_chest_room_1)

cm_adold_eastern_dark_key_room:
	%preset("Dark Key Room", preset_adold_eastern_dark_key_room)

cm_adold_eastern_big_key_dmg_boost:
	%preset("Big Key DMG Boost", preset_adold_eastern_big_key_dmg_boost)

cm_adold_eastern_big_chest_room_2:
	%preset("Big Chest Room 2", preset_adold_eastern_big_chest_room_2)

cm_adold_eastern_gifted_with_greenies:
	%preset("Gifted with Greenies", preset_adold_eastern_gifted_with_greenies)

cm_adold_eastern_pot_room:
	%preset("Pot Room", preset_adold_eastern_pot_room)

cm_adold_eastern_zeldagamer_room:
	%preset("Zeldagamer Room", preset_adold_eastern_zeldagamer_room)

cm_adold_eastern_armos:
	%preset("Armos", preset_adold_eastern_armos)

; PALACE OF DARKNESS

cm_adold_presets_goto_pod:
	%submenu("Palace of Darkness", cm_adold_presets_pod)

cm_adold_presets_pod:
	dw cm_adold_pod_outside_ep
	dw cm_adold_pod_sanctuary
	dw cm_adold_pod_dma
	dw cm_adold_pod_death_mountain
	dw cm_adold_pod_after_mirror
	dw cm_adold_pod_kiki_skip
	dw cm_adold_pod_dungeon_reload
	dw cm_adold_pod_main_hub_bk
	dw cm_adold_pod_main_hub_hammerjump
	dw cm_adold_pod_hammerjump
	dw cm_adold_pod_archery_contest
	dw cm_adold_pod_mimics
	dw cm_adold_pod_statue
	dw cm_adold_pod_basement
	dw cm_adold_pod_turtle_room
	dw cm_adold_pod_helma
	dw $0000
	%menu_header("PALACE OF DARKNESS")

cm_adold_pod_outside_ep:
	%preset("Outside EP", preset_adold_pod_outside_ep)

cm_adold_pod_sanctuary:
	%preset("Sanctuary", preset_adold_pod_sanctuary)

cm_adold_pod_dma:
	%preset("DMA", preset_adold_pod_dma)

cm_adold_pod_death_mountain:
	%preset("Death Mountain", preset_adold_pod_death_mountain)

cm_adold_pod_after_mirror:
	%preset("After Mirror", preset_adold_pod_after_mirror)

cm_adold_pod_kiki_skip:
	%preset("Kiki Skip", preset_adold_pod_kiki_skip)

cm_adold_pod_dungeon_reload:
	%preset("Dungeon Reload", preset_adold_pod_dungeon_reload)

cm_adold_pod_main_hub_bk:
	%preset("Main Hub (bk)", preset_adold_pod_main_hub_bk)

cm_adold_pod_main_hub_hammerjump:
	%preset("Main Hub (hammerjump)", preset_adold_pod_main_hub_hammerjump)

cm_adold_pod_hammerjump:
	%preset("Hammerjump", preset_adold_pod_hammerjump)

cm_adold_pod_archery_contest:
	%preset("Archery Contest", preset_adold_pod_archery_contest)

cm_adold_pod_mimics:
	%preset("Mimics", preset_adold_pod_mimics)

cm_adold_pod_statue:
	%preset("Statue", preset_adold_pod_statue)

cm_adold_pod_basement:
	%preset("Basement", preset_adold_pod_basement)

cm_adold_pod_turtle_room:
	%preset("Turtle Room", preset_adold_pod_turtle_room)

cm_adold_pod_helma:
	%preset("Helma", preset_adold_pod_helma)

; HERA TOWER

cm_adold_presets_goto_hera:
	%submenu("Hera Tower", cm_adold_presets_hera)

cm_adold_presets_hera:
	dw cm_adold_hera_outside_pod
	dw cm_adold_hera_old_man_cave
	dw cm_adold_hera_entrance
	dw cm_adold_hera_tile_room
	dw cm_adold_hera_torches
	dw cm_adold_hera_beetles
	dw cm_adold_hera_petting_zoo
	dw cm_adold_hera_moldorm
	dw $0000
	%menu_header("HERA TOWER")

cm_adold_hera_outside_pod:
	%preset("Outside PoD", preset_adold_hera_outside_pod)

cm_adold_hera_old_man_cave:
	%preset("Old Man Cave", preset_adold_hera_old_man_cave)

cm_adold_hera_entrance:
	%preset("Entrance", preset_adold_hera_entrance)

cm_adold_hera_tile_room:
	%preset("Tile Room", preset_adold_hera_tile_room)

cm_adold_hera_torches:
	%preset("Torches", preset_adold_hera_torches)

cm_adold_hera_beetles:
	%preset("Beetles", preset_adold_hera_beetles)

cm_adold_hera_petting_zoo:
	%preset("Petting Zoo", preset_adold_hera_petting_zoo)

cm_adold_hera_moldorm:
	%preset("Moldorm", preset_adold_hera_moldorm)

; THIEVES TOWN

cm_adold_presets_goto_thieves:
	%submenu("Thieves' Town", cm_adold_presets_thieves)

cm_adold_presets_thieves:
	dw cm_adold_thieves_outside_hera
	dw cm_adold_thieves_dmd
	dw cm_adold_thieves_entrance
	dw cm_adold_thieves_after_big_key
	dw cm_adold_thieves_stalfos_hallway
	dw cm_adold_thieves_conveyor_gibos
	dw cm_adold_thieves_hellway
	dw cm_adold_thieves_bomb_floor
	dw cm_adold_thieves_backtracking
	dw cm_adold_thieves_basement
	dw cm_adold_thieves_prison
	dw cm_adold_thieves_backtracking_2
	dw cm_adold_thieves_pot_hammerdash
	dw cm_adold_thieves_blind
	dw $0000
	%menu_header("THIEVES TOWN")

cm_adold_thieves_outside_hera:
	%preset("Outside Hera", preset_adold_thieves_outside_hera)

cm_adold_thieves_dmd:
	%preset("DMD", preset_adold_thieves_dmd)

cm_adold_thieves_entrance:
	%preset("Entrance", preset_adold_thieves_entrance)

cm_adold_thieves_after_big_key:
	%preset("After Big Key", preset_adold_thieves_after_big_key)

cm_adold_thieves_stalfos_hallway:
	%preset("Stalfos Hallway", preset_adold_thieves_stalfos_hallway)

cm_adold_thieves_conveyor_gibos:
	%preset("Conveyor Gibos", preset_adold_thieves_conveyor_gibos)

cm_adold_thieves_hellway:
	%preset("Hellway", preset_adold_thieves_hellway)

cm_adold_thieves_bomb_floor:
	%preset("Bomb Floor", preset_adold_thieves_bomb_floor)

cm_adold_thieves_backtracking:
	%preset("Backtracking", preset_adold_thieves_backtracking)

cm_adold_thieves_basement:
	%preset("Basement", preset_adold_thieves_basement)

cm_adold_thieves_prison:
	%preset("Prison", preset_adold_thieves_prison)

cm_adold_thieves_backtracking_2:
	%preset("Backtracking", preset_adold_thieves_backtracking_2)

cm_adold_thieves_pot_hammerdash:
	%preset("Pot Hammerdash", preset_adold_thieves_pot_hammerdash)

cm_adold_thieves_blind:
	%preset("Blind", preset_adold_thieves_blind)

; SKULL WOODS

cm_adold_presets_goto_skull:
	%submenu("Skull Woods", cm_adold_presets_skull)

cm_adold_presets_skull:
	dw cm_adold_skull_outside_thieves
	dw cm_adold_skull_cursed_dwarf
	dw cm_adold_skull_getting_tempered
	dw cm_adold_skull_fencedash
	dw cm_adold_skull_dash_to_skull_woods
	dw cm_adold_skull_mummy_room
	dw cm_adold_skull_bomb_jump
	dw cm_adold_skull_key_pot
	dw cm_adold_skull_skull_entrance
	dw cm_adold_skull_mummy_hellway
	dw cm_adold_skull_mummy_key
	dw cm_adold_skull_mothula
	dw $0000
	%menu_header("SKULL WOODS")

cm_adold_skull_outside_thieves:
	%preset("Outside Thieves", preset_adold_skull_outside_thieves)

cm_adold_skull_cursed_dwarf:
	%preset("Cursed Dwarf", preset_adold_skull_cursed_dwarf)

cm_adold_skull_getting_tempered:
	%preset("Getting Tempered", preset_adold_skull_getting_tempered)

cm_adold_skull_fencedash:
	%preset("Fencedash", preset_adold_skull_fencedash)

cm_adold_skull_dash_to_skull_woods:
	%preset("Dash to Skull Woods", preset_adold_skull_dash_to_skull_woods)

cm_adold_skull_mummy_room:
	%preset("Mummy Room", preset_adold_skull_mummy_room)

cm_adold_skull_bomb_jump:
	%preset("Bomb Jump", preset_adold_skull_bomb_jump)

cm_adold_skull_key_pot:
	%preset("Key Pot", preset_adold_skull_key_pot)

cm_adold_skull_skull_entrance:
	%preset("Skull Entrance", preset_adold_skull_skull_entrance)

cm_adold_skull_mummy_hellway:
	%preset("Mummy Hellway", preset_adold_skull_mummy_hellway)

cm_adold_skull_mummy_key:
	%preset("Mummy Key", preset_adold_skull_mummy_key)

cm_adold_skull_mothula:
	%preset("Mothula", preset_adold_skull_mothula)

; DESERT PALACE

cm_adold_presets_goto_desert:
	%submenu("Desert Palace", cm_adold_presets_desert)

cm_adold_presets_desert:
	dw cm_adold_desert_outside_skull
	dw cm_adold_desert_ether
	dw cm_adold_desert_bridge_hammerdash
	dw cm_adold_desert_zora_dmd
	dw cm_adold_desert_links_house
	dw cm_adold_desert_swamp_warp
	dw cm_adold_desert_fluteless_mire
	dw cm_adold_desert_desert_entrance
	dw cm_adold_desert_torch_key
	dw cm_adold_desert_pre_cannonballs
	dw cm_adold_desert_desert_2_spinspeed
	dw cm_adold_desert_torches
	dw cm_adold_desert_lanmolas
	dw $0000
	%menu_header("DESERT PALACE")

cm_adold_desert_outside_skull:
	%preset("Outside Skull", preset_adold_desert_outside_skull)

cm_adold_desert_ether:
	%preset("Ether", preset_adold_desert_ether)

cm_adold_desert_bridge_hammerdash:
	%preset("Bridge Hammerdash", preset_adold_desert_bridge_hammerdash)

cm_adold_desert_zora_dmd:
	%preset("Zora DMD", preset_adold_desert_zora_dmd)

cm_adold_desert_links_house:
	%preset("Link's House", preset_adold_desert_links_house)

cm_adold_desert_swamp_warp:
	%preset("Swamp Warp", preset_adold_desert_swamp_warp)

cm_adold_desert_fluteless_mire:
	%preset("Fluteless Mire", preset_adold_desert_fluteless_mire)

cm_adold_desert_desert_entrance:
	%preset("Desert Entrance", preset_adold_desert_desert_entrance)

cm_adold_desert_torch_key:
	%preset("Torch Key", preset_adold_desert_torch_key)

cm_adold_desert_pre_cannonballs:
	%preset("Pre Cannonballs", preset_adold_desert_pre_cannonballs)

cm_adold_desert_desert_2_spinspeed:
	%preset("Desert 2 Spinspeed", preset_adold_desert_desert_2_spinspeed)

cm_adold_desert_torches:
	%preset("Torches", preset_adold_desert_torches)

cm_adold_desert_lanmolas:
	%preset("Lanmolas", preset_adold_desert_lanmolas)

; MISERY MIRE

cm_adold_presets_goto_mire:
	%submenu("Misery Mire", cm_adold_presets_mire)

cm_adold_presets_mire:
	dw cm_adold_mire_outside_desert
	dw cm_adold_mire_entrance
	dw cm_adold_mire_mire_2
	dw cm_adold_mire_main_hub
	dw cm_adold_mire_spike_key
	dw cm_adold_mire_beat_the_fireball
	dw cm_adold_mire_bari_switch
	dw cm_adold_mire_sluggulas
	dw cm_adold_mire_torches
	dw cm_adold_mire_backtracking
	dw cm_adold_mire_mire_to_hera_clip
	dw cm_adold_mire_hera_to_swamp_clip
	dw cm_adold_mire_mire_2_2
	dw cm_adold_mire_big_chest_room
	dw cm_adold_mire_main_hub_post_cane
	dw cm_adold_mire_bridge_room
	dw cm_adold_mire_spooky_action
	dw cm_adold_mire_vitreous
	dw $0000
	%menu_header("MISERY MIRE")

cm_adold_mire_outside_desert:
	%preset("Outside Desert", preset_adold_mire_outside_desert)

cm_adold_mire_entrance:
	%preset("Entrance", preset_adold_mire_entrance)

cm_adold_mire_mire_2:
	%preset("Mire 2", preset_adold_mire_mire_2)

cm_adold_mire_main_hub:
	%preset("Main Hub", preset_adold_mire_main_hub)

cm_adold_mire_spike_key:
	%preset("Spike Key", preset_adold_mire_spike_key)

cm_adold_mire_beat_the_fireball:
	%preset("Beat the Fireball", preset_adold_mire_beat_the_fireball)

cm_adold_mire_bari_switch:
	%preset("Bari Switch", preset_adold_mire_bari_switch)

cm_adold_mire_sluggulas:
	%preset("Sluggulas", preset_adold_mire_sluggulas)

cm_adold_mire_torches:
	%preset("Torches", preset_adold_mire_torches)

cm_adold_mire_backtracking:
	%preset("Backtracking", preset_adold_mire_backtracking)

cm_adold_mire_mire_to_hera_clip:
	%preset("Mire to Hera Clip", preset_adold_mire_mire_to_hera_clip)

cm_adold_mire_hera_to_swamp_clip:
	%preset("Hera to Swamp Clip", preset_adold_mire_hera_to_swamp_clip)

cm_adold_mire_mire_2_2:
	%preset("Mire 2-2", preset_adold_mire_mire_2_2)

cm_adold_mire_big_chest_room:
	%preset("Big Chest Room", preset_adold_mire_big_chest_room)

cm_adold_mire_main_hub_post_cane:
	%preset("Main Hub (post Cane)", preset_adold_mire_main_hub_post_cane)

cm_adold_mire_bridge_room:
	%preset("Bridge Room", preset_adold_mire_bridge_room)

cm_adold_mire_spooky_action:
	%preset("Spooky Action", preset_adold_mire_spooky_action)

cm_adold_mire_vitreous:
	%preset("Vitreous", preset_adold_mire_vitreous)

; SWAMP PALACE

cm_adold_presets_goto_swamp:
	%submenu("Swamp Palace", cm_adold_presets_swamp)

cm_adold_presets_swamp:
	dw cm_adold_swamp_outside_mire
	dw cm_adold_swamp_antifairy_room
	dw cm_adold_swamp_entrance
	dw cm_adold_swamp_first_key_pot
	dw cm_adold_swamp_main_hub
	dw cm_adold_swamp_hookdash
	dw cm_adold_swamp_restock_room
	dw cm_adold_swamp_phelps_way
	dw cm_adold_swamp_arrghus
	dw $0000
	%menu_header("SWAMP PALACE")

cm_adold_swamp_outside_mire:
	%preset("Outside Mire", preset_adold_swamp_outside_mire)

cm_adold_swamp_antifairy_room:
	%preset("Antifairy Room", preset_adold_swamp_antifairy_room)

cm_adold_swamp_entrance:
	%preset("Entrance", preset_adold_swamp_entrance)

cm_adold_swamp_first_key_pot:
	%preset("First Key Pot", preset_adold_swamp_first_key_pot)

cm_adold_swamp_main_hub:
	%preset("Main Hub", preset_adold_swamp_main_hub)

cm_adold_swamp_hookdash:
	%preset("Hookdash", preset_adold_swamp_hookdash)

cm_adold_swamp_restock_room:
	%preset("Restock Room", preset_adold_swamp_restock_room)

cm_adold_swamp_phelps_way:
	%preset("Phelps Way", preset_adold_swamp_phelps_way)

cm_adold_swamp_arrghus:
	%preset("Arrghus", preset_adold_swamp_arrghus)

; ICE PALACE

cm_adold_presets_goto_ice:
	%submenu("Ice Palace", cm_adold_presets_ice)

cm_adold_presets_ice:
	dw cm_adold_ice_outside_swamp
	dw cm_adold_ice_entrance
	dw cm_adold_ice_ice_conveyor
	dw cm_adold_ice_ipbj
	dw cm_adold_ice_penguin_lineup_room
	dw cm_adold_ice_lonely_firebar
	dw cm_adold_ice_last_two_screens
	dw cm_adold_ice_kholdstare
	dw $0000
	%menu_header("ICE PALACE")

cm_adold_ice_outside_swamp:
	%preset("Outside Swamp", preset_adold_ice_outside_swamp)

cm_adold_ice_entrance:
	%preset("Entrance", preset_adold_ice_entrance)

cm_adold_ice_ice_conveyor:
	%preset("Ice Conveyor", preset_adold_ice_ice_conveyor)

cm_adold_ice_ipbj:
	%preset("IPBJ", preset_adold_ice_ipbj)

cm_adold_ice_penguin_lineup_room:
	%preset("Penguin Lineup Room", preset_adold_ice_penguin_lineup_room)

cm_adold_ice_lonely_firebar:
	%preset("Lonely Firebar", preset_adold_ice_lonely_firebar)

cm_adold_ice_last_two_screens:
	%preset("Last Two Screens", preset_adold_ice_last_two_screens)

cm_adold_ice_kholdstare:
	%preset("Kholdstare", preset_adold_ice_kholdstare)

; TURTLE ROCK

cm_adold_presets_goto_trock:
	%submenu("Turtle Rock", cm_adold_presets_trock)

cm_adold_presets_trock:
	dw cm_adold_trock_outside_ice
	dw cm_adold_trock_old_man_cave
	dw cm_adold_trock_tr_climb
	dw cm_adold_trock_laser_entrance
	dw cm_adold_trock_crystal_roller
	dw cm_adold_trock_pokey_1
	dw cm_adold_trock_laser_entrance_2
	dw cm_adold_trock_switch_maze
	dw cm_adold_trock_trinexx
	dw $0000
	%menu_header("TURTLE ROCK")

cm_adold_trock_outside_ice:
	%preset("Outside Ice", preset_adold_trock_outside_ice)

cm_adold_trock_old_man_cave:
	%preset("Old Man Cave", preset_adold_trock_old_man_cave)

cm_adold_trock_tr_climb:
	%preset("TR Climb", preset_adold_trock_tr_climb)

cm_adold_trock_laser_entrance:
	%preset("Laser Entrance", preset_adold_trock_laser_entrance)

cm_adold_trock_crystal_roller:
	%preset("Crystal Roller", preset_adold_trock_crystal_roller)

cm_adold_trock_pokey_1:
	%preset("Pokey 1", preset_adold_trock_pokey_1)

cm_adold_trock_laser_entrance_2:
	%preset("Laser Entrance 2", preset_adold_trock_laser_entrance_2)

cm_adold_trock_switch_maze:
	%preset("Switch Maze", preset_adold_trock_switch_maze)

cm_adold_trock_trinexx:
	%preset("Trinexx", preset_adold_trock_trinexx)

; GANONS TOWER

cm_adold_presets_goto_gtower:
	%submenu("Ganon's Tower", cm_adold_presets_gtower)

cm_adold_presets_gtower:
	dw cm_adold_gtower_outside_turtle_rock
	dw cm_adold_gtower_old_man_cave
	dw cm_adold_gtower_entrance
	dw cm_adold_gtower_spike_skip
	dw cm_adold_gtower_pre_firesnakes_room
	dw cm_adold_gtower_bombable_floor
	dw cm_adold_gtower_floor_2
	dw cm_adold_gtower_mimics_1
	dw cm_adold_gtower_spike_pit
	dw cm_adold_gtower_gauntlet_1
	dw cm_adold_gtower_lanmola_2
	dw cm_adold_gtower_wizzrobes_1
	dw cm_adold_gtower_wizzrobes_2
	dw cm_adold_gtower_torches_1
	dw cm_adold_gtower_torches_2
	dw cm_adold_gtower_helma_key
	dw cm_adold_gtower_bombable_wall
	dw cm_adold_gtower_moldorm_2
	dw cm_adold_gtower_agahnim_2
	dw $0000
	%menu_header("GANONS TOWER")

cm_adold_gtower_outside_turtle_rock:
	%preset("Outside Turtle Rock", preset_adold_gtower_outside_turtle_rock)

cm_adold_gtower_old_man_cave:
	%preset("Old Man Cave", preset_adold_gtower_old_man_cave)

cm_adold_gtower_entrance:
	%preset("Entrance", preset_adold_gtower_entrance)

cm_adold_gtower_spike_skip:
	%preset("Spike Skip", preset_adold_gtower_spike_skip)

cm_adold_gtower_pre_firesnakes_room:
	%preset("Pre Firesnakes Room", preset_adold_gtower_pre_firesnakes_room)

cm_adold_gtower_bombable_floor:
	%preset("Bombable Floor", preset_adold_gtower_bombable_floor)

cm_adold_gtower_floor_2:
	%preset("Floor 2", preset_adold_gtower_floor_2)

cm_adold_gtower_mimics_1:
	%preset("Mimics 1", preset_adold_gtower_mimics_1)

cm_adold_gtower_spike_pit:
	%preset("Spike Pit", preset_adold_gtower_spike_pit)

cm_adold_gtower_gauntlet_1:
	%preset("Gauntlet 1", preset_adold_gtower_gauntlet_1)

cm_adold_gtower_lanmola_2:
	%preset("Lanmola 2", preset_adold_gtower_lanmola_2)

cm_adold_gtower_wizzrobes_1:
	%preset("Wizzrobes 1", preset_adold_gtower_wizzrobes_1)

cm_adold_gtower_wizzrobes_2:
	%preset("Wizzrobes 2", preset_adold_gtower_wizzrobes_2)

cm_adold_gtower_torches_1:
	%preset("Torches 1", preset_adold_gtower_torches_1)

cm_adold_gtower_torches_2:
	%preset("Torches 2", preset_adold_gtower_torches_2)

cm_adold_gtower_helma_key:
	%preset("Helma Key", preset_adold_gtower_helma_key)

cm_adold_gtower_bombable_wall:
	%preset("Bombable Wall", preset_adold_gtower_bombable_wall)

cm_adold_gtower_moldorm_2:
	%preset("Moldorm 2", preset_adold_gtower_moldorm_2)

cm_adold_gtower_agahnim_2:
	%preset("Agahnim 2", preset_adold_gtower_agahnim_2)

; AGAHNIMS TOWER

cm_adold_presets_goto_aga:
	%submenu("Agahnim's Tower", cm_adold_presets_aga)

cm_adold_presets_aga:
	dw cm_adold_aga_pyramid
	dw cm_adold_aga_gold_knights
	dw cm_adold_aga_dark_room_of_despair
	dw cm_adold_aga_dark_room_of_melancholy
	dw cm_adold_aga_spear_guards
	dw cm_adold_aga_circle_of_pots
	dw cm_adold_aga_pit_room
	dw cm_adold_aga_agahnim
	dw $0000
	%menu_header("AGAHNIMS TOWER")

cm_adold_aga_pyramid:
	%preset("Pyramid", preset_adold_aga_pyramid)

cm_adold_aga_gold_knights:
	%preset("Gold Knights", preset_adold_aga_gold_knights)

cm_adold_aga_dark_room_of_despair:
	%preset("Dark Room of Despair", preset_adold_aga_dark_room_of_despair)

cm_adold_aga_dark_room_of_melancholy:
	%preset("Dark Room of Melancholy", preset_adold_aga_dark_room_of_melancholy)

cm_adold_aga_spear_guards:
	%preset("Spear Guards", preset_adold_aga_spear_guards)

cm_adold_aga_circle_of_pots:
	%preset("Circle of Pots", preset_adold_aga_circle_of_pots)

cm_adold_aga_pit_room:
	%preset("Pit Room", preset_adold_aga_pit_room)

cm_adold_aga_agahnim:
	%preset("Agahnim", preset_adold_aga_agahnim)

; GANON

cm_adold_presets_goto_ganon:
	%submenu("Ganon", cm_adold_presets_ganon)

cm_adold_presets_ganon:
	dw cm_adold_ganon_pyramid
	dw $0000
	%menu_header("GANON")

cm_adold_ganon_pyramid:
	%preset("Pyramid", preset_adold_ganon_pyramid)

; BOSSES

cm_adold_presets_goto_boss:
	%submenu("Bosses", cm_adold_presets_boss)

cm_adold_presets_boss:
	dw cm_adold_eastern_armos
	dw cm_adold_pod_helma
	dw cm_adold_hera_moldorm
	dw cm_adold_thieves_blind
	dw cm_adold_skull_mothula
	dw cm_adold_desert_lanmolas
	dw cm_adold_mire_vitreous
	dw cm_adold_swamp_arrghus
	dw cm_adold_ice_kholdstare
	dw cm_adold_trock_trinexx
	dw cm_adold_gtower_agahnim_2
	dw cm_adold_aga_agahnim
	dw cm_adold_ganon_pyramid
	dw $0000
	%menu_header("BOSSES")
