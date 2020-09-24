cm_ad_submenu_presets:
	dw cm_ad_presets_goto_escape
	dw cm_ad_presets_goto_eastern
	dw cm_ad_presets_goto_pod
	dw cm_ad_presets_goto_hera
	dw cm_ad_presets_goto_thieves
	dw cm_ad_presets_goto_skull
	dw cm_ad_presets_goto_desert
	dw cm_ad_presets_goto_mire
	dw cm_ad_presets_goto_swamp
	dw cm_ad_presets_goto_ice
	dw cm_ad_presets_goto_trock
	dw cm_ad_presets_goto_gtower
	dw cm_ad_presets_goto_atower
	dw cm_ad_presets_goto_ganon
	dw cm_ad_presets_goto_boss
	dw #$0000
	%cm_header("AD PRESETS")

; HYRULE CASTLE

cm_ad_presets_goto_escape:
	%cm_submenu("Hyrule Castle", cm_ad_presets_escape)

cm_ad_presets_escape:
	dw cm_ad_esc_links_bed
	dw cm_ad_esc_courtyard
	dw cm_ad_esc_entrance
	dw cm_ad_esc_1st_key_guard
	dw cm_ad_esc_stealth_room
	dw cm_ad_esc_2nd_key_guard
	dw cm_ad_esc_ball_n_chains
	dw cm_ad_esc_backtracking
	dw cm_ad_esc_key_guard_revisit
	dw cm_ad_esc_throne_room
	dw cm_ad_esc_snake_avoidance
	dw cm_ad_esc_sewer_rooms
	dw cm_ad_esc_keyrat
	dw cm_ad_esc_last_two
	dw #$0000
	%cm_header("HYRULE CASTLE")

cm_ad_esc_links_bed:
	%cm_preset("Link's Bed", preset_ad_esc_links_bed)

cm_ad_esc_courtyard:
	%cm_preset("Courtyard", preset_ad_esc_courtyard)

cm_ad_esc_entrance:
	%cm_preset("Entrance", preset_ad_esc_entrance)

cm_ad_esc_1st_key_guard:
	%cm_preset("1st Key Guard", preset_ad_esc_1st_key_guard)

cm_ad_esc_stealth_room:
	%cm_preset("Stealth Room", preset_ad_esc_stealth_room)

cm_ad_esc_2nd_key_guard:
	%cm_preset("2nd Key Guard", preset_ad_esc_2nd_key_guard)

cm_ad_esc_ball_n_chains:
	%cm_preset("Ball 'n Chains", preset_ad_esc_ball_n_chains)

cm_ad_esc_backtracking:
	%cm_preset("Backtracking", preset_ad_esc_backtracking)

cm_ad_esc_key_guard_revisit:
	%cm_preset("Key Guard Revisit", preset_ad_esc_key_guard_revisit)

cm_ad_esc_throne_room:
	%cm_preset("Throne Room", preset_ad_esc_throne_room)

cm_ad_esc_snake_avoidance:
	%cm_preset("Snake Avoidance", preset_ad_esc_snake_avoidance)

cm_ad_esc_sewer_rooms:
	%cm_preset("Sewer Rooms", preset_ad_esc_sewer_rooms)

cm_ad_esc_keyrat:
	%cm_preset("Keyrat", preset_ad_esc_keyrat)

cm_ad_esc_last_two:
	%cm_preset("Last Two", preset_ad_esc_last_two)

; EASTERN

cm_ad_presets_goto_eastern:
	%cm_submenu("Eastern Palace", cm_ad_presets_eastern)

cm_ad_presets_eastern:
	dw cm_ad_east_before_cutscene
	dw cm_ad_east_links_house
	dw cm_ad_east_ep_overworld
	dw cm_ad_east_entrance
	dw cm_ad_east_stalfos_room
	dw cm_ad_east_big_chest_room_1
	dw cm_ad_east_dark_key_room
	dw cm_ad_east_big_key_dmg_boost
	dw cm_ad_east_big_chest_room_2
	dw cm_ad_east_gifted_with_greenies
	dw cm_ad_east_pot_room
	dw cm_ad_east_zeldagamer_room
	dw cm_ad_east_armos
	dw #$0000
	%cm_header("EASTERN")

