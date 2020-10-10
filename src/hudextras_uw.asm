; $A0[2] room ID
; find a place to cache original room id that only works on proper transitions?

; $A2[2] previous room

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

; $068E[2] WEST SOMARIA
; $0690[2] WEST SOMARIA

; $0716 scrolling? OW only?

; $7EC0000[5] stair destinations

; template for design planning
; 00000000001111111111222222222233
; 01234567890123456789012345678901
; ................................



UpdateUWWindow:
	LDA.w !ram_superwatch
	LSR : AND.b SA1IRAM.CopyOf_1B : LSR ; set or clear carry

	LDA #$20
	BCC NoSuperWatch_set
	LDX.b SA1IRAM.CopyOf_10 : CPX #$0E : BEQ NoSuperWatch_set
	CPX #$0C : BEQ NoSuperWatch_set
	TSB.b SA1IRAM.HDMA_ASK

	JSL ClearSWBuffer

	SEP #$10
print_coords:
	LDA.w #char(0)|!RED_PAL : STA SA1RAM.SW_BUFFER_r0+4 ; XY
	LDX #14
	LDA.b SA1IRAM.CopyOf_20 : JSR DrawHexSW_four_yellow
	LDA.b SA1IRAM.CopyOf_22 : JSR DrawHexSW_four_white

print_room_id:
	LDA.w #char(1)|!RED_PAL : STA SA1RAM.SW_BUFFER_r0+24 ; IDr
	INC : STA SA1RAM.SW_BUFFER_r0+26 ; INC for next char cheaply
	LDA.w #!HAMMER : STA SA1RAM.SW_BUFFER_r0+34 ; hammer

	LDX #26 : LDA.b SA1IRAM.CopyOf_A0 : JSR DrawHexSW_three_white

calc_correct_room_id:
	LDA.b SA1IRAM.CopyOf_21 : AND #$00FE : ASL #3 : STA.b SA1IRAM.SCRATCH+0
	LDA.b SA1IRAM.CopyOf_23 : AND #$00FE : LSR ; bit 0 is off, so it clears carry
	ADC.b SA1IRAM.SCRATCH+0 : STA.b SA1IRAM.SCRATCH+0

	LDX #34
	CMP.b SA1IRAM.CopyOf_A0 : BNE .roomdesync

.roomsynced
	JSR DrawHexSW_three_gray
	LDA.w #!SYNCED
	BRA .doneRoom

.roomdesync
	JSR DrawHexSW_three_red
	LDA.w #!DESYNC

.doneRoom
	STA SA1RAM.SW_BUFFER_r0+22

calc_room_flags:
	LDX #(2*(16-1))
	LDA.w SA1IRAM.CopyOf_0401 : ORA.w SA1IRAM.CopyOf_0408 : STA.b SA1IRAM.SCRATCH+0 ; not sure if I need $0400 at all?
	LDA.w SA1IRAM.CopyOf_0403 : STA.b SA1IRAM.SCRATCH+1
--	LDA.l .tiles, X : LSR.b SA1IRAM.SCRATCH+0 : BCS .flagSet
	ORA.w #!GRAY_PAL : BRA +

.flagSet
	ORA.l .palettes, X
+	STA SA1RAM.SW_BUFFER_r1+2+4, X
	DEX #2 : BPL --

	LDA.w #char($19)|!RED_PAL : STA SA1RAM.SW_BUFFER_r1+4

calc_quadrant:
	LDA.w #char($14)|!BLUE_PAL : STA SA1RAM.SW_BUFFER_r0+44
	LDA.w #!HAMMER : STA SA1RAM.SW_BUFFER_r0+48
	LDA.w SA1IRAM.CopyOf_A9 : LSR ; $A9 is 0 or 1
	BCS .east

.west
	BEQ .northwest ; $AA is 0 or 2, and will be the only bit remaining, no matter what

.southwest
	LDY #2
	LDA.w #char(5+2)|!RED_PAL
	BRA .doQuadrant

.northwest
	LDY #3
	LDA.w #char(5+3)|!RED_PAL
	BRA .doQuadrant

.east
	BEQ .northeast
.southeast
	LDY #1
	LDA.w #char(5+1)|!RED_PAL
	BRA .doQuadrant

.northeast
	LDY #0
	LDA.w #char(5+0)|!RED_PAL
;	BRA .doQuadrant


.doQuadrant
	STY.b SA1IRAM.SCRATCH+0
	STA SA1RAM.SW_BUFFER_r0+46

