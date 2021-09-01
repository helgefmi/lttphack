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
    dw cm_ad2020_presets_goto_aga
    dw cm_ad2020_presets_goto_ganon
    dw cm_ad2020_presets_goto_boss
    dw $0000
    %menu_header("ALL DUNGEONS PRESETS")

; EASTERN PALACE

cm_ad2020_presets_goto_eastern:
    %submenu("Eastern Palace", cm_ad2020_presets_eastern)

cm_ad2020_presets_eastern:
    dw cm_ad2020_eastern_bed
    dw cm_ad2020_eastern_courtyard_1
    dw cm_ad2020_eastern_castle_entrance
    dw cm_ad2020_eastern_courtyard_2
    dw cm_ad2020_eastern_river_clip
    dw cm_ad2020_eastern_outside_palace
    dw cm_ad2020_eastern_entrance
    dw cm_ad2020_eastern_stalfos_room
    dw cm_ad2020_eastern_big_chest_room_1
    dw cm_ad2020_eastern_dark_antifairies_room
    dw cm_ad2020_eastern_dark_key_room
    dw cm_ad2020_eastern_big_key_dmg_boost
    dw cm_ad2020_eastern_big_chest_room_2
    dw cm_ad2020_eastern_gwg
    dw cm_ad2020_eastern_pot_room
    dw cm_ad2020_eastern_zeldagamer_room
    dw cm_ad2020_eastern_armos
    dw $0000
    %menu_header("EASTERN PALACE")

cm_ad2020_eastern_bed:
    %preset("Link's Bed", preset_ad2020_eastern_bed)

cm_ad2020_eastern_courtyard_1:
    %preset("Courtyard 1", preset_ad2020_eastern_courtyard_1)

cm_ad2020_eastern_castle_entrance:
    %preset("Castle Entrance", preset_ad2020_eastern_castle_entrance)

cm_ad2020_eastern_courtyard_2:
    %preset("Courtyard 2", preset_ad2020_eastern_courtyard_2)

cm_ad2020_eastern_river_clip:
    %preset("East River FAWT", preset_ad2020_eastern_river_clip)

cm_ad2020_eastern_outside_palace:
    %preset("Eastern Overworld", preset_ad2020_eastern_outside_palace)

cm_ad2020_eastern_entrance:
    %preset("Entrance", preset_ad2020_eastern_entrance)

cm_ad2020_eastern_stalfos_room:
    %preset("Stalfos Room", preset_ad2020_eastern_stalfos_room)

cm_ad2020_eastern_big_chest_room_1:
    %preset("Big Chest Room 1", preset_ad2020_eastern_big_chest_room_1)

cm_ad2020_eastern_dark_antifairies_room:
    %preset("Dark Antifairies Room", preset_ad2020_eastern_dark_antifairies_room)

cm_ad2020_eastern_dark_key_room:
    %preset("Dark Key Room", preset_ad2020_eastern_dark_key_room)

cm_ad2020_eastern_big_key_dmg_boost:
    %preset("Big Key DMG Boost", preset_ad2020_eastern_big_key_dmg_boost)

cm_ad2020_eastern_big_chest_room_2:
    %preset("Big Chest Room 2", preset_ad2020_eastern_big_chest_room_2)

cm_ad2020_eastern_gwg:
    %preset("Gifted With Greenies", preset_ad2020_eastern_gwg)

cm_ad2020_eastern_pot_room:
    %preset("Pot Room", preset_ad2020_eastern_pot_room)

cm_ad2020_eastern_zeldagamer_room:
    %preset("Zeldagamer Room", preset_ad2020_eastern_zeldagamer_room)

cm_ad2020_eastern_armos:
    %preset("Armos", preset_ad2020_eastern_armos)

; PALACE OF DARKNESS

cm_ad2020_presets_goto_pod:
    %submenu("Palace of Darkness", cm_ad2020_presets_pod)

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
    dw $0000
    %menu_header("PALACE OF DARKNESS")

cm_ad2020_pod_outside_eastern:
    %preset("Outside Eastern", preset_ad2020_pod_outside_eastern)

