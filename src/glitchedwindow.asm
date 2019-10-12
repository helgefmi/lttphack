function char(n) = $2150+n

!dg_buffer_r0 #= !dg_dma_buffer+(64*0)
!dg_buffer_r1 #= !dg_dma_buffer+(64*1)
!dg_buffer_r2 #= !dg_dma_buffer+(64*2)
!dg_buffer_r3 #= !dg_dma_buffer+(64*3)
!dg_buffer_r4 #= !dg_dma_buffer+(64*4)

!BROWN_PAL #= (0<<10)
!RED_PAL #= (1<<10)
!YELLOW_PAL #= (2<<10)
!BLUE_PAL #= (3<<10)
!GRAY_PAL #= (4<<10)
!REDYELLOW #= (5<<10)
!TEXT_PAL #= (6<<10)
!GREEN_PAL #= (7<<10)

!VFLIP #= (1<<15)
!HFLIP #= (1<<14)

!P3 = $2000
!SYNCED = char($10)|!BLUE_PAL
!DESYNC = char($11)|!RED_PAL
!HAMMER = char($12)|!BROWN_PAL


; $20[2] Y coordinate
; $22[2] X coordinate
; mirrors to check sync status of: $02DC, $02DE ; $0FC2, $0FC4

; $A0[2] room ID
; find a place to cache original room id that only works on proper transitions?

; $A2[2] previous room
; $A6[1] something with scrolling
; $A7[1] ditto

; $A9[1] 0 = west quadrants, 1 = east quadrants
; $AA[1] 0 = north quadrants, 2 = south quadrants
; guess with coordinates?

; $B7[3] overlay location or something
; $BA[2] overlay determiner or something
; use this data to calculate chances of VRAM corruption?

; $E0[2], $E2[2], $E6[2], $E8[2] BG scrolling
; $0110[2] room id*3 only add if it seems to ever desync
; $7EC180[2] Initial camera scroll of room ; hook these to cache $A0?
; $7EC182[2] Initial camera scroll of room
; $7EC184[2] Initial link coord
; $7EC186[2] Initial link coord

; $0403 room data
; $040C dungeon ID
; $040E room header

; $0496 number of chests * 2
; $04BA[2] overlay stuff

; $06xx - camera scroll things?


; $068E[2] WEST SOMARIA
; $0690[2] WEST SOMARIA

; $0716 scrolling? OW only?

; $7EC0000[5] stair destinations

; # = relevant symbol
; 00000000001111111111222222222233
; 01234567890123456789012345678901
; ..#XXXXYYYY.#.IDrrr#rrr.#.......
; ..#NW#SW#...#HKcCCCCC DDDDQQQQ.. ; True quadrant / repaired #
; ..#XXXXd^XXXXvXXXX....##aaaaaa##
; ..#YYYYd^YYYYvYYYY
; ..#XXXXYYYY#^XXvXX^YYvYY........  ; camera scroll, upper and lower high bytes
; ...................... ; overlay, RAM/ROM icon, long address, vanilla warning
; ................................
UpdateGlitchedWindow:
; Room Flag icon: use gray/colored 
clear_buffer:
	REP #$20
	LDA #$207F
	LDX #$20
--	STA !dg_buffer_r0, X
	STA !dg_buffer_r1, X
	STA !dg_buffer_r2, X
	STA !dg_buffer_r3, X
	STA !dg_buffer_r4, X
	DEX : DEX : BNE --

print_coords:
	LDA.w #char(0)|!RED_PAL : STA !dg_dma_buffer+4 ; XY
	LDX #6 : LDA $22 : JSR draw_hex_4digits_white
	LDX #14 : LDA $20 : JSR draw_hex_4digits_yellow

print_room_id:
	LDA.w #char(1)|!RED_PAL : STA !dg_dma_buffer+28 ; IDr
	INC : STA !dg_dma_buffer+30 ; INC for next char cheaply
	LDA.w #!HAMMER : STA !dg_dma_buffer+38 ; hammer

	LDX #32 : LDA $A0 : JSR draw_hex_3digits_white

calc_correct_room_id:
	LDA $21 : AND #$00FE : ASL #3 : STA $72
	LDA $23 : AND #$00FE : LSR ; bit 0 is off, so it clears carry
	ADC $72 : STA $72

	LDX #40
	CMP $A0 : BNE .roomdesync

.roomsynced
	JSR draw_hex_3digits_gray
	LDA.w #!SYNCED
	BRA .doneRoom

.roomdesync
	JSR draw_hex_3digits_red
	LDA.w #!DESYNC

.doneRoom
	STA !dg_dma_buffer+24

