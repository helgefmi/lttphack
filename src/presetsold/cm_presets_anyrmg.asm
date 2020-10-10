cm_anyrmg_submenu_presets:
    dw cm_anyrmg_presets_goto_eastern
    dw cm_anyrmg_presets_goto_escape
    dw cm_anyrmg_presets_goto_tempered
    dw cm_anyrmg_presets_goto_gtower
    dw cm_anyrmg_presets_goto_ganon
    dw cm_anyrmg_presets_goto_boss
    dw $0000
    %menu_header("ANY RMG PRESETS")

; EASTERN PALACE

cm_anyrmg_presets_goto_eastern:
    %submenu("Eastern Palace", cm_anyrmg_presets_eastern)

cm_anyrmg_presets_eastern:
    dw cm_anyrmg_eastern_bed
    dw cm_anyrmg_eastern_courtyard_1
    dw cm_anyrmg_eastern_castle_entrance
    dw cm_anyrmg_eastern_courtyard_2
    dw cm_anyrmg_eastern_links_house_citrus
    dw cm_anyrmg_eastern_outside_palace
    dw cm_anyrmg_eastern_entrance
    dw cm_anyrmg_eastern_stalfos_room
    dw cm_anyrmg_eastern_big_chest_room_1
    dw cm_anyrmg_eastern_dark_antifairies_room
    dw cm_anyrmg_eastern_dark_key_room
    dw cm_anyrmg_eastern_big_key_dmg_boost
    dw cm_anyrmg_eastern_big_chest_room_2
    dw cm_anyrmg_eastern_gwg
    dw cm_anyrmg_eastern_pot_room
    dw cm_anyrmg_eastern_zeldagamer_room
    dw cm_anyrmg_eastern_armos
    dw $0000
    %menu_header("EASTERN PALACE")

cm_anyrmg_eastern_bed:
    %preset("Link's Bed", preset_anyrmg_eastern_bed)

cm_anyrmg_eastern_courtyard_1:
    %preset("Courtyard 1", preset_anyrmg_eastern_courtyard_1)

cm_anyrmg_eastern_castle_entrance:
    %preset("Castle Entrance", preset_anyrmg_eastern_castle_entrance)

cm_anyrmg_eastern_courtyard_2:
    %preset("Courtyard 2", preset_anyrmg_eastern_courtyard_2)

cm_anyrmg_eastern_links_house_citrus:
    %preset("Link's House Citrus", preset_anyrmg_eastern_links_house_citrus)

cm_anyrmg_eastern_outside_palace:
    %preset("Eastern Overworld", preset_anyrmg_eastern_outside_palace)

cm_anyrmg_eastern_entrance:
    %preset("Entrance", preset_anyrmg_eastern_entrance)

cm_anyrmg_eastern_stalfos_room:
    %preset("Stalfos Room", preset_anyrmg_eastern_stalfos_room)

cm_anyrmg_eastern_big_chest_room_1:
    %preset("Big Chest Room 1", preset_anyrmg_eastern_big_chest_room_1)

cm_anyrmg_eastern_dark_antifairies_room:
    %preset("Dark Antifairies Room", preset_anyrmg_eastern_dark_antifairies_room)

cm_anyrmg_eastern_dark_key_room:
    %preset("Dark Key Room", preset_anyrmg_eastern_dark_key_room)

cm_anyrmg_eastern_big_key_dmg_boost:
    %preset("Big Key DMG Boost", preset_anyrmg_eastern_big_key_dmg_boost)

cm_anyrmg_eastern_big_chest_room_2:
    %preset("Big Chest Room 2", preset_anyrmg_eastern_big_chest_room_2)

cm_anyrmg_eastern_gwg:
    %preset("Gifted With Greenies", preset_anyrmg_eastern_gwg)

cm_anyrmg_eastern_pot_room:
    %preset("Pot Room", preset_anyrmg_eastern_pot_room)

cm_anyrmg_eastern_zeldagamer_room:
    %preset("Zeldagamer Room", preset_anyrmg_eastern_zeldagamer_room)

cm_anyrmg_eastern_armos:
    %preset("Armos", preset_anyrmg_eastern_armos)

; HYRULE CASTLE

cm_anyrmg_presets_goto_escape:
    %submenu("Hyrule Castle", cm_anyrmg_presets_escape)

