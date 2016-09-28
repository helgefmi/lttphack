local last_save_state = {} -- holds all state that has been changed up untill last save
local current_state = {} -- state changes since last save (will be emptied for each change)
local sram_output = ""
local preset_output = ""
local num_states = 0

local movie_steps = { -- {{{
    -- Escape
    [1900] = "esc_bed",
    [5770] = "esc_courtyard",
    [6330] = "esc_entrance",
    [7646] = "esc_1st_keyguard",
    [8966] = "esc_big_room",
    [9756] = "esc_2nd_keyguard",
    [11092] = "esc_ball_n_chains",
    [15093] = "esc_keyguard_revisited",
    [17288] = "esc_secret_passage",
    [18338] = "esc_snake_avoidance_room",
    [20284] = "esc_keyrat",
    [21335] = "esc_last_two_screens",
    -- Eastern
    [22184] = "east_before_cutscene",
    [23743] = "east_after_cutscene",
    [25707] = "east_octoroc",
    [26541] = "east_outside_palace",
    [28086] = "east_entrance",
    [29962] = "east_stalfos_room",
    [32159] = "east_dark_key_room",
    [33492] = "east_big_key_dmg_boost",
    [34604] = "east_big_chest_room",
    [35516] = "east_gwg",
    [36040] = "east_pot_room",
    [37133] = "east_zeldagamer_room",
    [37945] = "east_armos",
    -- Desert
    [39993] = "desert_outside_eastern_palace",
    [41862] = "desert_ep_spinspeed",
    [44397] = "desert_unholy_spinspeed",
    [46968] = "desert_water_dash",
    [49591] = "desert_desert_entrance",
    [50540] = "desert_keybonk",
    [51794] = "desert_pre_cannonball_room",
    [53803] = "desert_pot_room",
    [55451] = "desert_desert2_spinspeed",
    [56862] = "desert_popo_genocide_room",
    [58004] = "desert_torches",
    [58995] = "desert_lanmolas",
    -- Hera
    [61408] = "hera_outside_desert_palace",
    [62918] = "hera_fake_flippers",
    [66550] = "hera_dm",
    [67499] = "hera_after_mirror",
    [69321] = "hera_entrance",
    [70568] = "hera_tile_room",
    [73384] = "hera_torches",
    [74293] = "hera_beetles",
    [75505] = "hera_petting_zoo",
    [77291] = "hera_moldorm",
    -- Agatower
    [80099] = "aga_outside_hera",
    [81427] = "aga_first_rupee_tree",
    [82373] = "aga_lost_woods",
    [87154] = "aga_after_lost_woods",
    [89759] = "aga_tower_entrance",
    [91220] = "aga_dark_room_of_despair",
    [92847] = "aga_dark_room_of_melancholy",
    [93632] = "aga_red_spears",
    [94433] = "aga_circle_of_pot",
    [97618] = "aga_agahnim",
    -- PoD
    [102972] = "pod_pyramid",
    [104154] = "pod_pod_overworld",
    [106570] = "pod_entrance",
    [108249] = "pod_main_hub",
    [112313] = "pod_hammeryump",
    [114430] = "pod_before_sexy_statue",
    [118081] = "pod_turtle_room",
    [119315] = "pod_helma",
    -- Theieves
    [124636] = "thieves_outside_pod",
    [126247] = "thieves_ow_hammerdash",
    [127638] = "thieves_getting_flute",
    [130089] = "thieves_usain_bolt",
    [132234] = "thieves_after_activating_flute",
    [134031] = "thieves_darkworld",
    [134858] = "thieves_entrance",
    [136482] = "thieves_after_big_key",
    [138006] = "thieves_fire_room",
    [138334] = "thieves_hellway",
    [139796] = "thieves_bombable_floor",
    [142429] = "thieves_prison",
    [143816] = "thieves_after_gloves",
    [144376] = "thieves_pot_hammerdash",
    [145037] = "thieves_blind",
    -- Skull Woods
    [149670] = "sw_outside_thieves",
    [150808] = "sw_cursed_dwarf",
    [155126] = "sw_got_tempered",
    [156691] = "sw_dash_to_sw",
    [157754] = "sw_mummy_room",
    [159673] = "sw_bomb_jump",
    [161534] = "sw_key_pot",
    [162431] = "sw_skull_entrance",
    [163037] = "sw_mummy_hellway",
    [163757] = "sw_mummy_key",
    [164126] = "sw_mothula",
    -- Ice
    [168480] = "ice_outside_skull",
    [169346] = "ice_bridge_warp",
    [170869] = "ice_lottery",
    [171950] = "ice_medallion",
    [173468] = "ice_zoras_domain",
    [177042] = "ice_tiny_warp",
    [178067] = "ice_ice_entrance",
    [178435] = "ice_ice2",
    [179938] = "ice_penguin_switch_room",
    [180584] = "ice_bombable_floor",
    [181658] = "ice_conveyor_room",
    [182094] = "ice_ipbj",
    [183013] = "ice_penguin_room",
    [183742] = "ice_lonely_firebar",
    [185763] = "ice_kholdstare",
    -- Swamp
    [190374] = "swamp_outside_ice",
    [191072] = "swamp_links_house",
    [192329] = "swamp_swamp_overworld",
    [192938] = "swamp_antifairy_room",
    [194319] = "swamp_entrance",
    [195969] = "swamp_first_key",
    [197600] = "swamp_main_hub",
    [199562] = "swamp_switch_room",
    [202105] = "swamp_sociable_firebar",
    [203444] = "swamp_backtracking",
    [204569] = "swamp_hook_shot",
    [205779] = "swamp_hookdash",
    [207934] = "swamp_restock",
    [209302] = "swamp_arrghus",
    -- Mire
    [214178] = "mire_outside_swamp",
    [217918] = "mire_mire_darkworld_warp",
    [219615] = "mire_mire_entrance",
    [220125] = "mire_mire2",
    [222017] = "mire_left_dash",
    [223066] = "mire_dodongos",
    [226545] = "mire_spark_gamble",
    [228244] = "mire_spike_key",
    [229528] = "mire_basement",
    [230377] = "mire_cane_dash",
    [231141] = "mire_bombable_wall",
    [233031] = "mire_vitty",
    --  TRock
    [237271] = "trock_ouside_mire",
    [238140] = "trock_icerod_overworld",
    [242449] = "trock_peg_puzzle",
    [244468] = "trock_entrance",
    [245557] = "trock_lanterns",
    [246430] = "trock_roller_room",
    [247905] = "trock_chomps",
    [250460] = "trock_pokies_1",
    [252864] = "trock_pokies_2",
    [253878] = "trock_roller_key",
    [256484] = "trock_lazer_skip",
    [257241] = "trock_switch_room",
    [258382] = "trock_trinexx",
    -- GTower
    [263886] = "gtower_outside_trock",
    [265964] = "gtower_entrance",
    [267262] = "gtower_spike_skip",
    [268195] = "gtower_pre_firesnakes_room",
    [270901] = "gtower_bombable_floor",
    [271498] = "gtower_ice_armos",
    [273164] = "gtower_floor_2",
    [273797] = "gtower_mimics1",
    [274202] = "gtower_mimics2",
    [274693] = "gtower_spike_room",
    [275862] = "gtower_gauntlet",
    [277800] = "gtower_lanmola2",
    [279593] = "gtower_wizz2",
    [281370] = "gtower_torches2",
    [281759] = "gtower_helma_key",
    [282124] = "gtower_bombable_wall",
    [282738] = "gtower_moldorm_2",
    [284440] = "gtower_agahnim_2",
    -- Ganon
    [287664] = "ganon_pyramid",
} -- }}}


