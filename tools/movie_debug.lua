local QUIT = false

local MODE

local FS_RECORD
local FS_PLAY

local FRAME
local LAST_LAG

local RECORDED_STATE
local RECORDED_RNG_CALLS

local RNG_CALLS


local function tohex(n, size)
    size = size or 0
    return string.format("$%0" .. tostring(size) .. "X", n)
end


local function get_framecount()
    return emu.framecount() - emu.lagcount()
end


function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end


local function table_compare(t1, t2)
    local t1_keys = {}
    for k, v in pairs(t1) do
        t1_keys[k] = 1
        if v ~= t2[k] then
            print(k, 'differs:', v, '~=', t2[k])
            return false
        end
    end

    local t2_keys = {}
    for k, v in pairs(t2) do
        t2_keys[k] = 1
        if t1_keys[k] ~= 1 then
            print('Second argument has extra key:', k)
            return false
        end
    end

    for k, v in pairs(t1) do
        if t2_keys[k] ~= 1 then
            print('First argument has extra key:', k)
            return false
        end
    end

    return true
end


local function call_for_each_bank(address, fn, ...)
    for i = 0x00, 0x1F do
        fn(bit.lshift(i, 16) + address, unpack(arg))
    end
    fn(0x7E0000 + address, unpack(arg))
end


local function movie_mode()
    local ret = memory.readbyte(0x7F8000)
    if ret == 1 then
        return 'record'
    elseif ret == 2 then
        return 'play'
    end
end


local function get_state()
    local ret = {
        ['$22'] = memory.readwordunsigned(0x7E0022),
        ['$20'] = memory.readwordunsigned(0x7E0020),
        ['$1A'] = memory.readwordunsigned(0x7E001A),
        ['$F0'] = memory.readbyte(0x7E00F0),
        ['$F2'] = memory.readbyte(0x7E00F2),
        ['$F4'] = memory.readbyte(0x7E00F4),
        ['$F6'] = memory.readbyte(0x7E00F6),
    }

    if FRAME <= 55 then
        ret['$F0'] = nil
        ret['$F2'] = nil
        ret['$F4'] = nil
        ret['$F6'] = nil
    end

    return ret
end


local function do_record()
    FRAME = get_framecount() - FS_RECORD

    assert(RECORDED_STATE[FRAME] == nil)
    assert(RECORDED_RNG_CALLS[FRAME] == nil)

    RECORDED_STATE[FRAME] = get_state()
    RECORDED_RNG_CALLS[FRAME] = deepcopy(RNG_CALLS)
    RNG_CALLS = {}
end


local function do_play()
    FRAME = get_framecount() - FS_PLAY

    assert(RECORDED_STATE[FRAME] ~= nil)
    assert(RECORDED_RNG_CALLS[FRAME] ~= nil)

    local state = get_state()
    if not table_compare(RECORDED_STATE[FRAME], state) then
        print('Invalid state on frame', FRAME)
    end

    if not table_compare(RECORDED_RNG_CALLS[FRAME], RNG_CALLS) then
        print('Invalid RNG on frame', FRAME)
    end
    RNG_CALLS = {}
end


local function rng_hook(a, b, c)
    if MODE then
        local stack = memory.getregister('s')
        local addr = memory.readwordunsigned(stack + 1)
        local bank = memory.readbyteunsigned(stack + 3)
        local fulladdr = bit.lshift(bank, 16) + addr

        local value = bit.band(memory.getregister('a'), 0xFF)

        local rng_line = tohex(fulladdr, 6) .. ' = ' .. tohex(value, 2)
        table.insert(RNG_CALLS, rng_line)
    end
end


local function tick()
    local lag = emu.lagcount()
    if lag ~= LAST_LAG then
        LAST_LAG = lag
        return
    end

    local cur_mode = movie_mode()
    if MODE ~= cur_mode then
        print('Changing modes from', MODE, 'to', cur_mode)

        if cur_mode == 'record' then
            FS_RECORD = get_framecount()
            RECORDED_STATE = {}
            RECORDED_RNG_CALLS = {}
            RNG_CALLS = {}
            print('Starting record on frame', FS_RECORD)
        elseif cur_mode == 'play' then
            FS_PLAY = get_framecount()
            print('Starting playback on frame', FS_PLAY)
        else
            print('Waiting for record')
        end

        MODE = cur_mode
    end

    if MODE == 'record' then
        do_record()
    elseif MODE == 'play' then
        do_play()
    end
end


local function main()
    if movie_mode() ~= nil then
        print('Need to start without recording/playing back')
        return
    end

    memory.registerexecute(0x0DBA79, rng_hook)

    while not QUIT do
        tick()
        snes9x.frameadvance()
    end

    print('Quitting')
end

main()
