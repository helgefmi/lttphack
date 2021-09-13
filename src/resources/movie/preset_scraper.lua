console.clear()

fat_line = ';==================================================================================================='
long_line = ';---------------------------------------------------------------------------------------------------'

short_line = ';-----------------------------'

local running = true
local reading = true

u8 = 'read_u8'
u16 = 'read_u16_le'

file = forms.openfile()

io.input(file)

category = ''

presets = { frames = {} }
current_segment_num = 0
current_preset_num = 0
segment_count = 0

if preset_data then
	preset_data:close()
end

----------------------------------------------------------------------------------------------------

function labelize(s)
	return s:lower():gsub('[ -]', '_'):gsub('[^a-z0-9_]', '')
end

function labelize_trim(s)
	return s:lower():gsub('[^a-z0-9]', '')
end

function stylize(s)
	return s:gsub('[%s_]+', ' '):gsub("[^a-zA-Z0-9%%%$ .,'?!#%(%)-]", '')
end

----------------------------------------------------------------------------------------------------

while reading do
	local line = io.read()

	if string.find(line, '^@ ') then
		category = stylize(string.gsub(line, '^@ (%S.*%S)%s*$', '%1 #'):gsub('^%s*(.-)%s*#.*', '%1'))

	elseif string.find(line, '^= ') then
		local segment_name = string.gsub(line, '^= (%S.*%S)%s*$', '%1 #')
		segment_name = string.gsub(segment_name, '^%s*(.-)%s*#.*', '%1')

		if string.find(line, 'End') then
			reading = false
		else
			current_segment_num = current_segment_num + 1
			segment_count = current_segment_num
			presets[current_segment_num] = {
				name = stylize(segment_name),
				frames = {}
				}
			current_preset_num = 0
		end
	elseif string.find(line, '^%d+ .*$') then
		current_preset_num = current_preset_num + 1
		local _, _, frame_count, preset_name = string.find(line, '^%s*(%d+) (%S.*%S)%s*$')

		preset_name = string.gsub(preset_name, '^%s*(.-)%s*#.*', '%1')

		frame_count = tonumber(frame_count)

		presets[current_segment_num][current_preset_num] = {
				ptype = nil,
				name = stylize(preset_name),
				preset_values = {},
				sram_values = {},
				persistent_values = {},
				single_values = {}
			}

		presets[current_segment_num].frames[current_preset_num] = frame_count
		presets.frames[frame_count] = { s = current_segment_num, p = current_preset_num }
	end

end

io.input():close()

preset_data = io.open(string.format('cm_presets_%s.asm', labelize_trim(category)), 'w')

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

function dprint(s)
	print(s)
	preset_data:write(s)
	preset_data:write('\n')
end

function print_preset(s, p)
	local d = presets[s][p]

	dprint(long_line)
	dprint(string.format('%%preset_%s("%s", "%s", "%s", "%s")',
		d.ptype,
		d.name,
		labelize_trim(category),
		labelize(presets[s].name),
		labelize(d.name)
	))

	local e = d.preset_values

	dprint(string.format('dw $%04X ; Screen ID', e.screen))
	dprint(string.format('dw $%04X, $%04X ; Link Coords', e.coord_X, e.coord_Y))
	dprint(string.format('dw $%04X, $%04X ; Camera HV', e.scr_H, e.scr_V))
	dprint(string.format('db $%02X ; Item', e.item))
	dprint(string.format('db $%02X ; Direction', e.dir))

	dprint(short_line)

	if d.ptype == 'UW' then
		dprint(string.format('db $%02X ; Entrance', e.entrance))

		local temp = bit.bor(
			bit.lshift(e.quadA, 6),
			bit.lshift(e.quadB, 5)
		)

		temp = bit.bor(temp, bit.lshift(bit.band(e.quadC, 0x01), 4))
		temp = bit.bor(temp, bit.lshift(bit.band(e.quadD, 0x02), 4))

		temp = bit.bor(temp, bit.band(e.flr, 0x0F))

		dprint(string.format('db $%02X ; Room layout', temp))

		temp = bit.bor(
			bit.band(e.door, 0x03),
			bit.lshift(bit.band(e.pegs, 0x01), 6)
		)

		temp = bit.bor(temp, bit.lshift(bit.bxor(bit.band(e.shutters, 0x01), 0x01), 7))
		temp = bit.bor(temp, bit.lshift(bit.band(e.layerA, 0x01), 2))
		temp = bit.bor(temp, bit.lshift(bit.band(e.layerB, 0x01), 3))

		dprint(string.format('db $%02X ; Door / Peg state / Layer', temp))

		dprint(string.format('dw $%04X ; Dead sprites', e.dead))
	else
		dprint(string.format('dw $%04X, $%04X ; Scroll X,Y', e.mscr_X, e.mscr_Y))
		dprint(string.format('dw $%04X ; Tilemap position', e.tmap))
	end

	dprint(short_line)

	e = d.single_values
	if #e.u8_7E ~= 0 then
		dprint('%write8_enable()')

		for _, v in ipairs(e.u8_7E) do
			dprint(string.format('%%write8($%06X, $%02X) ; %s', v.addr, v.value, v.comment))
		end
	end

	if #e.u16_7E ~= 0 then
		dprint('%write16_enable()')

		for _, v in ipairs(e.u16_7E) do
			dprint(string.format('%%write16($%06X, $%04X) ; %s', v.addr, v.value, v.comment))
		end
	end

	if #e.u8_7F ~= 0 then
		dprint('%write_7F()')

		for _, v in ipairs(e.u8_7F) do
			dprint(string.format('%%write8($%06X, $%02X) ; %s', v.addr, v.value, v.comment))
		end
	end

	if #e.u16_7F ~= 0 then
		dprint('%write_7F_16()')

		for _, v in ipairs(e.u16_7F) do
			dprint(string.format('%%write16($%06X, $%04X) ; %s', v.addr, v.t, v.comment))
		end
	end

	dprint('%write_end()\n')

