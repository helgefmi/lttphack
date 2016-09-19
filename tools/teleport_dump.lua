local previous_state_changes = {} -- holds all state that has been changed up untill last save
local state_changes = {} -- state changes since last save (will be emptied for each change)
local state_output = "" -- state changes in 7E:F000 - 7E:F4FF
local preset_output = "" -- dungeon/overworld data related to links position
local num_states = 0
local last_save_input = false  -- cache of whether or not user pressed S last frame

local function tohex(n)
    return string.format("$%X", n)
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
    return "dw " .. tohex(n) .. " ; " .. comment
end

local function db(n, comment)
    return "db " .. tohex(n) .. " ; " .. comment
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
        "Screen    : " .. tohex(T.screen_idx),
        "Link X    : " .. tohex(T.link_x),
        "Link Y    : " .. tohex(T.link_y),
        "BG1 V Scr : " .. tohex(T.bg1_vscroll),
        "BG2 V Scr : " .. tohex(T.bg2_vscroll),
        "BG1 H Scr : " .. tohex(T.bg1_hscroll),
        "BG2 H Scr : " .. tohex(T.bg2_hscroll),
        "Scroll X  : " .. tohex(T.scroll_x),
        "Scroll Y  : " .. tohex(T.scroll_y),
        "Unknown 1 : " .. tohex(T.unk1),
        "Unknown 2 : " .. tosigned16(T.unk2),
        "Unknown 3 : " .. tosigned16(T.unk3),
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
        "Room      : " .. tohex(T.room),
        "Bg1 V Scr : " .. tohex(T.bg1_vscroll),
        "Bg2 V Scr : " .. tohex(T.bg2_vscroll),
        "Bg1 H Scr : " .. tohex(T.bg1_hscroll),
        "Bg2 H Scr : " .. tohex(T.bg2_hscroll),
        "Link X    : " .. tohex(T.link_x),
        "Link Y    : " .. tohex(T.link_y),
        "Camera X  : " .. tohex(T.camera_x),
        "Camera Y  : " .. tohex(T.camera_y),
        "Door Sett.: " .. tohex(T.door_settings),

        "Rel. coord: " .. (tohex(T.relative_coords[1]) .. "," .. tohex(T.relative_coords[2]) .. "," ..
                           tohex(T.relative_coords[3]) .. "," .. tohex(T.relative_coords[4]) .. "," ..
                           tohex(T.relative_coords[5]) .. "," .. tohex(T.relative_coords[6]) .. "," ..
                           tohex(T.relative_coords[7]) .. "," .. tohex(T.relative_coords[8])),
        "Main Gfx  : " .. tohex(T.main_graphics),
        "Music     : " .. tohex(T.music_track),
        "Floor     : " .. tohex(T.starting_floor),
        "Palace    : " .. tohex(T.palace_no),
        "Door Orie : " .. tohex(T.door_orientation),
        "Start BG  : " .. tohex(T.starting_bg),
        "Quad 1    : " .. tohex(T.quadrant_1),
        "Quad 2    : " .. tohex(T.quadrant_2),
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
    for k, v in pairs(state_changes) do
        if previous_state_changes[k] ~= v then
            state_output = state_output .. "dl " .. tohex(k) .. " : db " .. tohex(v[1]) .. " : dw " .. tohex(v[2]) .. "\n"
            previous_state_changes[k] = v
        end
    end
    state_output = state_output .. ".after_state_" .. tostring(num_states) .. "\n"
    state_changes = {}
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
        local file = io.open ("test.txt", "w")
        file:write("; Location Presets\n" .. preset_output .. "\n\n; State Changes\n" .. state_output)
        file:close()
    end
end

function state_changed(a, size)
    val = size == 1 and memory.readbyte(a) or memory.readword(a)
    print("[" .. tohex(memory.getregister("pb")) .. ":" .. tohex(memory.getregister("pc")) .. "] " .. tohex(a) .. " (" .. tostring(size) .. ") = " .. tostring(val))
    state_changes[a] = {size, val}
end

memory.registerwrite(0x7E0400, 0x10, state_changed)
memory.registerwrite(0x7EF000, 0x4FF, state_changed)

while true do
    tick()
    snes9x.frameadvance()
end
