cm_ad2020_submenu_presets:
    dw cm_ad2020_presets_goto_eastern
    dw cm_ad2020_presets_goto_pod
    dw cm_ad2020_presets_goto_escape
    dw cm_ad2020_presets_goto_hook
    dw cm_ad2020_presets_goto_thieves
    dw cm_ad2020_presets_goto_skull
    dw cm_ad2020_presets_goto_hera
    dw cm_ad2020_presets_goto_mire
    dw cm_ad2020_presets_goto_desert
    dw cm_ad2020_presets_goto_trock
    dw cm_ad2020_presets_goto_swamp
    dw cm_ad2020_presets_goto_ice
    dw cm_ad2020_presets_goto_gtower
    dw cm_ad2020_presets_goto_atower
    dw cm_ad2020_presets_goto_ganon
    dw cm_ad2020_presets_goto_boss
    dw #$0000
    %cm_header("ALL DUNGEONS PRESETS")

; EASTERN PALACE

cm_ad2020_presets_goto_eastern:
    %cm_submenu("Eastern Palace", cm_ad2020_presets_eastern)

cm_ad2020_presets_eastern:
    dw cm_ad2020_east_bed
    dw cm_ad2020_east_courtyard_1
    dw cm_ad2020_east_castle_entrance
    dw cm_ad2020_east_courtyard_2
    dw cm_ad2020_east_river_clip
    dw cm_ad2020_east_outside_palace
    dw cm_ad2020_east_entrance
    dw cm_ad2020_east_stalfos_room
    dw cm_ad2020_east_big_chest_room_1
    dw cm_ad2020_east_dark_antifairies_room
    dw cm_ad2020_east_dark_key_room
    dw cm_ad2020_east_big_key_dmg_boost
    dw cm_ad2020_east_big_chest_room_2
    dw cm_ad2020_east_gwg
    dw cm_ad2020_east_pot_room
    dw cm_ad2020_east_zeldagamer_room
    dw cm_ad2020_east_armos
    dw #$0000
    %cm_header("EASTERN PALACE")

cm_ad2020_east_bed:
    %cm_preset("Link's Bed", preset_ad2020_east_bed)

cm_ad2020_east_courtyard_1:
    %cm_preset("Courtyard 1", preset_ad2020_east_courtyard_1)

cm_ad2020_east_castle_entrance:
    %cm_preset("Castle Entrance", preset_ad2020_east_castle_entrance)

cm_ad2020_east_courtyard_2:
    %cm_preset("Courtyard 2", preset_ad2020_east_courtyard_2)

cm_ad2020_east_river_clip:
    %cm_preset("East River FAWT", preset_ad2020_east_river_clip)

cm_ad2020_east_outside_palace:
    %cm_preset("Eastern Overworld", preset_ad2020_east_outside_palace)

cm_ad2020_east_entrance:
    %cm_preset("Entrance", preset_ad2020_east_entrance)

cm_ad2020_east_stalfos_room:
    %cm_preset("Stalfos Room", preset_ad2020_east_stalfos_room)

cm_ad2020_east_big_chest_room_1:
    %cm_preset("Big Chest Room 1", preset_ad2020_east_big_chest_room_1)

cm_ad2020_east_dark_antifairies_room:
    %cm_preset("Dark Antifairies Room", preset_ad2020_east_dark_antifairies_room)

cm_ad2020_east_dark_key_room:
    %cm_preset("Dark Key Room", preset_ad2020_east_dark_key_room)

cm_ad2020_east_big_key_dmg_boost:
    %cm_preset("Big Key DMG Boost", preset_ad2020_east_big_key_dmg_boost)

cm_ad2020_east_big_chest_room_2:
    %cm_preset("Big Chest Room 2", preset_ad2020_east_big_chest_room_2)

cm_ad2020_east_gwg:
    %cm_preset("Gifted With Greenies", preset_ad2020_east_gwg)

cm_ad2020_east_pot_room:
    %cm_preset("Pot Room", preset_ad2020_east_pot_room)

cm_ad2020_east_zeldagamer_room:
    %cm_preset("Zeldagamer Room", preset_ad2020_east_zeldagamer_room)

cm_ad2020_east_armos:
    %cm_preset("Armos", preset_ad2020_east_armos)

; PALACE OF DARKNESS

cm_ad2020_presets_goto_pod:
    %cm_submenu("Palace of Darkness", cm_ad2020_presets_pod)