cm_ad2020_pod_eastern_spinspeed:
    %preset("Eastern Spinspeed", preset_ad2020_pod_eastern_spinspeed)

cm_ad2020_pod_dma:
    %preset("DMA", preset_ad2020_pod_dma)

cm_ad2020_pod_death_mountain:
    %preset("Death Mountain", preset_ad2020_pod_death_mountain)

cm_ad2020_pod_kiki_yeet:
    %preset("Kiki Yeet", preset_ad2020_pod_kiki_yeet)

cm_ad2020_pod_kiki_skip:
    %preset("Kiki Skip", preset_ad2020_pod_kiki_skip)

cm_ad2020_pod_dungeon_reload:
    %preset("Dungeon Reload", preset_ad2020_pod_dungeon_reload)

cm_ad2020_pod_main_hub_bk:
    %preset("Main Hub (Big Key)", preset_ad2020_pod_main_hub_bk)

cm_ad2020_pod_main_hub_hammerjump:
    %preset("Main Hub (Hammerjump)", preset_ad2020_pod_main_hub_hammerjump)

cm_ad2020_pod_hammerjump:
    %preset("Hammerjump", preset_ad2020_pod_hammerjump)

cm_ad2020_pod_archery_contest:
    %preset("Archery Contest", preset_ad2020_pod_archery_contest)

cm_ad2020_pod_sexy_statue:
    %preset("Sexy Statue", preset_ad2020_pod_sexy_statue)

cm_ad2020_pod_mimics:
    %preset("Mimics", preset_ad2020_pod_mimics)

cm_ad2020_pod_statue:
    %preset("Statue", preset_ad2020_pod_statue)

cm_ad2020_pod_basement:
    %preset("Basement", preset_ad2020_pod_basement)

cm_ad2020_pod_turtle_room:
    %preset("Turtle Room", preset_ad2020_pod_turtle_room)

cm_ad2020_pod_helma:
    %preset("Helma", preset_ad2020_pod_helma)

; HYRULE CASTLE

cm_ad2020_presets_goto_escape:
    %submenu("Hyrule Castle", cm_ad2020_presets_escape)

cm_ad2020_presets_escape:
    dw cm_ad2020_escape_outside_pod
    dw cm_ad2020_escape_sanc_1
    dw cm_ad2020_escape_entrance
    dw cm_ad2020_escape_1st_keyguard
    dw cm_ad2020_escape_stealth_room
    dw cm_ad2020_escape_2nd_keyguard
    dw cm_ad2020_escape_zeldas_cell
    dw cm_ad2020_escape_sanc_2
    dw $0000
    %menu_header("HYRULE CASTLE")

cm_ad2020_escape_outside_pod:
    %preset("Outside PoD", preset_ad2020_escape_outside_pod)

cm_ad2020_escape_sanc_1:
    %preset("River Clip", preset_ad2020_escape_sanc_1)

cm_ad2020_escape_entrance:
    %preset("Entrance", preset_ad2020_escape_entrance)

cm_ad2020_escape_1st_keyguard:
    %preset("1st Key Guard", preset_ad2020_escape_1st_keyguard)

cm_ad2020_escape_stealth_room:
    %preset("Not So Stealth Room", preset_ad2020_escape_stealth_room)

cm_ad2020_escape_2nd_keyguard:
    %preset("2nd Key Guard", preset_ad2020_escape_2nd_keyguard)

cm_ad2020_escape_zeldas_cell:
    %preset("Zelda's Cell", preset_ad2020_escape_zeldas_cell)

cm_ad2020_escape_sanc_2:
    %preset("Sanctuary", preset_ad2020_escape_sanc_2)

; EARLY HOOKSHOT

cm_ad2020_presets_goto_hook:
    %submenu("Early Hookshot", cm_ad2020_presets_hook)

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
    dw $0000
    %menu_header("EARLY HOOKSHOT")

cm_ad2020_hook_old_man_cave:
    %preset("Old Man Cave", preset_ad2020_hook_old_man_cave)

cm_ad2020_hook_entrance:
    %preset("Hera Entrance", preset_ad2020_hook_entrance)

cm_ad2020_hook_hera_to_sewers_clip:
    %preset("Hera to Sewers Clip", preset_ad2020_hook_hera_to_sewers_clip)

