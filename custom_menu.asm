; $10C0 = first line -> $D100 in VRAM
; $1140 = second line
; $1780 = last line
; $40 bytes/32 tiles per line.

; Overrides Game Mode 0x0C.
org $00806D
    db #$00
org $008089
    db #$80
org $0080A5
    db #$25

org $258000
CM_Main:
    PHB : PHK : PLB

    JSR CM_Local

    PLB
    RTL


CM_Local:
    ; We try to stay %ai8() throughout these local $11 indexed functions.
    ;
    ; This means that any subroutines called from these subroutines, should make sure to do %ai8()
    ; before RTS-ing.

    LDA $11

    JSL !UseImplicitRegIndexedLocalJumpTable

    dw CM_Init
    dw CM_DrawMenu
    dw CM_MenuDown
    dw CM_Active
    dw CM_DeInit
    dw CM_MenuUp
    dw CM_Return


CM_Init:
    ; Start with new state when opening the menu.
    JSR cm_clear_stack

  ; Put the main menu onto the stack.
  %a16()
    LDA #$0000 : STA !lowram_cm_stack_index
    LDA #cm_mainmenu_indices : STA !ram_cm_menu_stack
  %a8()

  %ppu_off()
    JSR cm_transfer_tilemap
  %ppu_on()

    INC $11
    RTS


CM_DrawMenu:
    JSR cm_redraw

    ; play sound effect for opening menu
    LDA.b #$11 : STA $012F

    INC $11
    RTS


CM_MenuDown:
    ; Scrolls the menu down first.
  %a16()
    LDA $EA : SEC : SBC.w #$0008 : STA $EA
    CMP.w #$FF18
  %a8()

    BNE .not_done_scrolling
    INC $11

  .not_done_scrolling
    RTS


CM_Active:
    ; $F4 = BYST | udlr
    ; $F6 = AXLR | ....

    LDA $F4 : CMP #$10 : BEQ .pressed_start
              CMP #$04 : BEQ .pressed_down
              CMP #$08 : BEQ .pressed_up
              CMP #$02 : BEQ .pressed_left
              CMP #$01 : BEQ .pressed_right
              CMP #$80 : BEQ .pressed_b
    LDA $F6 : CMP #$80 : BEQ .pressed_a

    ; Did not press anything
    BRA .done

  .pressed_start
    INC $11
    BRA .done

  .pressed_up
  %a16()
    LDX !lowram_cm_stack_index
    LDA !lowram_cm_cursor_stack, X : DEC : DEC : JSR cm_fix_cursor_wrap : STA !lowram_cm_cursor_stack, X
  %a8()
    BRA .redraw

  .pressed_down
  %a16()
    LDX !lowram_cm_stack_index
    LDA !lowram_cm_cursor_stack, X : INC : INC : JSR cm_fix_cursor_wrap : STA !lowram_cm_cursor_stack, X
  %a8()
    BRA .redraw

  .pressed_left
  .pressed_right
  .pressed_a
    JSR cm_execute_cursor
    BRA .redraw

  .pressed_b
  %ai16()
    JSR cm_action_back
  %ai8()
    BRA .redraw

  .redraw
    JSR cm_redraw
  .done
    RTS


CM_DeInit:
    ; play sound effect for closing menu, and go to next mode
    LDA.b #$11 : STA $012F

    JSR cm_clear_buffer

    INC $11
    RTS


CM_MenuUp:
  %a16()
    LDA $EA : CLC : ADC.w #$0008 : STA $EA
  %a8()

    BNE .not_done_scrolling
    INC $11

  .not_done_scrolling
    RTS

CM_Return:
  %ppu_off()
    JSL load_default_tileset
  %ppu_on()

    LDA !ram_cm_old_gamemode : STA $10
    LDA !ram_cm_old_submode : STA $11
    RTS

; -----------
; Utilities
; ----------

cm_clear_stack:
    ; Assumes I=8
  %a16()
    LDX.b #$00
    LDA #$0000

  .loop
    STA !lowram_cm_cursor_stack, X
    STA !ram_cm_menu_stack, X
    INX : INX
    CPX.b #$10 : BNE .loop

  %a8()
    RTS


cm_clear_buffer:
    ; Assumes I=8
  %a16()

    LDX.b #$00

    ; value of a transparent tile
    LDA #$207F

  .loop
    STA $1000, X : STA $1080, X
    STA $1100, X : STA $1180, X
    STA $1200, X : STA $1280, X
    STA $1300, X : STA $1380, X
    STA $1400, X : STA $1480, X
    STA $1500, X : STA $1580, X
    STA $1600, X : STA $1680, X
    STA $1700, X : STA $1780, X

    INX : INX
    CPX.b #$80 : BNE .loop

  %a8()
    RTS