cm_ad2020_presets_pod:
    dw cm_ad2020_pod_outside_eastern
    dw cm_ad2020_pod_eastern_spinspeed
    dw cm_ad2020_pod_dma
    dw cm_ad2020_pod_death_mountain
    dw cm_ad2020_pod_kiki_yeet
    dw cm_ad2020_pod_kiki_skip
    dw cm_ad2020_pod_dungeon_reload
    dw cm_ad2020_pod_main_hub_bk
    dw cm_ad2020_pod_main_hub_hammerjump
    dw cm_ad2020_pod_hammerjump
    dw cm_ad2020_pod_archery_contest
    dw cm_ad2020_pod_sexy_statue
    dw cm_ad2020_pod_mimics
    dw cm_ad2020_pod_statue
    dw cm_ad2020_pod_basement
    dw cm_ad2020_pod_turtle_room
    dw cm_ad2020_pod_helma
    dw #$0000
    %cm_header("PALACE OF DARKNESS")

cm_ad2020_pod_outside_eastern:
    %cm_preset("Outside Eastern", preset_ad2020_pod_outside_eastern)

cm_ad2020_pod_eastern_spinspeed:
    %cm_preset("Eastern Spinspeed", preset_ad2020_pod_eastern_spinspeed)

cm_ad2020_pod_dma:
    %cm_preset("DMA", preset_ad2020_pod_dma)

cm_ad2020_pod_death_mountain:
    %cm_preset("Death Mountain", preset_ad2020_pod_death_mountain)

cm_ad2020_pod_kiki_yeet:
    %cm_preset("Kiki Yeet", preset_ad2020_pod_kiki_yeet)

cm_ad2020_pod_kiki_skip:
    %cm_preset("Kiki Skip", preset_ad2020_pod_kiki_skip)

cm_ad2020_pod_dungeon_reload:
    %cm_preset("Dungeon Reload", preset_ad2020_pod_dungeon_reload)

cm_ad2020_pod_main_hub_bk:
    %cm_preset("Main Hub (Big Key)", preset_ad2020_pod_main_hub_bk)

cm_ad2020_pod_main_hub_hammerjump:
    %cm_preset("Main Hub (Hammerjump)", preset_ad2020_pod_main_hub_hammerjump)

cm_ad2020_pod_hammerjump:
    %cm_preset("Hammerjump", preset_ad2020_pod_hammerjump)

cm_ad2020_pod_archery_contest:
    %cm_preset("Archery Contest", preset_ad2020_pod_archery_contest)

cm_ad2020_pod_sexy_statue:
    %cm_preset("Sexy Statue", preset_ad2020_pod_sexy_statue)

cm_ad2020_pod_mimics:
    %cm_preset("Mimics", preset_ad2020_pod_mimics)

cm_ad2020_pod_statue:
    %cm_preset("Statue", preset_ad2020_pod_statue)

cm_ad2020_pod_basement:
    %cm_preset("Basement", preset_ad2020_pod_basement)

cm_ad2020_pod_turtle_room:
    %cm_preset("Turtle Room", preset_ad2020_pod_turtle_room)

cm_ad2020_pod_helma:
    %cm_preset("Helma", preset_ad2020_pod_helma)

; HYRULE CASTLE

cm_ad2020_presets_goto_escape:
    %cm_submenu("Hyrule Castle", cm_ad2020_presets_escape)

cm_ad2020_presets_escape:
    dw cm_ad2020_esc_outside_pod
    dw cm_ad2020_esc_sanc_1
    dw cm_ad2020_esc_entrance
    dw cm_ad2020_esc_1st_keyguard
    dw cm_ad2020_esc_stealth_room
    dw cm_ad2020_esc_2nd_keyguard
    dw cm_ad2020_esc_zeldas_cell
    dw cm_ad2020_esc_sanc_2
    dw #$0000
    %cm_header("HYRULE CASTLE")

cm_ad2020_esc_outside_pod:
    %cm_preset("Outside PoD", preset_ad2020_esc_outside_pod)

cm_ad2020_esc_sanc_1:
    %cm_preset("River Clip", preset_ad2020_esc_sanc_1)

cm_ad2020_esc_entrance:
    %cm_preset("Entrance", preset_ad2020_esc_entrance)

cm_ad2020_esc_1st_keyguard:
    %cm_preset("1st Key Guard", preset_ad2020_esc_1st_keyguard)

cm_ad2020_esc_stealth_room:
    %cm_preset("Not So Stealth Room", preset_ad2020_esc_stealth_room)

cm_ad2020_esc_2nd_keyguard:
    %cm_preset("2nd Key Guard", preset_ad2020_esc_2nd_keyguard)