cm_ad2020_hook_tile_room:
    %preset("Tile room", preset_ad2020_hook_tile_room)

cm_ad2020_hook_minimoldorm_switch:
    %preset("Mini Moldorm Switch", preset_ad2020_hook_minimoldorm_switch)

cm_ad2020_hook_torches:
    %preset("Torches", preset_ad2020_hook_torches)

cm_ad2020_hook_beetles:
    %preset("Beetles", preset_ad2020_hook_beetles)

cm_ad2020_hook_petting_zoo:
    %preset("Petting Zoo", preset_ad2020_hook_petting_zoo)

cm_ad2020_hook_fake_clippers:
    %preset("Fake Clippers", preset_ad2020_hook_fake_clippers)

cm_ad2020_hook_hookshot:
    %preset("Hookshot", preset_ad2020_hook_hookshot)

; THIEVES TOWN

cm_ad2020_presets_goto_thieves:
    %submenu("Thieves' Town", cm_ad2020_presets_thieves)

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
    dw $0000
    %menu_header("THIEVES TOWN")

cm_ad2020_thieves_outside_hera:
    %preset("Outside Hera", preset_ad2020_thieves_outside_hera)

cm_ad2020_thieves_dmd:
    %preset("DMD", preset_ad2020_thieves_dmd)

cm_ad2020_thieves_entrance:
    %preset("Entrance", preset_ad2020_thieves_entrance)

cm_ad2020_thieves_after_big_key:
    %preset("After Big Key", preset_ad2020_thieves_after_big_key)

cm_ad2020_thieves_blind_hallway:
    %preset("Stalfos Hallway", preset_ad2020_thieves_blind_hallway)

cm_ad2020_thieves_conveyor_gibos:
    %preset("Conveyor Gibos", preset_ad2020_thieves_conveyor_gibos)

cm_ad2020_thieves_hellway:
    %preset("Hellway", preset_ad2020_thieves_hellway)

cm_ad2020_thieves_bombable_floor:
    %preset("Bombable Floor", preset_ad2020_thieves_bombable_floor)

cm_ad2020_thieves_backtracking_1:
    %preset("Backtracking", preset_ad2020_thieves_backtracking_1)

cm_ad2020_thieves_basement:
    %preset("Basement", preset_ad2020_thieves_basement)

cm_ad2020_thieves_prison:
    %preset("Prison", preset_ad2020_thieves_prison)

cm_ad2020_thieves_mitts:
    %preset("Mitts", preset_ad2020_thieves_mitts)

cm_ad2020_thieves_backtracking_2:
    %preset("Backtracking", preset_ad2020_thieves_backtracking_2)

cm_ad2020_thieves_pot_hammerdash:
    %preset("Pot Hammerdash", preset_ad2020_thieves_pot_hammerdash)

cm_ad2020_thieves_blind:
    %preset("Blind", preset_ad2020_thieves_blind)

; SKULL WOODS

cm_ad2020_presets_goto_skull:
    %submenu("Skull Woods", cm_ad2020_presets_skull)

cm_ad2020_presets_skull:
    dw cm_ad2020_skull_outside_thieves
    dw cm_ad2020_skull_frogdor
    dw cm_ad2020_skull_getting_tempered
    dw cm_ad2020_skull_fencedash
    dw cm_ad2020_skull_dash_to_sw
    dw cm_ad2020_skull_mummy_room
    dw cm_ad2020_skull_bomb_jump
    dw cm_ad2020_skull_key_pot
    dw cm_ad2020_skull_skull_entrance
    dw cm_ad2020_skull_mummy_hellway
    dw cm_ad2020_skull_mummy_key
    dw cm_ad2020_skull_mothula
    dw $0000
    %menu_header("SKULL WOODS")

cm_ad2020_skull_outside_thieves:
    %preset("Outside Thieves", preset_ad2020_skull_outside_thieves)

cm_ad2020_skull_frogdor:
    %preset("Frogdor", preset_ad2020_skull_frogdor)

cm_ad2020_skull_getting_tempered:
    %preset("Getting Tempered", preset_ad2020_skull_getting_tempered)

