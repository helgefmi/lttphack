#!/usr/bin/env python
# coding: utf-8
import sys
import re

from loc_conv import from_physical


def main(filename):
    with open(filename, 'rb') as f:
        cts = f.read()

    empty_matches = re.compile('\xff+').finditer(cts)
    sorted_matches = sorted(empty_matches, key=lambda m: -1 * len(m.group()))

    for i, m in enumerate(sorted_matches):
        phys_addr = m.start()
        num_empty_bytes = len(m.group())
        print(from_physical(phys_addr), num_empty_bytes)
        if i >= 10:
            break


if __name__ == '__main__':
    main(sys.argv[1])
