cm_anyrmg_submenu_presets:
    dw cm_anyrmg_presets_goto_eastern
    dw cm_anyrmg_presets_goto_escape
    dw cm_anyrmg_presets_goto_tempered
    dw cm_anyrmg_presets_goto_gtower
    dw cm_anyrmg_presets_goto_ganon
    dw cm_anyrmg_presets_goto_boss
    dw #$0000
    %cm_header("ANY RMG PRESETS")

; EASTERN PALACE

cm_anyrmg_presets_goto_eastern:
    %cm_submenu("Eastern Palace", cm_anyrmg_presets_eastern)

cm_anyrmg_presets_eastern:
    dw cm_anyrmg_east_bed
    dw cm_anyrmg_east_courtyard_1
    dw cm_anyrmg_east_castle_entrance
    dw cm_anyrmg_east_courtyard_2
    dw cm_anyrmg_east_links_house_citrus
    dw cm_anyrmg_east_outside_palace
    dw cm_anyrmg_east_entrance
    dw cm_anyrmg_east_stalfos_room
    dw cm_anyrmg_east_big_chest_room_1
    dw cm_anyrmg_east_dark_antifairies_room
    dw cm_anyrmg_east_dark_key_room
    dw cm_anyrmg_east_big_key_dmg_boost
    dw cm_anyrmg_east_big_chest_room_2
    dw cm_anyrmg_east_gwg
    dw cm_anyrmg_east_pot_room
    dw cm_anyrmg_east_zeldagamer_room
    dw cm_anyrmg_east_armos
    dw #$0000
    %cm_header("EASTERN PALACE")

cm_anyrmg_east_bed:
    %cm_preset("Link's Bed", preset_anyrmg_east_bed)

cm_anyrmg_east_courtyard_1:
    %cm_preset("Courtyard 1", preset_anyrmg_east_courtyard_1)

cm_anyrmg_east_castle_entrance:
    %cm_preset("Castle Entrance", preset_anyrmg_east_castle_entrance)

cm_anyrmg_east_courtyard_2:
    %cm_preset("Courtyard 2", preset_anyrmg_east_courtyard_2)

cm_anyrmg_east_links_house_citrus:
    %cm_preset("Link's House Citrus", preset_anyrmg_east_links_house_citrus)

cm_anyrmg_east_outside_palace:
    %cm_preset("Eastern Overworld", preset_anyrmg_east_outside_palace)

cm_anyrmg_east_entrance:
    %cm_preset("Entrance", preset_anyrmg_east_entrance)

cm_anyrmg_east_stalfos_room:
    %cm_preset("Stalfos Room", preset_anyrmg_east_stalfos_room)

cm_anyrmg_east_big_chest_room_1:
    %cm_preset("Big Chest Room 1", preset_anyrmg_east_big_chest_room_1)

cm_anyrmg_east_dark_antifairies_room:
    %cm_preset("Dark Antifairies Room", preset_anyrmg_east_dark_antifairies_room)

cm_anyrmg_east_dark_key_room:
    %cm_preset("Dark Key Room", preset_anyrmg_east_dark_key_room)

cm_anyrmg_east_big_key_dmg_boost:
    %cm_preset("Big Key DMG Boost", preset_anyrmg_east_big_key_dmg_boost)

cm_anyrmg_east_big_chest_room_2:
    %cm_preset("Big Chest Room 2", preset_anyrmg_east_big_chest_room_2)

cm_anyrmg_east_gwg:
    %cm_preset("Gifted With Greenies", preset_anyrmg_east_gwg)

cm_anyrmg_east_pot_room:
    %cm_preset("Pot Room", preset_anyrmg_east_pot_room)

cm_anyrmg_east_zeldagamer_room:
    %cm_preset("Zeldagamer Room", preset_anyrmg_east_zeldagamer_room)

cm_anyrmg_east_armos:
    %cm_preset("Armos", preset_anyrmg_east_armos)

; HYRULE CASTLE

cm_anyrmg_presets_goto_escape:
    %cm_submenu("Hyrule Castle", cm_anyrmg_presets_escape)

