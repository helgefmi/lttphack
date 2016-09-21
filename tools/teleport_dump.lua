local last_save_state = {} -- holds all state that has been changed up untill last save
local current_state = {} -- state changes since last save (will be emptied for each change)
local sram_output = ""
local preset_output = ""
local num_states = 0

local movie_steps = { -- {{{
    -- Escape
    [1900] = "links_bed",
    [5770] = "courtyard",
    [6330] = "entrance",
    [7646] = "1st_keyguard",
    [8966] = "big_room",
    [9756] = "2nd_keyguard",
    [11092] = "ball_n_chains",
    [15093] = "keyguard_revisited",
    [17288] = "secret_passage",
    [18338] = "snake_avoidance_room",
    [20284] = "keyrat",
    [21335] = "last_two_screens",
    -- Eastern
    [22184] = "before_cutscene",
    [23708] = "after_cutscene",
    [25720] = "octoroc",
    [26541] = "ep overworld",
    [28086] = "entrance",
    [29962] = "stalfos_room",
    [32159] = "dark_key_room",
    [33492] = "big_key_dmg_boost",
    [34604] = "big_chest_room",
    [35516] = "gwg",
    [36040] = "pot_room",
    [37133] = "zeldagamer_room",
    [37945] = "armos",
    -- Desert
    [39993] = "outside_eastern_palace",
    [41862] = "ep_spinspeed",
    [44397] = "unholy_spinspeed",
    [46968] = "water_dash",
    [49591] = "desert_entrance",
    [50540] = "keybonk",
    [51794] = "pre_cannonball_room",
    [53803] = "pot_room",
    [55451] = "desert2_spinspeed",
    [56862] = "popo_genocide_room",
    [58004] = "torches",
    [58995] = "lanmolas",
    -- Hera
    [61408] = "outside_desert_palace",
    [62920] = "fake_flippers",
    [66550] = "dm",
    [67499] = "after_mirror",
    [69321] = "entrance",
    [70568] = "tile_room",
    [73384] = "torches",
    [74293] = "beetles",
    [75505] = "petting_zoo",
    [77291] = "moldorm",
    -- Agatower
    [80099] = "outside_hera",
    [81427] = "first_rupee_tree",
    [82375] = "lost_woods",
    [87154] = "after_lost_woods",
    [89759] = "tower_entrance",
    [91220] = "dark_room_of_despair",
    [92847] = "dark_room_of_melancholy",
    [93632] = "red_spears",
    [94433] = "circle_of_pot",
    [97618] = "agahnim",
    -- PoD
    [102972] = "pyramid",
    [104154] = "pod_overworld",
    [106570] = "entrance",
    [108249] = "main_hub",
    [112313] = "hammeryump",
    [114430] = "before_sexy_statue",
    [115630] = "mimics",
    [118081] = "turtle_room",
    [119315] = "helma",
    -- Theieves
    [124636] = "outside_pod",
    [126247] = "hammerdash",
    [127638] = "getting_flute",
    [130089] = "usain_bolt",
    [132234] = "after_activating_flute",
    [134031] = "darkworld",
    [134858] = "entrance",
    [136482] = "after_big_key",
    [138006] = "fire_room",
    [138334] = "hellway",
    [139796] = "bombable_floor",
    [142429] = "prison",
    [143816] = "after_gloves",
    [144376] = "hammerdash",
    [144376] = "hammerdash",
    [145037] = "blind",
    -- Skull Woods
    [150790] = "outside_theives",
    [150808] = "cursed_dwarf",
    [155126] = "got_tempered",
    [156699] = "dash_to_sw",
    [157754] = "mummy_room",
    [159673] = "bomb_jump",
    [161534] = "key_pot",
    [162431] = "skull_entrance",
    [163037] = "mummy_hellway",
    [163757] = "helma_key",
    [164126] = "mothula",
    -- Ice
    [168490] = "outside_skull",
    [169346] = "bridge_warp",
    [170871] = "lottery",
    [171950] = "medallion",
    [173468] = "zoras_domain",
    [177042] = "tiny_warp",
    [178067] = "ice_entrance",
    [178435] = "ice2",
    [179938] = "penguin_switch_room",
    [180584] = "bombable_floor",
    [181658] = "conveyor_room",
    [182094] = "ipbj",
    [183013] = "penguin_room",
    [183742] = "lonely_fireball",
    [184753] = "fall_in_hole",
    [185763] = "kholdstair",
    -- Swamp
    [190382] = "outside_ice",
    [191072] = "links_house",
    [192329] = "swamp_overworld",
    [193244] = "antifairy_room",
    [194319] = "entrance",
    [195969] = "first_key",
    [197600] = "main_hub",
    [199562] = "switch_room",
    [202105] = "sociable_firebar",
    [203444] = "backtracking",
    [204569] = "hook_shot",
    [205779] = "hookdash",
    [207934] = "restock",
    [209302] = "arrghus",
    -- Mire
    [214178] = "outside_swamp",
    [215011] = "dm",
    [217918] = "mire_darkworld_warp",
    [219615] = "mire_entrance",
    [220125] = "mire2",
    [222017] = "left_dash",
    [223066] = "dodongos",
    [226545] = "spark_gamble",
    [228244] = "spike_key",
    [229528] = "basement",
    [230377] = "cane_dash",
    [231141] = "bombable_wall",
    [233031] = "vitty",
    --  TRock
    [237271] = "ouside_mire",
    [238140] = "icerod_overworld",
    [240138] = "dm",
    [242452] = "trock_overworld",
    [244468] = "entrance",
    [245557] = "lanterns",
    [246430] = "roller_room",
    [247909] = "lonely_pokey",
    [248257] = "chomps",
    [250460] = "pokies 1",
    [252864] = "pokies 2",
    [253878] = "firebar_key",
    [256484] = "lazer_skip",
    [257241] = "switch_room",
    [258382] = "trinexxx",
    -- GTower
    [263886] = "outside_trock",
    [265964] = "entrance",
    [267262] = "spike_skip",
    [268512] = "firebar_room",
    [270901] = "bombable_floor",
    [271498] = "ice_armos",
    [273164] = "floor_2",
    [273797] = "mimics1",
    [274202] = "mimics2",
    [274696] = "spike_room",
    [275862] = "gauntlet",
    [277800] = "lanmola2",
    [279593] = "wizz2",
    [281370] = "torches2",
    [281759] = "helma_key",
    [282124] = "bombable_wall",
    [282738] = "moldorm_2",
    [284440] = "agahnim_2",
    -- Ganon
    [287664] = "pyramid",
} -- }}}


