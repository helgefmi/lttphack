set version="13.6.0"
cd target
copy alttp.sfc "lttphack-%version%.sfc"
copy alttp.sfc "lttphack-%version% SD2SNES.sfc"
copy alttp.sfc "lttphack-%version% VanillaHUD.sfc"
copy alttp.sfc "lttphack-%version% SD2SNES VanillaHUD.sfc"
cd ../src

asar.exe -DFEATURE_SD2SNES=0 -DFEATURE_HUD=1 -DVERSION=%version% main.asm "../target/lttphack-%version%.sfc"
asar.exe -DFEATURE_SD2SNES=1 -DFEATURE_HUD=1 -DVERSION=%version% main.asm "../target/lttphack-%version% SD2SNES.sfc"
asar.exe -DFEATURE_SD2SNES=0 -DFEATURE_HUD=0 -DVERSION=%version% main.asm "../target/lttphack-%version% VanillaHUD.sfc"
asar.exe -DFEATURE_SD2SNES=1 -DFEATURE_HUD=0 -DVERSION=%version% main.asm "../target/lttphack-%version% SD2SNES VanillaHUD.sfc"

cd ../target

flips --create --bps alttp.sfc "lttphack-%version%.sfc" "../docs/patcher/files/emulator-customhud.bps"
flips --create --bps alttp.sfc "lttphack-%version% VanillaHUD.sfc" "../docs/patcher/files/emulator-vanillahud.bps"
flips --create --bps alttp.sfc "lttphack-%version% SD2SNES.sfc" "../docs/patcher/files/sd2snes-customhud.bps"
flips --create --bps alttp.sfc "lttphack-%version% SD2SNES VanillaHUD.sfc" "../docs/patcher/files/sd2snes-vanillahud.bps"

cd ..
pause