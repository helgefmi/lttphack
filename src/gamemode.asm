pushpc
org $008039
gamemode_hook:
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

UseShortCut:
	JMP.w (SA1IRAM.SHORTCUT_USED)

UseShortCutSA1:
	DEC
	PHA
	RTS

gamemode_sa1_side_shortcut:
	RTL

; Custom Menu
gamemode_custom_menu:
	JML CM_Main

; Load previous preset
gamemode_load_previous_preset:
	SEP #$30

	; Loading during text mode makes the text stay or the item menu bug
	LDA $10 : CMP #$0E : BEQ .no_load_preset
	REP #$20
	LDA.w SA1IRAM.preset_addr
	SEP #$20
	BEQ .no_load_preset

	JML preset_load_last_preset

.no_load_preset
	RTL

; Replay last movie
gamemode_replay_last_movie:
	SEP #$20
	LDA !ram_movie_mode : CMP #$02 : BEQ .no_replay

	SEP #$30
	JSR gamemode_load_previous_preset : BCC .no_replay
	LDA #$02 : STA !ram_movie_next_mode

.no_replay
	RTL

; Save state
gamemode_savestate:
.save
	SEP #$20
	REP #$10
	; Remember which song bank was loaded before load stating
	; I put it here too, since `end` code runs both on save and load state..
	LDA $0136 : STA.w SA1RAM.ss_old_music_bank

	; store DMA to SRAM
	LDY #$0000 : LDX #$0000
-	LDA $4300, X : STA.w SA1RAM.ss_dma_buffer, X
	INX
	INY : CPY #$000B : BNE -
	CPX #$007B : BCS +
	INX #5
	LDY #$0000
	BRA -
	; end of DMA to SRAM

+	JSL ppuoff
	LDA #$80 : STA $4310 ; B to A
	JSR DMA_BWRAMSRAM

	JMP savestate_end

.load
	SEP #$20
	REP #$10
	; Remember which song bank was loaded before load stating (so we can change if needed)
	LDA $0136 : STA.w SA1RAM.ss_old_music_bank

	LDA.w !ram_rerandomize_toggle : BEQ .dont_rerandomize_1

	; Save the current framecounter & rng accumulator
	LDA $1A : STA.w SA1RAM.frame_cache
	LDA $0FA1 : STA.w SA1RAM.rng_cache

.dont_rerandomize_1
	SEP #$20
	; Remember which song was playing before loading state
	LDA.w $0130 : STA.w SA1RAM.old_music

	; Mute ambient sounds
	LDA #$05 : STA $2141

	STZ $420C
	JSL ppuoff
	STZ $4310
	LDA.b #$00 : STA.w $4310
	JSR DMA_BWRAMSRAM

	LDX $1C : STX $212C
	LDX $1E : STX $212E
	LDX $94 : STX $2105
	LDX $96 : STX $2123
	LDX $99 : STX $2130

	INC $15
	; Update which song is currently being played by the APU
	LDA.w SA1RAM.old_music : STA.w $0133
	; Attempt to restart the current song if it isn't already playing
	LDA.w $0130 : STA.w $012C

	LDA $0131 : CMP #$17 : BEQ .annoyingSounds ; Bird music
	STA $012D : STZ $0131

.annoyingSounds
	LDA $0638 : STA $211F
	LDA $0639 : STA $211F
	LDA $063A : STA $2120
	LDA $063B : STA $2120
	LDA $98 : STA $2125
	LDA $9B : STA $420C

	LDA #$01 : STA $4310
	LDA #$18 : STA $4311

	LDA.w !ram_rerandomize_toggle : BEQ .dont_rerandomize_2

	LDA.w SA1RAM.frame_cache : STA $1A
	LDA.w SA1RAM.rng_cache : STA $0FA1

.dont_rerandomize_2
	LDA.w SA1RAM.framerule
	DEC
	BMI .nofixedframerule
	STA $1A

.nofixedframerule
+	SEP #$20

	JMP savestate_end

ppuoff:
	LDA.b #$80 : STA.w $2100
	STZ.w $4200
	STZ.w $420C
	RTL

ppuon:
	LDA.b #$0F : STA.b $13
	LDA.b #$81 : STA.w $4200
	RTL

DMA_BWRAMSRAM:
	PLX : STX.w $4328

	STA.w $4310 ; direction
	LDA.b #$80 : STA.w $4311 ; wram
	LDA.b #$41 : STA.w $4314

	LDX.w #$0000
	TXA : XBA ; top byte 0
	STX.w $4312 ; bottom of bank

.next
	LDA.w .address_size+2, X ; get bank
	BEQ .sa1stuff

	STA.w $2183
	LDY.w .address_size+0, X
	STY.w $2181

	LDY.w .address_size+3, X
	STY.w $4315

	LDA.b #$02 : STA.w $420B

	TXA
	CLC
	ADC.b #$05
	TAX
	BRA .next