-- Utility functions

local function tohex(n, size)
    size = size or 0
    return string.format("$%0" .. tostring(size) .. "X", n)
end


local debug_file = io.open("debug.txt", "w")

local function debug(...)
    print(unpack(arg))
    debug_file:write(table.concat(arg, " ") .. "\n")
    debug_file:flush()
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
    [0x340] = "Bow",
    [0x341] = "Boomerang",
    [0x342] = "Hookshot",
    [0x343] = "Bombs",
    [0x344] = "Mushroom",
    [0x345] = "Fire Rod",
    [0x346] = "Ice Rod",
    [0x347] = "Bombos Medallion",
    [0x348] = "Ether Medallion",
    [0x349] = "Quake Medallion",
    [0x34A] = "Torch",
    [0x34B] = "Hammer",
    [0x34C] = "Flute",
    [0x34D] = "Bug Catching Net",
    [0x34E] = "Book of Mudora",
    [0x34F] = "Bottles",
    [0x350] = "Cane of Somaria",
    [0x351] = "Cane of Byrna",
    [0x352] = "Magic Cape",
    [0x353] = "Magic Mirror",
    [0x354] = "Gloves",
    [0x355] = "Boots",
    [0x356] = "Flippers",
    [0x357] = "Moon Pearl",
    [0x359] = "Sword",
    [0x35A] = "Shield",
    [0x35B] = "Armor",
    [0x35C] = "Bottle",
    [0x360] = "Rupees (goal)",
    [0x362] = "Rupees (actual)",
    [0x364] = "Compass1",
    [0x365] = "Compass2",
    [0x366] = "BigKey1",
    [0x367] = "BigKey2",
    [0x368] = "Dungeon map1",
    [0x369] = "Dungeon map2",
    [0x36B] = "Heart pieces collected",
    [0x36C] = "Health (goal)",
    [0x36D] = "Health (actual)",
    [0x36E] = "Magic Power",
    [0x36F] = "Keys",
    [0x370] = "Bomb Upgrades",
    [0x371] = "Arrow Upgrades",
    [0x372] = "Hearts filler",
    [0x373] = "Magic filler",
    [0x374] = "Pendants",
    [0x375] = "Bomb filler",
    [0x376] = "Arrow filler",
    [0x377] = "Arrows",
    [0x378] = "????",
    [0x379] = "Ability Flags",
    [0x37A] = "Crystals",
    [0x37B] = "Magic usage",
    [0x3C5] = "Game Phase 1",
    [0x3C6] = "Game Phase 2",
    [0x3C7] = "Map Phase",
    [0x3C8] = "Entrances Phase",
    [0x3C9] = "Game Phase 3",
    [0x3CA] = "LW/DW",
    [0x3CC] = "Tagalong",
    [0x3CD] = "Tagalong Y",
    [0x3CF] = "Tagalong X",
    [0x3D3] = "Super Bomb Boom",
    [0x3E5] = "Validity (checksum)",
    [0x403] = "Num Saves/Deaths",
    [0x405] = "Post-game Death Counter",
    [0x4FE] = "Inverse checksum",
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

local function annotate_address(real_addr, val)
    local addr = real_addr - 0x7EF000

    if addr <= 0x24F then
        local room_index = math.floor(addr / 2)
        local name = underworld_names[room_index] or "Unknown"
        return "Room " .. tohex(room_index, 4) .. ": " .. name .. " (" .. annotate_room_value(val) .. ")"
    elseif addr >= 0x280 and addr <= 0x300 then
        local screen_index = addr - 0x280
        local name = overworld_names[room_index] or "Unknown"
        return "Overworld " .. tohex(screen_index, 2) .. ": " .. name .. " (" .. annotate_overworld_value(val) .. ")"
    end

    if equipment_verbose[addr] then
        return equipment_verbose[addr]
    end

    if addr >= 0x37C and addr <= 0x389 then
        return "Key for dungeon " .. tohex(addr - 0x37C, 2)
    end

    if addr >= 0x3D9 and addr <= 0x3E4 then
        return "Player name"
    end

    if addr >= 0x3E7 and addr <= 0x402 then
        return "Deaths"
    end

    debug("Unknown address: ", tohex(real_addr, 6))
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

function save_sram_delta(slug)
    sram_output = sram_output .. "\nsram_" .. slug .. ":\n"
    for addr, size_and_val in pairs(current_state) do
        local size = size_and_val[1]
        local val = size_and_val[2]
        if last_save_state[addr] ~= val then
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
    memory.registerwrite(0x7EF000, 0x4FF, state_changed)
    gui.register(draw_ui)

    while true do
        tick_state()
        tick_movie()
        snes9x.frameadvance()
    end
end


main()