-- Utility functions

local function tohex(n, size)
    size = size or 0
    return string.format("$%0" .. tostring(size) .. "X", n)
end


local function call_for_each_bank(address, fn, ...)
    for i = 0x00, 0x1F do
        fn(bit.lshift(i, 16) + address, unpack(arg))
    end
    fn(0x7E0000 + address, unpack(arg))
end


-- local debug_file = io.open("debug.txt", "w")

local function debug(...)
    -- print(unpack(arg))
    -- debug_file:write(table.concat(arg, " ") .. "\n")
    -- debug_file:flush()
end


local function tosigned16(n)
    if n >= 2 ^ 15 then
        return n - 2 ^ 16
    end
    return n
end


local function in_overworld()
    return memory.readbyte(0x7E001B) == 0
end


local function in_underworld()
    return not in_overworld()
end


local function draw_lines(x, y, L)
    for i, line in ipairs(L) do
        gui.text(x, y + ((i - 1) * 8), line)
    end
end


local function dw(n, comment)
    return "dw " .. tohex(n, 4) .. " ; " .. comment
end


local function db(n, comment)
    return "db " .. tohex(n, 2) .. " ; " .. comment
end

local equipment_verbose = { -- {{{
    [0x7EF340] = "Bow",
    [0x7EF341] = "Boomerang",
    [0x7EF342] = "Hookshot",
    [0x7EF343] = "Bombs",
    [0x7EF344] = "Mushroom",
    [0x7EF345] = "Fire Rod",
    [0x7EF346] = "Ice Rod",
    [0x7EF347] = "Bombos Medallion",
    [0x7EF348] = "Ether Medallion",
    [0x7EF349] = "Quake Medallion",
    [0x7EF34A] = "Torch",
    [0x7EF34B] = "Hammer",
    [0x7EF34C] = "Flute",
    [0x7EF34D] = "Bug Catching Net",
    [0x7EF34E] = "Book of Mudora",
    [0x7EF34F] = "Bottles",
    [0x7EF350] = "Cane of Somaria",
    [0x7EF351] = "Cane of Byrna",
    [0x7EF352] = "Magic Cape",
    [0x7EF353] = "Magic Mirror",
    [0x7EF354] = "Gloves",
    [0x7EF355] = "Boots",
    [0x7EF356] = "Flippers",
    [0x7EF357] = "Moon Pearl",
    [0x7EF359] = "Sword",
    [0x7EF35A] = "Shield",
    [0x7EF35B] = "Armor",
    [0x7EF35C] = "Bottle",
    [0x7EF360] = "Rupees (goal)",
    [0x7EF362] = "Rupees (actual)",
    [0x7EF364] = "Compass1",
    [0x7EF365] = "Compass2",
    [0x7EF366] = "BigKey1",
    [0x7EF367] = "BigKey2",
    [0x7EF368] = "Dungeon map1",
    [0x7EF369] = "Dungeon map2",
    [0x7EF36B] = "Heart pieces collected",
    [0x7EF36C] = "Health (goal)",
    [0x7EF36D] = "Health (actual)",
    [0x7EF36E] = "Magic Power",
    [0x7EF36F] = "Keys",
    [0x7EF370] = "Bomb Upgrades",
    [0x7EF371] = "Arrow Upgrades",
    [0x7EF372] = "Hearts filler",
    [0x7EF373] = "Magic filler",
    [0x7EF374] = "Pendants",
    [0x7EF375] = "Bomb filler",
    [0x7EF376] = "Arrow filler",
    [0x7EF377] = "Arrows",
    [0x7EF378] = "????",
    [0x7EF379] = "Ability Flags",
    [0x7EF37A] = "Crystals",
    [0x7EF37B] = "Magic usage",
    [0x7EF3C5] = "Game Phase 1",
    [0x7EF3C6] = "Game Phase 2",
    [0x7EF3C7] = "Map Phase",
    [0x7EF3C8] = "Entrances Phase",
    [0x7EF3C9] = "Game Phase 3",
    [0x7EF3CA] = "LW/DW",
    [0x7EF3CC] = "Tagalong",
    [0x7EF3CD] = "Tagalong Y",
    [0x7EF3CF] = "Tagalong X",
    [0x7EF3D3] = "Super Bomb Boom",
    [0x7EF3E5] = "Validity (checksum)",
    [0x7EF403] = "Num Saves/Deaths",
    [0x7EF405] = "Post-game Death Counter",
    [0x7EF4FE] = "Inverse checksum",
} -- }}}
local overworld_names = { -- {{{
    [0x00] = "Lost Woods",
    [0x02] = "Northeast House",
    [0x03] = "Spectacle Rock",
    [0x05] = "Death Mountain East",
    [0x07] = "Turtle Rock",
    [0x0A] = "Death Mountain Cave",
    [0x0F] = "Waterfall Near Zora's Domain",
    [0x10] = "Lost Woods Entrance",
    [0x11] = "Fortune Teller's House",
    [0x12] = "Teleport Lake",
    [0x13] = "Sanctuary",
    [0x14] = "Cemetary",
    [0x15] = "River Area",
    [0x16] = "Witch's Hut",
    [0x17] = "Another Waterfall",
    [0x18] = "Kakariko Village",
    [0x1A] = "Another Forest",
    [0x1B] = "Hyrule Castle",
    [0x1D] = "Bridge Near Castle",
    [0x1E] = "Eastern Palace",
    [0x22] = "Blacksmiths' House",
    [0x25] = "Octorok Area",
    [0x28] = "Fencepost Maze",
    [0x29] = "Kakariko Library",
    [0x2A] = "Haunted Grove",
    [0x2B] = "Before Flute Area",
    [0x2C] = "Link's House",
    [0x2D] = "Bridge to Hyrule Castle",
    [0x2E] = "South of Eastern Palace",
    [0x2F] = "Peg Circle",
    [0x30] = "Desert of Mystery",
    [0x32] = "Bluffs Near Desert",
    [0x33] = "Near the Swamp",
    [0x34] = "Great Swamp North",
    [0x35] = "Lake Hylia",
    [0x37] = "Ice Rod Cave",
    [0x3A] = "Sleeping Man Area",
    [0x3B] = "Great Swamp South",
    [0x3C] = "Great Swamp SE",
    [0x3F] = "Lake Hylia SE",
    [0x40] = "Skull Woods",
    [0x42] = "Northeast House",
    [0x43] = "Ganon's Tower",
    [0x45] = "Death Mountain East",
    [0x47] = "Turtle Rock",
    [0x4A] = "Magic Cape Cave",
    [0x4F] = "Mysterious Pond",
    [0x50] = "Outside Skull Woods",
    [0x51] = "Fortune Teller's House",
    [0x52] = "Small Lake",
    [0x53] = "Dark Sanctuary",
    [0x54] = "Dark Graveyard",
    [0x55] = "Dark Waterway",
    [0x56] = "Dark Witch's Hut",
    [0x57] = "Dark Lake Hylia Shore",
    [0x58] = "Thieves' Town",
    [0x5A] = "House I've Never Seen",
    [0x5B] = "Pyramid of Power",
    [0x5D] = "Broken Bridge",
    [0x5E] = "Hedge Maze",
    [0x62] = "Locked Chest House",
    [0x65] = "Octorok Area",
    [0x68] = "Shovel Game",
    [0x69] = "Arrow Game",
    [0x6A] = "Haunted Grove",
    [0x6B] = "Outside Haunted Grove",
    [0x6C] = "Dark Link's House",
    [0x6D] = "Peg Bridge",
    [0x6E] = "Outside Hedge Maze",
    [0x6F] = "Dark Peg Circle",
    [0x70] = "Misery Mire",
    [0x72] = "Outside Misery Mire",
    [0x73] = "Outside Dark Swamp",
    [0x74] = "Dark Swamp North",
    [0x75] = "Frozen Lake Hylia",
    [0x77] = "Black Ice Cave",
    [0x7A] = "Dark Sleeping Man",
    [0x7B] = "Swamp Palace",
    [0x7C] = "Dark Swamp SE",
    [0x7F] = "Dark Waterfall",
    [0x80] = "Unknown 1 (Master Sword Area)",
    [0x88] = "Unknown 2",
    [0x93] = "Unknown 3",
    [0x94] = "Unknown 4 (Master Sword Area)",
    [0x95] = "Unknown 5 (Zora's Domain)",
    [0x96] = "Unknown 6",
    [0x97] = "Unknown 7",
    [0x9C] = "Unknown 8",
    [0x9D] = "Unknown 9",
    [0x9E] = "Unknown 10 (Lost Woods Overlay)",
    [0x9F] = "Unknown 11 (Rain)",
} -- }}}
local underworld_names = { -- {{{
    [0x0000] = "Ganon",
    [0x0001] = "Hyrule Castle (North Corridor)",
    [0x0002] = "Hyrule Castle (Switch Room)",
    [0x0003] = "Houlihan Room",
    [0x0004] = "Turtle Rock (Crysta-roller Room)",
    [0x0005] = "Empty Clone Room",
    [0x0006] = "Swamp Palace (Arrghus[Boss])",
    [0x0007] = "Tower of Hera (Moldorm[Boss])",
    [0x0008] = "Cave (Healing Fairy)",
    [0x0009] = "Palace of Darkness",
    [0x000A] = "Palace of Darkness (Stalfos Trap Room)",
    [0x000B] = "Palace of Darkness (Turtle Room)",
    [0x000C] = "Ganon's Tower (Entrance Room)",
    [0x000D] = "Ganon's Tower (Agahnim2[Boss])",
    [0x000E] = "Ice Palace (Entrance Room)",
    [0x000F] = "Empty Clone Room",
    [0x0010] = "Ganon Evacuation Route",
    [0x0011] = "Hyrule Castle (Bombable Stock Room)",
    [0x0012] = "Sanctuary",
    [0x0013] = "Turtle Rock (Hokku-Bokku Key Room 2)",
    [0x0014] = "Turtle Rock (Big Key Room)",
    [0x0015] = "Turtle Rock",
    [0x0016] = "Swamp Palace (Swimming Treadmill)",
    [0x0017] = "Tower of Hera (Moldorm Fall Room)",
    [0x0018] = "Cave",
    [0x0019] = "Palace of Darkness (Dark Maze)",
    [0x001A] = "Palace of Darkness (Big Chest Room)",
    [0x001B] = "Palace of Darkness (Mimics / Moving Wall Room)",
    [0x001C] = "Ganon's Tower (Ice Armos)",
    [0x001D] = "Ganon's Tower (Final Hallway)",
    [0x001E] = "Ice Palace (Bomb Floor / Bari Room)",
    [0x001F] = "Ice Palace (Pengator / Big Key Room)",
    [0x0020] = "Agahnim's Tower (Agahnim[Boss])",
    [0x0021] = "Hyrule Castle (Key-rat Room)",
    [0x0022] = "Hyrule Castle (Sewer Text Trigger Room)",
    [0x0023] = "Turtle Rock (West Exit to Balcony)",
    [0x0024] = "Turtle Rock (Double Hokku-Bokku / Big chest Room)",
    [0x0025] = "Empty Clone Room",
    [0x0026] = "Swamp Palace (Statue Room)",
    [0x0027] = "Tower of Hera (Big Chest)",
    [0x0028] = "Swamp Palace (Entrance Room)",
    [0x0029] = "Skull Woods (Mothula[Boss])",
    [0x002A] = "Palace of Darkness (Big Hub Room)",
    [0x002B] = "Palace of Darkness (Map Chest / Fairy Room)",
    [0x002C] = "Cave",
    [0x002D] = "Empty Clone Room",
    [0x002E] = "Ice Palace (Compass Room)",
    [0x002F] = "Cave (Kakariko Well HP)",
    [0x0030] = "Agahnim's Tower (Maiden Sacrifice Chamber)",
    [0x0031] = "Tower of Hera (Hardhat Beetles Room)",
    [0x0032] = "Hyrule Castle (Sewer Key Chest Room)",
    [0x0033] = "Desert Palace (Lanmolas[Boss])",
    [0x0034] = "Swamp Palace (Push Block Puzzle / Pre-Big Key Room)",
    [0x0035] = "Swamp Palace (Big Key / BS Room)",
    [0x0036] = "Swamp Palace (Big Chest Room)",
    [0x0037] = "Swamp Palace (Map Chest / Water Fill Room)",
    [0x0038] = "Swamp Palace (Key Pot Room)",
    [0x0039] = "Skull Woods (Gibdo Key / Mothula Hole Room)",
    [0x003A] = "Palace of Darkness (Bombable Floor Room)",
    [0x003B] = "Palace of Darkness (Spike Block / Conveyor Room)",
    [0x003C] = "Cave",
    [0x003D] = "Ganon's Tower (Torch Room 2)",
    [0x003E] = "Ice Palace (Stalfos Knights / Conveyor Hellway)",
    [0x003F] = "Ice Palace (Map Chest Room)",
    [0x0040] = "Agahnim's Tower (Final Bridge Room)",
    [0x0041] = "Hyrule Castle (First Dark Room)",
    [0x0042] = "Hyrule Castle (6 Ropes Room)",
    [0x0043] = "Desert Palace (Torch Puzzle / Moving Wall Room)",
    [0x0044] = "Thieves Town (Big Chest Room)",
    [0x0045] = "Thieves Town (Jail Cells Room)",
    [0x0046] = "Swamp Palace (Compass Chest Room)",
    [0x0047] = "Empty Clone Room",
    [0x0048] = "Empty Clone Room",
    [0x0049] = "Skull Woods (Gibdo Torch Puzzle Room)",
    [0x004A] = "Palace of Darkness (Entrance Room)",
    [0x004B] = "Palace of Darkness (Warps / South Mimics Room)",
    [0x004C] = "Ganon's Tower (Mini-Helmasaur Conveyor Room)",
    [0x004D] = "Ganon's Tower (Moldorm Room)",
    [0x004E] = "Ice Palace (Bomb-Jump Room)",
    [0x004F] = "Ice Palace Clone Room (Fairy Room)",
    [0x0050] = "Hyrule Castle (West Corridor)",
    [0x0051] = "Hyrule Castle (Throne Room)",
    [0x0052] = "Hyrule Castle (East Corridor)",
    [0x0053] = "Desert Palace (Popos 2 / Beamos Hellway Room)",
    [0x0054] = "Swamp Palace (Upstairs Pits Room)",
    [0x0055] = "Castle Secret Entrance / Uncle Death Room",
    [0x0056] = "Skull Woods (Key Pot / Trap Room)",
    [0x0057] = "Skull Woods (Big Key Room)",
    [0x0058] = "Skull Woods (Big Chest Room)",
    [0x0059] = "Skull Woods (Final Section Entrance Room)",
    [0x005A] = "Palace of Darkness (Helmasaur King[Boss])",
    [0x005B] = "Ganon's Tower (Spike Pit Room)",
    [0x005C] = "Ganon's Tower (Ganon-Ball Z)",
    [0x005D] = "Ganon's Tower (Gauntlet 1/2/3)",
    [0x005E] = "Ice Palace (Lonely Firebar)",
    [0x005F] = "Ice Palace (Hidden Chest / Spike Floor Room)",
    [0x0060] = "Hyrule Castle (West Entrance Room)",
    [0x0061] = "Hyrule Castle (Main Entrance Room)",
    [0x0062] = "Hyrule Castle (East Entrance Room)",
    [0x0063] = "Desert Palace (Final Section Entrance Room)",
    [0x0064] = "Thieves Town (West Attic Room)",
    [0x0065] = "Thieves Town (East Attic Room)",
    [0x0066] = "Swamp Palace (Hidden Chest / Hidden Door Room)",
    [0x0067] = "Skull Woods (Compass Chest Room)",
    [0x0068] = "Skull Woods (Key Chest / Trap Room)",
    [0x0069] = "Empty Clone Room",
    [0x006A] = "Palace of Darkness (Rupee Room)",
    [0x006B] = "Ganon's Tower (Mimics Rooms)",
    [0x006C] = "Ganon's Tower (Lanmolas Room)",
    [0x006D] = "Ganon's Tower (Gauntlet 4/5)",
    [0x006E] = "Ice Palace (Pengators Room)",
    [0x006F] = "Empty Clone Room",
    [0x0070] = "Hyrule Castle (Small Corridor to Jail Cells)",
    [0x0071] = "Hyrule Castle (Boomerang Chest Room)",
    [0x0072] = "Hyrule Castle (Map Chest Room)",
    [0x0073] = "Desert Palace (Big Chest Room)",
    [0x0074] = "Desert Palace (Map Chest Room)",
    [0x0075] = "Desert Palace (Big Key Chest Room)",
    [0x0076] = "Swamp Palace (Water Drain Room)",
    [0x0077] = "Tower of Hera (Entrance Room)",
    [0x0078] = "Empty Clone Room",
    [0x0079] = "Empty Clone Room",
    [0x007A] = "Empty Clone Room",
    [0x007B] = "Ganon's Tower",
    [0x007C] = "Ganon's Tower (East Side Collapsing Bridge / Exploding Wall Room)",
    [0x007D] = "Ganon's Tower (Winder / Warp Maze Room)",
    [0x007E] = "Ice Palace (Hidden Chest / Bombable Floor Room)",
    [0x007F] = "Ice Palace ( Big Spike Traps Room)",
    [0x0080] = "Hyrule Castle (Jail Cell Room)",
    [0x0081] = "Hyrule Castle",
    [0x0082] = "Hyrule Castle (Basement Chasm Room)",
    [0x0083] = "Desert Palace (West Entrance Room)",
    [0x0084] = "Desert Palace (Main Entrance Room)",
    [0x0085] = "Desert Palace (East Entrance Room)",
    [0x0086] = "Empty Clone Room",
    [0x0087] = "Tower of Hera (Tile Room)",
    [0x0088] = "Empty Clone Room",
    [0x0089] = "Eastern Palace (Fairy Room)",
    [0x008A] = "Empty Clone Room",
    [0x008B] = "Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room)",
    [0x008C] = "Ganon's Tower (East and West Downstairs / Big Chest Room)",
    [0x008D] = "Ganon's Tower (Tile / Torch Puzzle Room)",
    [0x008E] = "Ice Palace",
    [0x008F] = "Empty Clone Room",
    [0x0090] = "Misery Mire (Vitreous[Boss])",
    [0x0091] = "Misery Mire (Final Switch Room)",
    [0x0092] = "Misery Mire (Dark Bomb Wall / Switches Room)",
    [0x0093] = "Misery Mire (Dark Cane Floor Switch Puzzle Room)",
    [0x0094] = "Empty Clone Room",
    [0x0095] = "Ganon's Tower (Final Collapsing Bridge Room)",
    [0x0096] = "Ganon's Tower (Torches 1 Room)",
    [0x0097] = "Misery Mire (Torch Puzzle / Moving Wall Room)",
    [0x0098] = "Misery Mire (Entrance Room)",
    [0x0099] = "Eastern Palace (Eyegore Key Room)",
    [0x009A] = "Empty Clone Room",
    [0x009B] = "Ganon's Tower (Many Spikes / Warp Maze Room)",
    [0x009C] = "Ganon's Tower (Invisible Floor Maze Room)",
    [0x009D] = "Ganon's Tower (Compass Chest / Invisible Floor Room)",
    [0x009E] = "Ice Palace (Big Chest Room)",
    [0x009F] = "Ice Palace",
    [0x00A0] = "Misery Mire (Pre-Vitreous Room)",
    [0x00A1] = "Misery Mire (Fish Room)",
    [0x00A2] = "Misery Mire (Bridge Key Chest Room)",
    [0x00A3] = "Misery Mire",
    [0x00A4] = "Turtle Rock (Trinexx[Boss])",
    [0x00A5] = "Ganon's Tower (Wizzrobes Rooms)",
    [0x00A6] = "Ganon's Tower (Moldorm Fall Room)",
    [0x00A7] = "Tower of Hera (Fairy Room)",
    [0x00A8] = "Eastern Palace (Stalfos Spawn Room)",
    [0x00A9] = "Eastern Palace (Big Chest Room)",
    [0x00AA] = "Eastern Palace (Map Chest Room)",
    [0x00AB] = "Thieves Town (Moving Spikes / Key Pot Room)",
    [0x00AC] = "Thieves Town (Blind The Thief[Boss])",
    [0x00AD] = "Empty Clone Room",
    [0x00AE] = "Ice Palace",
    [0x00AF] = "Ice Palace (Ice Bridge Room)",
    [0x00B0] = "Agahnim's Tower (Circle of Pots)",
    [0x00B1] = "Misery Mire (Hourglass Room)",
    [0x00B2] = "Misery Mire (Slug Room)",
    [0x00B3] = "Misery Mire (Spike Key Chest Room)",
    [0x00B4] = "Turtle Rock (Pre-Trinexx Room)",
    [0x00B5] = "Turtle Rock (Dark Maze)",
    [0x00B6] = "Turtle Rock (Chain Chomps Room)",
    [0x00B7] = "Turtle Rock (Map Chest / Key Chest / Roller Room)",
    [0x00B8] = "Eastern Palace (Big Key Room)",
    [0x00B9] = "Eastern Palace (Lobby Cannonballs Room)",
    [0x00BA] = "Eastern Palace (Dark Antifairy / Key Pot Room)",
    [0x00BB] = "Thieves Town (Hellway)",
    [0x00BC] = "Thieves Town (Conveyor Toilet)",
    [0x00BD] = "Empty Clone Room",
    [0x00BE] = "Ice Palace (Block Puzzle Room)",
    [0x00BF] = "Ice Palace Clone Room (Switch Room)",
    [0x00C0] = "Agahnim's Tower (Dark Bridge Room)",
    [0x00C1] = "Misery Mire (Compass Chest / Tile Room)",
    [0x00C2] = "Misery Mire (Big Hub Room)",
    [0x00C3] = "Misery Mire (Big Chest Room)",
    [0x00C4] = "Turtle Rock (Final Crystal Switch Puzzle Room)",
    [0x00C5] = "Turtle Rock (Laser Bridge)",
    [0x00C6] = "Turtle Rock",
    [0x00C7] = "Turtle Rock (Torch Puzzle)",
    [0x00C8] = "Eastern Palace (Armos Knights[Boss])",
    [0x00C9] = "Eastern Palace (Entrance Room)",
    [0x00CA] = "??",
    [0x00CB] = "Thieves Town (North West Entrance Room)",
    [0x00CC] = "Thieves Town (North East Entrance Room)",
    [0x00CD] = "Empty Clone Room",
    [0x00CE] = "Ice Palace (Hole to Kholdstare Room)",
    [0x00CF] = "Empty Clone Room",
    [0x00D0] = "Agahnim's Tower (Dark Maze)",
    [0x00D1] = "Misery Mire (Conveyor Slug / Big Key Room)",
    [0x00D2] = "Misery Mire (Mire02 / Wizzrobes Room)",
    [0x00D3] = "Empty Clone Room",
    [0x00D4] = "Empty Clone Room",
    [0x00D5] = "Turtle Rock (Laser Key Room)",
    [0x00D6] = "Turtle Rock (Entrance Room)",
    [0x00D7] = "Empty Clone Room",
    [0x00D8] = "Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room)",
    [0x00D9] = "Eastern Palace (Canonball Room)",
    [0x00DA] = "Eastern Palace",
    [0x00DB] = "Thieves Town (Main (South West) Entrance Room)",
    [0x00DC] = "Thieves Town (South East Entrance Room)",
    [0x00DD] = "Empty Clone Room",
    [0x00DE] = "Ice Palace (Kholdstare[Boss])",
    [0x00DF] = "Cave",
    [0x00E0] = "Agahnim's Tower (Entrance Room)",
    [0x00E1] = "Cave (Lost Woods HP)",
    [0x00E2] = "Cave (Lumberjack's Tree HP)",
    [0x00E3] = "Cave (1/2 Magic)",
    [0x00E4] = "Cave (Lost Old Man Final Cave)",
    [0x00E5] = "Cave (Lost Old Man Final Cave)",
    [0x00E6] = "Cave",
    [0x00E7] = "Cave",
    [0x00E8] = "Cave",
    [0x00E9] = "Empty Clone Room",
    [0x00EA] = "Cave (Spectacle Rock HP)",
    [0x00EB] = "Cave",
    [0x00EC] = "Empty Clone Room",
    [0x00ED] = "Cave",
    [0x00EE] = "Cave (Spiral Cave)",
    [0x00EF] = "Cave (Crystal Switch / 5 Chests Room)",
    [0x00F0] = "Cave (Lost Old Man Starting Cave)",
    [0x00F1] = "Cave (Lost Old Man Starting Cave)",
    [0x00F2] = "House",
    [0x00F3] = "House (Old Woman (Sahasrahla's Wife?))",
    [0x00F4] = "House (Angry Brothers)",
    [0x00F5] = "House (Angry Brothers)",
    [0x00F6] = "Empty Clone Room",
    [0x00F7] = "Empty Clone Room",
    [0x00F8] = "Cave",
    [0x00F9] = "Cave",
    [0x00FA] = "Cave",
    [0x00FB] = "Cave",
    [0x00FC] = "Empty Clone Room",
    [0x00FD] = "Cave",
    [0x00FE] = "Cave",
    [0x00FF] = "Cave",
} -- }}}