cm_ad2020_esc_zeldas_cell:
    %cm_preset("Zelda's Cell", preset_ad2020_esc_zeldas_cell)

cm_ad2020_esc_sanc_2:
    %cm_preset("Sanctuary", preset_ad2020_esc_sanc_2)

; EARLY HOOKSHOT

cm_ad2020_presets_goto_hook:
    %cm_submenu("Early Hookshot", cm_ad2020_presets_hook)

cm_ad2020_presets_hook:
    dw cm_ad2020_hook_old_man_cave
    dw cm_ad2020_hook_entrance
    dw cm_ad2020_hook_hera_to_sewers_clip
    dw cm_ad2020_hook_tile_room
    dw cm_ad2020_hook_minimoldorm_switch
    dw cm_ad2020_hook_torches
    dw cm_ad2020_hook_beetles
    dw cm_ad2020_hook_petting_zoo
    dw cm_ad2020_hook_fake_clippers
    dw cm_ad2020_hook_hookshot
    dw #$0000
    %cm_header("EARLY HOOKSHOT")

cm_ad2020_hook_old_man_cave:
    %cm_preset("Old Man Cave", preset_ad2020_hook_old_man_cave)

cm_ad2020_hook_entrance:
    %cm_preset("Hera Entrance", preset_ad2020_hook_entrance)

cm_ad2020_hook_hera_to_sewers_clip:
    %cm_preset("Hera to Sewers Clip", preset_ad2020_hook_hera_to_sewers_clip)

cm_ad2020_hook_tile_room:
    %cm_preset("Tile room", preset_ad2020_hook_tile_room)

cm_ad2020_hook_minimoldorm_switch:
    %cm_preset("Mini Moldorm Switch", preset_ad2020_hook_minimoldorm_switch)

cm_ad2020_hook_torches:
    %cm_preset("Torches", preset_ad2020_hook_torches)

cm_ad2020_hook_beetles:
    %cm_preset("Beetles", preset_ad2020_hook_beetles)

cm_ad2020_hook_petting_zoo:
    %cm_preset("Petting Zoo", preset_ad2020_hook_petting_zoo)

cm_ad2020_hook_fake_clippers:
    %cm_preset("Fake Clippers", preset_ad2020_hook_fake_clippers)

cm_ad2020_hook_hookshot:
    %cm_preset("Hookshot", preset_ad2020_hook_hookshot)

; THIEVES TOWN

cm_ad2020_presets_goto_thieves:
    %cm_submenu("Thieves' Town", cm_ad2020_presets_thieves)

cm_ad2020_presets_thieves:
    dw cm_ad2020_thieves_outside_hera
    dw cm_ad2020_thieves_dmd
    dw cm_ad2020_thieves_entrance
    dw cm_ad2020_thieves_after_big_key
    dw cm_ad2020_thieves_blind_hallway
    dw cm_ad2020_thieves_conveyor_gibos
    dw cm_ad2020_thieves_hellway
    dw cm_ad2020_thieves_bombable_floor
    dw cm_ad2020_thieves_backtracking_1
    dw cm_ad2020_thieves_basement
    dw cm_ad2020_thieves_prison
    dw cm_ad2020_thieves_mitts
    dw cm_ad2020_thieves_backtracking_2
    dw cm_ad2020_thieves_pot_hammerdash
    dw cm_ad2020_thieves_blind
    dw #$0000
    %cm_header("THIEVES TOWN")

cm_ad2020_thieves_outside_hera:
    %cm_preset("Outside Hera", preset_ad2020_thieves_outside_hera)

cm_ad2020_thieves_dmd:
    %cm_preset("DMD", preset_ad2020_thieves_dmd)

cm_ad2020_thieves_entrance:
    %cm_preset("Entrance", preset_ad2020_thieves_entrance)

cm_ad2020_thieves_after_big_key:
    %cm_preset("After Big Key", preset_ad2020_thieves_after_big_key)

cm_ad2020_thieves_blind_hallway:
    %cm_preset("Stalfos Hallway", preset_ad2020_thieves_blind_hallway)

cm_ad2020_thieves_conveyor_gibos:
    %cm_preset("Conveyor Gibos", preset_ad2020_thieves_conveyor_gibos)

cm_ad2020_thieves_hellway:
    %cm_preset("Hellway", preset_ad2020_thieves_hellway)

cm_ad2020_thieves_bombable_floor:
    %cm_preset("Bombable Floor", preset_ad2020_thieves_bombable_floor)

cm_ad2020_thieves_backtracking_1:
    %cm_preset("Backtracking", preset_ad2020_thieves_backtracking_1)