calc_room_flags:
	LDX #(2*(16-1))
	LDA $0400 : ORA $401 : ORA $0408 : STA $72
	LDA $0403 : STA $73
--	LDA.l .tiles, X : LSR $72 : BCS .flagSet
	ORA.w #!GRAY_PAL : BRA +

.flagSet
	ORA.l .palettes, X
+	STA !dg_dma_buffer+2+64+4, X
	DEX #2 : BPL --

	LDA.w #char($19)|!RED_PAL : STA !dg_buffer_r1+4

; HKcCCCCC DDDDQQQQ

calc_quadrant:
	LDA.w #char($14)|!BLUE_PAL : STA !dg_buffer_r1+42
	LDA.w #!HAMMER : STA !dg_buffer_r1+46
	LDA $A9 : LSR ; $A9 is 0 or 1
	BCS .east

.west
	BEQ .northwest ; $A0 is 0 or 2, and will be the only bit remaining, no matter what

.southwest
	LDY #2
	LDA.w #char(5+2)|!RED_PAL
	BRA .doQuadrant

.northwest
	LDY #3
	LDA.w #char(5+3)|!RED_PAL
	BRA .doQuadrant

.east
	BEQ .northeast ; $A0 is 0 or 2, and will be the only bit remaining, no matter what

.southeast
	LDY #1
	LDA.w #char(5+1)|!RED_PAL
	BRA .doQuadrant

.northeast
	LDY #0
	LDA.w #char(5+0)|!RED_PAL
;	BRA .doQuadrant


.doQuadrant
	STY $72
	STA !dg_buffer_r1+44

calc_correct_quadrant:
	LDA #$0100 ; checking the same bit on both coordinates

	BIT $22 : BNE .east

.west
	BIT $20 : BEQ .northwest

	; using the gray pal means we only need to ORA if desynched
	; and can leave it alone otherwise
.southwest
	LDY #2
	LDA.w #char(5+2)|!GRAY_PAL
	BRA .doQuadrant

.northwest
	LDY #3
	LDA.w #char(5+3)|!GRAY_PAL
	BRA .doQuadrant

.east
	BIT $20 : BEQ .northeast

.southeast
	LDY #1
	LDA.w #char(5+1)|!GRAY_PAL
	BRA .doQuadrant

.northeast
	LDY #0
	LDA.w #char(5+0)|!GRAY_PAL

.doQuadrant
	CPY $72 : BEQ .quadrantsSynced
	ORA.w #!TEXT_PAL
	STA !dg_buffer_r1+48
	LDA.w #!DESYNC : BRA ++

.quadrantsSynced
	STA !dg_buffer_r1+48
	LDA.w #!SYNCED
++	STA !dg_buffer_r1+50

draw_camera:
	LDA.w #char($13)|!RED_PAL
	STA !dg_buffer_r2+4
	STA !dg_buffer_r3+4
	LDX.b #(64+64)+6 : LDA $E2 : JSR draw_hex_4digits_white
	LDX.b #(64+64+64)+6 : LDA $E8 : JSR draw_hex_4digits_yellow

	LDA.w #char(9)|!RED_PAL : STA !dg_buffer_r2+14
	INC : STA !dg_buffer_r2+26 ; consecutive character values, so just increment
	INC : STA !dg_buffer_r3+16
	INC : STA !dg_buffer_r3+26

	LDX.b #(64+64)+18 : LDA $060A : JSR draw_hex_4digits_white
	LDX.b #(64+64)+28 : LDA $060E : JSR draw_hex_4digits_white

	LDX.b #(64+64+64)+18 : LDA $0602 : JSR draw_hex_4digits_yellow
	LDX.b #(64+64+64)+28 : LDA $0606 : JSR draw_hex_4digits_yellow

	LDA $E2 : CMP $060A : BCC .xDesynced
	; decrement to compare such that equals means carry is clear
	DEC : CMP $060E : BCS .xDesynced
	LDA.w #!SYNCED : BRA .drawXSync
.xDesynced
	LDA.w #!DESYNC

.drawXSync
	STA !dg_buffer_r2+14

	LDA $E8 : CMP $0602 : BCC .yDesynced
	; decrement to compare such that equals means carry is clear
	DEC : CMP $0606 : BCS .yDesynced
	LDA.w #!SYNCED : BRA .drawYSync
.yDesynced
	LDA.w #!DESYNC

.drawYSync
	STA !dg_buffer_r3+14

OverlayPTR = $04E9A1
draw_overlay:
	LDA.w #char($18)|!GRAY_PAL : STA !dg_buffer_r2+44

	LDA $BA : BNE .preloaded

	%i16()
	LDA $04BA : ASL : CLC : ADC $04BA : TAX
	LDA.l OverlayPTR+1, X : STA $72
	LDA.l OverlayPTR+1, X : STA $73
	%i8()
	LDA.w #0 ; char(??) ; load symbol
	BRA .draw