local function annotate_room_value(val)
    -- d d d d b k ck cr | c c c c q q q q
    all_bits = {"q", "q", "q", "q", "c", "c", "c", "c", "R", "K", "k", "b", "d", "d", "d", "d"}
    selected_bits = {}

    for i, bit_verbose in pairs(all_bits) do
        if bit.band(val, bit.lshift(1, i)) > 0 then
            table.insert(selected_bits, 1, bit_verbose)
        else
            table.insert(selected_bits, 1, ".")
        end
    end

    return table.concat(selected_bits, "")
end

local function annotate_overworld_value(val)
    -- ?ho???s?
    all_bits = {"?", "h", "o", "?", "?", "?", "s", "?"}
    selected_bits = {}

    for i, bit_verbose in pairs(all_bits) do
        if bit.band(val, bit.lshift(1, i)) > 0 then
            table.insert(selected_bits, 1, bit_verbose)
        else
            table.insert(selected_bits, 1, ".")
        end
    end

    return table.concat(selected_bits, "")
end

local function annotate_address(addr, val)
    if addr >= 0x7E0B08 and addr <= 0x7E0BFF then
        return "Arc variable"
    end

    if addr >= 0x7E010E and addr < 0x7E010F then
        return "Dungeon entrance index"
    end

    if addr >= 0x7E0540 and addr < 0x7E0560 then
        return "Object tilemap state"
    end

    if addr >= 0x7E0468 and addr <= 0x7E0469 then
        return "Trap door state"
    end

    if addr >= 0x7E0641 and addr <= 0x7E0642 then
        return "Room puzzle state (?)"
    end

    if addr == 0x7E1ABF or addr == 0x7E1ACF or addr == 0x7E1ADF or addr == 0x7E1AEF then
        return "Warp Vortex Coordinate"
    end

    if addr >= 0x7EC140 and addr < 0x7EC172 then
        return "Underworld exit cache"
    end

    if addr == 0x7E002F then
        return "Link's direction"
    end

    if addr == 0x7E0202 or (addr >= 0x7E0302 and addr <= 0x7E0303) then
        return "Selected menu item"
    end

    if addr >= 0x7EC74A and addr <= 0x7EC74D then
        return "Selected menu gfx, row 1"
    end

    if addr >= 0x7EC78A and addr <= 0x7EC78D then
        return "Selected menu gfx, row 2"
    end

    if addr >= 0x7EC172 and addr <= 0x7EC173 then
        return "Crystal switch state"
    end

    if addr >= 0x7FDF80 and addr <= 0x7FE200 then
        local screen_index = math.floor((addr - 0x7FDF80) / 2)
        if in_overworld() then
            return "Overworld " .. tohex(screen_index) .. " persistent: " .. (overworld_names[screen_index] or 'UNKNOWN')
        else
            return "Room " .. tohex(screen_index) .. " persistent: " .. (underworld_names[screen_index] or 'UNKNOWN')
        end
    end

    if addr >= 0x7EF000 and addr <= 0x7EF24F then
        local room_index = math.floor((addr - 0x7EF000)/ 2)
        local name = underworld_names[room_index] or "Unknown"
        return "Room " .. tohex(room_index, 4) .. ": " .. name .. " (" .. annotate_room_value(val) .. ")"
    elseif addr >= 0x7EF280 and addr <= 0x7EF300 then
        local screen_index = addr - 0x7EF280
        local name = overworld_names[room_index] or "Unknown"
        return "Overworld " .. tohex(screen_index, 2) .. ": " .. name .. " (" .. annotate_overworld_value(val) .. ")"
    end

    if equipment_verbose[addr] then
        return equipment_verbose[addr]
    end

    if addr >= 0x7EF37C and addr <= 0x7EF389 then
        return "Key for dungeon " .. tohex(addr - 0x7EF37C, 2)
    end

    if addr >= 0x7EF3D9 and addr <= 0x7EF3E4 then
        return "Player name"
    end

    if addr >= 0x7EF3E7 and addr <= 0x7EF402 then
        return "Deaths"
    end

    debug("Unknown address: ", tohex(addr, 6))
    return ""
