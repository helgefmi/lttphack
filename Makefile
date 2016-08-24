TARGET=plp

jp:
	cp zelda_jp.sfc lttphack_jp.sfc && xkas lttphack_jp.asm lttphack_jp.sfc

en:
	cp zelda_en.sfc lttphack_en.sfc && xkas lttphack_en.asm lttphack_en.sfc

gow:
	cp zelda_gow.sfc lttphack_gow.sfc && xkas lttphack_en.asm lttphack_gow.sfc

all: jp en gow

clean:
	rm -f lttphack*{sfc,srm}
