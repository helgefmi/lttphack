pushpc

org $008039
RequestShortcut:
	BIT.w SA1IRAM.SHORTCUT_USED+1
	BPL .askforshortcut

	JSL UseShortCut

	SEP #$30
	STZ.w SA1IRAM.SHORTCUT_USED+1
	BRA .done

.askforshortcut
	LDA.b #$81
	STA.w $2200 ; SA-1 IRQ, bit 1 for preparing shortcut checks
	BRA .done

warnpc $008051
org $008051
.done

pullpc

;===================================================================================================

ResetGameStack:
	REP #$FF

	LDA.w #$01FF : TCS
	LDA.w #$0000 : TCD

	STZ.b $F0 : STZ.w SA1IRAM.CopyOf_F0
	STZ.b $F2 : STZ.w SA1IRAM.CopyOf_F2
	STZ.b $F4 : STZ.w SA1IRAM.CopyOf_F4
	STZ.b $F6 : STZ.w SA1IRAM.CopyOf_F6

	STZ.w SA1IRAM.SEG_TIME_F
	STZ.w SA1IRAM.SEG_TIME_S
	STZ.w SA1IRAM.SEG_TIME_M

	STZ.w SA1IRAM.SHORTCUT_USED

	SEP #$30

	PHA : PLB

	STZ.b $12

	LDA.b #$0F : STA.b $13
	LDA.b #$81 : STA.w $4200

	JML $008034

;===================================================================================================

Rerandomize:
	LDA.w !config_rerandomize_toggle : BEQ .dont_rerandomize

	JSL GetRandomInt : STA.b $1A
	JSL GetRandomInt : STA.w $0FA1

.dont_rerandomize
	LDA.w SA1RAM.framerule
	DEC
	BMI .nofixedframerule

	STA.b $1A

.nofixedframerule
	RTL

;===================================================================================================

UseShortCut:
	REP #$20

	; kill controller so SA-1 doesn't get confused next frame
	STZ.b $F0 : STZ.w SA1IRAM.CopyOf_F0
	STZ.b $F2 : STZ.w SA1IRAM.CopyOf_F2
	STZ.b $F4 : STZ.w SA1IRAM.CopyOf_F4
	STZ.b $F6 : STZ.w SA1IRAM.CopyOf_F6

	SEP #$20

	LDA.b $10
	CMP.b #$06 : BCC ShortcutsBanned
	CMP.b #$19 : BCS ShortcutsBanned
	CMP.b #$14 : BEQ ShortcutsBanned

	JMP.w (SA1IRAM.SHORTCUT_USED)

UseShortCutSA1:
	DEC
	PHA
	RTS

ShortcutsBanned:
	SEP #$20

	LDA.b #$3C : STA.w $2142

SA1SideShortcut:
	RTL

;===================================================================================================

Shortcut_EnterPracticeMenu:
	JML CM_Main

;===================================================================================================

Shortcut_LoadLastPreset:
	JML LoadLastPreset

;===================================================================================================

Shortcut_SaveState:
	PHK
	PLB

	SEP #$20
	REP #$10
	; Remember which song bank was loaded before load stating
	; I put it here too, since `end` code runs both on save and load state..
	LDA.w $0136 : STA.w SA1RAM.old_music_bank

	STZ.w $4200
	STZ.w $420C

	LDA.b #$80 : STA.w $2100
	STA.w $4350 ; B to A
	JSR DMA_BWRAMSRAM

	JMP FinalizeSavestate

;===================================================================================================

Shortcut_LoadState:
	; music bank should only ever be 0 or 1
	; assume any other value means there's no save state
	SEP #$30
	LDA.w SA1RAM.old_music_bank
	CMP.b #$02 : BCC ++

	JMP ShortcutsBanned