end


-- Overworld

local function fetch_ow_table()
    return {
        screen_idx = memory.readword(0x7E008A),
        unk1 = memory.readword(0x7E0084),
        bg1_vscroll = memory.readword(0x7E00E6),
        bg2_vscroll = memory.readword(0x7E00E8),
        bg1_hscroll = memory.readword(0x7E00E0),
        bg2_hscroll = memory.readword(0x7E00E2),
        link_y = memory.readword(0x7E0020),
        link_x = memory.readword(0x7E0022),
        scroll_y = memory.readword(0x7E0618),
        scroll_x = memory.readword(0x7E061C),
        unk2 = memory.readword(0x7E0624),
        unk3 = memory.readword(0x7E0628),
    }
end

function draw_overworld()
    local T = fetch_ow_table()
    draw_lines(2, 18, {
        "Screen    : " .. tohex(T.screen_idx, 4),
        "Link X    : " .. tohex(T.link_x, 4),
        "Link Y    : " .. tohex(T.link_y, 4),
        "BG1 V Scr : " .. tohex(T.bg1_vscroll, 4),
        "BG2 V Scr : " .. tohex(T.bg2_vscroll, 4),
        "BG1 H Scr : " .. tohex(T.bg1_hscroll, 4),
        "BG2 H Scr : " .. tohex(T.bg2_hscroll, 4),
        "Scroll X  : " .. tohex(T.scroll_x, 4),
        "Scroll Y  : " .. tohex(T.scroll_y, 4),
        "Unknown 1 : " .. tohex(T.unk1, 4),
        "Unknown 2 : " .. tohex(T.unk2, 4),
        "Unknown 3 : " .. tohex(T.unk3, 4),
    })
end

function save_overworld(slug)
    local T = fetch_ow_table()
    preset_output = preset_output .. "\n" .. table.concat({
        "preset_" .. slug .. ":",
        db(1, "Overworld"),
        dw(T.screen_idx, "Screen Index"),
        dw(T.link_x, "Link X"),
        dw(T.link_y, "Link Y"),
        dw(T.bg1_vscroll, "BG1 Vertical Scroll"),
        dw(T.bg2_vscroll, "BG2 Vertical Scroll"),
        dw(T.bg1_hscroll, "BG1 Horizontal Scroll"),
        dw(T.bg2_hscroll, "BG2 Horizontal Scroll"),
        dw(T.scroll_x, "Scroll X"),
        dw(T.scroll_y, "Scroll Y"),
        dw(T.unk1, "Unknown 1"),
        dw(T.unk2, "Unknown 2"),
        dw(T.unk3, "Unknown 3"),
        "dw sram_" .. slug .. "_after",
    }, "\n") .. "\n"
end


-- Dungeon

local function fetch_dng_table()
    return {
        relative_coords = {memory.readword(0x7E0600), memory.readword(0x7E0602),
                           memory.readword(0x7E0604), memory.readword(0x7E0606),
                           memory.readword(0x7E0608), memory.readword(0x7E060A),
                           memory.readword(0x7E060C), memory.readword(0x7E060E)},
        main_graphics = memory.readbyte(0x7E0AA1),
        starting_floor = memory.readbyte(0x7E00A4),
        palace_no = memory.readbyte(0x7E040C),
        door_orientation = memory.readbyte(0x7E006C),
        starting_bg = memory.readbyte(0x7E00EE),
        music_track = memory.readbyte(0x7E0132),

        room = memory.readword(0x7E00A0),
        bg1_vscroll = memory.readword(0x7E00E6),
        bg2_vscroll = memory.readword(0x7E00E8),
        bg1_hscroll = memory.readword(0x7E00E0),
        bg2_hscroll = memory.readword(0x7E00E2),
        link_y = memory.readword(0x7E0020),
        link_x = memory.readword(0x7E0022),
        camera_y = memory.readword(0x7E0618),
        camera_x = memory.readword(0x7E061C),
        quadrant_1 = memory.readword(0x7E00A6),
        quadrant_2 = memory.readword(0x7E00A9),
        door_settings = memory.readword(0x7E0696),
    }
