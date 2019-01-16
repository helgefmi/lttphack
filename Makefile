jp:
	cp sfc/zelda_jp.sfc target/lttphack.sfc && cd src && asar -DFEATURE_SD2SNES=0 -DFEATURE_HUD=1 main.asm ../target/lttphack.sfc && cd -

jpnohud:
	cp sfc/zelda_jp.sfc target/lttphack_VanillaHUD.sfc && cd src && asar -DFEATURE_SD2SNES=0 -DFEATURE_HUD=0 main.asm ../target/lttphack_VanillaHUD.sfc && cd -

jpsd2snes:
	cp sfc/zelda_jp.sfc target/lttphack_SD2SNES.sfc && cd src && asar -DFEATURE_SD2SNES=1 -DFEATURE_HUD=1 main.asm ../target/lttphack_SD2SNES.sfc && cd -

jpsd2snesnohud:
	cp sfc/zelda_jp.sfc target/lttphack_SD2SNES_VanillaHUD.sfc && cd src && asar -DFEATURE_SD2SNES=1 -DFEATURE_HUD=0 main.asm ../target/lttphack_SD2SNES_VanillaHUD.sfc && cd -

ohko:
	cp sfc/zelda_jp_ohko.sfc target/ohko.sfc && cd src && asar ohko.asm ../target/ohko.sfc && cd -


all: jp jpsd2snes jpnohud jpsd2snesnohud

clean:
	rm -f target/*
