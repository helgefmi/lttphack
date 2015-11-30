#!/usr/bin/env python
# coding: utf-8

import sys

def from_physical(phys_addr):
    return '%02X%04X' % (phys_addr / 0x8000, (phys_addr & 0x7FFF) ^ 0x8000)

def main():
    n = eval(sys.argv[1])
    print from_physical(n)

if __name__ == '__main__':
    main()
