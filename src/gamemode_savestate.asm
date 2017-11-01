  %ai16()
    LDA (!ram_savestate_ctrl_to_use)
    CMP !ram_savestate_load_shortcut : BEQ .do_save_state
    JMP .test_load_state

  .do_save_state
  %a8()
    ; store DMA to SRAM
    LDY #$0000 : LDX #$0000
-   LDA $4300, X : STA $770000, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA to SRAM

  + JSR ppuoff
    LDA #$80 : STA $4310
    JSR func_dma2

    LDA #$81 : STA $4310
    LDA #$39 : STA $4311
    JMP end

  .test_load_state
    CMP !ram_savestate_save_shortcut : BEQ .do_load_state
    JMP after_save_state

  .do_load_state
  %a8()
    STZ $420C
    JSR ppuoff
    STZ $4310
    JSR func_dma2

    LDX $1C : STX $212C
    LDX $1E : STX $212E
    LDX $94 : STX $2105
    LDX $96 : STX $2123
    LDX $99 : STX $2130

    INC $15
    LDA $0133 : STA $012C
    STZ $0133
    LDA $0638 : STA $211F
    LDA $0639 : STA $211F
    LDA $063A : STA $2120
    LDA $063B : STA $2120
    LDA $98 : STA $2125
    LDA $9B : STA $420C

    LDA #$01 : STA $4310
    LDA #$18 : STA $4311

+ %a8()
    JMP end

  ppuoff:
    LDA #$80 : STA $13 : STA $2100
    STZ $4200
    RTS

  func_dma1:
    LDX #$7500 : LDY #$0000 : LDA #$80 : JSR func_dma1b
    LDX #$7600 : LDY #$4000 : LDA #$80 : JSR func_dma1b
    RTS

  func_dma1b:
    STY $2116 : STZ $4312 : STX $4313 : STZ $4315 : STA $4316 : STZ $2115

    LDA $4311 : CMP #$39 : BNE +
    LDA $2139

  + LDA #$02 : STA $420B
    RTS

  func_dma2:
    PLX : STX $4318

    STZ $2181 : STZ $4312

    LDY #$0071 : LDX #$0000 : JSR func_dma2b
    INY : LDX #$0080 : JSR func_dma2b
    INY : LDX #$0100 : JSR func_dma2b
    INY : LDX #$0180 : JSR func_dma2b

    LDX $4318 : PHX

    RTS

  func_dma2b:
    STZ $4313 : STY $4314 : STX $2182
    LDA #$80 : STA $4311 : STA $4316
    LDA #$02 : STA $420B
    RTS

  end:
    JSR func_dma1

    ; load DMA from SRAM
    LDY #$0000 : LDX #$0000
  %a8()
  - LDA $770000, X : STA $4300, X
    INX
    INY : CPY #$000B : BNE -
    CPX #$007B : BEQ +
    INX : INX : INX : INX : INX
    LDY #$0000
    JMP -
    ; end of DMA from SRAM

  + LDA #$A1 : STA $4200
    LDA #$0F : STA $13 : STA $2100
  %ai8()
    LDA #$01 : STA !lowram_last_frame_did_saveload
    RTL

  after_save_state:
