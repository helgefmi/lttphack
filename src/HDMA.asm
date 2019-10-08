pushpc
; STZ $9B : STZ $420C
;649B9C0C42

org $008135
	JSL ShutOffHDMANMI
	NOP

macro keepHDMA5()
	JSL ShutOffHDMA
	NOP
endmacro

org $008220
	JSL InitializeFrameCountHDMA
	NOP
org $0CEEAC
%keepHDMA5()

pullpc
warnpc $238001 ; this has to be first
!HDMA_frame_local = $0224
!HDMA_framecount_table = $7E0000+!HDMA_frame_local ; will be mirror of 7E0224

!fraaame = 0
macro addFrame()
	!fraaame #= !fraaame+1
	db !fraaame
endmacro
HDMAFrameCount:
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()
	%addFrame()

HDMAFrameCountStatic:
	db !HDMA_frame_local+1

InitializeFrameCountHDMA:
	REP #$10
	SEP #$20
	LDA #%01001000 : STA $4350 ; 2 registers, write once, indirect
	LDA #$80 : STA $4351 ; write to WRAM lowbyte
	STZ $2183
	LDA #$10 : STA.l !HDMA_framecount_table+0 ; wait this many scan lines
	LDX.w #(!HDMA_frame_local+1) : STX $2181 ; addr in WRAM
	LDX.w #HDMAFrameCount : STX.w !HDMA_framecount_table+1 ; Address of table in HDMA table
	;LDX.w #HDMAFrameCountStatic : STX.w !HDMA_framecount_table+3
	STX $4355
	LDA.b #HDMAFrameCount>>16 : STA $4354 ; bank of HDMA table
	LDX.w #!HDMA_framecount_table : STX $4352 ; address of table for HDMA
	LDA.b #(HDMAFrameCount>>16) : STA $4357
	LDA #$00 : STA.w !HDMA_frame_local+3 ; end HDMA

	LDA $9B : ORA #$20 : STA $420C
	RTL

ShutOffHDMA:
	LDA #$20
	STA $420C
	STA $9B
	RTL

ShutOffHDMANMI:
	LDA #$20
	STA $420C
	LDA $12
	RTL