cm_transfer_tilemap:
    ; Assumes A=8
  %i16()

    ; word-access, incr by 1
    LDA #$80 : STA $2115

    LDX #$7000 : STX $2116 ; VRAM address (E000 in vram)
    LDX #cm_hud_table : STX $4302 ; Source offset 
    LDA #$25 : STA $4304 ; Source bank
    LDX #$0740 : STX $4305 ; Size (0x10 = 1 tile)
    LDA #$01 : STA $4300 ; word, normal increment (DMA MODE)
    LDA #$18 : STA $4301 ; destination (VRAM write)
    LDA #$01 : STA $420B ; initiate DMA (channel 1)

  %i8()
    RTS

; ---------
; Draw
; ---------

cm_redraw:
    ; Assumes A=8 I=8 
    JSR cm_clear_buffer
    JSR cm_draw_background_gfx
    JSR cm_draw_active_menu

    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    RTS


cm_draw_background_gfx:
  %ai16()
    LDA #$30FB : STA $1102
    ORA #$8000 : STA $1742
    ORA #$4000 : STA $177C
    EOR #$8000 : STA $113C

    LDX #$0000
    LDY #$0017

  .drawVerticalEdges

    LDA.w #$30FC : STA $1142, X
    ORA.w #$4000 : STA $117C, X

    TXA : CLC : ADC #$0040 : TAX

    DEY : BPL .drawVerticalEdges

    LDX.w #$0000
    LDY.w #$001B

  .drawHorizontalEdges

    LDA.w #$30F9 : STA $1104, X
    ORA.w #$8000 : STA $1744, X

    INX #2

    DEY : BPL .drawHorizontalEdges

    LDX.w #$0000
    LDY.w #$001B
    LDA.w #$24F5

  .drawBoxInterior

    STA $1144, X : STA $1184, X : STA $11C4, X : STA $1204, X
    STA $1244, X : STA $1284, X : STA $12C4, X : STA $1304, X
    STA $1344, X : STA $1384, X : STA $13C4, X : STA $1404, X
    STA $1444, X : STA $1484, X : STA $14C4, X : STA $1504, X
    STA $1544, X : STA $1584, X : STA $15C4, X : STA $1604, X
    STA $1644, X : STA $1684, X : STA $16C4, X : STA $1704, X

    INX #2

    DEY : BPL .drawBoxInterior

  %ai8()
    RTS

cm_draw_active_menu:
    ; This functions sets:
    ; $00[0x2] = menu indices
    ; $02[0x2] = current menu item index
    ; Then we call the action draw method, which can consume its arguments and draw the text however it wants.
  %ai16()
    LDX !lowram_cm_stack_index
    LDA !ram_cm_menu_stack, X : STA $00
    LDY #$0000

  .loop
    ; Figure out if this menu item is on the same location as the cursor.
    TYA : CMP !lowram_cm_cursor_stack, X : BEQ .selected
    LDA #$0020
    BRA .not_selected

  .selected
    LDA #$0024
    
  .not_selected
    STA $0E

    LDA ($00), Y : BEQ .done_with_items : STA $02

    PHY : PHX

    ; Pull out the action index, increment $02 so its ready for the associated
    ; draw function to use its data however it likes, and jump to it.
    LDA ($02) : TAX
    INC $0002 : INC $0002
    JSR (cm_action_draw_table, X)

    PLX : PLY
    INY : INY
    JMP .loop

  .done_with_items
    TYA : CLC : ADC $00 : INC : INC : STA $02
    LDX #$0186
    LDA #$0030 : STA $0E
    JSR cm_draw_text

  %ai8()
    RTS


cm_draw_text:
    ; Assumes I=16
  %a8()
    LDY #$0000

  .loop
    LDA ($02), Y : CMP #$FF : BEQ .end
    STA $1000, X : INX
    LDA $0E : STA $1000, X : INX
    INY : JMP .loop

  .end
  %a16()
    RTS


; ---------
; Cursor
; ---------

cm_fix_cursor_wrap:
    ; Checks if new cursor is out of bounds, and if so, sets it to the appropriate index.
    ;
    ; Assumes X = !lowram_cm_stack_index
    ;         A = the current cursor position (might be out of bounds)
  %ai16()
    PHA
    LDA !ram_cm_menu_stack, X : STA $00
    LDY #$0000

  .loop
    LDA ($00), Y : BEQ .after_loop
    INY : INY
    JMP .loop

  .after_loop
    ; Top of stack = cursor index
    ; Y = max + 2
    STY $00
    PLA : BMI .set_to_max
    CMP $00 : BEQ .set_to_zero : BCS .set_to_zero

    BRA .end

  .set_to_zero
    LDA #$0000
    BRA .end

  .set_to_max
    LDA $00
    DEC : DEC

  .end
  %ai8()
    RTS