cm_ad2020_skull_fencedash:
    %preset("Fencedash", preset_ad2020_skull_fencedash)

cm_ad2020_skull_dash_to_sw:
    %preset("Dash to Skull Woods", preset_ad2020_skull_dash_to_sw)

cm_ad2020_skull_mummy_room:
    %preset("Mummy Room", preset_ad2020_skull_mummy_room)

cm_ad2020_skull_bomb_jump:
    %preset("Bomb Jump", preset_ad2020_skull_bomb_jump)

cm_ad2020_skull_key_pot:
    %preset("Key Pot", preset_ad2020_skull_key_pot)

cm_ad2020_skull_skull_entrance:
    %preset("Skull Entrance", preset_ad2020_skull_skull_entrance)

cm_ad2020_skull_mummy_hellway:
    %preset("Mummy Hellway", preset_ad2020_skull_mummy_hellway)

cm_ad2020_skull_mummy_key:
    %preset("Mummy Key", preset_ad2020_skull_mummy_key)

cm_ad2020_skull_mothula:
    %preset("Mothula", preset_ad2020_skull_mothula)

; TOWER OF HERA

cm_ad2020_presets_goto_hera:
    %submenu("Tower of Hera", cm_ad2020_presets_hera)

cm_ad2020_presets_hera:
    dw cm_ad2020_hera_outside_skull
    dw cm_ad2020_hera_old_man_cave
    dw cm_ad2020_hera_entrance
    dw cm_ad2020_hera_moldorm
    dw $0000
    %menu_header("TOWER OF HERA")

cm_ad2020_hera_outside_skull:
    %preset("Outside Skull", preset_ad2020_hera_outside_skull)

cm_ad2020_hera_old_man_cave:
    %preset("Old Man Cave", preset_ad2020_hera_old_man_cave)

cm_ad2020_hera_entrance:
    %preset("Entrance", preset_ad2020_hera_entrance)

cm_ad2020_hera_moldorm:
    %preset("Moldorm", preset_ad2020_hera_moldorm)

; MISERY MIRE

cm_ad2020_presets_goto_mire:
    %submenu("Misery Mire", cm_ad2020_presets_mire)

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
    dw $0000
    %menu_header("MISERY MIRE")

cm_ad2020_mire_outside_hera:
    %preset("Outside Hera", preset_ad2020_mire_outside_hera)

cm_ad2020_mire_swamp_dmd:
    %preset("Swamp DMD", preset_ad2020_mire_swamp_dmd)

cm_ad2020_mire_overworld:
    %preset("Swamp of Evil", preset_ad2020_mire_overworld)

cm_ad2020_mire_entrance:
    %preset("Entrance", preset_ad2020_mire_entrance)

cm_ad2020_mire_mire2:
    %preset("Mire 2", preset_ad2020_mire_mire2)

cm_ad2020_mire_main_hub:
    %preset("Main Hub", preset_ad2020_mire_main_hub)

cm_ad2020_mire_beat_the_fireball:
    %preset("Beat the Fireball", preset_ad2020_mire_beat_the_fireball)

cm_ad2020_mire_bari_key:
    %preset("Bari Key", preset_ad2020_mire_bari_key)

cm_ad2020_mire_sluggulas:
    %preset("Sluggulas", preset_ad2020_mire_sluggulas)

cm_ad2020_mire_torches:
    %preset("Torches", preset_ad2020_mire_torches)

cm_ad2020_mire_spark_gamble:
    %preset("Spark Gamble", preset_ad2020_mire_spark_gamble)

cm_ad2020_mire_big_chest_room:
    %preset("Big Chest Room", preset_ad2020_mire_big_chest_room)

cm_ad2020_mire_spike_key:
    %preset("Spike Key", preset_ad2020_mire_spike_key)

cm_ad2020_mire_wizzrobe:
    %preset("Wizzrobe", preset_ad2020_mire_wizzrobe)

cm_ad2020_mire_bridge_room:
    %preset("Bridge Room", preset_ad2020_mire_bridge_room)

cm_ad2020_mire_canedash:
    %preset("Canedash", preset_ad2020_mire_canedash)