.preloaded
	LDA $B8 : STA $73
	LDA $B7 : STA $72
	LDA.w #0 ; char(??)

!NON_VANILLA = $0000
.draw
	STA !dg_buffer_r2+46
	;REP #$10
	;LDX #$0106 : LDA $72 : JSR draw_hex_2digits_white ; this doesn't change X flag
	;LDX #$0108 : LDA $73 : JSR draw_hex_4digits_white ; this exits i=10

	LDX #(64+64)+48 : LDA $74 : JSR draw_hex_2digits_white
	LDX #(64+64)+52 : LDA $72 : JSR draw_hex_4digits_white
	LDA $73 : AND #$FF00
	CMP #$7000 : BCC .notSRAM
	CMP #$7000 : BCS .notSRAM
	LDA.w #!NON_VANILLA
	BRA .safetyDraw

.notSRAM
	LDA $73 : AND #$00FF ; see what page it's on
	CMP #$0080 : BCC .notROM ; if it's less than page $80, we're not in ROM
	; at least, we're not in practice hack ROM, which always has mirrored WRAM

	LDA $73 : AND #$3FFF ; account for mirroring of ROM
	CMP #$2080 : BCC .notROM ; before bank $20 and we're okay
	CMP.w #(EndOfPracticeROM&$FF00)+$0100 : BCS .notROM ; the last bank we *don't* use
	LDA.w #!NON_VANILLA

.safetyDraw 
	;STA !dg_buffer_r3+60

.notROM


trigger_update:
	%a8()
	LDA #$06 : STA $17
	LDA #!DG_DMA : STA $0116

	RTL

!ToDo = $207F
!CHEST_TILE = char($15)
!QUAD = char($14)
!DOOR_TILE = char($1A)

calc_room_flags_tiles:
	dw $20A0 ; heart
	dw $2071 ; key
	dw $2071 ; key
	dw !CHEST_TILE, !CHEST_TILE, !CHEST_TILE, !CHEST_TILE, !CHEST_TILE
	dw !DOOR_TILE, !DOOR_TILE, !DOOR_TILE, !DOOR_TILE
	dw !QUAD|!HFLIP, !QUAD, !QUAD|!HFLIP|!VFLIP, !QUAD|!VFLIP

	; Todo: for quadrants, include the flipping in tile
	; also make them go RYGB,
calc_room_flags_palettes:
	dw !RED_PAL, !YELLOW_PAL, !YELLOW_PAL
	dw !RED_PAL, !RED_PAL, !RED_PAL, !RED_PAL, !RED_PAL
	dw !BROWN_PAL, !BROWN_PAL, !BROWN_PAL, !BROWN_PAL
	dw !BLUE_PAL, !RED_PAL, !GREEN_PAL, !YELLOW_PAL

draw_hex_4digits_white:
	REP #$10
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+6, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+4, X

	TYA : XBA : TAY ; get old value back, change to high byte

	AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+2, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+0, X

	SEP #$10
	RTS

draw_hex_4digits_yellow:
	REP #$10
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+6, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+4, X

	TYA : XBA : TAY ; get old value back, change to high byte

	AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+2, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+0, X

	SEP #$10
	RTS

draw_hex_3digits_white:
	REP #$10
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+4, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+2, X

	TYA : XBA ; get old value back, change to high byte
	AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+0, X

	SEP #$10
	RTS

draw_hex_3digits_yellow:
	REP #$10
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+4, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+2, X

	TYA : XBA ; get old value back, change to high byte
	AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+0, X

	SEP #$10
	RTS

draw_hex_3digits_red:
	REP #$10
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!TEXT_PAL : STA !dg_dma_buffer+4, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!TEXT_PAL : STA !dg_dma_buffer+2, X

	TYA : XBA ; get old value back, change to high byte
	AND #$000F : ORA #$10|!P3|!TEXT_PAL : STA !dg_dma_buffer+0, X

	SEP #$10
	RTS

draw_hex_3digits_gray:
	REP #$10
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!GRAY_PAL : STA !dg_dma_buffer+4, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!GRAY_PAL : STA !dg_dma_buffer+2, X

	TYA : XBA ; get old value back, change to high byte
	AND #$000F : ORA #$10|!P3|!GRAY_PAL : STA !dg_dma_buffer+0, X

	SEP #$10
	RTS

draw_hex_2digits_white:
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+2, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+0, X

	RTS

draw_hex_2digits_yellow:
	TAY ; cache A
	AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+2, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!REDYELLOW : STA !dg_dma_buffer+0, X

	RTS
