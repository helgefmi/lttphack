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

local function quadrant(mem)
  byte1 = memory.readbyte(mem)
  byte2 = memory.readbyte(mem + 1)
  return bit.bor(bit.lshift(byte1, 4), bit.band(byte2, 0x0F))
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
    relative_coords = {memory.readbyte(0x7E0601), memory.readbyte(0x7E0603),
                       memory.readbyte(0x7E0605), memory.readbyte(0x7E0607),
                       memory.readbyte(0x7E0609), memory.readbyte(0x7E060B),
                       memory.readbyte(0x7E060D), memory.readbyte(0x7E060F)},
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
    quadrant_1 = quadrant(0x7E00A6),
    quadrant_2 = quadrant(0x7E00A9),
    door_settings = memory.readword(0x7E0696),
  }
end

local output = ""
local last_save_input = false

while true do
  local save_input = input.get().S
  local do_save = false
  if save_input ~= last_save_input then
    last_save_input = save_input
    do_save = save_input
  end
  
  if in_overworld() then
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
    if do_save then
      output = output .. "\n\n" .. table.concat({
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
      }, "\n") .. "\n"
    end
  else
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
    if do_save then
      output = output .. "\n\n" .. table.concat({
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

        db(T.relative_coords[1], "Relative Coords"),
        db(T.relative_coords[2], "Relative Coords"),
        db(T.relative_coords[3], "Relative Coords"),
        db(T.relative_coords[4], "Relative Coords"),
        db(T.relative_coords[5], "Relative Coords"),
        db(T.relative_coords[6], "Relative Coords"),
        db(T.relative_coords[7], "Relative Coords"),
        db(T.relative_coords[8], "Relative Coords"),
        db(T.main_graphics, "Main Graphics"),
        db(T.music_track, "Music Track"),
        db(T.starting_floor, "Starting Floor"),
        db(T.palace_no, "Palace No"),
        db(T.door_orientation, "Door Orientation"),
        db(T.starting_bg, "Starting Background"),
        db(T.quadrant_1, "Quadrant 1"),
        db(T.quadrant_2, "Quadrant 2"),
     }, "\n") .. "\n"
    end
  end

  if do_save then
    local file = io.open ("test.txt", "w")
    file:write(output)
    file:close()
  end
  
  snes9x.frameadvance()
end