end

function print_header()
	dprint(fat_line)
	dprint('; PRESET DATA HEADER')
	dprint(fat_line)

	dprint(string.format('presetheader_%s:', labelize_trim(category)))
	dprint(string.format('	dw presetSRAM_%s ; location of SRAM', labelize_trim(category)))
	dprint(string.format('	dw presetpersistent_%s ; location of persistent data', labelize_trim(category)))

	dprint('\n'..fat_line)
	dprint(string.format('%%menu_header("%s", %s)', category, segment_count))

	for _, v in ipairs(presets) do
		dprint(string.format('	%%submenu("%s", presetmenu_%s_%s)', v.name, labelize_trim(category), labelize(v.name)))
	end

end

function print_segheader(s)
	if s == 1 then
		dprint('\n'..fat_line)
	else
		dprint(fat_line)
	end
	dprint(long_line)
	dprint('; ' .. presets[s].name:upper())
	dprint(long_line)
	dprint(fat_line)

	dprint(string.format('presetmenu_%s_%s:', labelize_trim(category), labelize(presets[s].name)))

	local sss = presets[s]
	dprint(string.format('%%menu_header("%s", %s)\n', sss.name, #sss))
end

function print_persist()
	dprint(fat_line)
	dprint(string.format('presetpersistent_%s:', labelize_trim(category)))

	for _, v in ipairs(presets) do
		dprint('\n'..fat_line)
		dprint(string.format('presetpersistent_%s_%s:', labelize_trim(category), labelize(v.name)))

		for _, w in ipairs(v) do
			dprint(short_line)
			dprint('.'..labelize(w.name))

			if #w.persistent_values > 0 then
				for _, g in ipairs(w.persistent_values) do
					if g.addr == 0x1ABF then
						local xl = g.value.xl
						local xh = g.value.xh
						local yl = g.value.yl
						local yh = g.value.yh

						if xl == 0 and xh == 0 and yl == 0 and yh == 0 then
							dprint('%write_sq()')
						else
							dprint(string.format('%%write_mirror($%02X, $%02X, $%02X, $%02X)', xl, xh, yl, yh))
						end
					else
						dprint(string.format('%%write8($%06X, $%02X) ; %s', g.addr, g.value, g.comment))
					end
				end
			end
			dprint('..end')
		end
	end
end

function print_sram()
	dprint('\n'..fat_line)
	dprint(string.format('presetSRAM_%s:', labelize_trim(category)))

	for _, v in ipairs(presets) do
		dprint(short_line)
		dprint('.'..labelize(v.name))

		for _, w in ipairs(v) do
			dprint(short_line)
			dprint('..'..labelize(w.name))

			for _, x in ipairs(w.sram_values) do
				if x.funcy == 'write8' then
					dprint(string.format('%%%s($%06X, $%02X) ; %s', x.funcy, x.addr, x.value, x.comment))
				elseif x.funcy == 'write16sram' then
					dprint(string.format('%%%s($%06X, $%04X) ; %s', x.funcy, x.addr, x.value, x.comment))
				elseif x.funcy == 'writeroom' then
					dprint(string.format('%%%s($%03X, $%04X)', x.funcy, x.addr, x.value))
				end
			end
			dprint('...end')
		end
	end
end

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

all_args = {
	coord_X = { f = u16, l = 0x0022 },
	coord_Y = { f = u16, l = 0x0020 },
	scr_V = { f = u16, l = 0x00E8 },
	scr_H = { f = u16, l = 0x00E2 },
	item = { f = u8, l = 0x0303 },
	dir = { f = u8, l = 0x002F }
}

uw_args = {
	entrance = { f = u8, l = 0x010E },
	quadA = { f = u8, l = 0x00A6 },
	quadB = { f = u8, l = 0x00A7 },
	quadC = { f = u8, l = 0x00A9 },
	quadD = { f = u8, l = 0x00AA },
	flr = { f = u8, l = 0x00A4 },
	pegs = { f = u8, l = 0xC172 },
	layerA = { f = u8, l = 0x00EE },
	layerB = { f = u8, l = 0x0476 },
	door = { f = u8, l = 0x006C },
	shutters = { f = u8, l = 0x0468 }
}

ow_args = {
	mscr_X = { f = u16, l = 0x061C },
	mscr_Y = { f = u16, l = 0x0618 },
	tmap = { f = u16, l = 0x0084 },
}

single_args = {
	{ addr = 0x00ABD, indoors = true, reader = u8, filter = 'nonzero', comment = 'Palette swap' },

	{ addr = 0x002E0, reader = u8, filter = 'nonzero', comment = 'Bunny' },
	{ addr = 0x00056, reader = u8, filter = 'nonzero', comment = 'Bunny' },
	{ addr = 0x0005D, reader = u8, filter = 'linkstate', comment = 'Link state' },

	{ addr = 0x002FA, reader = u8, filter = 'nonzero', comment = 'Statue drag' },

	{ addr = 0x00600, indoors = true, reader = u16, filter = 'cameray', comment = 'Camera boundaries' },
	{ addr = 0x00602, indoors = true, reader = u16, filter = 'cameray', comment = 'Camera boundaries' },
	{ addr = 0x00604, indoors = true, reader = u16, filter = 'cameray', comment = 'Camera boundaries' },
	{ addr = 0x00606, indoors = true, reader = u16, filter = 'cameray', comment = 'Camera boundaries' },
	{ addr = 0x00608, indoors = true, reader = u16, filter = 'camerax', comment = 'Camera boundaries' },
	{ addr = 0x0060A, indoors = true, reader = u16, filter = 'camerax', comment = 'Camera boundaries' },
	{ addr = 0x0060C, indoors = true, reader = u16, filter = 'camerax', comment = 'Camera boundaries' },
	{ addr = 0x0060E, indoors = true, reader = u16, filter = 'camerax', comment = 'Camera boundaries' },

--	{ addr = 0x00618, indoors = true, reader = u16, filter = 'cameray', comment = 'Camera boundaries' },
--	{ addr = 0x0061A, indoors = true, reader = u16, filter = 'cameray', comment = 'Camera boundaries' },
--	{ addr = 0x0061C, indoors = true, reader = u16, filter = 'camerax', comment = 'Camera boundaries' },
--	{ addr = 0x0061E, indoors = true, reader = u16, filter = 'camerax', comment = 'Camera boundaries' },

	{ addr = 0x0C140, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C142, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C144, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C146, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C148, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C14A, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C14C, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C14E, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C150, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C152, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C154, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C156, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C158, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C15A, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C15C, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C15E, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C160, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C162, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C164, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C166, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C16A, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C16C, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C16E, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },
	{ addr = 0x0C170, indoors = true, reader = u16, filter = 'eg2', comment = 'Entrance caching' },

}

single_arg_funcs = {
	nofilter = function() return true end,

	nonzero = function(a) return a ~= 0 end,

	linkstate = function(a) return a == 0x04 or a == 0x17 end,

	camerax = function()
		local a = memory.read_u16_le(0x00E2)
		local b = memory.read_u16_le(0x060A)
		local c = memory.read_u16_le(0x060E)

		return (a < b) or (a > c)
	end,

	cameray = function()
		local a = memory.read_u16_le(0x00E8)
		local b = memory.read_u16_le(0x0602)
		local c = memory.read_u16_le(0x0606)

		return (a < b) or (a > c)
	end,

	eg2 = function()
		local a = memory.read_u16_le(0x00A0)
		return (a > 0x0100) and (a ~= 0x0104)
	end
}

persist_args = {
	{ addr = 0x01ABF, comment = 'Mirror portal' },

	{ addr = 0x00B08, comment = 'Arc variable' },
	{ addr = 0x00B09, comment = 'Arc variable' },

	{ addr = 0x002A1, comment = 'Slot 3 Altitude' },
	{ addr = 0x002A2, comment = 'Slot 4 Altitude' },

	{ addr = 0x0044A, comment = 'EG strength' },
	{ addr = 0x0047A, comment = 'Armed EG' },

	{ addr = 0x00FC7, comment = 'Prize pack 1' },
	{ addr = 0x00FC8, comment = 'Prize pack 2' },
	{ addr = 0x00FC9, comment = 'Prize pack 3' },
	{ addr = 0x00FCA, comment = 'Prize pack 4' },
	{ addr = 0x00FCB, comment = 'Prize pack 5' },
	{ addr = 0x00FCC, comment = 'Prize pack 6' },
	{ addr = 0x00FCD, comment = 'Prize pack 7' },

	{ addr = 0x00CFB, comment = 'Rupee pull kills' },
	{ addr = 0x00CFC, comment = 'Rupee pull hits' },
}

sram_args = {
	{ addr = 0x0F340, reader = u8, comment = 'Bow' },
	{ addr = 0x0F341, reader = u8, comment = 'Boomerang' },
	{ addr = 0x0F342, reader = u8, comment = 'Hookshot' },
	{ addr = 0x0F343, reader = u8, comment = 'Bombs' },
	{ addr = 0x0F344, reader = u8, comment = 'Powder' },
	{ addr = 0x0F345, reader = u8, comment = 'Fire Rod' },
	{ addr = 0x0F346, reader = u8, comment = 'Ice Rod' },
	{ addr = 0x0F347, reader = u8, comment = 'Bombos' },
	{ addr = 0x0F348, reader = u8, comment = 'Ether' },
	{ addr = 0x0F349, reader = u8, comment = 'Quake' },
	{ addr = 0x0F34A, reader = u8, comment = 'Lamp' },
	{ addr = 0x0F34B, reader = u8, comment = 'Hammer' },
	{ addr = 0x0F34C, reader = u8, comment = 'Flute' },
	{ addr = 0x0F34D, reader = u8, comment = 'Net' },
	{ addr = 0x0F34E, reader = u8, comment = 'Book' },
	{ addr = 0x0F34F, reader = u8, comment = 'Bottles' },
	{ addr = 0x0F350, reader = u8, comment = 'Somaria' },
	{ addr = 0x0F351, reader = u8, comment = 'Byrna' },
	{ addr = 0x0F352, reader = u8, comment = 'Cape' },
	{ addr = 0x0F353, reader = u8, comment = 'Mirror' },
	{ addr = 0x0F354, reader = u8, comment = 'Gloves' },
	{ addr = 0x0F355, reader = u8, comment = 'Boots' },
	{ addr = 0x0F356, reader = u8, comment = 'Flippers' },
	{ addr = 0x0F357, reader = u8, comment = 'Pearl' },
	{ addr = 0x0F359, reader = u8, comment = 'Sword' },
	{ addr = 0x0F35A, reader = u8, comment = 'Shield' },
	{ addr = 0x0F35B, reader = u8, comment = 'Armor' },
	{ addr = 0x0F35C, reader = u8, comment = 'Bottle 1' },
	{ addr = 0x0F35D, reader = u8, comment = 'Bottle 2' },
	{ addr = 0x0F35E, reader = u8, comment = 'Bottle 3' },
	{ addr = 0x0F35F, reader = u8, comment = 'Bottle 4' },
	{ addr = 0x0F36B, reader = u8, comment = 'Heart pieces' },
	{ addr = 0x0F36C, reader = u8, comment = 'Max HP' },
	{ addr = 0x0F36D, reader = u8, comment = 'Health' },
	{ addr = 0x0F36E, reader = u8, comment = 'Magic' },
	{ addr = 0x0F36F, reader = u8, comment = 'Keys' },
	{ addr = 0x0F374, reader = u8, comment = 'Pendants' },
	{ addr = 0x0F377, reader = u8, comment = 'Arrows' },
	{ addr = 0x0F379, reader = u8, comment = 'Ability' },
	{ addr = 0x0F37A, reader = u8, comment = 'Crystals' },
	{ addr = 0x0F37B, reader = u8, comment = '1/2 magic' },

	{ addr = 0x0F37C, reader = u8, comment = 'EX keys' },
	{ addr = 0x0F37E, reader = u8, comment = 'EP keys' },
	{ addr = 0x0F37F, reader = u8, comment = 'DP keys' },
	{ addr = 0x0F380, reader = u8, comment = 'AT keys' },
	{ addr = 0x0F381, reader = u8, comment = 'SP keys' },
	{ addr = 0x0F382, reader = u8, comment = 'PD keys' },
	{ addr = 0x0F383, reader = u8, comment = 'MM keys' },
	{ addr = 0x0F384, reader = u8, comment = 'SW keys' },
	{ addr = 0x0F385, reader = u8, comment = 'IP keys' },
	{ addr = 0x0F386, reader = u8, comment = 'TH keys' },
	{ addr = 0x0F387, reader = u8, comment = 'TT keys' },
	{ addr = 0x0F388, reader = u8, comment = 'TR keys' },
	{ addr = 0x0F389, reader = u8, comment = 'GT keys' },

	{ addr = 0x0F3C5, reader = u8, comment = 'Game state' },
	{ addr = 0x0F3C6, reader = u8, comment = 'Game flags A' },
	{ addr = 0x0F3C7, reader = u8, comment = 'Map marker' },
	{ addr = 0x0F3C8, reader = u8, comment = 'Spawn point' },
	{ addr = 0x0F3C9, reader = u8, comment = 'Game flags B' },
	{ addr = 0x0F3CA, reader = u8, comment = 'LW/DW' },
	{ addr = 0x0F3CC, reader = u8, comment = 'Follower' },
	{ addr = 0x0F360, reader = u16, comment = 'Rupees' },
	{ addr = 0x0F364, reader = u16, comment = 'Compasses' },
	{ addr = 0x0F368, reader = u16, comment = 'Maps' },
	{ addr = 0x0F366, reader = u16, comment = 'Big keys' },
}

memory.usememorydomain('WRAM')

current_sram = {}

for i=0x0F000,0x0F3CC do
	current_sram[i] = 0
end

current_sram[0xF36C] = 0x18
current_sram[0xF36D] = 0x18
current_sram[0xF379] = 0xF8
current_sram[0xF20D] = 0xF0 -- room 106
current_sram[0xF20F] = 0xF0 -- room 107

current_persist = {
	[0x0FC7] = 0x00,
	[0x0FC8] = 0x00,
	[0x0FC9] = 0x00,
	[0x0FCA] = 0x00,
	[0x0FCB] = 0x00,
	[0x0FCC] = 0x00,
	[0x0FCD] = 0x00,
	[0x0FCE] = 0x00,
	[0x0CFB] = 0x00,
	[0x0CFC] = 0x00,
}


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

print_header()

current_segment_num = 0

while movie.mode() == 'PLAY' do
	emu.frameadvance()

	local state = presets.frames[emu.framecount()+60]

	if state then
		local s = state.s
		local p = state.p
		savestate.save(string.format('states/%s.%s.%s.%s.%s.%s.state',
			labelize_trim(category),
			s,
			p,
			labelize_trim(presets[s].name),
			labelize_trim(presets[s][p].name),
			emu.framecount()+60
		))
	end

	local snap = presets.frames[emu.framecount()]

	if snap then
		local seg = snap.s
		local pre = snap.p

		if seg ~= current_segment_num then
			current_segment_num = seg
			print_segheader(seg)
		end

		local ptype = nil
		local preset_values = {}
		local sram_values = {}
		local persistent_values = {}
		local single_values = {
			u8_7E = {}, u16_7E = {},
			u8_7F = {}, u16_7F = {}
		}

		local arglist = {}
		local ow = (memory.read_u8(0x001B) == 0)

		-- Do preset specific values
		for n, v in pairs(all_args) do
			preset_values[n] = memory[v.f](v.l)
		end

		local sid = 0

		if ow then
			sid = memory.read_u16_le(0x008A)
			ptype = 'OW'
			arglist = ow_args
		else
			sid = memory.read_u16_le(0x00A0)
			ptype = 'UW'
			arglist = uw_args
			preset_values.dead = memory.read_u16_le(0x1DF80+(sid*2))
		end

		for n, v in pairs(arglist) do
			preset_values[n] = memory[v.f](v.l)
		end

		preset_values.screen = sid

		-- Do SRAM
		for _, v in ipairs(sram_args) do
			local t = memory[v.reader](v.addr)
			if t ~= current_sram[v.addr] then
				local funccc = 'write8'
				if v.reader == u16 then funccc = 'write16sram' end
				current_sram[v.addr] = t
				table.insert(sram_values, {
					addr = bit.bor(v.addr, 0x7E0000),
					value = t,
					comment = v.comment,
					funcy = funccc
				})
			end
		end

		for i=0x0F280,0xF340 do
			local t = memory.read_u8(i)
			if t ~= current_sram[i] then
				current_sram[i] = t
				local screenid = bit.band(i,0xFFF)-0x280
				table.insert(sram_values, {
					addr = bit.bor(i, 0x7E0000),
					value = t,
					comment = string.format('OW screen $%02X', screenid),
					funcy = 'write8'
				})
			end
		end

		for i=0x0F000,0x0F27E,2 do
			local t = memory.read_u16_le(i)
			if t ~= current_sram[i] then

				-- dumb special shit for current room's flags
				if not ow then
					if (bit.band(i,0xFFF) == (sid*2)) then
						local rdata = 0x0000
						rdata = bit.bor(rdata, memory.read_u8(0x00408))
						rdata = bit.bor(rdata, bit.lshift(memory.read_u8(0x00403), 4))
						rdata = bit.bor(rdata, bit.band(memory.read_u16_le(0x00400), 0xF000))

						t = rdata
					end
				end

				current_sram[i] = t
				local roomid = bit.rshift(bit.band(i,0xFFF), 1)
				table.insert(sram_values, {
					addr = roomid,
					value = t,
					comment = string.format('Room $%04X', roomid),
					funcy = 'writeroom'
				})
			end
		end

		-- Do WRAM normal
		for _, v in ipairs(single_args) do
			if (v.indoors == nil) or v.indoors ~= ow then
				local t = memory[v.reader](v.addr)
				if single_arg_funcs[v.filter](t) then
					local M8 = v.reader == u8
					local B1 = v.addr >= 0xFFFF

					local addto = {}

					if not B1 then
						if M8 then
							addto = single_values.u8_7E
						else
							addto = single_values.u16_7E
						end
					else
						if M8 then
							addto = single_values.u8_7F
						else
							addto = single_values.u16_7F
						end
					end

					table.insert(addto, {
						addr = bit.bor(v.addr, 0x7E0000),
						value = t,
						comment = v.comment
					})
				end
			end
		end

		-- Do persistent WRAM
		for _, v in ipairs(persist_args) do
			if v.addr == 0x1ABF then
				local xl = memory.read_u8(0x1ABF)
				local xh = memory.read_u8(0x1ACF)
				local yl = memory.read_u8(0x1ADF)
				local yh = memory.read_u8(0x1AEF)

				local xlc = current_persist[0x1ABF] or -1
				local xhc = current_persist[0x1ACF] or -1
				local ylc = current_persist[0x1ADF] or -1
				local yhc = current_persist[0x1AEF] or -1

				if xl ~= xlc or xh ~= xhc or yl ~= ylc or yh ~= yhc then
					current_persist[0x1ABF] = xl
					current_persist[0x1ACF] = xh
					current_persist[0x1ADF] = yl
					current_persist[0x1AEF] = yh

					table.insert(persistent_values, {
						addr = 0x1ABF,
						value = { xl = xl, xh = xh, yl = yl, yh = yh }
					})
				end
			else
				local t = memory.read_u8(v.addr)
				local w = current_persist[v.addr] or -1

				if t ~= w then
					current_persist[v.addr] = t
					table.insert(persistent_values, {
						addr = bit.bor(v.addr, 0x7E0000),
						value = t,
						comment = v.comment
					})
				end
			end
		end

		presets[seg][pre].ptype = ptype
		presets[seg][pre].preset_values = preset_values
		presets[seg][pre].sram_values = sram_values
		presets[seg][pre].persistent_values = persistent_values
		presets[seg][pre].single_values = single_values

		print_preset(seg, pre)
	end
end

print_persist()
print_sram()

----------------------------------------------------------------------------------------------------

dprint(fat_line)
dprint(string.format('presetend_%s:', labelize_trim(category)))
dprint(string.format('print "%s size: $", hex(presetend_%s-presetheader_%s)', labelize_trim(category), labelize_trim(category), labelize_trim(category)))

preset_data:close()