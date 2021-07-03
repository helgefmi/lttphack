Original hack by pinkus, under new management.

# Building

Download [Asar](https://github.com/RPGHacker/asar) (You can build it yourself or grab a recent [release](https://github.com/RPGHacker/asar/releases)). Unzip it somewhere and make sure `asar.exe` is on your path.

Download [flips](https://github.com/Alcaro/Flips) (You can build it yourself, or there's [a pre-built version](https://github.com/Alcaro/Flips). You'll have to rename or make a copy of `flips.exe` named just `flips`. Make sure this is on your path as well.

Make a directory called `target` and copy your vanilla rom into it with the filename `alttp.sfc`.

Now you should be able to double-click `build.bat` and have your ROMs built!

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