cm_ad2020_mire_spooky_action:
    %preset("Spooky Action", preset_ad2020_mire_spooky_action)

cm_ad2020_mire_vitty:
    %preset("Vitreous", preset_ad2020_mire_vitty)

; DESERT PALACE

cm_ad2020_presets_goto_desert:
    %submenu("Desert Palace", cm_ad2020_presets_desert)

cm_ad2020_presets_desert:
    dw cm_ad2020_desert_outside_mire
    dw cm_ad2020_desert_entrance
    dw cm_ad2020_desert_torch_key
    dw cm_ad2020_desert_pre_cannonball_room
    dw cm_ad2020_desert_desert2_spinspeed
    dw cm_ad2020_desert_popo_genocide_room
    dw cm_ad2020_desert_torches
    dw cm_ad2020_desert_lanmolas
    dw $0000
    %menu_header("DESERT PALACE")

cm_ad2020_desert_outside_mire:
    %preset("Outside Mire", preset_ad2020_desert_outside_mire)

cm_ad2020_desert_entrance:
    %preset("Entrance", preset_ad2020_desert_entrance)

cm_ad2020_desert_torch_key:
    %preset("Torch Key", preset_ad2020_desert_torch_key)

cm_ad2020_desert_pre_cannonball_room:
    %preset("Pre Cannonball Room", preset_ad2020_desert_pre_cannonball_room)

cm_ad2020_desert_desert2_spinspeed:
    %preset("Desert 2 Spinspeed", preset_ad2020_desert_desert2_spinspeed)

cm_ad2020_desert_popo_genocide_room:
    %preset("Popo Genocide", preset_ad2020_desert_popo_genocide_room)

cm_ad2020_desert_torches:
    %preset("Torches", preset_ad2020_desert_torches)

cm_ad2020_desert_lanmolas:
    %preset("Lanmolas", preset_ad2020_desert_lanmolas)

; TURTLE ROCK

cm_ad2020_presets_goto_trock:
    %submenu("Turtle Rock", cm_ad2020_presets_trock)

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
    dw $0000
    %menu_header("TURTLE ROCK")

cm_ad2020_trock_outside_desert:
    %preset("Outside Desert", preset_ad2020_trock_outside_desert)

cm_ad2020_trock_old_man_cave:
    %preset("Old Man Cave", preset_ad2020_trock_old_man_cave)

cm_ad2020_trock_tr_climb:
    %preset("TR Climb", preset_ad2020_trock_tr_climb)

cm_ad2020_trock_laser_entrance:
    %preset("Laser Entrance", preset_ad2020_trock_laser_entrance)

cm_ad2020_trock_crystal_roller:
    %preset("Crystal Roller", preset_ad2020_trock_crystal_roller)

cm_ad2020_trock_pokey_1:
    %preset("Pokey 1", preset_ad2020_trock_pokey_1)

cm_ad2020_trock_laser_entrance_2:
    %preset("Laser Entrance 2", preset_ad2020_trock_laser_entrance_2)

cm_ad2020_trock_switch_maze:
    %preset("Switch Maze", preset_ad2020_trock_switch_maze)

cm_ad2020_trock_trinexx:
    %preset("Trinexx", preset_ad2020_trock_trinexx)

; SWAMP PALACE

cm_ad2020_presets_goto_swamp:
    %submenu("Swamp Palace", cm_ad2020_presets_swamp)

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
    dw $0000
    %menu_header("SWAMP PALACE")

cm_ad2020_swamp_outside_trock:
    %preset("Outside Turtle Rock", preset_ad2020_swamp_outside_trock)

cm_ad2020_swamp_zoras_domain:
    %preset("Zora's Domain", preset_ad2020_swamp_zoras_domain)

cm_ad2020_swamp_links_house:
    %preset("Link's House", preset_ad2020_swamp_links_house)

cm_ad2020_swamp_swamp_overworld:
    %preset("Swamp Overworld", preset_ad2020_swamp_swamp_overworld)

cm_ad2020_swamp_antifairy_room:
    %preset("Antifairy Room", preset_ad2020_swamp_antifairy_room)

cm_ad2020_swamp_entrance:
    %preset("Entrance", preset_ad2020_swamp_entrance)