cm_ad2020_thieves_basement:
    %cm_preset("Basement", preset_ad2020_thieves_basement)

cm_ad2020_thieves_prison:
    %cm_preset("Prison", preset_ad2020_thieves_prison)

cm_ad2020_thieves_mitts:
    %cm_preset("Mitts", preset_ad2020_thieves_mitts)

cm_ad2020_thieves_backtracking_2:
    %cm_preset("Backtracking", preset_ad2020_thieves_backtracking_2)

cm_ad2020_thieves_pot_hammerdash:
    %cm_preset("Pot Hammerdash", preset_ad2020_thieves_pot_hammerdash)

cm_ad2020_thieves_blind:
    %cm_preset("Blind", preset_ad2020_thieves_blind)

; SKULL WOODS

cm_ad2020_presets_goto_skull:
    %cm_submenu("Skull Woods", cm_ad2020_presets_skull)

cm_ad2020_presets_skull:
    dw cm_ad2020_sw_outside_thieves
    dw cm_ad2020_sw_frogdor
    dw cm_ad2020_sw_getting_tempered
    dw cm_ad2020_sw_fencedash
    dw cm_ad2020_sw_dash_to_sw
    dw cm_ad2020_sw_mummy_room
    dw cm_ad2020_sw_bomb_jump
    dw cm_ad2020_sw_key_pot
    dw cm_ad2020_sw_skull_entrance
    dw cm_ad2020_sw_mummy_hellway
    dw cm_ad2020_sw_mummy_key
    dw cm_ad2020_sw_mothula
    dw #$0000
    %cm_header("SKULL WOODS")

cm_ad2020_sw_outside_thieves:
    %cm_preset("Outside Thieves", preset_ad2020_sw_outside_thieves)

cm_ad2020_sw_frogdor:
    %cm_preset("Frogdor", preset_ad2020_sw_frogdor)

cm_ad2020_sw_getting_tempered:
    %cm_preset("Getting Tempered", preset_ad2020_sw_getting_tempered)

cm_ad2020_sw_fencedash:
    %cm_preset("Fencedash", preset_ad2020_sw_fencedash)

cm_ad2020_sw_dash_to_sw:
    %cm_preset("Dash to Skull Woods", preset_ad2020_sw_dash_to_sw)

cm_ad2020_sw_mummy_room:
    %cm_preset("Mummy Room", preset_ad2020_sw_mummy_room)

cm_ad2020_sw_bomb_jump:
    %cm_preset("Bomb Jump", preset_ad2020_sw_bomb_jump)

cm_ad2020_sw_key_pot:
    %cm_preset("Key Pot", preset_ad2020_sw_key_pot)

cm_ad2020_sw_skull_entrance:
    %cm_preset("Skull Entrance", preset_ad2020_sw_skull_entrance)

cm_ad2020_sw_mummy_hellway:
    %cm_preset("Mummy Hellway", preset_ad2020_sw_mummy_hellway)

cm_ad2020_sw_mummy_key:
    %cm_preset("Mummy Key", preset_ad2020_sw_mummy_key)

cm_ad2020_sw_mothula:
    %cm_preset("Mothula", preset_ad2020_sw_mothula)

; TOWER OF HERA

cm_ad2020_presets_goto_hera:
    %cm_submenu("Tower of Hera", cm_ad2020_presets_hera)

cm_ad2020_presets_hera:
    dw cm_ad2020_hera_outside_skull
    dw cm_ad2020_hera_old_man_cave
    dw cm_ad2020_hera_entrance
    dw cm_ad2020_hera_moldorm
    dw #$0000
    %cm_header("TOWER OF HERA")

cm_ad2020_hera_outside_skull:
    %cm_preset("Outside Skull", preset_ad2020_hera_outside_skull)

cm_ad2020_hera_old_man_cave:
    %cm_preset("Old Man Cave", preset_ad2020_hera_old_man_cave)

cm_ad2020_hera_entrance:
    %cm_preset("Entrance", preset_ad2020_hera_entrance)

cm_ad2020_hera_moldorm:
    %cm_preset("Moldorm", preset_ad2020_hera_moldorm)

; MISERY MIRE

cm_ad2020_presets_goto_mire:
    %cm_submenu("Misery Mire", cm_ad2020_presets_mire)