cm_anyrmg_presets_escape:
    dw cm_anyrmg_escape_outside_eastern
    dw cm_anyrmg_escape_eastern_spinspeed
    dw cm_anyrmg_escape_dma
    dw cm_anyrmg_escape_death_mountain
    dw cm_anyrmg_escape_kiki_yeet
    dw cm_anyrmg_escape_kiki_skip
    dw cm_anyrmg_escape_pod_main_hub_bk
    dw cm_anyrmg_escape_pod_main_hub_hammerjump
    dw cm_anyrmg_escape_hammerjump
    dw cm_anyrmg_escape_sanc_1
    dw cm_anyrmg_escape_entrance
    dw cm_anyrmg_escape_1st_keyguard
    dw cm_anyrmg_escape_stealth_room
    dw cm_anyrmg_escape_2nd_keyguard
    dw cm_anyrmg_escape_zeldas_cell
    dw cm_anyrmg_escape_sanc_2
    dw $0000
    %menu_header("HYRULE CASTLE")

cm_anyrmg_escape_outside_eastern:
    %preset("Outside Eastern", preset_anyrmg_escape_outside_eastern)

cm_anyrmg_escape_eastern_spinspeed:
    %preset("Eastern Spinspeed", preset_anyrmg_escape_eastern_spinspeed)

cm_anyrmg_escape_dma:
    %preset("DMA", preset_anyrmg_escape_dma)

cm_anyrmg_escape_death_mountain:
    %preset("Death Mountain", preset_anyrmg_escape_death_mountain)

cm_anyrmg_escape_kiki_yeet:
    %preset("Kiki Yeet", preset_anyrmg_escape_kiki_yeet)

cm_anyrmg_escape_kiki_skip:
    %preset("Kiki Skip", preset_anyrmg_escape_kiki_skip)

cm_anyrmg_escape_pod_main_hub_bk:
    %preset("PoD Main Hub (Big Key)", preset_anyrmg_escape_pod_main_hub_bk)

cm_anyrmg_escape_pod_main_hub_hammerjump:
    %preset("PoD Main Hub (Hammerjump)", preset_anyrmg_escape_pod_main_hub_hammerjump)

cm_anyrmg_escape_hammerjump:
    %preset("Hammerjump", preset_anyrmg_escape_hammerjump)

cm_anyrmg_escape_sanc_1:
    %preset("River Clip", preset_anyrmg_escape_sanc_1)

cm_anyrmg_escape_entrance:
    %preset("Entrance", preset_anyrmg_escape_entrance)

cm_anyrmg_escape_1st_keyguard:
    %preset("1st Key Guard", preset_anyrmg_escape_1st_keyguard)

cm_anyrmg_escape_stealth_room:
    %preset("Not So Stealth Room", preset_anyrmg_escape_stealth_room)

cm_anyrmg_escape_2nd_keyguard:
    %preset("2nd Key Guard", preset_anyrmg_escape_2nd_keyguard)

cm_anyrmg_escape_zeldas_cell:
    %preset("Zelda's Cell", preset_anyrmg_escape_zeldas_cell)

cm_anyrmg_escape_sanc_2:
    %preset("Sanctuary", preset_anyrmg_escape_sanc_2)

; TEMPERED SWORD

cm_anyrmg_presets_goto_tempered:
    %submenu("Tempered Sword", cm_anyrmg_presets_tempered)

cm_anyrmg_presets_tempered:
    dw cm_anyrmg_tempered_old_man_cave
    dw cm_anyrmg_tempered_hera_entrance
    dw cm_anyrmg_tempered_hera_beetles
    dw cm_anyrmg_tempered_hera_petting_zoo
    dw cm_anyrmg_tempered_frog_dmd
    dw cm_anyrmg_tempered_getting_tempered
    dw $0000
    %menu_header("TEMPERED SWORD")

cm_anyrmg_tempered_old_man_cave:
    %preset("Old Man Cave", preset_anyrmg_tempered_old_man_cave)

cm_anyrmg_tempered_hera_entrance:
    %preset("Hera Entrance", preset_anyrmg_tempered_hera_entrance)

cm_anyrmg_tempered_hera_beetles:
    %preset("Beetles", preset_anyrmg_tempered_hera_beetles)

cm_anyrmg_tempered_hera_petting_zoo:
    %preset("Petting Zoo", preset_anyrmg_tempered_hera_petting_zoo)

cm_anyrmg_tempered_frog_dmd:
    %preset("Frog DMD", preset_anyrmg_tempered_frog_dmd)

cm_anyrmg_tempered_getting_tempered:
    %preset("Getting Tempered", preset_anyrmg_tempered_getting_tempered)

; GANONS TOWER

cm_anyrmg_presets_goto_gtower:
    %submenu("Ganon's Tower", cm_anyrmg_presets_gtower)