calc_correct_quadrant:
	LDA #$0100 ; checking the same bit on both coordinates

	BIT.b SA1IRAM.CopyOf_22 : BNE .east

.west
	BIT.b SA1IRAM.CopyOf_20 : BEQ .northwest

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
	BIT.b SA1IRAM.CopyOf_20 : BEQ .northeast

.southeast
	LDY #1
	LDA.w #char(5+1)|!GRAY_PAL
	BRA .doQuadrant

.northeast
	LDY #0
	LDA.w #char(5+0)|!GRAY_PAL

.doQuadrant
	CPY.b SA1IRAM.SCRATCH+0 : BEQ .quadrantsSynced
	ORA.w #!TEXT_PAL
	STA SA1RAM.SW_BUFFER_r0+50
	LDA.w #!DESYNC : BRA ++

.quadrantsSynced
	STA SA1RAM.SW_BUFFER_r0+50
	LDA.w #!SYNCED
++	STA SA1RAM.SW_BUFFER_r0+52

draw_pits:
	LDX #(64+48)
	JSR DrawHexSW_two_white

	REP #$30
	LDX.b SA1IRAM.CopyOf_A0

	LDA.l RoomHasPitDamage, X
	SEP #$10
	LSR ; carry set if room has pit damage
	BCS .pitdamage

	LDA.w #char($16)|!GRAY_PAL
	BRA .drawflag

.pitdamage
	LDA.w #char($16)|!YELLOW_PAL

.drawflag
	STA.w SA1RAM.SW_BUFFER_r1+50

;draw_west_somaria:
;	LDX #(64+48) : LDA.w SA1IRAM.CopyOf_0690
;	CMP.w #$0010
;	BCC .fine
;
;	JSR DrawHexSW_four_red
;	LDA.w #char($17)|!RED_PAL
;	BRA .door
;
;.fine
;	JSR DrawHexSW_four_gray
;	LDA.w #char($17)|!GRAY_PAL
;
;.door
;	STA.w SA1RAM.SW_BUFFER_r1+46
;	DEX
;	DEX
;	LDA.w SA1IRAM.CopyOf_068E
;	JSR DrawHexSW_four_white




draw_camera:
	LDA.w #char($13)|!GRAY_PAL ; camera icon
	STA SA1RAM.SW_BUFFER_r2+4
	STA SA1RAM.SW_BUFFER_r3+4
	LDX.b #(64+64)+6 : LDA.b SA1IRAM.CopyOf_E2 : JSR DrawHexSW_four_white
	LDX.b #(64+64+64)+6 : LDA.b SA1IRAM.CopyOf_E8 : JSR DrawHexSW_four_yellow

	LDX.w SA1IRAM.CopyOf_A6
	LDA.w SA1IRAM.CopyOf_0608, X : STA.b SA1IRAM.SCRATCH+0 ; cache X camera for desync check
	LDA.w SA1IRAM.CopyOf_060C, X : STA.b SA1IRAM.SCRATCH+2
	CPX #$02 : BEQ .XSet2

.XSet1
	LDA.w #char(9)|!RED_PAL ; labels
	STA SA1RAM.SW_BUFFER_r2+16
	INC : STA SA1RAM.SW_BUFFER_r2+26

	LDA.w #char(9)|!GRAY_PAL
	STA SA1RAM.SW_BUFFER_r2+36
	INC : STA SA1RAM.SW_BUFFER_r2+46

	LDX.b #(64+64)+18 : LDA.w SA1IRAM.CopyOf_0608 : JSR DrawHexSW_four_white
	LDX.b #(64+64)+28 : LDA.w SA1IRAM.CopyOf_060C : JSR DrawHexSW_four_white
	LDX.b #(64+64)+38 : LDA.w SA1IRAM.CopyOf_060A : JSR DrawHexSW_four_gray
	LDX.b #(64+64)+48 : LDA.w SA1IRAM.CopyOf_060E : JSR DrawHexSW_four_gray
	BRA .checkXSync