cm_ad2020_presets_mire:
    dw cm_ad2020_mire_outside_hera
    dw cm_ad2020_mire_swamp_dmd
    dw cm_ad2020_mire_overworld
    dw cm_ad2020_mire_entrance
    dw cm_ad2020_mire_mire2
    dw cm_ad2020_mire_main_hub
    dw cm_ad2020_mire_beat_the_fireball
    dw cm_ad2020_mire_bari_key
    dw cm_ad2020_mire_sluggulas
    dw cm_ad2020_mire_torches
    dw cm_ad2020_mire_spark_gamble
    dw cm_ad2020_mire_big_chest_room
    dw cm_ad2020_mire_spike_key
    dw cm_ad2020_mire_wizzrobe
    dw cm_ad2020_mire_bridge_room
    dw cm_ad2020_mire_canedash
    dw cm_ad2020_mire_spooky_action
    dw cm_ad2020_mire_vitty
    dw #$0000
    %cm_header("MISERY MIRE")

cm_ad2020_mire_outside_hera:
    %cm_preset("Outside Hera", preset_ad2020_mire_outside_hera)

cm_ad2020_mire_swamp_dmd:
    %cm_preset("Swamp DMD", preset_ad2020_mire_swamp_dmd)

cm_ad2020_mire_overworld:
    %cm_preset("Swamp of Evil", preset_ad2020_mire_overworld)

cm_ad2020_mire_entrance:
    %cm_preset("Entrance", preset_ad2020_mire_entrance)

cm_ad2020_mire_mire2:
    %cm_preset("Mire 2", preset_ad2020_mire_mire2)

cm_ad2020_mire_main_hub:
    %cm_preset("Main Hub", preset_ad2020_mire_main_hub)

cm_ad2020_mire_beat_the_fireball:
    %cm_preset("Beat the Fireball", preset_ad2020_mire_beat_the_fireball)

cm_ad2020_mire_bari_key:
    %cm_preset("Bari Key", preset_ad2020_mire_bari_key)

cm_ad2020_mire_sluggulas:
    %cm_preset("Sluggulas", preset_ad2020_mire_sluggulas)

cm_ad2020_mire_torches:
    %cm_preset("Torches", preset_ad2020_mire_torches)

cm_ad2020_mire_spark_gamble:
    %cm_preset("Spark Gamble", preset_ad2020_mire_spark_gamble)

cm_ad2020_mire_big_chest_room:
    %cm_preset("Big Chest Room", preset_ad2020_mire_big_chest_room)

cm_ad2020_mire_spike_key:
    %cm_preset("Spike Key", preset_ad2020_mire_spike_key)

cm_ad2020_mire_wizzrobe:
    %cm_preset("Wizzrobe", preset_ad2020_mire_wizzrobe)

cm_ad2020_mire_bridge_room:
    %cm_preset("Bridge Room", preset_ad2020_mire_bridge_room)

cm_ad2020_mire_canedash:
    %cm_preset("Canedash", preset_ad2020_mire_canedash)

cm_ad2020_mire_spooky_action:
    %cm_preset("Spooky Action", preset_ad2020_mire_spooky_action)

cm_ad2020_mire_vitty:
    %cm_preset("Vitreous", preset_ad2020_mire_vitty)

; DESERT PALACE

cm_ad2020_presets_goto_desert:
    %cm_submenu("Desert Palace", cm_ad2020_presets_desert)

cm_ad2020_presets_desert:
    dw cm_ad2020_desert_outside_mire
    dw cm_ad2020_desert_entrance
    dw cm_ad2020_desert_torch_key
    dw cm_ad2020_desert_pre_cannonball_room
    dw cm_ad2020_desert_desert2_spinspeed
    dw cm_ad2020_desert_popo_genocide_room
    dw cm_ad2020_desert_torches
    dw cm_ad2020_desert_lanmolas
    dw #$0000
    %cm_header("DESERT PALACE")

cm_ad2020_desert_outside_mire:
    %cm_preset("Outside Mire", preset_ad2020_desert_outside_mire)

cm_ad2020_desert_entrance:
    %cm_preset("Entrance", preset_ad2020_desert_entrance)

cm_ad2020_desert_torch_key:
    %cm_preset("Torch Key", preset_ad2020_desert_torch_key)

cm_ad2020_desert_pre_cannonball_room:
    %cm_preset("Pre Cannonball Room", preset_ad2020_desert_pre_cannonball_room)

cm_ad2020_desert_desert2_spinspeed:
    %cm_preset("Desert 2 Spinspeed", preset_ad2020_desert_desert2_spinspeed)

cm_ad2020_desert_popo_genocide_room:
    %cm_preset("Popo Genocide", preset_ad2020_desert_popo_genocide_room)