cm_ad_east_before_cutscene:
	%cm_preset("Before Cutscene", preset_ad_east_before_cutscene)

cm_ad_east_links_house:
	%cm_preset("Link's House", preset_ad_east_links_house)

cm_ad_east_ep_overworld:
	%cm_preset("EP Overworld", preset_ad_east_ep_overworld)

cm_ad_east_entrance:
	%cm_preset("Entrance", preset_ad_east_entrance)

cm_ad_east_stalfos_room:
	%cm_preset("Stalfos Room", preset_ad_east_stalfos_room)

cm_ad_east_big_chest_room_1:
	%cm_preset("Big Chest Room 1", preset_ad_east_big_chest_room_1)

cm_ad_east_dark_key_room:
	%cm_preset("Dark Key Room", preset_ad_east_dark_key_room)

cm_ad_east_big_key_dmg_boost:
	%cm_preset("Big Key DMG Boost", preset_ad_east_big_key_dmg_boost)

cm_ad_east_big_chest_room_2:
	%cm_preset("Big Chest Room 2", preset_ad_east_big_chest_room_2)

cm_ad_east_gifted_with_greenies:
	%cm_preset("Gifted with Greenies", preset_ad_east_gifted_with_greenies)

cm_ad_east_pot_room:
	%cm_preset("Pot Room", preset_ad_east_pot_room)

cm_ad_east_zeldagamer_room:
	%cm_preset("Zeldagamer Room", preset_ad_east_zeldagamer_room)

cm_ad_east_armos:
	%cm_preset("Armos", preset_ad_east_armos)

; PALACE OF DARKNESS

cm_ad_presets_goto_pod:
	%cm_submenu("Palace of Darkness", cm_ad_presets_pod)

cm_ad_presets_pod:
	dw cm_ad_pod_outside_ep
	dw cm_ad_pod_sanctuary
	dw cm_ad_pod_dma
	dw cm_ad_pod_death_mountain
	dw cm_ad_pod_after_mirror
	dw cm_ad_pod_kiki_skip
	dw cm_ad_pod_dungeon_reload
	dw cm_ad_pod_main_hub_bk
	dw cm_ad_pod_main_hub_hammerjump
	dw cm_ad_pod_hammerjump
	dw cm_ad_pod_archery_contest
	dw cm_ad_pod_mimics
	dw cm_ad_pod_statue
	dw cm_ad_pod_basement
	dw cm_ad_pod_turtle_room
	dw cm_ad_pod_helma
	dw #$0000
	%cm_header("PALACE OF DARKNESS")

cm_ad_pod_outside_ep:
	%cm_preset("Outside EP", preset_ad_pod_outside_ep)

cm_ad_pod_sanctuary:
	%cm_preset("Sanctuary", preset_ad_pod_sanctuary)

cm_ad_pod_dma:
	%cm_preset("DMA", preset_ad_pod_dma)

cm_ad_pod_death_mountain:
	%cm_preset("Death Mountain", preset_ad_pod_death_mountain)

cm_ad_pod_after_mirror:
	%cm_preset("After Mirror", preset_ad_pod_after_mirror)

cm_ad_pod_kiki_skip:
	%cm_preset("Kiki Skip", preset_ad_pod_kiki_skip)

cm_ad_pod_dungeon_reload:
	%cm_preset("Dungeon Reload", preset_ad_pod_dungeon_reload)

cm_ad_pod_main_hub_bk:
	%cm_preset("Main Hub (bk)", preset_ad_pod_main_hub_bk)

cm_ad_pod_main_hub_hammerjump:
	%cm_preset("Main Hub (hammerjump)", preset_ad_pod_main_hub_hammerjump)

cm_ad_pod_hammerjump:
	%cm_preset("Hammerjump", preset_ad_pod_hammerjump)

cm_ad_pod_archery_contest:
	%cm_preset("Archery Contest", preset_ad_pod_archery_contest)