.sa1stuff
	PHB
	LDA.b #$00
	XBA
	LDA.b #(SA1IRAM.savethis_end-SA1IRAM.savethis_start)-1
	BIT.w $4310 ; which way to transfer?
	BPL ..loading

..saving
	LDX.w #SA1IRAM.savethis_start
	LDY.w $4312 ; get location last written
	%MVN($00, $41)
	BRA .done

..loading
	LDY.w #SA1IRAM.savethis_start
	LDX.w $4312 ; get location last written
	%MVN($41, $00)

.done
	LDX.w $4328 : PHX
	LDA.w $4338 : PHA
	PLB
	RTS

.address_size
	dl $7E0000 : dw $6000
	dl $7EC000 : dw $0900
	dl $7EE800 : dw $1800

	dl $7F0000 : dw $6000
	dl $7FDD80 : dw $1200
	dl $7FF800 : dw $0800

	dl 0

savestate_end:
	LDA.w $4310
	ORA.b #$01
	STA.w $4310
	BMI .saving

.loading
	LDA.b #$18
	BRA .continue

.saving
	LDA.b #$39

.continue
	STA.w $4311

	LDX.w #$0000
	STX.w $4312
	LDA.b #$42
	STA.w $4314

	STX.w $4315
	STX.w $2116
	LDA.w $4311 : CMP.b #$39 : BNE ++
	LDY.w $2139

++	LDA.b #$02 : STA.w $420B

	; load DMA from SRAM
	LDY #$0000 : LDX #$0000
	SEP #$20
	REP #$10
-	LDA.w SA1RAM.ss_dma_buffer, X : STA.w $4300, X
	INX
	INY : CPY #$000B : BNE -
	CPX #$007B : BEQ +
	INX #5
	LDY #$0000
	BRA -
	; end of DMA from SRAM

+	LDA.w SA1RAM.ss_old_music_bank : CMP $0136 : BEQ .songBankNotChanged
	JSL music_reload

.songBankNotChanged
	SEP #$31

	; i hope this works
	; now we just reset to the main game loop
	REP #$20
	LDA.w #$0000
	TCD
	PHA
	PLB

	STZ.w SA1IRAM.SHORTCUT_USED

	LDA.w #$1FFF
	TCS

	SEP #$30
	STZ.b $12
	;LDA.b $13 : STA.w $2100
	LDA.b #$81 : STA.w $4200
	JML.l $008034

gamemode_oob:
	SEP #$20
	LDA.w $037F
	AND.b #$01 ; just in case
	EOR.b #$01
	STA.w $037F
	RTL

gamemode_toggle_switch:
	REP #$20
	LDA.b $10
	CMP.w #$0007
	SEP #$20
	BNE .notsafe

	LDA.l $7EC172 : EOR #$01 : STA.l $7EC172
	LDA.b #$16 : STA.b $11
	LDA.b #$25 : STA.w $012F


.notsafe
	RTL


gamemode_skip_text:
	SEP #$20
	LDA.b #$04 : STA.w $1CD4
	RTL

gamemode_disable_sprites:
	SEP #$20
	JML Sprite_DisableAll

gamemode_fill_everything:
	SEP #$20
	REP #$10
	PHB
	PHK
	PLB

	LDA.b #$7E ; bank of SRAM mirror
	STA.b $0C

	LDY.w #0

.next_item
	LDX.w .table+0, Y
	BEQ .itemsover

	STX.b $0A ; SRAM address we're writing to

	LDA.w .table+2, Y ; value we're writing
	STA.b [$0A]

	INY
	INY
	INY
	BRA .next_item

.itemsover

	; do keys
	LDA.w $001B ; are we indoors?
	BEQ .outdoors

	LDA.w $040C ; are we in a dungeon?
	BMI .cavestate

	LDA.b #$09
	BRA .write_keys

.cavestate
	LDA.b #$FF ; -1 for cavestate

.write_keys
	STA.l !ram_equipment_keys

.outdoors
	LDA.l !ram_game_progress : BNE .ignoreprogress
	LDA #$01 : STA.l !ram_game_progress

.ignoreprogress

	PLB

	SEP #$30
	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	RTL

