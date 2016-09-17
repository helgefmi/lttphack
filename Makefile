TARGET=plp

jp:
	cp sfc/zelda_jp.sfc target/lttphack_jp.sfc && cd src && xkas main.asm ../target/lttphack_jp.sfc && cd -

all: jp

clean:
	rm -f target/*