cm_ad_pod_mimics:
	%cm_preset("Mimics", preset_ad_pod_mimics)

cm_ad_pod_statue:
	%cm_preset("Statue", preset_ad_pod_statue)

cm_ad_pod_basement:
	%cm_preset("Basement", preset_ad_pod_basement)

cm_ad_pod_turtle_room:
	%cm_preset("Turtle Room", preset_ad_pod_turtle_room)

cm_ad_pod_helma:
	%cm_preset("Helma", preset_ad_pod_helma)

; HERA TOWER

cm_ad_presets_goto_hera:
	%cm_submenu("Hera Tower", cm_ad_presets_hera)

cm_ad_presets_hera:
	dw cm_ad_hera_outside_pod
	dw cm_ad_hera_old_man_cave
	dw cm_ad_hera_entrance
	dw cm_ad_hera_tile_room
	dw cm_ad_hera_torches
	dw cm_ad_hera_beetles
	dw cm_ad_hera_petting_zoo
	dw cm_ad_hera_moldorm
	dw #$0000
	%cm_header("HERA TOWER")

cm_ad_hera_outside_pod:
	%cm_preset("Outside PoD", preset_ad_hera_outside_pod)

cm_ad_hera_old_man_cave:
	%cm_preset("Old Man Cave", preset_ad_hera_old_man_cave)

cm_ad_hera_entrance:
	%cm_preset("Entrance", preset_ad_hera_entrance)

cm_ad_hera_tile_room:
	%cm_preset("Tile Room", preset_ad_hera_tile_room)

cm_ad_hera_torches:
	%cm_preset("Torches", preset_ad_hera_torches)

cm_ad_hera_beetles:
	%cm_preset("Beetles", preset_ad_hera_beetles)

cm_ad_hera_petting_zoo:
	%cm_preset("Petting Zoo", preset_ad_hera_petting_zoo)

cm_ad_hera_moldorm:
	%cm_preset("Moldorm", preset_ad_hera_moldorm)

; THIEVES TOWN

cm_ad_presets_goto_thieves:
	%cm_submenu("Thieves' Town", cm_ad_presets_thieves)

cm_ad_presets_thieves:
	dw cm_ad_thieves_outside_hera
	dw cm_ad_thieves_dmd
	dw cm_ad_thieves_entrance
	dw cm_ad_thieves_after_big_key
	dw cm_ad_thieves_stalfos_hallway
	dw cm_ad_thieves_conveyor_gibos
	dw cm_ad_thieves_hellway
	dw cm_ad_thieves_bomb_floor
	dw cm_ad_thieves_backtracking
	dw cm_ad_thieves_basement
	dw cm_ad_thieves_prison
	dw cm_ad_thieves_backtracking_2
	dw cm_ad_thieves_pot_hammerdash
	dw cm_ad_thieves_blind
	dw #$0000
	%cm_header("THIEVES TOWN")

cm_ad_thieves_outside_hera:
	%cm_preset("Outside Hera", preset_ad_thieves_outside_hera)

cm_ad_thieves_dmd:
	%cm_preset("DMD", preset_ad_thieves_dmd)

cm_ad_thieves_entrance:
	%cm_preset("Entrance", preset_ad_thieves_entrance)

cm_ad_thieves_after_big_key:
	%cm_preset("After Big Key", preset_ad_thieves_after_big_key)

cm_ad_thieves_stalfos_hallway:
	%cm_preset("Stalfos Hallway", preset_ad_thieves_stalfos_hallway)

cm_ad_thieves_conveyor_gibos:
	%cm_preset("Conveyor Gibos", preset_ad_thieves_conveyor_gibos)

cm_ad_thieves_hellway:
	%cm_preset("Hellway", preset_ad_thieves_hellway)

cm_ad_thieves_bomb_floor:
	%cm_preset("Bomb Floor", preset_ad_thieves_bomb_floor)

cm_ad_thieves_backtracking:
	%cm_preset("Backtracking", preset_ad_thieves_backtracking)