end

function save_dungeon(slug)
    local T = fetch_dng_table()
    preset_output = preset_output .. "\n" .. table.concat({
        "preset_" .. slug .. ":",
        db(2, "Dungeon"),
        dw(T.room, "Room Index"),
        dw(T.bg1_vscroll, "BG1 Vertical Scroll"),
        dw(T.bg2_vscroll, "BG2 Vertical Scroll"),
        dw(T.bg1_hscroll, "BG1 Horizontal Scroll"),
        dw(T.bg2_hscroll, "BG2 Horizontal Scroll"),
        dw(T.link_x, "Link X"),
        dw(T.link_y, "Link Y"),
        dw(T.camera_x, "Camera X"),
        dw(T.camera_y, "Camera Y"),
        dw(T.door_settings, "Door Settings"),
        dw(T.relative_coords[1], "Relative Coords HU"),
        dw(T.relative_coords[2], "Relative Coords FU"),
        dw(T.relative_coords[3], "Relative Coords HD"),
        dw(T.relative_coords[4], "Relative Coords FD"),
        dw(T.relative_coords[5], "Relative Coords HL"),
        dw(T.relative_coords[6], "Relative Coords FL"),
        dw(T.relative_coords[7], "Relative Coords HR"),
        dw(T.relative_coords[8], "Relative Coords FR"),
        dw(T.quadrant_1, "Quadrant 1"),
        dw(T.quadrant_2, "Quadrant 2"),

        db(T.main_graphics, "Main Graphics"),
        db(T.music_track, "Music Track"),
        db(T.starting_floor, "Starting Floor"),
        db(T.palace_no, "Palace No"),
        db(T.door_orientation, "Door Orientation"),
        db(T.starting_bg, "Starting Background"),
        "dw sram_" .. slug .. "_after",
    }, "\n") .. "\n"
