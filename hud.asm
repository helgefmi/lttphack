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
    STZ !lowram_last_frame_hearts ; Makes sure to redraw hearts.
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
    %a8()
    LDA $7EF36D : CMP !lowram_last_frame_hearts : BEQ qw_indicator
    STA !lowram_last_frame_hearts

  draw_hearts:
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
    LDA $7EF36D : AND.w #$FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_HEARTS : JSL draw2_white

    ; Quarters
    LDA $7EF36D : AND.w #$7 : ORA #$3490 : STA $7EC704,x

    ; Container gfx
    LDA #$24A2 : STA !POS_MEM_CONTAINER_GFX

    ; Container
    LDA $7EF36C : AND #$00FF : LSR : LSR : LSR : JSL hex_to_dec : LDX.w #!POS_CONTAINERS : JSL draw2_white


  qw_indicator:
    %a16()
    ; Check if state changed at all, skip if not.
    LDA !ram_qw_indicator_toggle : CMP !ram_last_frame_qw_check_enabled : BEQ enemy_hp

    STA !ram_last_frame_qw_check_enabled : CMP.w #$01 : BEQ +

    LDA #$2C62 : STA $7EC74A
    LDA #$2C63 : STA $7EC74C
    LDA #$2C72 : STA $7EC78A
    LDA #$2C73 : STA $7EC78C

    JMP enemy_hp

  + LDA #$2062 : STA $7EC74A
    LDA #$2063 : STA $7EC74C
    LDA #$2072 : STA $7EC78A
    LDA #$2073 : STA $7EC78C

  enemy_hp:
    ; Draw over Enemy Heart stuff in case theres no enemies
    LDA #$207F : STA !POS_MEM_ENEMY_HEART_GFX
    LDX.w #!POS_ENEMY_HEARTS : STA $7EC700,x : STA $7EC702,x

    LDX #$FFFF
  .loop
    INX : CPX.w #$10 : BEQ input_display
    LDA $0DD0,x : AND.w #$FF : CMP.w #9 : BNE .loop
    LDA $0E60,x : AND.w #$40 : BNE .loop
    LDA $0E50,x : AND.w #$FF : BEQ .loop : CMP.w #$FF : BEQ .loop

    ; Enemy HP should be in A.
    JSL hex_to_dec : LDX.w #!POS_ENEMY_HEARTS : JSL draw2_white

    ; Enemy Heart GFX
    LDA #$2CA0 : STA !POS_MEM_ENEMY_HEART_GFX

  input_display:
    ; Shamelessly stolen from Total's SM hack.
    LDA !ram_ctrl1_word : CMP !ram_ctrl1_word_copy : BEQ xy_display

    STA !ram_ctrl1_word_copy

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

  xy_display:
    %a8()
    LDA !ram_xy_toggle : CMP !ram_last_frame_xy_toggle : BEQ .no_change
    LDA !ram_xy_toggle : STA !ram_last_frame_xy_toggle : BNE .show
    JMP .hide

  .no_change
    LDA !ram_xy_toggle : BNE .show
    JMP always_lit

  .hide
    %a16()
    LDA #$207F : LDX.w #!POS_XY
    STA $7EC700,x : STA $7EC702,x : STA $7EC704,x
    STA $7EC706,x : STA $7EC708,x : STA $7EC70A,x
    JMP always_lit

  .show
    %a16()
    LDA $22 : TAX
    LDA $20 : TAY
    LDA.w #!POS_XY : STA !lowram_draw_tmp
    JSL draw_coordinates

  always_lit:
    %a8()
    LDA !ram_lit_rooms_toggle : BEQ dhh_end
    LDA #$03 : STA $045A

  dhh_end:
    %a16()
    RTL