.XSet2
	LDA.w #char(9)|!GRAY_PAL ; labels
	STA SA1RAM.SW_BUFFER_r2+16
	INC : STA SA1RAM.SW_BUFFER_r2+26

	LDA.w #char(9)|!RED_PAL
	STA SA1RAM.SW_BUFFER_r2+36
	INC : STA SA1RAM.SW_BUFFER_r2+46

	LDX.b #(64+64)+18 : LDA.w SA1IRAM.CopyOf_0608 : JSR DrawHexSW_four_gray
	LDX.b #(64+64)+28 : LDA.w SA1IRAM.CopyOf_060C : JSR DrawHexSW_four_gray
	LDX.b #(64+64)+38 : LDA.w SA1IRAM.CopyOf_060A : JSR DrawHexSW_four_white
	LDX.b #(64+64)+48 : LDA.w SA1IRAM.CopyOf_060E : JSR DrawHexSW_four_white

.checkXSync
	LDA.b SA1IRAM.CopyOf_E2 : CMP.b SA1IRAM.SCRATCH+0 : BCC .xDesynced
	; decrement so that equal values result in a clear carry
	DEC : CMP.b SA1IRAM.SCRATCH+2 : BCS .xDesynced

.xProbablyFine
	LDA.w #!SYNCED
	BRA .drawXSync

.xDesynced
	LDA.w #!DESYNC 

.drawXSync
	STA SA1RAM.SW_BUFFER_r2+14

	LDX.w SA1IRAM.CopyOf_A7
	LDA.w SA1IRAM.CopyOf_0600, X : STA.b SA1IRAM.SCRATCH+0 ; cache Y camera for desync check
	LDA.w SA1IRAM.CopyOf_0604, X : STA.b SA1IRAM.SCRATCH+2
	CPX #$02 : BEQ .YSet2

.YSet1
	LDA.w #char(11)|!REDYELLOW ; labels
	STA SA1RAM.SW_BUFFER_r3+16
	INC : STA SA1RAM.SW_BUFFER_r3+26

	LDA.w #char(11)|!GRAY_PAL
	STA SA1RAM.SW_BUFFER_r3+36
	INC : STA SA1RAM.SW_BUFFER_r3+46

	LDX.b #(64+64+64)+18 : LDA.w SA1IRAM.CopyOf_0600 : JSR DrawHexSW_four_yellow
	LDX.b #(64+64+64)+28 : LDA.w SA1IRAM.CopyOf_0604 : JSR DrawHexSW_four_yellow
	LDX.b #(64+64+64)+38 : LDA.w SA1IRAM.CopyOf_0602 : JSR DrawHexSW_four_gray
	LDX.b #(64+64+64)+48 : LDA.w SA1IRAM.CopyOf_0606 : JSR DrawHexSW_four_gray
	BRA .checkYSync

.YSet2
	LDA.w #char(11)|!GRAY_PAL ; labels
	STA SA1RAM.SW_BUFFER_r3+16
	INC : STA SA1RAM.SW_BUFFER_r3+26

	LDA.w #char(11)|!REDYELLOW
	STA SA1RAM.SW_BUFFER_r3+36
	INC : STA SA1RAM.SW_BUFFER_r3+46

	LDX.b #(64+64+64)+18 : LDA.w SA1IRAM.CopyOf_0600 : JSR DrawHexSW_four_gray
	LDX.b #(64+64+64)+28 : LDA.w SA1IRAM.CopyOf_0604 : JSR DrawHexSW_four_gray
	LDX.b #(64+64+64)+38 : LDA.w SA1IRAM.CopyOf_0602 : JSR DrawHexSW_four_yellow
	LDX.b #(64+64+64)+48 : LDA.w SA1IRAM.CopyOf_0606 : JSR DrawHexSW_four_yellow

.checkYSync
	LDA.b SA1IRAM.CopyOf_E8 : CMP.b SA1IRAM.SCRATCH+0 : BCC .yDesynced
	; decrement so that equal values result in a clear carry
	DEC : CMP.b SA1IRAM.SCRATCH+2 : BCS .yDesynced

.yProbablyFine
	LDA.w #!SYNCED
	BRA .drawYSync

.yDesynced
	LDA.w #!DESYNC 

.drawYSync
	STA SA1RAM.SW_BUFFER_r3+14

trigger_update:
	SEP #$20
	RTS

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

	; TODO: for quadrants, include the flipping in tile
	; also make them go RYGB,
calc_room_flags_palettes:
	dw !RED_PAL, !YELLOW_PAL, !YELLOW_PAL
	dw !RED_PAL, !RED_PAL, !RED_PAL, !RED_PAL, !RED_PAL
	dw !BROWN_PAL, !BROWN_PAL, !BROWN_PAL, !BROWN_PAL
	dw !BLUE_PAL, !RED_PAL, !GREEN_PAL, !YELLOW_PAL



