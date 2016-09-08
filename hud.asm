; == FLOOR INDICATOR SKIP ==

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


; == HUD TEMPLATE ==

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
    JSL draw_counters
    SEP #$30
    INC $16
    RTL


; == UPDATE HEARTS TEMPLATE ==

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
    ; enters with AI=16
  %a8()
    LDA $7EF36D : CMP !lowram_last_frame_hearts : BEQ .dont_update_hearts

    STA !lowram_last_frame_hearts
    JSR hud_draw_hearts

  .dont_update_hearts

    LDA !ram_qw_toggle : BEQ .dont_update_qw
    STA !ram_debug
    LDA $E2 : CMP !ram_qw_last_scroll : BEQ .dont_update_qw

    STA !ram_qw_last_scroll
    JSR hud_draw_qw

  .dont_update_qw

    JSR hud_draw_enemy_hp

  %a16()
    LDA !ram_ctrl1_word : CMP !ram_ctrl1_word_copy : BEQ .dont_update_input_display
    JSR hud_draw_input_display

  .dont_update_input_display

  %a8()
    LDA !ram_xy_toggle : CMP !ram_last_frame_xy_toggle : BEQ .dont_update_xy
    STA !ram_last_frame_xy_toggle
    JSR hud_draw_xy_display

  .dont_update_xy

    LDA !ram_lit_rooms_toggle : BEQ .end
    LDA.b #$03 : STA $045A

  .end
  %ai16()
    RTL


hud_draw_hearts:
    ; assumes A=8, X=16
    ; check if we have full hp
    LDA $7EF36C : CMP $7EF36D : BNE .not_full_hp

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
    LDA $7EF36D : AND #$00FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_HEARTS : JSL draw2_white

    ; Quarters
    LDA $7EF36D : AND #$0007 : ORA #$3490 : STA $7EC704,x

    ; Container gfx
    LDA #$24A2 : STA !POS_MEM_CONTAINER_GFX

    ; Container
    LDA $7EF36C : AND #$00FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_CONTAINERS : JSL draw2_white

  %a8()
    RTS

hud_draw_qw:
    ; assumes A=8
    LDA $E2 : AND.b #$06 : CMP.b #$06 : BEQ .is_qw

  %a16()
    LDA #$0400 : ORA $7EC74A : STA $7EC74A
    LDA #$0400 : ORA $7EC74C : STA $7EC74C
    LDA #$0400 : ORA $7EC78A : STA $7EC78A
    LDA #$0400 : ORA $7EC78C : STA $7EC78C
    BRA .end

  .is_qw
    %a16()
    LDA #$F0FF : AND $7EC74A : STA $7EC74A
    LDA #$F0FF : AND $7EC74C : STA $7EC74C
    LDA #$F0FF : AND $7EC78A : STA $7EC78A
    LDA #$F0FF : AND $7EC78C : STA $7EC78C

  .end
  %a8()
    RTS


hud_draw_enemy_hp:
    ; assumes I=16
  %a16()
    ; Draw over Enemy Heart stuff in case theres no enemies
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x

    LDA !ram_enemy_hp_toggle : BEQ .end

    LDX #$FFFF
  .loop
    INX : CPX #$0010 : BEQ .end
    LDA $0DD0,x : AND #$00FF : CMP #$0009 : BNE .loop
    LDA $0E60,x : AND #$0040 : BNE .loop
    LDA $0E50,x : AND #$00FF : BEQ .loop : CMP #$00FF : BEQ .loop

    ; Enemy HP should be in A.
    JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw2_white

    ; Enemy Heart GFX
    LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

  .end
  %a8()
    RTS

hud_draw_input_display:
    ; assumes AI=16
    LDA !ram_input_display_toggle : BEQ .input_display_disabled

    LDA !ram_ctrl1_word : STA !ram_ctrl1_word_copy
    BRA .start

  .input_display_disabled

    LDA #$0000

  .start
    TAY
    LDX #$0000

-   TYA : AND ctrl_top_bit_table, X : BEQ +
    LDA ctrl_top_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_MEM_INPUT_DISPLAY_TOP, X
    INX : INX : CPX #$00C : BNE -

    LDX #$0000

-   TYA : AND ctrl_bot_bit_table, X : BEQ +
    LDA ctrl_bot_gfx_table, X
    JMP ++
+   LDA #$207F
++  STA !POS_MEM_INPUT_DISPLAY_BOT, X
    INX : INX : CPX #$00C : BNE -

  .end
    RTS


hud_draw_xy_display:
    LDA !ram_xy_toggle : BNE .show

  .hide
    %a16()
    LDA #$207F : LDX.w #!POS_XY
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x : STA $7EC70A,x
    BRA .end

  .show
    %a16()
    LDA $22 : TAX
    LDA $20 : TAY
    LDA.w #!POS_XY : STA !lowram_draw_tmp
    JSL draw_coordinates

  .end
  %a8()
    RTS