++	PHK
	PLB

	SEP #$20
	REP #$10

	; Remember which song and bank was in APU before load stating (so we can change if needed)
	LDA.w $0136 : STA.w SA1RAM.old_music_bank
	LDA.w $0130 : STA.w SA1RAM.old_music

	; Mute ambient sounds
	LDA.b #$05 : STA.w $2141

	LDA.b #$80 : STA.w $2100
	STZ.w $420C
	STZ.w $4200

	LDA.b #$00 : STA.w $4350
	JSR DMA_BWRAMSRAM

	LDX.b $1C : STX.w $212C
	LDX.b $1E : STX.w $212E
	LDX.b $94 : STX.w $2105
	LDX.b $96 : STX.w $2123
	LDX.b $99 : STX.w $2130

	INC.b $15

	; Update which song is currently being played by the APU
	LDA.w SA1RAM.old_music : STA.w $0133

	; Attempt to restart the current song if it isn't already playing
	LDA.w $0130 : STA.w $012C

	LDA.w $0131 : CMP.b #$17 : BEQ .annoyingSounds ; Bird music
	STA.w $012D : STZ.w $0131

.annoyingSounds
	LDA.w $0638 : STA.w $211F
	LDA.w $0639 : STA.w $211F
	LDA.w $063A : STA.w $2120
	LDA.w $063B : STA.w $2120
	LDA.b $98 : STA.w $2125
	LDA.b $9B : STA.w $420C

	JSL Rerandomize

	SEP #$20

	JMP FinalizeSavestate

;===================================================================================================

DMA_BWRAMSRAM:
	PLX : STX.w SA1IRAM.preset_scratch

	STA.w $4350 ; direction
	LDA.b #$80 : STA.w $4351 ; wram
	LDA.b #$41 : STA.w $4354

	LDX.w #$0000
	TXA : XBA ; top byte 0
	STX.w $4352 ; bottom of bank

.next
	LDA.w .address_size+2,X ; get bank
	BEQ .sa1stuff

	STA.w $2183

	LDY.w .address_size+0,X
	STY.w $2181

	LDY.w .address_size+3,X
	STY.w $4355

	LDA.b #$20 : STA.w $420B

	TXA
	CLC
	ADC.b #$05
	TAX
	BRA .next

.sa1stuff
	PHB
	REP #$20

	LDA.w #(SA1IRAM.savethis_end-SA1IRAM.savethis_start)-1

	BIT.w $4350-1 ; which way to transfer?
	BPL .loading

.saving
	LDX.w #SA1IRAM.savethis_start
	LDY.w $4352 ; get location last written
	%MVN($00, $41)

	LDA.l HUD_NMI_DMA_SIZE : DEC
	LDX.w #SA1RAM.HUD
	%MVN($00, $41)

	; LDA.w #$004F ; DMAs
	; LDX.w #$4300 ; DMA location
	; %MVN($41, $00)

	; HDMA
	LDA.w #$001F ; DMAs
	LDX.w #$4360 ; DMA location
	%MVN($00, $41)

	BRA .done

.loading
	LDY.w #SA1IRAM.savethis_start
	LDX.w $4352 ; get location last written
	%MVN($41, $00)

	LDA.l HUD_NMI_DMA_SIZE : DEC
	LDY.w #SA1RAM.HUD
	%MVN($41, $00)

	; LDA.w #$004F ; DMAs
	; LDY.w #$4300 ; DMA location
	; %MVN($41, $00)

	; HDMA
	LDA.w #$001F ; DMAs
	LDY.w #$4360 ; DMA location
	%MVN($41, $00)

.done
	PLB

	SEP #$20

	LDX.w SA1IRAM.preset_scratch : PHX

	RTS

.address_size
	dl $7E0000 : dw $6000
	dl $7EA680 : dw $0C00
	dl $7EB940 : dw $0480
	dl $7EC000 : dw $0700
	dl $7EC880 : dw $0080
	dl $7EE800 : dw $1800

	dl $7F0000 : dw $4000
	dl $7F5800 : dw $0700
	dl $7F7000 : dw $01C0
	dl $7FDD80 : dw $1400
	dl $7FF800 : dw $0800

	dl 0