cm_anyrmg_presets_gtower:
    dw cm_anyrmg_gtower_old_man_cave
    dw cm_anyrmg_gtower_entrance
    dw cm_anyrmg_gtower_spike_skip
    dw cm_anyrmg_gtower_pre_firesnakes_room
    dw cm_anyrmg_gtower_bombable_floor
    dw cm_anyrmg_gtower_floor_2
    dw cm_anyrmg_gtower_mimics1
    dw cm_anyrmg_gtower_mimics2
    dw cm_anyrmg_gtower_spike_room
    dw cm_anyrmg_gtower_gauntlet
    dw cm_anyrmg_gtower_gauntlet_3
    dw cm_anyrmg_gtower_lanmola2
    dw cm_anyrmg_gtower_wizz1
    dw cm_anyrmg_gtower_wizz2
    dw cm_anyrmg_gtower_torches1
    dw cm_anyrmg_gtower_torches2
    dw cm_anyrmg_gtower_helma_key
    dw cm_anyrmg_gtower_bombable_wall
    dw cm_anyrmg_gtower_moldorm_2
    dw cm_anyrmg_gtower_agahnim_2
    dw $0000
    %menu_header("GANONS TOWER")

cm_anyrmg_gtower_old_man_cave:
    %preset("Old Man Cave", preset_anyrmg_gtower_old_man_cave)

cm_anyrmg_gtower_entrance:
    %preset("Entrance", preset_anyrmg_gtower_entrance)

cm_anyrmg_gtower_spike_skip:
    %preset("Spike Skip", preset_anyrmg_gtower_spike_skip)

cm_anyrmg_gtower_pre_firesnakes_room:
    %preset("Pre Firesnakes Room", preset_anyrmg_gtower_pre_firesnakes_room)

cm_anyrmg_gtower_bombable_floor:
    %preset("Ice Armos Bombable Floor", preset_anyrmg_gtower_bombable_floor)

cm_anyrmg_gtower_floor_2:
    %preset("Floor 2", preset_anyrmg_gtower_floor_2)

cm_anyrmg_gtower_mimics1:
    %preset("Mimics 1", preset_anyrmg_gtower_mimics1)

cm_anyrmg_gtower_mimics2:
    %preset("Mimics 2", preset_anyrmg_gtower_mimics2)

cm_anyrmg_gtower_spike_room:
    %preset("Spike Pit", preset_anyrmg_gtower_spike_room)

cm_anyrmg_gtower_gauntlet:
    %preset("Gauntlet 1", preset_anyrmg_gtower_gauntlet)

cm_anyrmg_gtower_gauntlet_3:
    %preset("Gauntlet 3", preset_anyrmg_gtower_gauntlet_3)

cm_anyrmg_gtower_lanmola2:
    %preset("Lanmola 2", preset_anyrmg_gtower_lanmola2)

cm_anyrmg_gtower_wizz1:
    %preset("Wizzrobes 1", preset_anyrmg_gtower_wizz1)

cm_anyrmg_gtower_wizz2:
    %preset("Wizzrobes 2", preset_anyrmg_gtower_wizz2)

cm_anyrmg_gtower_torches1:
    %preset("Torches 1", preset_anyrmg_gtower_torches1)

cm_anyrmg_gtower_torches2:
    %preset("Torches 2", preset_anyrmg_gtower_torches2)

cm_anyrmg_gtower_helma_key:
    %preset("Helma Key", preset_anyrmg_gtower_helma_key)

cm_anyrmg_gtower_bombable_wall:
    %preset("Bombable Wall", preset_anyrmg_gtower_bombable_wall)

cm_anyrmg_gtower_moldorm_2:
    %preset("Moldorm 2", preset_anyrmg_gtower_moldorm_2)

cm_anyrmg_gtower_agahnim_2:
    %preset("Agahnim 2", preset_anyrmg_gtower_agahnim_2)

; GANON

cm_anyrmg_presets_goto_ganon:
    %submenu("Ganon", cm_anyrmg_presets_ganon)

cm_anyrmg_presets_ganon:
    dw cm_anyrmg_ganon_pyramid
    dw $0000
    %menu_header("GANON")

cm_anyrmg_ganon_pyramid:
    %preset("Pyramid", preset_anyrmg_ganon_pyramid)

; BOSSES

cm_anyrmg_presets_goto_boss:
    %submenu("Bosses", cm_anyrmg_presets_boss)

cm_anyrmg_presets_boss:
    dw cm_anyrmg_eastern_armos
    dw cm_anyrmg_gtower_bombable_floor
    dw cm_anyrmg_gtower_lanmola2
    dw cm_anyrmg_gtower_moldorm_2
    dw cm_anyrmg_gtower_agahnim_2
    dw cm_anyrmg_ganon_pyramid
    dw $0000
    %menu_header("BOSSES")