cm_execute_cursor:
    ; The user selected a menu item.
  %ai16()
    LDX !lowram_cm_stack_index
    LDA !ram_cm_menu_stack, X : STA $00
    LDY !lowram_cm_cursor_stack, X
    LDA ($00), Y : STA $00

    ; Consume the action index and jump to the appropriate execute subroutine.
    LDA ($00) : INC $0000 : INC $0000 : TAX

    JSR (cm_action_execute_table, X)
  %ai8()
    RTS

; --------------
; Actions
; --------------

cm_action_execute_table:
    ; Subroutines for executing an action when the user selects a menu item.
    ;
    ; We'll be in %ai16() when calling these.
    ; $01 will contain the menu item's data.
    ;
    ; They can safely manipulate X/Y/A/P and $00-$0F.
    dw cm_action_toggle_byte
    dw cm_action_jsr
    dw cm_action_submenu
    dw cm_action_back
    dw cm_action_choice

cm_action_toggle_byte:
    ; Will only toggle the first bit.
  %a16()
    LDA ($00) : INC $0000 : INC $0000 : STA $02
  %a8()
    LDA ($00) : INC $0000 : STA $04
    LDA [$02] : EOR #$01 : STA [$02]
    RTS

cm_action_jsr:
    ; < and > should do nothing here
  %a8()
    LDA $F4 : CMP.b #$01 : BEQ .end
            : CMP.b #$02 : BEQ .end

  %a16()
    LDA ($00) : INC $0000 : INC $0000 : STA $02
  %a8()

    LDX #$0000
    JSR ($0002, X)

  .end
    RTS

cm_action_submenu:
    ; < should do nothing here
  %a8()
    LDA $F4 : CMP.b #$02 : BEQ .end

    ; Increments stack index and puts the submenu into the stack.
  %a16()
    LDA !lowram_cm_stack_index : INC : INC : STA !lowram_cm_stack_index : TAX
    LDA ($00) : INC $0000 : INC $0000 : STA !ram_cm_menu_stack, X

  .end
    RTS

cm_action_back:
    ; > should do nothing here
  %a8()
    LDA $F4 : CMP.b #$01 : BEQ .end

    ; Decrements the stack index.
  %a16()
    ; make sure next time we go to a submenu, we start on the first line.
    LDX !lowram_cm_stack_index
    LDA #$0000 : STA !lowram_cm_cursor_stack, X

    ; make sure we dont set a negative number
    LDA !lowram_cm_stack_index : DEC : DEC : BPL .done
    LDA #$0000

  .done
    STA !lowram_cm_stack_index

  .end
    RTS

cm_action_choice:
  %a16()
    LDA ($00) : INC $0000 : INC $0000 : STA $02

  %ai8()
    LDA ($00) : INC $0000 : STA $04

    ; we either increment or decrement
    LDA $F4 : CMP #$02 : BEQ .pressed_left
    LDA [$02] : INC : BRA .bounds_check

  .pressed_left
    LDA [$02] : DEC

  .bounds_check
    TAX         ; X = new value
    LDY.b #$00  ; Y will be set to max

  .loop_choices
    LDA ($00) : CMP.b #$FF : BEQ .loop_done

  .loop_text
    LDA ($00) : INC $0000
    CMP.b #$FF : BNE .loop_text
    INY : BRA .loop_choices

  .loop_done
    ; X = new value (might be out of bounds)
    ; Y = maximum + 2
    ; We need to make sure X is between 0-maximum.

    ; for convenience so we cna use BCS. We do one more DEC in `.set_to_max`
    ; below, so we get the actual max.
    DEY

    TXA : BMI .set_to_max
    STY $06
    CMP $06 : BCS .set_to_zero

    BRA .end

  .set_to_zero
    LDA.b #$00 : BRA .end

  .set_to_max
    TYA : DEC

  .end
    STA [$02]
    RTS


cm_action_draw_table:
    ; Subroutines for drawing a menu item. I choose to do a subroutine dispatch for this,
    ; to make it possible for some widgets to draw itself differently (e.g. checkboxes, comboboxes etc).
    ;
    ; We'll be in %ai16() when calling these, and should leave it like that when RTS-ing too.
    ; $02 will contain the menu item's data, including the text.
    ; Y will be set to the row number (starting for 0 and going upwards 2 at a time).
    ;
    ; They can safely reuse X and Y. The only restriction is not touching $00[0x2].
    dw cm_action_draw_toggle_byte
    dw cm_action_draw_jsr
    dw cm_action_draw_submenu
    dw cm_action_draw_back
    dw cm_action_draw_choice