cm_anyrmg_presets_escape:
    dw cm_anyrmg_esc_outside_eastern
    dw cm_anyrmg_esc_eastern_spinspeed
    dw cm_anyrmg_esc_dma
    dw cm_anyrmg_esc_death_mountain
    dw cm_anyrmg_esc_kiki_yeet
    dw cm_anyrmg_esc_kiki_skip
    dw cm_anyrmg_esc_pod_main_hub_bk
    dw cm_anyrmg_esc_pod_main_hub_hammerjump
    dw cm_anyrmg_esc_hammerjump
    dw cm_anyrmg_esc_sanc_1
    dw cm_anyrmg_esc_entrance
    dw cm_anyrmg_esc_1st_keyguard
    dw cm_anyrmg_esc_stealth_room
    dw cm_anyrmg_esc_2nd_keyguard
    dw cm_anyrmg_esc_zeldas_cell
    dw cm_anyrmg_esc_sanc_2
    dw #$0000
    %cm_header("HYRULE CASTLE")

cm_anyrmg_esc_outside_eastern:
    %cm_preset("Outside Eastern", preset_anyrmg_esc_outside_eastern)

cm_anyrmg_esc_eastern_spinspeed:
    %cm_preset("Eastern Spinspeed", preset_anyrmg_esc_eastern_spinspeed)

cm_anyrmg_esc_dma:
    %cm_preset("DMA", preset_anyrmg_esc_dma)

cm_anyrmg_esc_death_mountain:
    %cm_preset("Death Mountain", preset_anyrmg_esc_death_mountain)

cm_anyrmg_esc_kiki_yeet:
    %cm_preset("Kiki Yeet", preset_anyrmg_esc_kiki_yeet)

cm_anyrmg_esc_kiki_skip:
    %cm_preset("Kiki Skip", preset_anyrmg_esc_kiki_skip)

cm_anyrmg_esc_pod_main_hub_bk:
    %cm_preset("PoD Main Hub (Big Key)", preset_anyrmg_esc_pod_main_hub_bk)

cm_anyrmg_esc_pod_main_hub_hammerjump:
    %cm_preset("PoD Main Hub (Hammerjump)", preset_anyrmg_esc_pod_main_hub_hammerjump)

cm_anyrmg_esc_hammerjump:
    %cm_preset("Hammerjump", preset_anyrmg_esc_hammerjump)

cm_anyrmg_esc_sanc_1:
    %cm_preset("River Clip", preset_anyrmg_esc_sanc_1)

cm_anyrmg_esc_entrance:
    %cm_preset("Entrance", preset_anyrmg_esc_entrance)

cm_anyrmg_esc_1st_keyguard:
    %cm_preset("1st Key Guard", preset_anyrmg_esc_1st_keyguard)

cm_anyrmg_esc_stealth_room:
    %cm_preset("Not So Stealth Room", preset_anyrmg_esc_stealth_room)

cm_anyrmg_esc_2nd_keyguard:
    %cm_preset("2nd Key Guard", preset_anyrmg_esc_2nd_keyguard)

cm_anyrmg_esc_zeldas_cell:
    %cm_preset("Zelda's Cell", preset_anyrmg_esc_zeldas_cell)

cm_anyrmg_esc_sanc_2:
    %cm_preset("Sanctuary", preset_anyrmg_esc_sanc_2)

; TEMPERED SWORD

cm_anyrmg_presets_goto_tempered:
    %cm_submenu("Tempered Sword", cm_anyrmg_presets_tempered)

cm_anyrmg_presets_tempered:
    dw cm_anyrmg_temp_old_man_cave
    dw cm_anyrmg_temp_hera_entrance
    dw cm_anyrmg_temp_hera_beetles
    dw cm_anyrmg_temp_hera_petting_zoo
    dw cm_anyrmg_temp_frog_dmd
    dw cm_anyrmg_temp_getting_tempered
    dw #$0000
    %cm_header("TEMPERED SWORD")

cm_anyrmg_temp_old_man_cave:
    %cm_preset("Old Man Cave", preset_anyrmg_temp_old_man_cave)

cm_anyrmg_temp_hera_entrance:
    %cm_preset("Hera Entrance", preset_anyrmg_temp_hera_entrance)

cm_anyrmg_temp_hera_beetles:
    %cm_preset("Beetles", preset_anyrmg_temp_hera_beetles)

cm_anyrmg_temp_hera_petting_zoo:
    %cm_preset("Petting Zoo", preset_anyrmg_temp_hera_petting_zoo)