cm_ad2020_desert_torches:
    %cm_preset("Torches", preset_ad2020_desert_torches)

cm_ad2020_desert_lanmolas:
    %cm_preset("Lanmolas", preset_ad2020_desert_lanmolas)

; TURTLE ROCK

cm_ad2020_presets_goto_trock:
    %cm_submenu("Turtle Rock", cm_ad2020_presets_trock)

cm_ad2020_presets_trock:
    dw cm_ad2020_trock_outside_desert
    dw cm_ad2020_trock_old_man_cave
    dw cm_ad2020_trock_tr_climb
    dw cm_ad2020_trock_laser_entrance
    dw cm_ad2020_trock_crystal_roller
    dw cm_ad2020_trock_pokey_1
    dw cm_ad2020_trock_laser_entrance_2
    dw cm_ad2020_trock_switch_maze
    dw cm_ad2020_trock_trinexx
    dw #$0000
    %cm_header("TURTLE ROCK")

cm_ad2020_trock_outside_desert:
    %cm_preset("Outside Desert", preset_ad2020_trock_outside_desert)

cm_ad2020_trock_old_man_cave:
    %cm_preset("Old Man Cave", preset_ad2020_trock_old_man_cave)

cm_ad2020_trock_tr_climb:
    %cm_preset("TR Climb", preset_ad2020_trock_tr_climb)

cm_ad2020_trock_laser_entrance:
    %cm_preset("Laser Entrance", preset_ad2020_trock_laser_entrance)

cm_ad2020_trock_crystal_roller:
    %cm_preset("Crystal Roller", preset_ad2020_trock_crystal_roller)

cm_ad2020_trock_pokey_1:
    %cm_preset("Pokey 1", preset_ad2020_trock_pokey_1)

cm_ad2020_trock_laser_entrance_2:
    %cm_preset("Laser Entrance 2", preset_ad2020_trock_laser_entrance_2)

cm_ad2020_trock_switch_maze:
    %cm_preset("Switch Maze", preset_ad2020_trock_switch_maze)

cm_ad2020_trock_trinexx:
    %cm_preset("Trinexx", preset_ad2020_trock_trinexx)

; SWAMP PALACE

cm_ad2020_presets_goto_swamp:
    %cm_submenu("Swamp Palace", cm_ad2020_presets_swamp)

cm_ad2020_presets_swamp:
    dw cm_ad2020_swamp_outside_trock
    dw cm_ad2020_swamp_zoras_domain
    dw cm_ad2020_swamp_links_house
    dw cm_ad2020_swamp_swamp_overworld
    dw cm_ad2020_swamp_antifairy_room
    dw cm_ad2020_swamp_entrance
    dw cm_ad2020_swamp_first_key_pot
    dw cm_ad2020_swamp_main_hub
    dw cm_ad2020_swamp_diver_down
    dw cm_ad2020_swamp_restock
    dw cm_ad2020_swamp_phelps_way
    dw cm_ad2020_swamp_arrghus
    dw #$0000
    %cm_header("SWAMP PALACE")

cm_ad2020_swamp_outside_trock:
    %cm_preset("Outside Turtle Rock", preset_ad2020_swamp_outside_trock)

cm_ad2020_swamp_zoras_domain:
    %cm_preset("Zora's Domain", preset_ad2020_swamp_zoras_domain)

cm_ad2020_swamp_links_house:
    %cm_preset("Link's House", preset_ad2020_swamp_links_house)

cm_ad2020_swamp_swamp_overworld:
    %cm_preset("Swamp Overworld", preset_ad2020_swamp_swamp_overworld)

cm_ad2020_swamp_antifairy_room:
    %cm_preset("Antifairy Room", preset_ad2020_swamp_antifairy_room)

cm_ad2020_swamp_entrance:
    %cm_preset("Entrance", preset_ad2020_swamp_entrance)

cm_ad2020_swamp_first_key_pot:
    %cm_preset("First Key Pot", preset_ad2020_swamp_first_key_pot)

cm_ad2020_swamp_main_hub:
    %cm_preset("Main Hub", preset_ad2020_swamp_main_hub)

cm_ad2020_swamp_diver_down:
    %cm_preset("Diver Down", preset_ad2020_swamp_diver_down)

cm_ad2020_swamp_restock:
    %cm_preset("Restock Room", preset_ad2020_swamp_restock)

cm_ad2020_swamp_phelps_way:
    %cm_preset("Phelps Way", preset_ad2020_swamp_phelps_way)

cm_ad2020_swamp_arrghus:
    %cm_preset("Arrghus", preset_ad2020_swamp_arrghus)