cm_ad_thieves_basement:
	%cm_preset("Basement", preset_ad_thieves_basement)

cm_ad_thieves_prison:
	%cm_preset("Prison", preset_ad_thieves_prison)

cm_ad_thieves_backtracking_2:
	%cm_preset("Backtracking", preset_ad_thieves_backtracking_2)

cm_ad_thieves_pot_hammerdash:
	%cm_preset("Pot Hammerdash", preset_ad_thieves_pot_hammerdash)

cm_ad_thieves_blind:
	%cm_preset("Blind", preset_ad_thieves_blind)

; SKULL WOODS

cm_ad_presets_goto_skull:
	%cm_submenu("Skull Woods", cm_ad_presets_skull)

cm_ad_presets_skull:
	dw cm_ad_skull_outside_thieves
	dw cm_ad_skull_cursed_dwarf
	dw cm_ad_skull_getting_tempered
	dw cm_ad_skull_fencedash
	dw cm_ad_skull_dash_to_skull_woods
	dw cm_ad_skull_mummy_room
	dw cm_ad_skull_bomb_jump
	dw cm_ad_skull_key_pot
	dw cm_ad_skull_skull_entrance
	dw cm_ad_skull_mummy_hellway
	dw cm_ad_skull_mummy_key
	dw cm_ad_skull_mothula
	dw #$0000
	%cm_header("SKULL WOODS")

cm_ad_skull_outside_thieves:
	%cm_preset("Outside Thieves", preset_ad_skull_outside_thieves)

cm_ad_skull_cursed_dwarf:
	%cm_preset("Cursed Dwarf", preset_ad_skull_cursed_dwarf)

cm_ad_skull_getting_tempered:
	%cm_preset("Getting Tempered", preset_ad_skull_getting_tempered)

cm_ad_skull_fencedash:
	%cm_preset("Fencedash", preset_ad_skull_fencedash)

cm_ad_skull_dash_to_skull_woods:
	%cm_preset("Dash to Skull Woods", preset_ad_skull_dash_to_skull_woods)

cm_ad_skull_mummy_room:
	%cm_preset("Mummy Room", preset_ad_skull_mummy_room)

cm_ad_skull_bomb_jump:
	%cm_preset("Bomb Jump", preset_ad_skull_bomb_jump)

cm_ad_skull_key_pot:
	%cm_preset("Key Pot", preset_ad_skull_key_pot)

cm_ad_skull_skull_entrance:
	%cm_preset("Skull Entrance", preset_ad_skull_skull_entrance)

cm_ad_skull_mummy_hellway:
	%cm_preset("Mummy Hellway", preset_ad_skull_mummy_hellway)

cm_ad_skull_mummy_key:
	%cm_preset("Mummy Key", preset_ad_skull_mummy_key)

cm_ad_skull_mothula:
	%cm_preset("Mothula", preset_ad_skull_mothula)

; DESERT PALACE

cm_ad_presets_goto_desert:
	%cm_submenu("Desert Palace", cm_ad_presets_desert)

cm_ad_presets_desert:
	dw cm_ad_desert_outside_skull
	dw cm_ad_desert_ether
	dw cm_ad_desert_bridge_hammerdash
	dw cm_ad_desert_zora_dmd
	dw cm_ad_desert_links_house
	dw cm_ad_desert_swamp_warp
	dw cm_ad_desert_fluteless_mire
	dw cm_ad_desert_desert_entrance
	dw cm_ad_desert_torch_key
	dw cm_ad_desert_pre_cannonballs
	dw cm_ad_desert_desert_2_spinspeed
	dw cm_ad_desert_torches
	dw cm_ad_desert_lanmolas
	dw #$0000
	%cm_header("DESERT PALACE")

cm_ad_desert_outside_skull:
	%cm_preset("Outside Skull", preset_ad_desert_outside_skull)

cm_ad_desert_ether:
	%cm_preset("Ether", preset_ad_desert_ether)

cm_ad_desert_bridge_hammerdash:
	%cm_preset("Bridge Hammerdash", preset_ad_desert_bridge_hammerdash)