cm_anyrmg_temp_frog_dmd:
    %cm_preset("Frog DMD", preset_anyrmg_temp_frog_dmd)

cm_anyrmg_temp_getting_tempered:
    %cm_preset("Getting Tempered", preset_anyrmg_temp_getting_tempered)

; GANONS TOWER

cm_anyrmg_presets_goto_gtower:
    %cm_submenu("Ganon's Tower", cm_anyrmg_presets_gtower)

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
    dw #$0000
    %cm_header("GANONS TOWER")

cm_anyrmg_gtower_old_man_cave:
    %cm_preset("Old Man Cave", preset_anyrmg_gtower_old_man_cave)

cm_anyrmg_gtower_entrance:
    %cm_preset("Entrance", preset_anyrmg_gtower_entrance)

cm_anyrmg_gtower_spike_skip:
    %cm_preset("Spike Skip", preset_anyrmg_gtower_spike_skip)

cm_anyrmg_gtower_pre_firesnakes_room:
    %cm_preset("Pre Firesnakes Room", preset_anyrmg_gtower_pre_firesnakes_room)

cm_anyrmg_gtower_bombable_floor:
    %cm_preset("Ice Armos Bombable Floor", preset_anyrmg_gtower_bombable_floor)

cm_anyrmg_gtower_floor_2:
    %cm_preset("Floor 2", preset_anyrmg_gtower_floor_2)

cm_anyrmg_gtower_mimics1:
    %cm_preset("Mimics 1", preset_anyrmg_gtower_mimics1)

cm_anyrmg_gtower_mimics2:
    %cm_preset("Mimics 2", preset_anyrmg_gtower_mimics2)

cm_anyrmg_gtower_spike_room:
    %cm_preset("Spike Pit", preset_anyrmg_gtower_spike_room)

cm_anyrmg_gtower_gauntlet:
    %cm_preset("Gauntlet 1", preset_anyrmg_gtower_gauntlet)

cm_anyrmg_gtower_gauntlet_3:
    %cm_preset("Gauntlet 3", preset_anyrmg_gtower_gauntlet_3)

cm_anyrmg_gtower_lanmola2:
    %cm_preset("Lanmola 2", preset_anyrmg_gtower_lanmola2)

cm_anyrmg_gtower_wizz1:
    %cm_preset("Wizzrobes 1", preset_anyrmg_gtower_wizz1)

cm_anyrmg_gtower_wizz2:
    %cm_preset("Wizzrobes 2", preset_anyrmg_gtower_wizz2)

cm_anyrmg_gtower_torches1:
    %cm_preset("Torches 1", preset_anyrmg_gtower_torches1)

cm_anyrmg_gtower_torches2:
    %cm_preset("Torches 2", preset_anyrmg_gtower_torches2)

cm_anyrmg_gtower_helma_key:
    %cm_preset("Helma Key", preset_anyrmg_gtower_helma_key)

cm_anyrmg_gtower_bombable_wall:
    %cm_preset("Bombable Wall", preset_anyrmg_gtower_bombable_wall)

cm_anyrmg_gtower_moldorm_2:
    %cm_preset("Moldorm 2", preset_anyrmg_gtower_moldorm_2)

cm_anyrmg_gtower_agahnim_2:
    %cm_preset("Agahnim 2", preset_anyrmg_gtower_agahnim_2)

; GANON

cm_anyrmg_presets_goto_ganon:
    %cm_submenu("Ganon", cm_anyrmg_presets_ganon)

cm_anyrmg_presets_ganon:
    dw cm_anyrmg_ganon_pyramid
    dw #$0000
    %cm_header("GANON")

cm_anyrmg_ganon_pyramid:
    %cm_preset("Pyramid", preset_anyrmg_ganon_pyramid)

; BOSSES

cm_anyrmg_presets_goto_boss:
    %cm_submenu("Bosses", cm_anyrmg_presets_boss)

cm_anyrmg_presets_boss:
    dw cm_anyrmg_east_armos
    dw cm_anyrmg_gtower_bombable_floor
    dw cm_anyrmg_gtower_lanmola2
    dw cm_anyrmg_gtower_moldorm_2
    dw cm_anyrmg_gtower_agahnim_2
    dw cm_anyrmg_ganon_pyramid
    dw #$0000
    %cm_header("BOSSES")