; ICE PALACE

cm_ad2020_presets_goto_ice:
    %cm_submenu("Ice Palace", cm_ad2020_presets_ice)

cm_ad2020_presets_ice:
    dw cm_ad2020_ice_outside_swamp
    dw cm_ad2020_ice_ice_entrance
    dw cm_ad2020_ice_penguin_switch_room
    dw cm_ad2020_ice_get_ready_to_break_the_ice
    dw cm_ad2020_ice_spike_key
    dw cm_ad2020_ice_lonely_firebar
    dw cm_ad2020_ice_last_two_screens
    dw cm_ad2020_ice_kholdstare
    dw #$0000
    %cm_header("ICE PALACE")

cm_ad2020_ice_outside_swamp:
    %cm_preset("Outside Swamp", preset_ad2020_ice_outside_swamp)

cm_ad2020_ice_ice_entrance:
    %cm_preset("Entrance", preset_ad2020_ice_ice_entrance)

cm_ad2020_ice_penguin_switch_room:
    %cm_preset("Penguin Switch Room", preset_ad2020_ice_penguin_switch_room)

cm_ad2020_ice_get_ready_to_break_the_ice:
    %cm_preset("Break the Ice", preset_ad2020_ice_get_ready_to_break_the_ice)

cm_ad2020_ice_spike_key:
    %cm_preset("Spike Key", preset_ad2020_ice_spike_key)

cm_ad2020_ice_lonely_firebar:
    %cm_preset("Lonely Firebar", preset_ad2020_ice_lonely_firebar)

cm_ad2020_ice_last_two_screens:
    %cm_preset("Last Two Screens", preset_ad2020_ice_last_two_screens)

cm_ad2020_ice_kholdstare:
    %cm_preset("Kholdstare", preset_ad2020_ice_kholdstare)

; GANONS TOWER

cm_ad2020_presets_goto_gtower:
    %cm_submenu("Ganon's Tower", cm_ad2020_presets_gtower)

cm_ad2020_presets_gtower:
    dw cm_ad2020_gtower_outside_ice
    dw cm_ad2020_gtower_old_man_cave
    dw cm_ad2020_gtower_entrance
    dw cm_ad2020_gtower_spike_skip
    dw cm_ad2020_gtower_pre_firesnakes_room
    dw cm_ad2020_gtower_bombable_floor
    dw cm_ad2020_gtower_floor_2
    dw cm_ad2020_gtower_mimics1
    dw cm_ad2020_gtower_mimics2
    dw cm_ad2020_gtower_spike_room
    dw cm_ad2020_gtower_gauntlet
    dw cm_ad2020_gtower_gauntlet_3
    dw cm_ad2020_gtower_lanmola2
    dw cm_ad2020_gtower_wizz1
    dw cm_ad2020_gtower_wizz2
    dw cm_ad2020_gtower_torches1
    dw cm_ad2020_gtower_torches2
    dw cm_ad2020_gtower_helma_key
    dw cm_ad2020_gtower_bombable_wall
    dw cm_ad2020_gtower_moldorm_2
    dw cm_ad2020_gtower_agahnim_2
    dw #$0000
    %cm_header("GANONS TOWER")

cm_ad2020_gtower_outside_ice:
    %cm_preset("Outside Ice", preset_ad2020_gtower_outside_ice)

cm_ad2020_gtower_old_man_cave:
    %cm_preset("Old Man Cave", preset_ad2020_gtower_old_man_cave)

cm_ad2020_gtower_entrance:
    %cm_preset("Entrance", preset_ad2020_gtower_entrance)

cm_ad2020_gtower_spike_skip:
    %cm_preset("Spike Skip", preset_ad2020_gtower_spike_skip)

cm_ad2020_gtower_pre_firesnakes_room:
    %cm_preset("Pre Firesnakes Room", preset_ad2020_gtower_pre_firesnakes_room)

cm_ad2020_gtower_bombable_floor:
    %cm_preset("Bombable Floor", preset_ad2020_gtower_bombable_floor)

cm_ad2020_gtower_floor_2:
    %cm_preset("Floor 2", preset_ad2020_gtower_floor_2)

cm_ad2020_gtower_mimics1:
    %cm_preset("Mimics 1", preset_ad2020_gtower_mimics1)

cm_ad2020_gtower_mimics2:
    %cm_preset("Mimics 2", preset_ad2020_gtower_mimics2)

cm_ad2020_gtower_spike_room:
    %cm_preset("Spike Pit", preset_ad2020_gtower_spike_room)

