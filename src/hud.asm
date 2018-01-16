; HUD
;
; Takes care of drawing the following:
; - Link's hearts and container
; - Enemy's hearts
; - Input display
; - Quick Warp Indicator
; - X/Y Coordinates

; ----------------
; FLOOR INDICATOR
; ----------------

; FloorIndicator quick RTL
;
; This can mess with the HUD, removing parts of it.

org $0AFD2C
    SEP #$30
    RTL


; FloorIndicator.noIndicator quick RTL
org $0AFDB0
    SEP #$30
    RTL


; -------------
; HUD TEMPLATE
; -------------

; HUD Template Hijack
;
; Overrides the following
; $0DFA8E: E2 30  SEP #$30
; $0DFA90: E6 16  INC $16
org $0DFAAE
    JSL hud_template_hook


; Hud Template Hook
org $21F000
hud_template_hook:
    ; Makes sure to redraw hearts.
    STZ !lowram_last_frame_hearts

  %a16()
    ; Remove some HUD stuff.
    LDA #$207F
    STA $7EC72C : STA $7EC72E
    STA $7EC730 : STA $7EC732
    STA $7EC734 : STA $7EC736

    JSL draw_counters

    LDA !ram_qw_toggle : BEQ .dont_update_qw
    JSR hud_draw_qw
  .dont_update_qw

    SEP #$30
    INC $16
    RTL


; -----------------------
; UPDATE HEARTS TEMPLATE
; -----------------------

; UpdateHearts removal
;
; Since the game calls this function twice, once for containers, once for actual hearts,
; and since we do them both at the same time, we only need one call, so erasing this one.
;
; Overriding the following:
; $0DFC06:  20 AB FD  JSR HandleHearts

org $0DFC26
    NOP : NOP : NOP


; UpdateHearts Hijack
org $0DFDCB
    JSL update_hearts_hook
    RTS


; UpdateHearts Hook
org $218000
update_hearts_hook:
    ; Enters: AI=16
    ; Keep AI=16 throughout (let subroutines change back/forth)
  %a8()
    LDA !ram_equipment_curhp : CMP !lowram_last_frame_hearts : BEQ .dont_update_hearts
    STA !lowram_last_frame_hearts
  %a16()

    JSR hud_draw_hearts

  .dont_update_hearts
  %a16()

    LDA !ram_qw_toggle : BEQ .dont_update_qw
    LDA $E2 : CMP !ram_qw_last_scroll : BEQ .dont_update_qw
    STA !ram_qw_last_scroll

    JSR hud_draw_qw

  .dont_update_qw

    LDA !ram_enemy_hp_toggle : BEQ .dont_draw_enemy_hp

    JSR hud_draw_enemy_hp

  .dont_draw_enemy_hp

    LDA !ram_input_display_toggle : BEQ .dont_update_input_display

    JSR hud_draw_input_display

  .dont_update_input_display

    LDA !ram_subpixels_show : BEQ .done_update_subpixels

    JSR hud_draw_subpixels

  .done_update_subpixels
  %a8()
    LDA !ram_xy_toggle : BEQ .dont_update_xy
  %a16()

    JSR hud_draw_xy_display

  .dont_update_xy
  %a8()
    LDA !ram_lit_rooms_toggle : BEQ .dont_update_lit_rooms
    LDA.b #$03 : STA $045A

  .dont_update_lit_rooms

    LDA !ram_toggle_lanmola_cycles : BEQ .end

    ; Make sure we're indoors and in the boss fight room
    LDA $A0 : CMP.b #$33 : BNE .end
    LDA $1B : BEQ .end

    LDA $0DF0 : CMP.b #$01 : BNE .lanmola2
    LDA $0D80 : CMP.b #$01 : BNE .lanmola2
    LDA !ram_lanmola_cycles : INC : STA !ram_lanmola_cycles

  .lanmola2
    LDA $0DF1 : CMP.b #$01 : BNE .lanmola3
    LDA $0D81 : CMP.b #$01 : BNE .lanmola3
    LDA !ram_lanmola_cycles+1 : INC : STA !ram_lanmola_cycles+1

  .lanmola3
    LDA $0DF2 : CMP.b #$01 : BNE .draw_cycles
    LDA $0D82 : CMP.b #$01 : BNE .draw_cycles
    LDA !ram_lanmola_cycles+2 : INC : STA !ram_lanmola_cycles+2

  .draw_cycles
  %a16()
    JSR hud_draw_lanmola_cycles

  .end
  %ai16()
    RTL


hud_draw_lanmola_cycles:
    LDA !ram_lanmola_cycles+0 : AND #$00FF : ORA #$2090 : STA $7EC810
    LDA !ram_lanmola_cycles+1 : AND #$00FF : ORA #$2090 : STA $7EC812
    LDA !ram_lanmola_cycles+2 : AND #$00FF : ORA #$2090 : STA $7EC814
    RTS



