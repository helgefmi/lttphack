#!/usr/bin/env python3
import sys


def get_data(romdata, offset, depth=0):
    assert depth < 99

    size = (romdata[offset + 1] << 8) + romdata[offset]

    if size == 0:
        return b''

    new_offset = offset + size + 4
    return romdata[offset:new_offset] + get_data(romdata, new_offset, depth + 1)


def extract(romdata, filename, offset):
    print('writing to', filename)
    with open(filename, 'wb') as f:
        data = get_data(romdata, offset)
        print('size', len(data))
        f.write(data)
    print()


def main(romdata):
    # Non-music SPC data (can be ignored)
    # $198000 -> $C8000
    # extract(romdata, 'spc_intro.bin', 0xC8000)

    # Overworld music
    # Starts: $1A9EF5 -> $D1EF5
    extract(romdata, 'spc_overworld.bin', 0xD1EF5)

    # Underworld music
    # Starts: $1B8000 -> $D8000
    extract(romdata, 'spc_underworld.bin', 0xD8000)

    # Ending credits music
    # Starts: $1AD380 -> $D5380
    extract(romdata, 'spc_credits.bin', 0xD5380)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print('extract_songbanks.py zelda_jp_without_headers.sfc')
        exit(1)

    rom_filename = sys.argv[1]
    with open(rom_filename, 'rb') as f:
        romdata = f.read()

    main(romdata)