;===================================================================================================

FinalizeSavestate:
	LDA.w $4350
	ORA.b #$01
	STA.w $4350
	BMI .saving

.loading
	LDA.b #$18
	BRA .continue

.saving
	LDA.b #$39

.continue
	STA.w $4351

	LDX.w #$0000
	STX.w $4352
	LDA.b #$42
	STA.w $4354

	STX.w $4355
	STX.w $2116
	LDA.w $4351 : CMP.b #$39 : BNE ++

	LDY.w $2139 ; necessary dummy read

++	LDA.b #$20 : STA.w $420B

	LDA.w SA1RAM.old_music_bank : CMP.w $0136 : BEQ .songBankNotChanged

	SEP #$34 ; I flag too

	STZ.w $4200
	STZ.w $420C

	LDA.b #$FF : STA.w $2140

	LDA.b $1B : STA.w $0136
	BEQ .indoors

	JSL $008925
	BRA ++

.indoors
	JSL $008913

.songBankNotChanged
	; i hope this works
	; now we just reset to the main game loop
++	JML ResetGameStack

;===================================================================================================

Shortcut_ToggleOoB:
	SEP #$20

	LDA.w $037F
	AND.b #$01 ; just in case
	EOR.b #$01
	STA.w $037F

	RTL

;===================================================================================================

Shortcut_ToggleCrystalSwitch:
	REP #$20

	LDA.b $10
	CMP.w #$0007

	SEP #$20
	BNE .notsafe

	LDA.l $7EC172 : EOR.b #$01 : STA.l $7EC172

	LDA.b #$16 : STA.b $11
	LDA.b #$25 : STA.w $012F

.notsafe
	RTL

;===================================================================================================

Shortcut_SkipText:
	SEP #$20

	LDA.b #$04 : STA.w $1CD4

	RTL

;===================================================================================================

Shortcut_DisableSprites:
	SEP #$20
	JML Sprite_DisableAll

;===================================================================================================

Shortcut_FillEverything:
	SEP #$20
	REP #$10


	PHD

	PEA.w $0000
	PLD


	PHB

	PHK
	PLB

	LDY.w #0
	LDX.w #$F340

.next_item
	LDA.w .table,Y ; value we're writing
	STA.l $7E0000,X

	INY

	INX
	CPX.w #$F37C
	BCC .next_item

.itemsover
	; do keys
	LDA.b $1B ; are we indoors?
	BEQ .no_keys

	LDA.w $040C ; are we in a dungeon?
	BMI .no_keys

	LDA.b #$09 : STA.l $7EF36F

.no_keys
	LDA.l $7EF3C5 : BNE .ignoreprogress
	LDA.b #$01 : STA.l $7EF3C5

.ignoreprogress
	SEP #$30

	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	PLB
	PLD

	RTL

