TARGET=plp

jp:
	cp sfc/zelda_jp.sfc target/lttphack_jp.sfc && cd src && xkas lttphack_jp.asm ../target/lttphack_jp.sfc && cd -

all: jp

clean:
	rm -f target/*
