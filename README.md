See http://milde.no/lttp/ for info.

Pull requests very much appreciated.

I use a custom version of [Asar](https://github.com/AndreaOrru/Asar) forked [here](https://github.com/helgefmi/Asar) as an assembler. See the Makefile for more information.

**PRESETS NOTES**

When making new presets (for hundo):

- Change `cm_presets_hundo.asm`:
    - Outside Swamp -> Outside Ice
    - Outside Ice -> Outside Mire
    - Outside Mire -> Outside Swamp

- Change `preset_data_hundo.asm`:
    - SRM: Move Mire before Swamp manually
    - Copy (both presets & sram)
        - outside_ice -> outside_swamp
        - outside_mire -> outside_ice
        - outside_swamp -> outside_mire
      DONT copy the "Manual changes" for SRAM. They're where they should be already.
