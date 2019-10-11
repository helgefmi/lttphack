function char(n) = $2150+n

!BROWN_PAL = (0<<10)
!RED_PAL = (1<<10)
!YELLOW_PAL = (2<<10)
!BLUE_PAL = (3<<10)
!GRAY_PAL = (4<<10)
!REDYELLOW = (5<<10)
!TEXT_PAL = (6<<10)
!GREEN_PAL = (7<<10)

!VFLIP = (1<<15)
!HFLIP = (1<<14)

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
; ..#XXXXYYYY^XXXXvXXXX^YYYYvYYYY ; camera scroll
; ................................
; ................................
UpdateGlitchedWindow:
; Room Flag icon: use gray/colored 
clear_buffer:
	REP #$20
	LDA #$207F
	LDX #$00
--	STA !dg_dma_buffer, X
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

	LDA.w #char($19)|!RED_PAL : STA !dg_dma_buffer+4+64

; HKcCCCCC DDDDQQQQ

calc_quadrant:
	LDA.w #char($14)|!BLUE_PAL : STA !dg_dma_buffer+64+42
	LDA.w #!HAMMER : STA !dg_dma_buffer+64+46
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
	STA !dg_dma_buffer+64+44

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
	STA !dg_dma_buffer+64+48
	LDA.w #!DESYNC : BRA ++

.quadrantsSynced
	STA !dg_dma_buffer+64+48
	LDA.w #!SYNCED
++	STA !dg_dma_buffer+64+50


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
	AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+4, X
	TYA : LSR #4 : AND #$000F : ORA #$10|!P3|!RED_PAL : STA !dg_dma_buffer+2, X

	RTS