hud_draw_hearts:
    ; Assumes: X=16

    ; Check if we have full hp
  %a8()
    LDA !ram_equipment_maxhp : SEC : SBC !ram_equipment_curhp : CMP.b #$04 : BCS .not_full_hp

  %a16()
    LDA #$24A0
    JMP .draw_hearts

  .not_full_hp
  %a16()
    LDA #$24A1

  .draw_hearts
    ; Heart gfx
    STA !POS_MEM_HEART_GFX

    ; Full hearts
    LDA !ram_equipment_curhp : AND #$00FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_HEARTS : JSL draw2_white

    ; Quarters
    LDA !ram_equipment_curhp : AND #$0007 : ORA #$3490 : STA $7EC704, X

    ; Container gfx
    LDA #$24A2 : STA !POS_MEM_CONTAINER_GFX

    ; Container
    LDA !ram_equipment_maxhp : AND #$00FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_CONTAINERS : JSL draw2_white

    RTS


hud_draw_qw:
  %a8()
    LDA $E2 : AND.b #$06 : CMP.b #$06 : BEQ .is_qw

  %a16()
    LDA #$207F : STA $7EC80A
    LDA #$207F : STA $7EC80C
    BRA .end

  .is_qw
  %a16()
    LDA #$340C : STA $7EC80A
    LDA #$340D : STA $7EC80C

  .end
  %a16()
    RTS


hud_draw_enemy_hp:
    ; Assumes: I=16
    ; Draw over Enemy Heart stuff in case theres no enemies
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700, X : STA $7EC702, X : STA $7EC704, X

    LDX #$FFFF

  .loop
    INX : CPX #$0010 : BEQ .end
    LDA $0DD0, X : AND #$00FF : CMP #$0009 : BNE .loop
    LDA $0E60, X : AND #$0040 : BNE .loop
    LDA $0E50, X : AND #$00FF : BEQ .loop : CMP #$00FF : BEQ .loop

    ; Enemy HP should be in A.
    JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw3_white_aligned_left

    ; Enemy Heart GFX
    LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

  .end
    RTS

hud_draw_input_display:
    ; Assumes: I=16

    LDA !ram_ctrl1 : CMP !ram_ctrl1_word_copy : BEQ .end

    STA !ram_ctrl1_word_copy : TAY
    LDX #$0000

-   TYA : AND.l ctrl_top_bit_table, X : BEQ +
    LDA.l ctrl_top_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_MEM_INPUT_DISPLAY_TOP, X
    INX : INX : CPX #$00C : BNE -

    LDX #$0000

-   TYA : AND.l ctrl_bot_bit_table, X : BEQ +
    LDA.l ctrl_bot_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_MEM_INPUT_DISPLAY_BOT, X
    INX : INX : CPX #$00C : BNE -

  .end
    RTS


hud_draw_xy_display:
    ; Assumes: I=16
    LDA #$0000
    CLC : ADC !ram_counters_real : ADC !ram_counters_lag : ADC !ram_counters_idle : ADC !ram_counters_segment
    TAX : JSR hud_set_counter_position

    LDA $22 : TAX
    LDA $20 : TAY
    JSL draw_coordinates_3
    RTS


hud_draw_subpixels:
    ; Assumes: I=16
    LDA #$0000
    CLC : ADC !ram_counters_real : ADC !ram_counters_lag : ADC !ram_counters_idle : ADC !ram_counters_segment : ADC !ram_xy_toggle
    TAX : JSR hud_set_counter_position

    LDA !ram_subpixels_show : CMP #$0002 : BEQ .speed

  .subpix
    LDA $2B : AND #$00FF : TAX
    LDA $2A : AND #$00FF : TAY
    JSL draw_coordinates_2
    RTS

  .speed
    LDA $27 : AND #$00FF : TAY
    LDA $28 : AND #$00FF : TAX
    JSL draw_coordinates_2
    RTS


hud_set_counter_position:
    LDA.w #!POS_COUNTERS : DEC : DEC

  .loop
    CPX #$0000 : BEQ .done
    CLC : ADC #$0040 : DEX : BRA .loop

  .done
    STA !lowram_draw_tmp
    RTS

; L, u, R, Y, X, SL
ctrl_top_bit_table:
    dw #$2000, #$0008, #$1000, #$0040, #$4000, #$0020
ctrl_top_gfx_table:
    dw #$2404, #$2406, #$2405, #$2403, #$2402, #$240A

; l, d, r, B, A, ST
ctrl_bot_bit_table:
    dw #$0002, #$0004, #$0001, #$0080, #$8000, #$0010
ctrl_bot_gfx_table:
    dw #$2409, #$2407, #$2408, #$2401, #$2400, #$240B
