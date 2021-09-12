!VERSIONTEXT = "v"
if stringsequal("!VERSION", "DEBUG")
	!VERSIONTEXT = ""
endif

!VERSIONTEXT += !VERSION

pushtable
cleartable
org $00FFC0
db "                     " ; empty this

org $00FFC0
db "ALTTPRAC !VERSIONTEXT"
warnpc $00FFD5
pulltable

org $00FFD5 : db $23, $35 ; SA-1
org $00FFD7 : db 11 ; 2mb ROM
org $00FFD8 : db 8 ; 256k SRAM

; interrupt changes
org $00FFE4 : dw BadInterrupt
org $00FFE6 : dw BadInterrupt
org $00FFF4 : dw BadInterrupt

;===================================================================================================

pushtable
table resources/fileselecttop.tbl
	org $0CDDF0 : fillword $0188 : fill 52
	org $0CDDF0 : dw "PRACTICE HACK !VERSIONTEXT"

table resources/fileselectbot.tbl
	org $0CDE2C : fillword $0188 : fill 52
	org $0CDE2C : dw "PRACTICE HACK !VERSIONTEXT"
pulltable

;===================================================================================================

macro what_item_is_this()
	fillword !BLANK_TILE : fill 16
	fillword !BLANK_TILE : fill 4
	fillword !QMARK : fill 8
	fillword !BLANK_TILE : fill 4
endmacro

!MENU_D = $A482
!MENU_O = $A483
!QMARKW = $252F

org $0DE876 ; Japanese "PENDANTS" text
	dw !MENU_D, !MENU_O, !MENU_D, !MENU_O, !QMARKW

org $0DE92A ; Japanese "CRYSTALS" text
	dw !MENU_D, !MENU_O, !QMARKW, !MENU_D, !MENU_O

org $0DF1C9
	rep 36 : %what_item_is_this()

; these clean up the messy menu tiles in the DO section

; Lift texts (leave the number)
org $0DF951
	fillword !BLANK_TILE : fill 12
	dw $A8D7, !MENU_D, !MENU_O

org $0DF965
	fillword !BLANK_TILE : fill 12
	dw $A8D7, !MENU_D, !MENU_O

org $0DF979
	fillword !BLANK_TILE : fill 12
	dw $A8D7, !MENU_D, !MENU_O

org $0DF99B
	dw !MENU_D, !MENU_O

org $0DF9AF
	dw !MENU_D, !MENU_O, !QMARKW

org $0DF9CD
	dw !BLANK_TILE

org $0DF9D3
	dw !MENU_D, !MENU_O, !MENU_D, !MENU_O

org $0DF9E9
	dw !MENU_D, !MENU_O, !QMARKW

org $0DF9F7
	dw !BLANK_TILE

org $0DF9FD
	dw !MENU_D, !MENU_O, !QMARKW

org $0DFA07
	dw !EMPTY

org $0DFA11
	dw !EMPTY

org $0DF829 ; boots gfx location moved
	dw $3521, $3522, $3523, $3524

;===================================================================================================

!RANDO ?= 0

if !RANDO
	incsrc "rando.asm"
endif