.table
	dw $F340 : db 4   ; bow: silvers w/ arrows
	dw $F341 : db 2   ; red boomerang
	dw $F342 : db 1   ; hookshot
	dw $F343 : db 30  ; max bombs
	dw $F344 : db 2   ; powder

	dw $F345 : db 1   ; fire rod
	dw $F346 : db 1   ; ice rod
	dw $F347 : db 1   ; bombos
	dw $F348 : db 1   ; ether
	dw $F349 : db 1   ; quake

	dw $F34A : db 1   ; lamp
	dw $F34B : db 1   ; hammer
	dw $F34C : db 3   ; active flute
	dw $F34D : db 1   ; bug net
	dw $F34E : db 1   ; book

	dw $F34F : db 1   ; bottles: slot 1 selected
	dw $F350 : db 1   ; somaria
	dw $F351 : db 1   ; byrna
	dw $F352 : db 1   ; cape
	dw $F353 : db 2   ; mirror

	dw $F354 : db 2   ; titan's mitt
	dw $F355 : db 1   ; boots
	dw $F356 : db 1   ; flippers
	dw $F357 : db 1   ; pearl

	dw $F359 : db 4   ; gold sword
	dw $F35A : db 3   ; mirror shield
	dw $F35B : db 2   ; red mail

	dw $F35C : db 4   ; green potion
	dw $F35D : db 3   ; red potion
	dw $F35E : db 5   ; blue potion
	dw $F35F : db 6   ; fairy

	dw $F360 : db $E7 ; rupees
	dw $F361 : db $03 ; high byte
	dw $F362 : db $E7 ; rupees
	dw $F363 : db $03 ; high byte

	dw $F364 : db $FF ; every compass
	dw $F365 : db $FF ; more compasses
	dw $F366 : db $FF ; every big key
	dw $F367 : db $FF ; more big keys
	dw $F368 : db $FF ; every map
	dw $F369 : db $FF ; more maps

	dw $F36D : db $98 ; 1 less than max health
	dw $F36C : db $A0 ; 20 hearts

	dw $F36E : db $78 ; full magic - 8

	dw $F370 : db 7   ; max bomb upgrades
	dw $F371 : db 7   ; max arrow upgrades

	dw $F372 : db 0   ; prevent filling of hp
	dw $F373 : db 0   ; prevent filling of magic

	dw $F374 : db $07 ; every pendant

	dw $F375 : db 0   ; prevent filling of bombs
	dw $F376 : db 0   ; prevent filling of arrows
	dw $F377 : db 50  ; max arrows

	dw $F379 : db $FE ; every ability
	dw $F37A : db $7F ; every crystal

	dw $F37B : db 1   ; half magic

	dl 0 ; end

gamemode_reset_segment_timer:
	REP #$20
	STZ.w SA1IRAM.SEG_TIME_F
	STZ.w SA1IRAM.SEG_TIME_S
	STZ.w SA1IRAM.SEG_TIME_M
	SEP #$20
	LDA.b #$02 : TSB.w SA1IRAM.TIMER_FLAG
	RTL

gamemode_fix_vram:
	SEP #$20
	LDA.b #$80 : STA.w $2100 ; keep fblank on while we do stuff
	STZ.w $4200

	REP #$30
	LDA.w #$0280 : STA.w $2100
	LDA.w #$0313 : STA.w $2107
	LDA.w #$0063 : STA.w $2109 ; zeros out unused bg4
	LDA.w #$0722 : STA.w $210B
	STZ.w $2133 ; mode 7 register hit, but who cares

	SEP #$20
	LDA.b $1B : BEQ ++
	JSR fix_vram_uw
	JSL load_default_tileset

	LDA $7EC172 : BEQ ++
	JSR fixpegs ; quick and dirty pegs reset

++	LDA.b #$0F : STA.b $13
	LDA.b #$81 : STA.w $4200
	RTL

fixpegs:

	REP #$30
	LDX #$0000
--	LDA $7EB4C0, X : STA $7F0000, X
	LDA $7EB340, X : STA $7F0080, X
	INX #2 : CPX #$0080 : BNE --
	SEP #$30
	LDA #$17 : STA $17
	RTS

fix_vram_uw: ; mostly copied from PalaceMap_RestoreGraphics - pc: $56F19
	PHB
	LDA #$00 : PHA : PLB ; need to be bank00
	LDA $9B : PHA
	STZ $9B : STZ $420C

	JSL $00834B ; Vram_EraseTilemaps.normal

	JSL $00E1DB ; InitTilesets

	JSL $0DFA8C ; HUD.RebuildLong2

.just_redraw
	STZ $0418
	STZ $045C

.drawQuadrants

	JSL $0091C4
	JSL $0090E3
	JSL $00913F
	JSL $0090E3

	LDA $045C : CMP #$10 : BNE .drawQuadrants

	STZ $17
	STZ $B0

	PLA : STA $9B
	PLB
	RTL

; wrapper because of push and pull logic
; need this to make it safe and ultimately fix INIDISP ($13)
gamemode_somaria_pits_wrapper:
	SEP #$30
	LDA $1B : BEQ ++ ; don't do this outdoors

	LDA #$80 : STA $13 : STA $2100 ; keep fblank on while we do stuff
	JSR gamemode_somaria_pits
	LDA #$0F : STA $13