cm_ad2020_gtower_gauntlet:
    %cm_preset("Gauntlet 1", preset_ad2020_gtower_gauntlet)

cm_ad2020_gtower_gauntlet_3:
    %cm_preset("Gauntlet 3", preset_ad2020_gtower_gauntlet_3)

cm_ad2020_gtower_lanmola2:
    %cm_preset("Lanmola 2", preset_ad2020_gtower_lanmola2)

cm_ad2020_gtower_wizz1:
    %cm_preset("Wizzrobes 1", preset_ad2020_gtower_wizz1)

cm_ad2020_gtower_wizz2:
    %cm_preset("Wizzrobes 2", preset_ad2020_gtower_wizz2)

cm_ad2020_gtower_torches1:
    %cm_preset("Torches 1", preset_ad2020_gtower_torches1)

cm_ad2020_gtower_torches2:
    %cm_preset("Torches 2", preset_ad2020_gtower_torches2)

cm_ad2020_gtower_helma_key:
    %cm_preset("Helma Key", preset_ad2020_gtower_helma_key)

cm_ad2020_gtower_bombable_wall:
    %cm_preset("Bombable Wall", preset_ad2020_gtower_bombable_wall)

cm_ad2020_gtower_moldorm_2:
    %cm_preset("Moldorm 2", preset_ad2020_gtower_moldorm_2)

cm_ad2020_gtower_agahnim_2:
    %cm_preset("Agahnim 2", preset_ad2020_gtower_agahnim_2)

; AGAHNIMS TOWER

cm_ad2020_presets_goto_atower:
    %cm_submenu("Agahnim's Tower", cm_ad2020_presets_atower)

cm_ad2020_presets_atower:
    dw cm_ad2020_aga_pyramid
    dw cm_ad2020_aga_gold_knights
    dw cm_ad2020_aga_dark_room_of_despair
    dw cm_ad2020_aga_dark_room_of_melancholy
    dw cm_ad2020_aga_spear_guards
    dw cm_ad2020_aga_circle_of_pots
    dw cm_ad2020_aga_catwalk
    dw cm_ad2020_aga_agahnim
    dw #$0000
    %cm_header("AGAHNIMS TOWER")

cm_ad2020_aga_pyramid:
    %cm_preset("Pyramid", preset_ad2020_aga_pyramid)

cm_ad2020_aga_gold_knights:
    %cm_preset("Gold Knights", preset_ad2020_aga_gold_knights)

cm_ad2020_aga_dark_room_of_despair:
    %cm_preset("Dark Room of Despair", preset_ad2020_aga_dark_room_of_despair)

cm_ad2020_aga_dark_room_of_melancholy:
    %cm_preset("Dark Room of Melancholy", preset_ad2020_aga_dark_room_of_melancholy)

cm_ad2020_aga_spear_guards:
    %cm_preset("Spear Guards", preset_ad2020_aga_spear_guards)

cm_ad2020_aga_circle_of_pots:
    %cm_preset("Circle of Pots", preset_ad2020_aga_circle_of_pots)

cm_ad2020_aga_catwalk:
    %cm_preset("Catwalk", preset_ad2020_aga_catwalk)

cm_ad2020_aga_agahnim:
    %cm_preset("Agahnim", preset_ad2020_aga_agahnim)

; GANON

cm_ad2020_presets_goto_ganon:
    %cm_submenu("Ganon", cm_ad2020_presets_ganon)

cm_ad2020_presets_ganon:
    dw cm_ad2020_ganon_pyramid
    dw #$0000
    %cm_header("GANON")

cm_ad2020_ganon_pyramid:
    %cm_preset("Pyramid", preset_ad2020_ganon_pyramid)

; BOSSES

cm_ad2020_presets_goto_boss:
    %cm_submenu("Bosses", cm_ad2020_presets_boss)

cm_ad2020_presets_boss:
    dw cm_ad2020_east_armos
    dw cm_ad2020_pod_helma
    dw cm_ad2020_thieves_blind
    dw cm_ad2020_sw_mothula
    dw cm_ad2020_hera_moldorm
    dw cm_ad2020_mire_vitty
    dw cm_ad2020_desert_lanmolas
    dw cm_ad2020_trock_trinexx
    dw cm_ad2020_swamp_arrghus
    dw cm_ad2020_ice_kholdstare
    dw cm_ad2020_gtower_agahnim_2
    dw cm_ad2020_aga_agahnim
    dw cm_ad2020_ganon_pyramid
    dw #$0000
    %cm_header("BOSSES")