end

function draw_dungeon()
    local T = fetch_dng_table()
    draw_lines(2, 18, {
        "Room      : " .. tohex(T.room, 4),
        "Bg1 V Scr : " .. tohex(T.bg1_vscroll, 4),
        "Bg2 V Scr : " .. tohex(T.bg2_vscroll, 4),
        "Bg1 H Scr : " .. tohex(T.bg1_hscroll, 4),
        "Bg2 H Scr : " .. tohex(T.bg2_hscroll, 4),
        "Link X    : " .. tohex(T.link_x, 4),
        "Link Y    : " .. tohex(T.link_y, 4),
        "Camera X  : " .. tohex(T.camera_x, 4),
        "Camera Y  : " .. tohex(T.camera_y, 4),
        "Door Sett.: " .. tohex(T.door_settings, 4),
        "Rel. coord: " .. (tohex(T.relative_coords[1], 4) .. "," .. tohex(T.relative_coords[2], 4) .. "," ..
                           tohex(T.relative_coords[3], 4) .. "," .. tohex(T.relative_coords[4], 4) .. "," ..
                           tohex(T.relative_coords[5], 4) .. "," .. tohex(T.relative_coords[6], 4) .. "," ..
                           tohex(T.relative_coords[7], 4) .. "," .. tohex(T.relative_coords[8], 4)),
        "Quad 1    : " .. tohex(T.quadrant_1, 4),
        "Quad 2    : " .. tohex(T.quadrant_2, 4),

        "Main Gfx  : " .. tohex(T.main_graphics, 2),
        "Music     : " .. tohex(T.music_track, 2),
        "Floor     : " .. tohex(T.starting_floor, 2),
        "Palace    : " .. tohex(T.palace_no, 2),
        "Door Orie : " .. tohex(T.door_orientation, 2),
        "Start BG  : " .. tohex(T.starting_bg, 2),
    })
end


-- SRAM state