++	RTL

gamemode_somaria_pits:
	PHB ; rebalanced in redraw
	PEA $007F ; push both bank 00 and bank 7F (wram)
	PLB ; but only pull 7F for now

	REP #$30

	LDY #$0FFE

--	LDA $2000, Y : AND #$00FF ; checks tile attributes table
	CMP #$0020 : BEQ .ispit
	;CMP #$00B0 : BCC .skip
	;CMP #$00BF : BCS .skip ; range B0-BE, which are pits
	BRA .skip

.ispit
	TYA : ASL : TAX
	LDA #$050F : STA $7E2000, X

.skip
	DEY : BPL --

.time_for_tilemaps ; just a delimiting label
	SEP #$30
	PLB ; pull to bank 00 for this next stuff

	LDA $9B : PHA ; rebalanced in redraw
	STZ $9B : STZ $420C

	JMP fix_vram_uw_just_redraw ; jmp because of stack

;gamemode_lagometer:
;	REP #$30
;	LDA !lowram_nmi_counter : CMP #$0002 : BCS .lag_frame
;	LDA #$3C00 : STA !lowram_draw_tmp
;
;	LDA $2137 : LDA $213D : AND #$00FF : CMP #$007F : BCS .warning
;	BRA .draw
;
;.warning
;	PHA : LDA #$2800 : STA !lowram_draw_tmp : PLA
;	BRA .draw
;
;.lag_frame
;	LDA #$3400 : STA !lowram_draw_tmp
;	LDA #$00FF
;
;.draw
;	STZ !lowram_nmi_counter
;
;	AND #$00FF : LSR : CLC : ADC #$0007 : AND #$FFF8 : TAX
;
;	LDA.l .mp_tilemap+0, X : ORA !lowram_draw_tmp : STA.w SA1RAM.HUD+$42
;	LDA.l .mp_tilemap+2, X : ORA !lowram_draw_tmp : STA.w SA1RAM.HUD+$82
;	LDA.l .mp_tilemap+4, X : ORA !lowram_draw_tmp : STA.w SA1RAM.HUD+$C2
;	LDA.l .mp_tilemap+6, X : ORA !lowram_draw_tmp : STA.w SA1RAM.HUD+$102
;
;	SEP #$30
;	RTS
;
;.mp_tilemap
;	dw $00F5, $00F5, $00F5, $00F5
;	dw $00F5, $00F5, $00F5, $005F
;	dw $00F5, $00F5, $00F5, $004C
;	dw $00F5, $00F5, $00F5, $004D
;	dw $00F5, $00F5, $00F5, $004E
;	dw $00F5, $00F5, $005F, $005E
;	dw $00F5, $00F5, $004C, $005E
;	dw $00F5, $00F5, $004D, $005E
;	dw $00F5, $00F5, $004E, $005E
;	dw $00F5, $005F, $005E, $005E
;	dw $00F5, $004C, $005E, $005E
;	dw $00F5, $004D, $005E, $005E
;	dw $00F5, $004E, $005E, $005E
;	dw $005F, $005E, $005E, $005E
;	dw $004C, $005E, $005E, $005E
;	dw $004D, $005E, $005E, $005E
;	dw $004E, $005E, $005E, $005E

;===================================================================================================
; DISGUSTING
; No shared slots except bottles
;===================================================================================================
QuickSwap:
	LDA.b $F6 : AND.b #$30 : BEQ .done

	PHX
	LDX.w $0202 : BEQ .done_X

	CMP.b #$30 : BEQ .special
	BIT.b #$10 : BEQ .no_r_press

	LDA.b $F2 : BIT.b #$20 : BNE .special_from_last_r
	STZ.w SA1IRAM.QuickSwapLR
.find_r
	JSR .find_next
	BRA .store

.no_r_press
	LDA.b $F2 : BIT.b #$10 : BNE .special_from_last_l
	STZ.w SA1IRAM.QuickSwapLR
.find_l
	JSR .find_prev
	BRA .store

.special
	CPX.b #$10 : BNE .store ; not bottles
	STX.w SA1IRAM.QuickSwapLR

	JSR FindNextBottle
	BRA .swap

.store
	STX.w $0202

.swap
	LDA.b #$20 : STA.w $012F

	JSL $0DDB7F

.done_X
	PLX

.done
	LDA.b $F6 : AND.b #$40
	RTL

;---------------------------------------------------------------------------------------------------

.special_from_last_r
	LDA.w SA1IRAM.QuickSwapLR : BEQ .find_r
	BRA .store

.special_from_last_l
	LDA.w SA1IRAM.QuickSwapLR : BEQ .find_l
	BRA .store

;---------------------------------------------------------------------------------------------------

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
	INX : CPX.b #$05 : BCC ++ : LDX.b #$01
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
