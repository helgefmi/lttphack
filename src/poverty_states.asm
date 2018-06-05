org $2C8000

save_preset_data:
    LDA.b #$80 : STA $2100 : STA $13
    STZ $4200

  %i16()
    LDY #$0000
    LDA.b #!sram_pss_offset : STA $00
    LDA.b #!sram_pss_offset>>8 : STA $01
    LDA.b #!sram_pss_offset>>16 : STA $02

    LDA $1B : INC : STA [$00],y : INY
    CMP #$02 : BEQ .dungeon

  %a16()
    ; overworld
    LDA $040A : STA [$00],y : INY : INY
    LDA $22 : STA [$00],y : INY : INY
    LDA $20 : STA [$00],y : INY : INY
    LDA $E6 : STA [$00],y : INY : INY
    LDA $E8 : STA [$00],y : INY : INY
    LDA $E0 : STA [$00],y : INY : INY
    LDA $E2 : STA [$00],y : INY : INY
    LDA $061C : STA [$00],y : INY : INY
    LDA $0618 : STA [$00],y : INY : INY
    LDA $84 : STA [$00],y : INY : INY
    LDA $0624 : STA [$00],y : INY : INY
    LDA $0628 : STA [$00],y : INY : INY
    LDA #$FFFF : STA [$00],y : INY : INY
    JMP .end

  .dungeon:
  %a16()
    LDA $048E : STA [$00],y : INY : INY
    LDA $E6 : STA [$00],y : INY : INY
    LDA $E8 : STA [$00],y : INY : INY
    LDA $E0 : STA [$00],y : INY : INY
    LDA $E2 : STA [$00],y : INY : INY
    LDA $22 : STA [$00],y : INY : INY
    LDA $20 : STA [$00],y : INY : INY
    LDA $061C : STA [$00],y : INY : INY
    LDA $0618 : STA [$00],y : INY : INY
    LDA $0696 : STA [$00],y : INY : INY
    LDA $0600 : STA [$00],y : INY : INY
    LDA $0602 : STA [$00],y : INY : INY
    LDA $0604 : STA [$00],y : INY : INY
    LDA $0606 : STA [$00],y : INY : INY
    LDA $0608 : STA [$00],y : INY : INY
    LDA $060A : STA [$00],y : INY : INY
    LDA $060C : STA [$00],y : INY : INY
    LDA $060E : STA [$00],y : INY : INY
    LDA $A6 : STA [$00],y : INY : INY
    LDA $A9 : STA [$00],y : INY : INY
  %a8()
    LDA $0AA1 : STA [$00],y : INY
    LDA $0132 : STA [$00],y : INY
    LDA $A4 : STA [$00],y : INY
    LDA $040C : STA [$00],y : INY
    LDA $6C : STA [$00],y : INY
    LDA $EE : STA [$00],y : INY
  %a16()
    LDA #$FFFF : STA [$00],y : INY : INY

  .end:
    JSR save_poverty_state

  %a8()
    LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
  %ai8()
    LDA #$01 : STA !lowram_last_frame_did_saveload
    STA !ram_can_load_pss
    RTL


; enter ai16
save_poverty_state:
  PHB : PHK : PLB
  %a8()
    STY $03
    LDY #$0000

    ; B->A (WRAM->SRAM)
    LDA #$80 : STA $4310
    LDA #$80 : STA $4311
    LDA #!sram_pss_offset>>16 : STA $4314

  .fetch
    LDA pss_data,y : CMP #$FF : BEQ .done
    STA $2181
  %a16()
    LDA pss_data+1,y : STA $2182
    LDA #!sram_pss_offset : CLC : ADC $03 : STA $4312
    LDA pss_data+3,y : INC : STA $4315
    CLC : ADC $03 : STA $03
  %a8()
    LDA #$02 : STA $420B
    INY : INY : INY : INY : INY
    BRA .fetch

  .done
  PLB
  %ai16()
    RTS


; enter ai16
load_poverty_state:
  PHB : PHK : PLB
  %a8()
    LDA !sram_pss_offset : CMP #$02 : BEQ .dungeon
    LDY #$001B
    BRA +
  .dungeon
    LDY #$0031
  +
    STY $03
    LDY #$0000

    ; A->B (SRAM->WRAM)
    STZ $4310
    LDA #$80 : STA $4311
    LDA #!sram_pss_offset>>16 : STA $4314

  .fetch
    LDA pss_data,y : CMP #$FF : BEQ .done
    STA $2181
  %a16()
    LDA pss_data+1,y : STA $2182
    LDA #!sram_pss_offset : CLC : ADC $03 : STA $4312
    LDA pss_data+3,y : INC : STA $4315
    CLC : ADC $03 : STA $03
  %a8()
    LDA #$02 : STA $420B
    INY : INY : INY : INY : INY
    BRA .fetch

  .done
   PLB

  %ai8()
    JSL !DecompSwordGfx
    JSL !Palette_Sword
    JSL !DecompShieldGfx
    JSL !Palette_Shield
    JSL !Palette_Armor

    ; Check if we're in overworld
    LDA $1B : BEQ .in_overworld

    JSL !UpdateBarrierTileChr

    LDA $11 : PHA
    LDA.b #$07 : STA $0690
    JSL !Dungeon_AnimateTrapDoors
    PLA : STA $11

  .in_overworld
    ; Check if we currently have a tagalong
    LDA $7EF3CC : BEQ +
    JSL !Tagalong_LoadGfx
  +

  %ai16()
    RTL


pss_data:
    dl $7EF000 : dw $04FF ; save data
    dl $7FDF80 : dw $027F ; underworld sprite state
    dl $7EC172 : dw $0001 ; crystal switch state
    dl $7EC74A : dw $0003 ; selected menu item
    dl $7EC78A : dw $0003
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
    dl $7E0B08 : dw $0001 ; arc variable
    dl $7E001A : dw $0000 ; frame counter (may be rerandomized)
    dl $7E029E : dw $0009 ; ancillae's altitudes
    db $FF