.table
	db 4   ; $F340 - silver bow w/ arrows
	db 2   ; $F341 - red boomerang
	db 1   ; $F342 - hookshot
	db 30  ; $F343 - max bombs
	db 2   ; $F344 - powder
	db 1   ; $F345 - fire rod
	db 1   ; $F346 - ice rod
	db 1   ; $F347 - bombos
	db 1   ; $F348 - ether
	db 1   ; $F349 - quake
	db 1   ; $F34A - lamp
	db 1   ; $F34B - hammer
	db 3   ; $F34C - active flute
	db 1   ; $F34D - bug net
	db 1   ; $F34E - book
	db 1   ; $F34F - bottles: slot 1 selected
	db 1   ; $F350 - somaria
	db 1   ; $F351 - byrna
	db 1   ; $F352 - cape
	db 2   ; $F353 - mirror
	db 2   ; $F354 - titan's mitt
	db 1   ; $F355 - boots
	db 1   ; $F356 - flippers
	db 1   ; $F357 - pearl
	db 0   ; $F358 - unused
	db 4   ; $F359 - gold sword
	db 3   ; $F35A - mirror shield
	db 2   ; $F35B - red mail
	db 4   ; $F35C - green potion
	db 3   ; $F35D - red potion
	db 5   ; $F35E - blue potion
	db 6   ; $F35F - fairy
	db $E7 ; $F360 - rupees
	db $03 ; $F361 - high byte
	db $E7 ; $F362 - rupees
	db $03 ; $F363 - high byte
	db $FF ; $F364 - every compass
	db $FF ; $F365 - more compasses
	db $FF ; $F366 - every big key
	db $FF ; $F367 - more big keys
	db $FF ; $F368 - every map
	db $FF ; $F369 - more maps
	db 0   ; $F36A - fairy donation
	db 0   ; $F36B - heart pieces
	db $A0 ; $F36C - 20 hearts
	db $98 ; $F36D - 1 less than max health
	db $78 ; $F36E - full magic - 8
	db $FF ; $F36F - keys
	db 7   ; $F370 - max bomb upgrades
	db 7   ; $F371 - max arrow upgrades
	db 0   ; $F372 - prevent filling of hp
	db 0   ; $F373 - prevent filling of magic
	db $07 ; $F374 - every pendant
	db 0   ; $F375 - prevent filling of bombs
	db 0   ; $F376 - prevent filling of arrows
	db 50  ; $F377 - max arrows
	db 0   ; $F378 - unused
	db $FE ; $F379 - every ability
	db $7F ; $F37A - every crystal
	db 1   ; $F37B - half magic

;===================================================================================================

Shortcut_ResetSegmentTimer:
	REP #$20

	STZ.w SA1IRAM.SEG_TIME_F
	STZ.w SA1IRAM.SEG_TIME_S
	STZ.w SA1IRAM.SEG_TIME_M

	SEP #$20

	LDA.b #$02 : TSB.w SA1IRAM.TIMER_FLAG

	RTL

;===================================================================================================

Shortcut_FixGraphics:
	SEP #$30
	LDA.b #$80 : STA.w $2100
	STZ.w $4200

	REP #$20
	LDA.w #$0280 : STA.w $2100
	LDA.w #$0313 : STA.w $2107
	LDA.w #$0063 : STA.w $2109 ; zeros out unused bg4
	LDA.w #$0722 : STA.w $210B
	STZ.w $2133 ; mode 7 register hit, but who cares

	SEP #$F0
	LDA.b $1B : BEQ ++

	JSL FixGraphics_Underworld
	JSL LoadCustomHUDGFX

	LDA.l $7EC172 : BEQ ++
	JSR FixGraphics_Pegs

++	LDA.b #$0F : STA.b $13
	LDA.b #$81 : STA.w $4200

	RTL

;===================================================================================================

FixGraphics_Pegs:
	REP #$30

	PHB

	LDX.w #$B4C0
	LDY.w #$F000
	LDA.w #$007F

	%MVN($7E,$7F)

	PLB

	SEP #$30

	LDA.b #$17 : STA.b $17

	RTS

;===================================================================================================

FixGraphics_Underworld: ; mostly copied from PalaceMap_RestoreGraphics
	PHB

	LDA.b #$00 : PHA : PLB

	LDA.b $9B : PHA
	STZ.b $9B : STZ.w $420C

	SEP #$30

	JSL $00834B ; Vram_EraseTilemaps.normal
	JSL $00E1DB ; InitTilesets
	JSL $0DFA8C ; HUD.RebuildLong2

.just_redraw
	STZ.w $0418
	STZ.w $045C

.drawQuadrants
	JSL $0091C4
	JSL $0090E3
	JSL $00913F
	JSL $0090E3

	LDA.w $045C : CMP.b #$10 : BNE .drawQuadrants

	STZ.b $17
	STZ.b $B0

	PLA : STA.b $9B
	PLB

	RTL

;===================================================================================================