cm_ad_desert_zora_dmd:
	%cm_preset("Zora DMD", preset_ad_desert_zora_dmd)

cm_ad_desert_links_house:
	%cm_preset("Link's House", preset_ad_desert_links_house)

cm_ad_desert_swamp_warp:
	%cm_preset("Swamp Warp", preset_ad_desert_swamp_warp)

cm_ad_desert_fluteless_mire:
	%cm_preset("Fluteless Mire", preset_ad_desert_fluteless_mire)

cm_ad_desert_desert_entrance:
	%cm_preset("Desert Entrance", preset_ad_desert_desert_entrance)

cm_ad_desert_torch_key:
	%cm_preset("Torch Key", preset_ad_desert_torch_key)

cm_ad_desert_pre_cannonballs:
	%cm_preset("Pre Cannonballs", preset_ad_desert_pre_cannonballs)

cm_ad_desert_desert_2_spinspeed:
	%cm_preset("Desert 2 Spinspeed", preset_ad_desert_desert_2_spinspeed)

cm_ad_desert_torches:
	%cm_preset("Torches", preset_ad_desert_torches)

cm_ad_desert_lanmolas:
	%cm_preset("Lanmolas", preset_ad_desert_lanmolas)

; MISERY MIRE

cm_ad_presets_goto_mire:
	%cm_submenu("Misery Mire", cm_ad_presets_mire)

cm_ad_presets_mire:
	dw cm_ad_mire_outside_desert
	dw cm_ad_mire_entrance
	dw cm_ad_mire_mire_2
	dw cm_ad_mire_main_hub
	dw cm_ad_mire_spike_key
	dw cm_ad_mire_beat_the_fireball
	dw cm_ad_mire_bari_switch
	dw cm_ad_mire_sluggulas
	dw cm_ad_mire_torches
	dw cm_ad_mire_backtracking
	dw cm_ad_mire_mire_to_hera_clip
	dw cm_ad_mire_hera_to_swamp_clip
	dw cm_ad_mire_mire_2_2
	dw cm_ad_mire_big_chest_room
	dw cm_ad_mire_main_hub_post_cane
	dw cm_ad_mire_bridge_room
	dw cm_ad_mire_spooky_action
	dw cm_ad_mire_vitreous
	dw #$0000
	%cm_header("MISERY MIRE")

cm_ad_mire_outside_desert:
	%cm_preset("Outside Desert", preset_ad_mire_outside_desert)

cm_ad_mire_entrance:
	%cm_preset("Entrance", preset_ad_mire_entrance)

cm_ad_mire_mire_2:
	%cm_preset("Mire 2", preset_ad_mire_mire_2)

cm_ad_mire_main_hub:
	%cm_preset("Main Hub", preset_ad_mire_main_hub)

cm_ad_mire_spike_key:
	%cm_preset("Spike Key", preset_ad_mire_spike_key)

cm_ad_mire_beat_the_fireball:
	%cm_preset("Beat the Fireball", preset_ad_mire_beat_the_fireball)

cm_ad_mire_bari_switch:
	%cm_preset("Bari Switch", preset_ad_mire_bari_switch)

cm_ad_mire_sluggulas:
	%cm_preset("Sluggulas", preset_ad_mire_sluggulas)

cm_ad_mire_torches:
	%cm_preset("Torches", preset_ad_mire_torches)

cm_ad_mire_backtracking:
	%cm_preset("Backtracking", preset_ad_mire_backtracking)

cm_ad_mire_mire_to_hera_clip:
	%cm_preset("Mire to Hera Clip", preset_ad_mire_mire_to_hera_clip)

cm_ad_mire_hera_to_swamp_clip:
	%cm_preset("Hera to Swamp Clip", preset_ad_mire_hera_to_swamp_clip)

cm_ad_mire_mire_2_2:
	%cm_preset("Mire 2-2", preset_ad_mire_mire_2_2)

cm_ad_mire_big_chest_room:
	%cm_preset("Big Chest Room", preset_ad_mire_big_chest_room)