local function put_quadrant_info_in_state_table()
    -- We're reversing the following:
    --
    -- ; What room are we in... use it as an index.
    -- LDA $A0 : ASL A : TAX
    --
    -- ; Store other data, like chests opened, bosses killed, etc.
    -- LDA $0402 : LSR #4 : STA $06
    --
    -- ; Store information about this room when it changes.
    -- LDA $0400 : AND.w #$F000 : ORA $0408 : ORA $06 : STA $7EF000, X

    local room_index = bit.lshift(memory.readword(0x7E00A0), 1)
    local data_06 = bit.rshift(memory.readword(0x7E0402), 4)
    local data_0400 = bit.band(memory.readword(0x7E0400), 0xF000)
    local data_0408 = memory.readword(0x7E0408)
    local data_value = bit.bor(bit.bor(data_0400, data_0408), data_06)

    local addr = 0x7EF000 + room_index
    local cache_value = memory.readword(addr)
    local value = bit.bor(data_value, cache_value)

    -- I write to memory to make sure it actually works (would be desynced quite fast if not)
    memory.writeword(addr, value)
    debug("-> wrote ", tohex(0x7EF000 + room_index), "=", tohex(value))
    state_changed(addr, 2)
end


function save_sram_delta(slug)
    if in_underworld() then
        put_quadrant_info_in_state_table()
    end

    local room_idx = memory.readword(0x7E00A0)

    sram_output = sram_output .. "\nsram_" .. slug .. ":\n"
    for addr, size_and_val in pairs(current_state) do
        local size = size_and_val[1]
        local val = size_and_val[2]

        local should_skip_underworld_cache = (addr >= 0x7EC140 and addr < 0x7EC172) and (in_overworld() or (in_underworld() and room_idx < 0x100))
        if last_save_state[addr] ~= val and not should_skip_underworld_cache then
            last_save_state[addr] = val

            -- Don't store 0 writes to the first state, since we'll clear SRAM before loading these.
            if num_states > 1 or val > 0 then
                sram_output = sram_output ..  "dl " ..  tohex(addr, 6) .. " : "
                sram_output = sram_output ..  "db " ..  tohex(size, 2) .. " : "
                sram_output = sram_output .. (size == 1 and "db " or "dw ") ..  tohex(val, size == 1 and 2 or 4)
                sram_output = sram_output .. " ; " .. annotate_address(addr, val) .. "\n"
            end
        end
    end
    sram_output = sram_output .. ".after\n"
end


-- Main functionality

function make_preset_save(slug)
    num_states = num_states + 1
    save_sram_delta(slug)

    if in_overworld() then
        save_overworld(slug)
    else
        save_dungeon(slug)
    end

    print("Saved", slug)
    debug("Saved", slug)
    local file = io.open("data.txt", "w")
    file:write("; Preset locations\n" .. preset_output .. "\n\n")
    file:write("; Preset SRAM changes\n" .. sram_output .. "\n\n")
    file:close()
end


local last_save_input = false  -- cache of whether or not user pressed S last frame

function tick_state()
    local save_input = input.get().S

    if save_input ~= last_save_input then
        last_save_input = save_input
        if save_input then
            make_preset_save("custom_" .. tostring(num_states))
        end
    end
end

function tick_movie()
    local frame = emu.framecount()

    slug = movie_steps[frame]
    if slug then
        make_preset_save(slug)
    end
end


-- Callbacks

function state_changed(addr, size)
    if addr < 0x200000 then
        addr = bit.band(addr, 0xFFFF)
        addr = 0x7E0000 + addr
    end

    val = size == 1 and memory.readbyte(addr) or memory.readword(addr)
    if current_state[addr] == nil or current_state[addr][2] ~= val then
        local line = "[" .. tohex(memory.getregister("pb"), 2) .. ":" .. tohex(memory.getregister("pc"), 4) .. "] "
                     .. tohex(addr, 6) .. "[" .. tostring(size) .. "] = " .. tohex(val, size == 1 and 2 or 4)
                     .. (size == 1 and "   | " or " | ") .. annotate_address(addr, val) .. " F=" .. emu.framecount()
        debug(line)
    end
    current_state[addr] = {size, val}
end


function draw_ui()
    if in_overworld() then
        draw_overworld()
    else
        draw_dungeon()
    end
end


-- Main

function main()
    -- SRAM working data
    memory.registerwrite(0x7EF000, 0x4FF, state_changed)

    -- Underworld sprite state (killed or not)
    memory.registerwrite(0x7FDF80, 0x280, state_changed)

    -- Crystal Switch state
    memory.registerwrite(0x7EC172, 0x2, state_changed)

    -- Selected menu item
    memory.registerwrite(0x0D0202, 0x1, state_changed) -- used in equipment.asm
    memory.registerwrite(0x0D0302, 0x2, state_changed) -- what ability link has when pressing Y 
    memory.registerwrite(0x7EC74A, 0x4, state_changed) -- graphics, row 1
    memory.registerwrite(0x7EC78A, 0x4, state_changed) -- graphics, row 2

    -- Link's direction
    memory.registerwrite(0x7E002F, 0x1, state_changed)

    -- Underworld exit cache (for room index >= 0x100, except Link's House & Zoras Domain)
    memory.registerwrite(0x7EC140, 0x32, state_changed)

    -- Warp location (where the warp vortex is located after warping from DW to LW)
    call_for_each_bank(0x0000, function (bank_only)
        memory.registerwrite(bank_only + 0x1ABF, 0x1, state_changed)
        memory.registerwrite(bank_only + 0x1ACF, 0x1, state_changed)
        memory.registerwrite(bank_only + 0x1ADF, 0x1, state_changed)
        memory.registerwrite(bank_only + 0x1AEF, 0x1, state_changed)
    end)

    -- Indicates if we solved a puzzle (to e.g. open a door) in the current room.
    call_for_each_bank(0x0641, function (addr_with_bank)
        memory.registerwrite(addr_with_bank, 0x2, state_changed)
    end)

    -- State of trap doors (opened or not)
    call_for_each_bank(0x0468, function (addr_with_bank)
        memory.registerwrite(addr_with_bank, 0x2, state_changed)
    end)

    -- Object tilemap attributes (MoN says position but I think its more?)
    call_for_each_bank(0x0540, function (addr_with_bank)
        memory.registerwrite(addr_with_bank, 0x20, state_changed)
    end)

    -- Dungeon entrance index
    call_for_each_bank(0x010E, function (addr_with_bank)
        memory.registerwrite(addr_with_bank, 0x2, state_changed)
    end)

    -- Arc variable
    call_for_each_bank(0x0B08, function (addr_with_bank)
        memory.registerwrite(addr_with_bank, 0x2, state_changed)
    end)

    gui.register(draw_ui)

    while true do
        tick_state()
        tick_movie()
        snes9x.frameadvance()
    end
end


main()
