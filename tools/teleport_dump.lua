local last_save_state = {} -- holds all state that has been changed up untill last save
local current_state = {} -- state changes since last save (will be emptied for each change)
local state_output = "" -- state changes in 7E:F000 - 7E:F4FF
local preset_output = "" -- dungeon/overworld data related to links position
local num_states = 0
local last_save_input = false  -- cache of whether or not user pressed S last frame
local debug_file = io.open("debug.txt", "w")

local function tohex(n, size)
    size = size or 0
    return string.format("$%0" .. tostring(size) .. "X", n)
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

local function annotate_address(real_addr)
    addr = real_addr - 0x7EF000
    if addr <= 0x24F then
      return "Room " .. tohex(math.floor(addr / 2), 4)
    elseif addr >= 0x280 and addr <= 0x300 then
      return "Overworld " .. tohex(addr - 0x280, 2)
    end

    equipment = {
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
    }
    if equipment[addr] then
        return equipment[addr]
    end

    if addr >= 0x37C and addr <= 0x389 then
        return "Key for dungeon " .. tohex(addr - 0x37C, 2)
    end

    if addr >= 0x3D9 and addr <= 0x3E4 then
        return "Player Name"
    end

    if addr >= 0x3E7 and addr <= 0x402 then
        return "Deaths Total"
    end

    print("Unknown address: ", tohex(real_addr, 6))
    snes9x.pause()
    return ""
end

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

function print_overworld()
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

function save_overworld()
    local T = fetch_ow_table()
    preset_output = preset_output .. "\n\n" .. table.concat({
        ".save_" .. tostring(num_states),
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
        "dw .after_state_" .. tostring(num_states),
    }, "\n") .. "\n"
end

function print_dungeon()
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

function save_dungeon()
    local T = fetch_dng_table()
    preset_output = preset_output .. "\n\n" .. table.concat({
        ".save_" .. tostring(num_states),
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
        "dw .after_state_" .. tostring(num_states),
    }, "\n") .. "\n"
end

function save_current_state()
    state_output = state_output .. "\n\n.state_" .. tostring(num_states) .. "\n"
    for addr, size_and_val in pairs(current_state) do
        local size = size_and_val[1]
        local val = size_and_val[2]
        if last_save_state[addr] ~= val then
            state_output = state_output ..  "dl " ..  tohex(addr, 6) .. " : "
            state_output = state_output ..  "db " ..  tohex(size, 2) .. " : "
            state_output = state_output .. (size == 1 and "db " or "dl ") ..  tohex(val, size == 1 and 2 or 4)
            state_output = state_output .. " ; " .. annotate_address(addr)
            last_save_state[addr] = val
        end
    end
    state_output = state_output .. ".after_state_" .. tostring(num_states) .. "\n"
end

function tick()
    local save_input = input.get().S
    local do_save = false

    if save_input ~= last_save_input then
        last_save_input = save_input
        do_save = save_input
    end

    if do_save then
        num_states = num_states + 1
        save_current_state()
    end

    if in_overworld() then
        print_overworld()
        if do_save then
            save_overworld()
        end
    else
        print_dungeon()
        if do_save then
            save_dungeon()
        end
    end

    if do_save then
        print("Saved state", num_states)
        local file = io.open ("data.txt", "w")
        file:write("; Location Presets\n" .. preset_output .. "\n\n; State Changes\n" .. state_output)
        file:close()
    end
end

function state_changed(addr, size)
    val = size == 1 and memory.readbyte(addr) or memory.readword(addr)
    if current_state[addr] == nil or current_state[addr][2] ~= val then
        local line = "[" .. tohex(memory.getregister("pb"), 2) .. ":" .. tohex(memory.getregister("pc"), 4) .. "] "
                     .. tohex(addr, 6) .. "[" .. tostring(size) .. "] = " .. tohex(val, size == 1 and 2 or 4)
                     .. (size == 1 and "   | " or " | ") .. annotate_address(addr, val)
        print(line)
        debug_file:write(line .. "\n")
        debug_file:flush()
    end
    current_state[addr] = {size, val}
end

memory.registerwrite(0x7EF000, 0x4FF, state_changed)

while true do
    tick()
    snes9x.frameadvance()
end