cm_ad_mire_main_hub_post_cane:
	%cm_preset("Main Hub (post Cane)", preset_ad_mire_main_hub_post_cane)

cm_ad_mire_bridge_room:
	%cm_preset("Bridge Room", preset_ad_mire_bridge_room)

cm_ad_mire_spooky_action:
	%cm_preset("Spooky Action", preset_ad_mire_spooky_action)

cm_ad_mire_vitreous:
	%cm_preset("Vitreous", preset_ad_mire_vitreous)

; SWAMP PALACE

cm_ad_presets_goto_swamp:
	%cm_submenu("Swamp Palace", cm_ad_presets_swamp)

cm_ad_presets_swamp:
	dw cm_ad_swamp_outside_mire
	dw cm_ad_swamp_antifairy_room
	dw cm_ad_swamp_entrance
	dw cm_ad_swamp_first_key_pot
	dw cm_ad_swamp_main_hub
	dw cm_ad_swamp_hookdash
	dw cm_ad_swamp_restock_room
	dw cm_ad_swamp_phelps_way
	dw cm_ad_swamp_arrghus
	dw #$0000
	%cm_header("SWAMP PALACE")

cm_ad_swamp_outside_mire:
	%cm_preset("Outside Mire", preset_ad_swamp_outside_mire)

cm_ad_swamp_antifairy_room:
	%cm_preset("Antifairy Room", preset_ad_swamp_antifairy_room)

cm_ad_swamp_entrance:
	%cm_preset("Entrance", preset_ad_swamp_entrance)

cm_ad_swamp_first_key_pot:
	%cm_preset("First Key Pot", preset_ad_swamp_first_key_pot)

cm_ad_swamp_main_hub:
	%cm_preset("Main Hub", preset_ad_swamp_main_hub)

cm_ad_swamp_hookdash:
	%cm_preset("Hookdash", preset_ad_swamp_hookdash)

cm_ad_swamp_restock_room:
	%cm_preset("Restock Room", preset_ad_swamp_restock_room)

cm_ad_swamp_phelps_way:
	%cm_preset("Phelps Way", preset_ad_swamp_phelps_way)

cm_ad_swamp_arrghus:
	%cm_preset("Arrghus", preset_ad_swamp_arrghus)

; ICE PALACE

cm_ad_presets_goto_ice:
	%cm_submenu("Ice Palace", cm_ad_presets_ice)

cm_ad_presets_ice:
	dw cm_ad_ice_outside_swamp
	dw cm_ad_ice_entrance
	dw cm_ad_ice_ice_conveyor
	dw cm_ad_ice_ipbj
	dw cm_ad_ice_penguin_lineup_room
	dw cm_ad_ice_lonely_firebar
	dw cm_ad_ice_last_two_screens
	dw cm_ad_ice_kholdstare
	dw #$0000
	%cm_header("ICE PALACE")

cm_ad_ice_outside_swamp:
	%cm_preset("Outside Swamp", preset_ad_ice_outside_swamp)

cm_ad_ice_entrance:
	%cm_preset("Entrance", preset_ad_ice_entrance)

cm_ad_ice_ice_conveyor:
	%cm_preset("Ice Conveyor", preset_ad_ice_ice_conveyor)

cm_ad_ice_ipbj:
	%cm_preset("IPBJ", preset_ad_ice_ipbj)

cm_ad_ice_penguin_lineup_room:
	%cm_preset("Penguin Lineup Room", preset_ad_ice_penguin_lineup_room)

cm_ad_ice_lonely_firebar:
	%cm_preset("Lonely Firebar", preset_ad_ice_lonely_firebar)

cm_ad_ice_last_two_screens:
	%cm_preset("Last Two Screens", preset_ad_ice_last_two_screens)

cm_ad_ice_kholdstare:
	%cm_preset("Kholdstare", preset_ad_ice_kholdstare)

; TURTLE ROCK

cm_ad_presets_goto_trock:
	%cm_submenu("Turtle Rock", cm_ad_presets_trock)