Shortcut_ShowPits:
	SEP #$30
	LDA.b $1B : BEQ ++ ; don't do this outdoors

	STZ.w $4200
	LDA.b #$80 : STA.b $13 : STA.w $2100
	STA.w $2115

	JSL ShowPits

	LDA.b #$0F : STA.b $13
	LDA.b #$81 : STA.w $4200

++	RTL

ShowPits:
	PHB ; rebalanced in redraw

	PEA $7F00
	PLB

	LDA.b $9B
	STZ.b $9B : STA.w $420C

	PLB
	PHA

	REP #$30

	LDY.w #$0FFE

--	LDA.w $2000,Y : AND.w #$00FF ; checks tile attributes table
	CMP.w #$0020 : BNE .skip

	STZ.b $00

	TYA : ASL : TAX
	LDA.w #$050F : STA.l $7E2000,X
	TXA
	BIT.w #$1000 : BEQ ++

	PHA
	LDA.w #$1000
	STA.b $00
	PLA
	EOR.w #$1000

++	BIT.w #$0040 : BEQ ++

	PHA
	LDA.w #$0800
	TSB.b $00
	PLA
	EOR.w #$0040

++	PHA
	AND.w #$FF80
	LSR
	STA.b $02
	PLA
	SEC
	SBC.b $02
	CLC
	ADC.b $00
	LSR
	STA.l $2116
	LDA.w #$050F
	STA.l $2118

.skip
	DEY : BPL --

.time_for_tilemaps ; just a delimiting label
	SEP #$30

	STZ.b $17
	STZ.b $B0

	PLA : STA.b $9B

	PLB

	RTL

;===================================================================================================
; DISGUSTING
; No shared slots except bottles
;===================================================================================================
QuickSwap:
	LDA.b $F6 : AND.b #$30 : BEQ .done

	PHX
	LDX.w $0202 : BEQ .done_X

	CMP.b #$30 : BEQ .swap
	BIT.b #$10 : BEQ .no_r_press

	LDA.b $F2 : BIT.b #$20 : BNE .swap_from_last_r
	STZ.w SA1IRAM.QuickSwapLR
.find_r
	JSR .find_next
	BRA .store

.no_r_press
	LDA.b $F2 : BIT.b #$10 : BNE .swap_from_last_l
	STZ.w SA1IRAM.QuickSwapLR
.find_l
	JSR .find_prev
	BRA .store

.swap
	CPX.b #$10 : BNE .store ; not bottles
	STX.w SA1IRAM.QuickSwapLR

	JSR FindNextBottle
	BRA .click

.store
	STX.w $0202

.click
	LDA.b #$20 : STA.w $012F

	JSL $0DDB7F

.done_X
	PLX

.done
	LDA.b $F6 : AND.b #$40
	RTL

;===================================================================================================

.swap_from_last_r
	LDA.w SA1IRAM.QuickSwapLR : BEQ .find_r
	BRA .store

.swap_from_last_l
	LDA.w SA1IRAM.QuickSwapLR : BEQ .find_l
	BRA .store

;===================================================================================================

.find_next
	INX
	CPX.b #$15 : BCC + : LDX.b #$00
+	LDA.l $7EF33F,X : BEQ .find_next
	RTS

.find_prev
	DEX : BPL + : LDX.b #$14
+	LDA.l $7EF33F,X : BEQ .find_prev
	RTS

;===================================================================================================

FindNextBottle:
	LDA.l $7EF34F
	TAX

.next
	INX : CPX.b #$05 : BCC ++

	LDX.b #$01

++	LDA.l $7EF35B,X
	BEQ .next

	TXA
	STA.l $7EF34F

	RTS

;===================================================================================================

BottleMenuButtonPress:
	BIT.b $F4 : BVC ++
	JSR FindNextBottle
	RTL

++	BIT.b $F6 : BVC ++
	LDA.b #$07 : STA.w $0200
++	RTL

;===================================================================================================