macro y2x_buffer_index()
    ; Assumes A=16, I=16
    ; Find screen position from Y (item number)
    TYA : ASL : ASL : ASL : ASL : ASL
    CLC : ADC #$0206 : TAX
endmacro

cm_action_draw_toggle_byte:
    ; grab the memory address (long)
    LDA ($02) : INC $0002 : INC $0002 : STA $04
    LDA ($02) : INC $0002 : STA $06

    ; Draw the text first (since it uses A)
    %y2x_buffer_index()
  PHX
    JSR cm_draw_text
  PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$001C : TAX

    ; grab the value at that memory address
    LDA [$04] : BNE .checked

    ; OFF
    LDA #$344B : STA $1000, X
    LDA #$344D : STA $1002, X : STA $1004, X

    BRA .end

  .checked
    ; ON
    LDA #$3C4B : STA $1000, X
    LDA #$3C4C : STA $1002, X

  .end
    RTS

cm_action_draw_jsr:
    ; skip jsr address
    INC $0002 : INC $0002

    ; draw text normally
    %y2x_buffer_index()
    JSR cm_draw_text
    RTS

cm_action_draw_submenu:
    INC $0002 : INC $0002 ; skip submenu address

    ; draw text normally
    %y2x_buffer_index()
    JSR cm_draw_text
    
    RTS

cm_action_draw_back:
    ; just draw the text
    %y2x_buffer_index()
    JSR cm_draw_text
    RTS


cm_action_draw_choice:
    ; grab the memory address (long)
    LDA ($02) : INC $0002 : INC $0002 : STA $04
    LDA ($02) : INC $0002 : STA $06

    ; Draw the text first (since it uses A)
    %y2x_buffer_index()
  PHX
    JSR cm_draw_text
  PLX

    ; set position for ON/OFF
    TXA : CLC : ADC #$001C : TAX

    ; grab the value at that memory address
    LDA [$04] : TAY

    ; find the correct text that should be drawn (the selected choice)
  %a8()
    INY : INY ; uh, skipping the first text that we already draw..
  .loop_choices
    DEY : BEQ .found

  .loop_text
    LDA ($02) : INC $0002
    CMP.b #$FF : BEQ .loop_choices
    BRA .loop_text

  .found
    LDA.b #$34 : STA $0E
    JSR cm_draw_text
    RTS

; --------------
; MAIN MENU
; --------------

table header.tbl

cm_mainmenu_indices:
    dw #cm_menuitem_jsr
    dw #cm_menuitem_sword
    dw #cm_menuitem_submenu
    dw #cm_menuitem_toggle_xy
    dw #cm_menuitem_toggle_qw
    dw #cm_menuitem_toggle_lit_rooms
    dw #cm_menuitem_toggle_oob
    dw #$0000
    db "MAIN MENU", $FF

cm_submenu_indices:
    dw #cm_menuitem_back
    dw #cm_menuitem_submenu
    dw #cm_menuitem_toggle_lit_rooms
    dw #cm_menuitem_toggle_oob
    dw #$0000
    db "CHOOSE YOUR DESTINY", $FF

table normal.tbl

cm_menuitem_sword:
    dw !CM_ACTION_CHOICE
    dl !ram_debug
    db "Sword", #$FF
    db "Fighter", #$FF
    db "Master", #$FF
    db "Tempered", #$FF
    db "Gold", #$FF
    db #$FF

cm_menuitem_back:
    dw !CM_ACTION_BACK
    db "Back", #$FF

cm_menuitem_jsr:
    dw !CM_ACTION_JSR
    dw #tezt
    db "Do something", #$FF

cm_menuitem_submenu:
    dw !CM_ACTION_SUBMENU
    dw #cm_submenu_indices
    db "Submenu", #$FF

cm_menuitem_toggle_xy:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_xy_toggle
    db "Coordinates", #$FF

cm_menuitem_toggle_qw:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_qw_indicator_toggle
    db "QW indicator", #$FF

cm_menuitem_toggle_oob:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !lowram_oob_toggle
    db "OoB mode", #$FF

cm_menuitem_toggle_lit_rooms:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_lit_rooms_toggle
    db "Lit rooms", #$FF


tezt:
    LDA.b #$01 : STA !ram_xy_toggle
  %a8()
    RTS

cm_hud_table:
    incbin cm_gfx.bin;