cm_ad_presets_trock:
	dw cm_ad_trock_outside_ice
	dw cm_ad_trock_old_man_cave
	dw cm_ad_trock_tr_climb
	dw cm_ad_trock_laser_entrance
	dw cm_ad_trock_crystal_roller
	dw cm_ad_trock_pokey_1
	dw cm_ad_trock_laser_entrance_2
	dw cm_ad_trock_switch_maze
	dw cm_ad_trock_trinexx
	dw #$0000
	%cm_header("TURTLE ROCK")

cm_ad_trock_outside_ice:
	%cm_preset("Outside Ice", preset_ad_trock_outside_ice)

cm_ad_trock_old_man_cave:
	%cm_preset("Old Man Cave", preset_ad_trock_old_man_cave)

cm_ad_trock_tr_climb:
	%cm_preset("TR Climb", preset_ad_trock_tr_climb)

cm_ad_trock_laser_entrance:
	%cm_preset("Laser Entrance", preset_ad_trock_laser_entrance)

cm_ad_trock_crystal_roller:
	%cm_preset("Crystal Roller", preset_ad_trock_crystal_roller)

cm_ad_trock_pokey_1:
	%cm_preset("Pokey 1", preset_ad_trock_pokey_1)

cm_ad_trock_laser_entrance_2:
	%cm_preset("Laser Entrance 2", preset_ad_trock_laser_entrance_2)

cm_ad_trock_switch_maze:
	%cm_preset("Switch Maze", preset_ad_trock_switch_maze)

cm_ad_trock_trinexx:
	%cm_preset("Trinexx", preset_ad_trock_trinexx)

; GANONS TOWER

cm_ad_presets_goto_gtower:
	%cm_submenu("Ganon's Tower", cm_ad_presets_gtower)

cm_ad_presets_gtower:
	dw cm_ad_gtower_outside_turtle_rock
	dw cm_ad_gtower_old_man_cave
	dw cm_ad_gtower_entrance
	dw cm_ad_gtower_spike_skip
	dw cm_ad_gtower_pre_firesnakes_room
	dw cm_ad_gtower_bombable_floor
	dw cm_ad_gtower_floor_2
	dw cm_ad_gtower_mimics_1
	dw cm_ad_gtower_spike_pit
	dw cm_ad_gtower_gauntlet_1
	dw cm_ad_gtower_lanmola_2
	dw cm_ad_gtower_wizzrobes_1
	dw cm_ad_gtower_wizzrobes_2
	dw cm_ad_gtower_torches_1
	dw cm_ad_gtower_torches_2
	dw cm_ad_gtower_helma_key
	dw cm_ad_gtower_bombable_wall
	dw cm_ad_gtower_moldorm_2
	dw cm_ad_gtower_agahnim_2
	dw #$0000
	%cm_header("GANONS TOWER")

cm_ad_gtower_outside_turtle_rock:
	%cm_preset("Outside Turtle Rock", preset_ad_gtower_outside_turtle_rock)

cm_ad_gtower_old_man_cave:
	%cm_preset("Old Man Cave", preset_ad_gtower_old_man_cave)

cm_ad_gtower_entrance:
	%cm_preset("Entrance", preset_ad_gtower_entrance)

cm_ad_gtower_spike_skip:
	%cm_preset("Spike Skip", preset_ad_gtower_spike_skip)

cm_ad_gtower_pre_firesnakes_room:
	%cm_preset("Pre Firesnakes Room", preset_ad_gtower_pre_firesnakes_room)

cm_ad_gtower_bombable_floor:
	%cm_preset("Bombable Floor", preset_ad_gtower_bombable_floor)

cm_ad_gtower_floor_2:
	%cm_preset("Floor 2", preset_ad_gtower_floor_2)

cm_ad_gtower_mimics_1:
	%cm_preset("Mimics 1", preset_ad_gtower_mimics_1)

cm_ad_gtower_spike_pit:
	%cm_preset("Spike Pit", preset_ad_gtower_spike_pit)

