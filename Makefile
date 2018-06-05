jp:
	cp sfc/zelda_jp.sfc target/lttphack.sfc && cd src && asar main.asm ../target/lttphack.sfc && cd -

jpnoss:
	cp sfc/zelda_jp.sfc target/lttphack_noss.sfc && cd src && asar -DFEATURE_SS=0 main.asm ../target/lttphack_noss.sfc && cd -

jppss:
	cp sfc/zelda_jp.sfc target/lttphack_pss.sfc && cd src && asar -DFEATURE_SS=0 -DFEATURE_PSS=1 main.asm ../target/lttphack_pss.sfc && cd -

jpnohud:
	cp sfc/zelda_jp.sfc target/lttphack_nohud.sfc && cd src && asar -DFEATURE_HUD=0 main.asm ../target/lttphack_nohud.sfc && cd -

jpnossnohud:
	cp sfc/zelda_jp.sfc target/lttphack_nossnohud.sfc && cd src && asar -DFEATURE_SS=0 -DFEATURE_HUD=0 main.asm ../target/lttphack_nossnohud.sfc && cd -

jppssnohud:
	cp sfc/zelda_jp.sfc target/lttphack_nossnohud.sfc && cd src && asar -DFEATURE_SS=0 -DFEATURE_PSS=1 -DFEATURE_HUD=0 main.asm ../target/lttphack_pssnohud.sfc && cd -


all: jp jpnohud jpnoss jppss jpnossnohud jppssnohud

clean:
	rm -f target/*
