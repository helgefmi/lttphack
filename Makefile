jp:
	cp sfc/zelda_jp.sfc target/lttphack.sfc && cd src && asar main.asm ../target/lttphack.sfc && cd -

jpnoss:
	cp sfc/zelda_jp.sfc target/lttphack_noss.sfc && cd src && asar -DFEATURE_SS=0 main.asm ../target/lttphack_noss.sfc && cd -

jpnohud:
	cp sfc/zelda_jp.sfc target/lttphack_nohud.sfc && cd src && asar -DFEATURE_HUD=0 main.asm ../target/lttphack_nohud.sfc && cd -

jpnossnohud:
	cp sfc/zelda_jp.sfc target/lttphack_nossnohud.sfc && cd src && asar -DFEATURE_SS=0 -DFEATURE_HUD=0 main.asm ../target/lttphack_nossnohud.sfc && cd -

all: jp jpnohud jpnoss jpnossnohud

clean:
	rm -f target/*