cm_ad_gtower_gauntlet_1:
	%cm_preset("Gauntlet 1", preset_ad_gtower_gauntlet_1)

cm_ad_gtower_lanmola_2:
	%cm_preset("Lanmola 2", preset_ad_gtower_lanmola_2)

cm_ad_gtower_wizzrobes_1:
	%cm_preset("Wizzrobes 1", preset_ad_gtower_wizzrobes_1)

cm_ad_gtower_wizzrobes_2:
	%cm_preset("Wizzrobes 2", preset_ad_gtower_wizzrobes_2)

cm_ad_gtower_torches_1:
	%cm_preset("Torches 1", preset_ad_gtower_torches_1)

cm_ad_gtower_torches_2:
	%cm_preset("Torches 2", preset_ad_gtower_torches_2)

cm_ad_gtower_helma_key:
	%cm_preset("Helma Key", preset_ad_gtower_helma_key)

cm_ad_gtower_bombable_wall:
	%cm_preset("Bombable Wall", preset_ad_gtower_bombable_wall)

cm_ad_gtower_moldorm_2:
	%cm_preset("Moldorm 2", preset_ad_gtower_moldorm_2)

cm_ad_gtower_agahnim_2:
	%cm_preset("Agahnim 2", preset_ad_gtower_agahnim_2)

; AGAHNIMS TOWER

cm_ad_presets_goto_atower:
	%cm_submenu("Agahnim's Tower", cm_ad_presets_atower)

cm_ad_presets_atower:
	dw cm_ad_atower_pyramid
	dw cm_ad_atower_gold_knights
	dw cm_ad_atower_dark_room_of_despair
	dw cm_ad_atower_dark_room_of_melancholy
	dw cm_ad_atower_spear_guards
	dw cm_ad_atower_circle_of_pots
	dw cm_ad_atower_pit_room
	dw cm_ad_atower_agahnim
	dw #$0000
	%cm_header("AGAHNIMS TOWER")

cm_ad_atower_pyramid:
	%cm_preset("Pyramid", preset_ad_atower_pyramid)

cm_ad_atower_gold_knights:
	%cm_preset("Gold Knights", preset_ad_atower_gold_knights)

cm_ad_atower_dark_room_of_despair:
	%cm_preset("Dark Room of Despair", preset_ad_atower_dark_room_of_despair)

cm_ad_atower_dark_room_of_melancholy:
	%cm_preset("Dark Room of Melancholy", preset_ad_atower_dark_room_of_melancholy)

cm_ad_atower_spear_guards:
	%cm_preset("Spear Guards", preset_ad_atower_spear_guards)

cm_ad_atower_circle_of_pots:
	%cm_preset("Circle of Pots", preset_ad_atower_circle_of_pots)

cm_ad_atower_pit_room:
	%cm_preset("Pit Room", preset_ad_atower_pit_room)

cm_ad_atower_agahnim:
	%cm_preset("Agahnim", preset_ad_atower_agahnim)

; GANON

cm_ad_presets_goto_ganon:
	%cm_submenu("Ganon", cm_ad_presets_ganon)

cm_ad_presets_ganon:
	dw cm_ad_ganon_pyramid
	dw #$0000
	%cm_header("GANON")

cm_ad_ganon_pyramid:
	%cm_preset("Pyramid", preset_ad_ganon_pyramid)

; BOSSES

cm_ad_presets_goto_boss:
	%cm_submenu("Bosses", cm_ad_presets_boss)

cm_ad_presets_boss:
	dw cm_ad_east_armos
	dw cm_ad_pod_helma
	dw cm_ad_hera_moldorm
	dw cm_ad_thieves_blind
	dw cm_ad_skull_mothula
	dw cm_ad_desert_lanmolas
	dw cm_ad_mire_vitreous
	dw cm_ad_swamp_arrghus
	dw cm_ad_ice_kholdstare
	dw cm_ad_trock_trinexx
	dw cm_ad_gtower_agahnim_2
	dw cm_ad_atower_agahnim
	dw cm_ad_ganon_pyramid
	dw #$0000
	%cm_header("BOSSES")