cm_ad2020_swamp_first_key_pot:
    %preset("First Key Pot", preset_ad2020_swamp_first_key_pot)

cm_ad2020_swamp_main_hub:
    %preset("Main Hub", preset_ad2020_swamp_main_hub)

cm_ad2020_swamp_diver_down:
    %preset("Diver Down", preset_ad2020_swamp_diver_down)

cm_ad2020_swamp_restock:
    %preset("Restock Room", preset_ad2020_swamp_restock)

cm_ad2020_swamp_phelps_way:
    %preset("Phelps Way", preset_ad2020_swamp_phelps_way)

cm_ad2020_swamp_arrghus:
    %preset("Arrghus", preset_ad2020_swamp_arrghus)

; ICE PALACE

cm_ad2020_presets_goto_ice:
    %submenu("Ice Palace", cm_ad2020_presets_ice)

cm_ad2020_presets_ice:
    dw cm_ad2020_ice_outside_swamp
    dw cm_ad2020_ice_ice_entrance
    dw cm_ad2020_ice_penguin_switch_room
    dw cm_ad2020_ice_get_ready_to_break_the_ice
    dw cm_ad2020_ice_spike_key
    dw cm_ad2020_ice_lonely_firebar
    dw cm_ad2020_ice_last_two_screens
    dw cm_ad2020_ice_kholdstare
    dw $0000
    %menu_header("ICE PALACE")

cm_ad2020_ice_outside_swamp:
    %preset("Outside Swamp", preset_ad2020_ice_outside_swamp)

cm_ad2020_ice_ice_entrance:
    %preset("Entrance", preset_ad2020_ice_ice_entrance)

cm_ad2020_ice_penguin_switch_room:
    %preset("Penguin Switch Room", preset_ad2020_ice_penguin_switch_room)

cm_ad2020_ice_get_ready_to_break_the_ice:
    %preset("Break the Ice", preset_ad2020_ice_get_ready_to_break_the_ice)

cm_ad2020_ice_spike_key:
    %preset("Spike Key", preset_ad2020_ice_spike_key)

cm_ad2020_ice_lonely_firebar:
    %preset("Lonely Firebar", preset_ad2020_ice_lonely_firebar)

cm_ad2020_ice_last_two_screens:
    %preset("Last Two Screens", preset_ad2020_ice_last_two_screens)

cm_ad2020_ice_kholdstare:
    %preset("Kholdstare", preset_ad2020_ice_kholdstare)

; GANONS TOWER

cm_ad2020_presets_goto_gtower:
    %submenu("Ganon's Tower", cm_ad2020_presets_gtower)

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
    dw $0000
    %menu_header("GANONS TOWER")

cm_ad2020_gtower_outside_ice:
    %preset("Outside Ice", preset_ad2020_gtower_outside_ice)

cm_ad2020_gtower_old_man_cave:
    %preset("Old Man Cave", preset_ad2020_gtower_old_man_cave)

cm_ad2020_gtower_entrance:
    %preset("Entrance", preset_ad2020_gtower_entrance)

cm_ad2020_gtower_spike_skip:
    %preset("Spike Skip", preset_ad2020_gtower_spike_skip)

cm_ad2020_gtower_pre_firesnakes_room:
    %preset("Pre Firesnakes Room", preset_ad2020_gtower_pre_firesnakes_room)

cm_ad2020_gtower_bombable_floor:
    %preset("Bombable Floor", preset_ad2020_gtower_bombable_floor)

cm_ad2020_gtower_floor_2:
    %preset("Floor 2", preset_ad2020_gtower_floor_2)

cm_ad2020_gtower_mimics1:
    %preset("Mimics 1", preset_ad2020_gtower_mimics1)

cm_ad2020_gtower_mimics2:
    %preset("Mimics 2", preset_ad2020_gtower_mimics2)

cm_ad2020_gtower_spike_room:
    %preset("Spike Pit", preset_ad2020_gtower_spike_room)

cm_ad2020_gtower_gauntlet:
    %preset("Gauntlet 1", preset_ad2020_gtower_gauntlet)

