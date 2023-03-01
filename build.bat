set version="14.3.4"

cd target

copy alttp.sfc "lttphacksa1.sfc"
copy alttp.sfc "lttphacksa1rando.sfc"

asar.exe --fix-checksum=on -DVERSION=%version% -DRANDO=0 "../src/main.asm" "lttphacksa1.sfc"
asar.exe --fix-checksum=on -DVERSION=%version% -DRANDO=1 "../src/main.asm" "lttphacksa1rando.sfc"

flips --create --bps alttp.sfc "lttphacksa1.sfc" "../docs/patcher/files/sa1.bps"
flips --create --bps alttp.sfc "lttphacksa1rando.sfc" "../docs/patcher/files/sa1rando.bps"

del "lttphacksa1.sfc"
del "lttphacksa1rando.sfc"

pause