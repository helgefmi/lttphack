save_preset_data:
	LDA.b #$80 : STA $2100 : STA $13
	STZ $4200

	REP #$10
	LDY #$0000
	LDA.b #!sram_pss_offset : STA $00
	LDA.b #!sram_pss_offset>>8 : STA $01
	LDA.b #!sram_pss_offset>>16 : STA $02

	LDA $1B : INC : STA [$00], Y : INY
	CMP #$02 : BEQ .dungeon

	REP #$20
	; overworld
	LDA $040A : STA [$00], Y : INY #2
	LDA $22 : STA [$00], Y : INY #2
	LDA $20 : STA [$00], Y : INY #2
	LDA $E6 : STA [$00], Y : INY #2
	LDA $E8 : STA [$00], Y : INY #2
	LDA $E0 : STA [$00], Y : INY #2
	LDA $E2 : STA [$00], Y : INY #2
	LDA $061C : STA [$00], Y : INY #2
	LDA $0618 : STA [$00], Y : INY #2
	LDA $84 : STA [$00], Y : INY #2
	LDA $0624 : STA [$00], Y : INY #2
	LDA $0628 : STA [$00], Y : INY #2
	LDA #$FFFF : STA [$00], Y : INY #2
	JMP .end

.dungeon:
	REP #$20
	LDA $048E : STA [$00], Y : INY #2
	LDA $E6 : STA [$00], Y : INY #2
	LDA $E8 : STA [$00], Y : INY #2
	LDA $E0 : STA [$00], Y : INY #2
	LDA $E2 : STA [$00], Y : INY #2
	LDA $22 : STA [$00], Y : INY #2
	LDA $20 : STA [$00], Y : INY #2
	LDA $061C : STA [$00], Y : INY #2
	LDA $0618 : STA [$00], Y : INY #2
	LDA $0696 : STA [$00], Y : INY #2
	LDA $0600 : STA [$00], Y : INY #2
	LDA $0602 : STA [$00], Y : INY #2
	LDA $0604 : STA [$00], Y : INY #2
	LDA $0606 : STA [$00], Y : INY #2
	LDA $0608 : STA [$00], Y : INY #2
	LDA $060A : STA [$00], Y : INY #2
	LDA $060C : STA [$00], Y : INY #2
	LDA $060E : STA [$00], Y : INY #2
	LDA $A6 : STA [$00], Y : INY #2
	LDA $A9 : STA [$00], Y : INY #2
	SEP #$20
	LDA $0AA1 : STA [$00], Y : INY
	LDA $0132 : STA [$00], Y : INY
	LDA $A4 : STA [$00], Y : INY
	LDA $040C : STA [$00], Y : INY
	LDA $6C : STA [$00], Y : INY
	LDA $EE : STA [$00], Y : INY
	REP #$20
	LDA #$FFFF : STA [$00], Y : INY #2

.end:
	JSR save_poverty_state

	SEP #$20
	LDA #$81 : STA $4200
	LDA #$0F : STA $13 : STA $2100
	SEP #$30
	LDA #$01 : STA !lowram_last_frame_did_saveload
	STA !ram_can_load_pss
	RTL


; enter ai16
save_poverty_state:
	PHB : PHK : PLB
	SEP #$20
	STY $03
	LDY #$0000

	; B->A (WRAM->SRAM)
	LDA #$80 : STA $4310
	LDA #$80 : STA $4311
	LDA #!sram_pss_offset>>16 : STA $4314

.fetch
	LDA pss_data, Y : CMP #$FF : BEQ .done
	STA $2181
	REP #$20
	LDA pss_data+1, Y : STA $2182
	LDA #!sram_pss_offset : CLC : ADC $03 : STA $4312
	LDA pss_data+3, Y : INC : STA $4315
	CLC : ADC $03 : STA $03
	SEP #$20
	LDA #$02 : STA $420B
	INY #5
	BRA .fetch

.done
	PLB
	REP #$30
	RTS


; enter ai16
load_poverty_state:
	PHB : PHK : PLB
	SEP #$20
	LDA !sram_pss_offset : CMP #$02 : BEQ .dungeon
	LDY #$001B
	BRA +
.dungeon
	LDY #$0031
+	STY $03
	LDY #$0000

	; A->B (SRAM->WRAM)
	STZ $4310
	LDA #$80 : STA $4311
	LDA #!sram_pss_offset>>16 : STA $4314

.fetch
	LDA pss_data, Y : CMP #$FF : BEQ .done
	STA $2181
	REP #$20
	LDA pss_data+1, Y : STA $2182
	LDA #!sram_pss_offset : CLC : ADC $03 : STA $4312
	LDA pss_data+3, Y : INC : STA $4315
	CLC : ADC $03 : STA $03
	SEP #$20
	LDA #$02 : STA $420B
	INY #5
	BRA .fetch

.done
	PLB

	SEP #$30
	LDA !ram_rerandomize_toggle : BEQ .dont_rerandomize_2

	LDA !ram_rerandomize_framecount : STA $1A
	LDA !ram_rerandomize_rng : STA $0FA1

.dont_rerandomize_2
	LDA.l !ram_framerule
	DEC
	BMI .nofixedframerule
	STA $1A

.nofixedframerule
	REP #$30
	JSL Sprite_LoadGfxProperties

	SEP #$30
	JSL DecompSwordGfx
	JSL Palette_Sword
	JSL DecompShieldGfx
	JSL Palette_Shield
	JSL Palette_Armor

	; Check if we're in overworld
	LDA $1B : BEQ .in_overworld

	JSL UpdateBarrierTileChr

	LDA $11 : PHA
	LDA.b #$07 : STA $0690
	JSL Dungeon_AnimateTrapDoors
	PLA : STA $11

.in_overworld
	; Check if we currently have a tagalong
	LDA $7EF3CC : BEQ +
	JSL Tagalong_LoadGfx
+	REP #$30
	RTL


pss_data:
	dl $7EF000 : dw $04FF ; save data
	dl $7FDF80 : dw $027F ; underworld sprite state
	dl $7EC172 : dw $0001 ; crystal switch state
	dl SA1RAM.HUD+$4A : dw $0003 ; selected menu item
	dl SA1RAM.HUD+$8A : dw $0003
	dl $7E0202 : dw $0000
	dl $7E0302 : dw $0001
	dl $7E002F : dw $0000 ; link's direction
	dl $7EC140 : dw $0031 ; underworld exit cache
	dl $7E1ABF : dw $0000 ; warp vortex coordinates
	dl $7E1ACF : dw $0000
	dl $7E1ADF : dw $0000
	dl $7E1AEF : dw $0000
	dl $7E0641 : dw $0001 ; puzzle state in current room
	dl $7E0468 : dw $0001 ; trap door state
	dl $7E0540 : dw $001F ; object tilemap attributes
	dl $7E010E : dw $0001 ; dungeon entrance index
	dl $7E0B30 : dw $000F ; overlord timer (wallmaster)
	dl $7E0B0C : dw $0000 ; variable used by arrghus initial puff configuration
	dl $7E0B08 : dw $0001 ; arc variable
	dl $7E001A : dw $0000 ; frame counter
	dl $7E029E : dw $0009 ; ancillae's altitudes
	dl $7E0ABD : dw $0000 ; palette swap variable
	dl $7E0FC7 : dw $000F ; prize pack index
	dl $7E005D : dw $0000 ; Link state
	dl $7E02E0 : dw $0000 ; Bunny graphics
	dl $7E0056 : dw $0000 ; Link palette (to fix bunny)
	dl $7E0CBA : dw $000F ; Sprite drop
	db $FF