cm_ad2020_gtower_gauntlet_3:
    %preset("Gauntlet 3", preset_ad2020_gtower_gauntlet_3)

cm_ad2020_gtower_lanmola2:
    %preset("Lanmola 2", preset_ad2020_gtower_lanmola2)

cm_ad2020_gtower_wizz1:
    %preset("Wizzrobes 1", preset_ad2020_gtower_wizz1)

cm_ad2020_gtower_wizz2:
    %preset("Wizzrobes 2", preset_ad2020_gtower_wizz2)

cm_ad2020_gtower_torches1:
    %preset("Torches 1", preset_ad2020_gtower_torches1)

cm_ad2020_gtower_torches2:
    %preset("Torches 2", preset_ad2020_gtower_torches2)

cm_ad2020_gtower_helma_key:
    %preset("Helma Key", preset_ad2020_gtower_helma_key)

cm_ad2020_gtower_bombable_wall:
    %preset("Bombable Wall", preset_ad2020_gtower_bombable_wall)

cm_ad2020_gtower_moldorm_2:
    %preset("Moldorm 2", preset_ad2020_gtower_moldorm_2)

cm_ad2020_gtower_agahnim_2:
    %preset("Agahnim 2", preset_ad2020_gtower_agahnim_2)

; AGAHNIMS TOWER

cm_ad2020_presets_goto_aga:
    %submenu("Agahnim's Tower", cm_ad2020_presets_aga)

cm_ad2020_presets_aga:
    dw cm_ad2020_aga_pyramid
    dw cm_ad2020_aga_gold_knights
    dw cm_ad2020_aga_dark_room_of_despair
    dw cm_ad2020_aga_dark_room_of_melancholy
    dw cm_ad2020_aga_spear_guards
    dw cm_ad2020_aga_circle_of_pots
    dw cm_ad2020_aga_catwalk
    dw cm_ad2020_aga_agahnim
    dw $0000
    %menu_header("AGAHNIMS TOWER")

cm_ad2020_aga_pyramid:
    %preset("Pyramid", preset_ad2020_aga_pyramid)

cm_ad2020_aga_gold_knights:
    %preset("Gold Knights", preset_ad2020_aga_gold_knights)

cm_ad2020_aga_dark_room_of_despair:
    %preset("Dark Room of Despair", preset_ad2020_aga_dark_room_of_despair)

cm_ad2020_aga_dark_room_of_melancholy:
    %preset("Dark Room of Melancholy", preset_ad2020_aga_dark_room_of_melancholy)

cm_ad2020_aga_spear_guards:
    %preset("Spear Guards", preset_ad2020_aga_spear_guards)

cm_ad2020_aga_circle_of_pots:
    %preset("Circle of Pots", preset_ad2020_aga_circle_of_pots)

cm_ad2020_aga_catwalk:
    %preset("Catwalk", preset_ad2020_aga_catwalk)

cm_ad2020_aga_agahnim:
    %preset("Agahnim", preset_ad2020_aga_agahnim)

; GANON

cm_ad2020_presets_goto_ganon:
    %submenu("Ganon", cm_ad2020_presets_ganon)

cm_ad2020_presets_ganon:
    dw cm_ad2020_ganon_pyramid
    dw $0000
    %menu_header("GANON")

cm_ad2020_ganon_pyramid:
    %preset("Pyramid", preset_ad2020_ganon_pyramid)

; BOSSES

cm_ad2020_presets_goto_boss:
    %submenu("Bosses", cm_ad2020_presets_boss)

cm_ad2020_presets_boss:
    dw cm_ad2020_eastern_armos
    dw cm_ad2020_pod_helma
    dw cm_ad2020_thieves_blind
    dw cm_ad2020_skull_mothula
    dw cm_ad2020_hera_moldorm
    dw cm_ad2020_mire_vitty
    dw cm_ad2020_desert_lanmolas
    dw cm_ad2020_trock_trinexx
    dw cm_ad2020_swamp_arrghus
    dw cm_ad2020_ice_kholdstare
    dw cm_ad2020_gtower_agahnim_2
    dw cm_ad2020_aga_agahnim
    dw cm_ad2020_ganon_pyramid
    dw $0000
    %menu_header("BOSSES")
