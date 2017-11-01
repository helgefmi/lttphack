; VRAM buffer:
; $10C0 = first line -> $D100 in VRAM
; $1100 = second line
; $1780 = last line
; $40 bytes/32 tiles per line.


; Overrides Game Mode 0x0C.
org $00806D : db #$00
org $008089 : db #$80
org $0080A5 : db #$25


org $258000
CM_Main:
    PHB : PHK : PLB

    JSR CM_Local

    PLB
    RTL


CM_Local:
    ; For all these local $11 indexed subroutines:
    ; Enters: AI=8.
    ; Leave with: AI=8

    LDA $11

    JSL !UseImplicitRegIndexedLocalJumpTable

    dw CM_Init
    dw CM_DrawMenu
    dw CM_MenuDown
    dw CM_Active
    dw CM_MenuUp
    dw CM_Return


CM_Init:
    ; Start with new state when opening the menu.
    JSR cm_clear_stack
    STZ $B0

  ; Put the main menu onto the stack.
  %a16()
    LDA #$0000 : STA !lowram_cm_stack_index
    LDA #cm_mainmenu_indices : STA !ram_cm_menu_stack
  %a8()

  %ppu_off()
    JSR cm_transfer_tileset
  %ppu_on()

  JSR cm_init_item_variables

  %a16()
    ; Make sure we don't go infinite loop in the next submodule if normal item menu is down.
    LDA $EA : BEQ .end
    LDA.w #$0000 : STA $EA

  .end
  %a8()
    INC $11
    RTS


CM_DrawMenu:
    ; Save $1000-1680 so we can transfer it back aferwards
    JSR cm_cache_buffer

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
    LDA $B0 : BEQ .in_menu
    JSR cm_do_minigame

    RTS


  .in_menu
    JSR cm_get_pressed_button : CPX.b #$04 : BEQ .pressed_down
                                CPX.b #$08 : BEQ .pressed_up
                                CPX.b #$02 : BEQ .pressed_left
                                CPX.b #$01 : BEQ .pressed_right

    ; F4 = BYST | udlr
    TXA : AND $F4 : CMP.b #$10 : BEQ .pressed_start
                    CMP.b #$80 : BEQ .pressed_b

    ; F6 = AXLR | ....
    TYA : AND $F6 : CMP.b #$80 : BEQ .pressed_a

    ; Did not press anything
    BRA .done

  .pressed_start
    ; play sound effect for closing menu, and go to next mode
    LDA.b #$11 : STA $012F

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
    JSR cm_execute_back
  %ai8()
    BRA .redraw

  .redraw
    JSR cm_redraw

  .done
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

  %ai8()
    LDA !ram_preset_type : BEQ .no_preset

    ; clear up any text we that might've been displayed on the screen
    JSR cm_clear_buffer

    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    JSL preset_load_next_frame
    RTS

  .no_preset
    ; Restores $1000-1680 in case it was used for something.
    JSR cm_restore_buffer

    ; tell NMI to update tilemap
    LDA.b #$01 : STA $17
    LDA.b #$22 : STA $0116

    LDA !ram_cm_old_gamemode : STA $10
    LDA !ram_cm_old_submode : STA $11

    ; Make sure that the item menu doesn't scroll forever by us resettings EA in previous submodule.
    LDA $10 : CMP.b #$0E : BNE .end
    LDA $11 : CMP.b #$01 : BNE .end
    LDA $0200 : CMP.b #$03 : BCS .item_menu_is_scrolled
    BRA .end

  .item_menu_is_scrolled
  %a16()
    LDA #$FF18 : STA $EA

  .end
  %a8()
    RTS

incsrc minigames.asm

; -----------
; Utilities
; ----------

cm_init_item_variables:
    ; Bow
    LDA !ram_item_bow : BEQ .store_bow
    CMP #$03 : BCC .normal_bow

    LDA.b #$02
    BRA .store_bow

  .normal_bow
    LDA.b #$01

  .store_bow
    STA !ram_cm_item_bow

    ; Bottle
    LDA !ram_item_bottle : BEQ .store_bottle
    LDA.b #$01
  .store_bottle
    STA !ram_cm_item_bottle

    ; Mirror
    LDA !ram_item_mirror : LSR : STA !ram_cm_item_mirror

    ; Boots
    LDA !ram_equipment_boots_menu : STA !ram_cm_equipment_boots

    ; Flippers
    LDA !ram_equipment_flippers_menu : STA !ram_cm_equipment_flippers

    ; MaxHP
    LDA !ram_equipment_maxhp
    LSR : LSR : LSR
    DEC : DEC : DEC
    STA !ram_cm_equipment_maxhp

    ; EG
    LDA $7E047A : STA !ram_cm_armed_eg
    LDA $7E044A : AND #$01 : STA !ram_cm_eg_strength
    RTS

cm_get_pressed_button:
  %ai16()
    LDA !ram_ctrl1_word : CMP !ram_cm_last_frame_input : BEQ .same_as_last_frame

    STA !ram_cm_last_frame_input
  PHA
    LDA.w #15 : STA !ram_cm_input_timer
  PLA
    
    ; If we're pressing a new button (e.g. holding down v then pressing A), make sure
    ; to not do anything that frame (since dpad has priority over face buttons).
    LDA !ram_ctrl1_word : CMP !ram_ctrl1_filtered : BEQ .do_it
    LDA.w #$0000
    BRA .end

  .same_as_last_frame
    CMP #$0000 : BEQ .end

    LDA !ram_cm_input_timer : DEC : STA !ram_cm_input_timer : BNE .no_input

    LDA.w #4 : STA !ram_cm_input_timer

  .do_it
    LDA !ram_ctrl1_word
    BRA .end

  .no_input
    LDA #$0000

  .end
  TAX
  XBA
  TAY
  %ai8()
    RTS


cm_clear_stack:
    ; Assumes I=8
    ;
    ; Clears cursor index for all but the main menu.
  %a16()
    LDX.b #$02
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


cm_cache_buffer:
    ; Assumes I=8
  %ai16()

    LDX #$0000

  .loop
    LDA $1000, X : STA $7ED000, X
    LDA $1080, X : STA $7ED080, X
    LDA $1100, X : STA $7ED100, X
    LDA $1180, X : STA $7ED180, X
    LDA $1200, X : STA $7ED200, X
    LDA $1280, X : STA $7ED280, X
    LDA $1300, X : STA $7ED300, X
    LDA $1380, X : STA $7ED380, X
    LDA $1400, X : STA $7ED400, X
    LDA $1480, X : STA $7ED480, X
    LDA $1500, X : STA $7ED500, X
    LDA $1580, X : STA $7ED580, X
    LDA $1600, X : STA $7ED600, X
    LDA $1680, X : STA $7ED680, X
    LDA $1700, X : STA $7ED700, X
    LDA $1780, X : STA $7ED780, X
    INX : INX : CPX #$080 : BNE .loop

  %ai8()
    RTS


cm_restore_buffer:
    ; Assumes I=8
  %ai16()

    LDX #$0000

  .loop
    LDA $7ED000, X : STA $1000, X 
    LDA $7ED080, X : STA $1080, X 
    LDA $7ED100, X : STA $1100, X 
    LDA $7ED180, X : STA $1180, X 
    LDA $7ED200, X : STA $1200, X 
    LDA $7ED280, X : STA $1280, X 
    LDA $7ED300, X : STA $1300, X 
    LDA $7ED380, X : STA $1380, X 
    LDA $7ED400, X : STA $1400, X 
    LDA $7ED480, X : STA $1480, X 
    LDA $7ED500, X : STA $1500, X 
    LDA $7ED580, X : STA $1580, X 
    LDA $7ED600, X : STA $1600, X 
    LDA $7ED680, X : STA $1680, X 
    LDA $7ED700, X : STA $1700, X 
    LDA $7ED780, X : STA $1780, X 
    INX : INX : CPX #$080 : BNE .loop

  %ai8()
    RTS


cm_transfer_tileset:
    ; Assumes A=8
  %i16()

    ; word-access, incr by 1
    LDA #$80 : STA $2115

    LDX #$7000 : STX $2116 ; VRAM address (E000 in vram)
    LDX #cm_hud_table : STX $4302 ; Source offset 
    LDA #$25 : STA $4304 ; Source bank
    LDX #$07A0 : STX $4305 ; Size (0x10 = 1 tile)
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
    ; Enters: AI=8
    ; Leave with: AI=8
    ;
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
    LDA #$0000
    BRA .not_selected

  .selected
    LDA #$0010
    
  .not_selected
    STA $0E

    LDA ($00), Y : BEQ .done_with_items : STA $02

    PHY : PHX

    ; Pull out the action index, increment $02 so its ready for the associated
    ; draw function to use its data however it likes, and jump to it.
    LDA ($02) : TAX
    INC $02 : INC $02
    JSR (cm_draw_action_table, X)

    PLX : PLY
    INY : INY
    JMP .loop

  .done_with_items
    STZ $0E
    TYA : CLC : ADC $00 : INC : INC : STA $02
    LDX #$0186
    JSR cm_draw_text

  %ai8()
    RTS


cm_draw_text:
    ; Assumes I=16
  %a8()
    LDY #$0000
    ; grab palette info
    LDA ($02), Y : INY : CMP #$FF : BEQ .end
    ORA $0E : STA $0E

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
    ; Enters: A=16 I=8
    ; Leave with: AI=8
    ; Assumes: X = !lowram_cm_stack_index
    ;          A = the current cursor position (might be out of bounds)
    ;
    ; Checks if new cursor is out of bounds, and if so, sets it to the appropriate index.
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
    ; Enters AI=8
    ; Leave with AI=8
    ;
    ; The user selected a menu item.
  %ai16()
    LDX !lowram_cm_stack_index
    LDA !ram_cm_menu_stack, X : STA $00
    LDY !lowram_cm_cursor_stack, X
    LDA ($00), Y : STA $00

    ; Consume the action index and jump to the appropriate execute subroutine.
    LDA ($00) : INC $00 : INC $00 : TAX

    JSR (cm_execute_action_table, X)
  %ai8()
    RTS

; ---------------
; Execute Action
; ---------------

cm_execute_action_table:
    ; Subroutines for executing an action when the user selects a menu item.
    ;
    ; Enters: AI=8
    ; Can mess with whatever it wants.
    dw cm_execute_toggle
    dw cm_execute_jsr
    dw cm_execute_submenu
    dw cm_execute_back
    dw cm_execute_choice
    dw cm_execute_toggle_jsr
    dw cm_execute_choice_jsr
    dw cm_execute_numfield
    dw cm_execute_preset
    dw cm_execute_toggle_bit


cm_execute_toggle:
    ; Will only toggle the first bit.
    LDA ($00) : INC $00 : INC $00 : STA $02
    LDA ($00) : INC $00 : STA $04
  %ai8()
    LDA [$02] : EOR #$01 : STA [$02]
    RTS


cm_execute_toggle_jsr:
    LDA ($00) : INC $00 : INC $00 : STA $06
    JSR cm_execute_toggle

  %ai8()
    LDX.b #$00 : JSR ($0006, X)
    RTS


cm_execute_jsr:
    ; < and > should do nothing here
  %a8()
    LDA $F0 : CMP #$01 : BEQ .end
              CMP #$02 : BEQ .end

  %a16()
    LDA ($00) : INC $00 : INC $00 : STA $02
  %a8()

    LDX #$0000
    JSR ($0002, X)

  .end
    RTS


cm_execute_submenu:
    ; dpad should do nothing here
  %a8()
    LDA $F0 : BNE .end

    ; Increments stack index and puts the submenu into the stack.
  %a16()
    LDA !lowram_cm_stack_index : INC : INC : STA !lowram_cm_stack_index : TAX
    LDA ($00) : INC $00 : INC $00 : STA !ram_cm_menu_stack, X

  .end
    RTS


cm_execute_back:
    ; > should do nothing here
  %a8()
    LDA $F0 : CMP.b #$01 : BEQ .end

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


cm_execute_choice:
  %a16()
    LDA ($00) : INC $00 : INC $00 : STA $02
    LDA ($00) : INC $00 : STA $04
  %ai8()

    ; we either increment or decrement
    LDA $F0 : CMP #$02 : BEQ .pressed_left
    LDA [$02] : INC : BRA .bounds_check

  .pressed_left
    LDA [$02] : DEC

  .bounds_check
    TAX         ; X = new value
    LDY.b #$00  ; Y will be set to max

  .loop_choices
    LDA ($00) : %a16() : INC $00 : %a8() : CMP.b #$FF : BEQ .loop_done

  .loop_text
    LDA ($00) : %a16() : INC $00 : %a8()
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
  %ai8()
    STA [$02]
    RTS


cm_execute_choice_jsr:
    LDA ($00) : INC $00 : INC $00 : STA $08
    JSR cm_execute_choice
    LDX.b #$00
    JSR ($0008, X)
    RTS


cm_execute_numfield:
    ; Puts: memory address in $02[0x3]
    ;       min in $05[0x1]
    ;       max in $06[0x1]
    ;       increment value in $07[0x1]
  %a16()
    LDA ($00) : INC $00 : INC $00 : STA $02
    LDA ($00) : INC $00 : INC $00 : STA $04
    ; One additional INC on the max value here, for convenience later.
    LDA ($00) : INC $00 : INC $00 : INC : STA $06
  %ai8()

    LDA $F0 : CMP.b #$02 : BEQ .pressed_left

    LDA [$02] : CLC : ADC $07

    CMP $06 : BCS .set_to_min

    STA [$02] : BRA .end

  .pressed_left
    LDA [$02] : SEC : SBC $07

    CMP $05 : BMI .set_to_max : BCC .set_to_max

    STA [$02] : BRA .end

  .set_to_min
    LDA $05 : STA [$02] : CLC : BRA .end

  .set_to_max
    LDA $06 : DEC : STA [$02] : CLC

  .end
  %ai16()
    RTS


cm_execute_preset:
    LDA $F0 : BNE .end

  %a16()
    LDA ($00) : STA $02
    INC : STA !ram_preset_destination  : STA !ram_previous_preset_destination
  %a8()
  PHB
    LDA.b #$27 : PHA : PLB
    LDA ($02) : STA !ram_preset_type : STA !ram_previous_preset_type
  PLB
    INC $11
  .end
  %a16()
    RTS


cm_execute_toggle_bit:
    ; Load the address
    LDA ($00) : INC $00 : INC $00 : STA $02
    LDA ($00) : INC $00 : STA $04
    ; Load which bit(s) to toggle
    LDA ($00) : INC $00 : STA $05
  %ai8()
    LDA [$02] : EOR $05 : STA [$02]
    RTS


; -------------
; Draw Action
; -------------

cm_draw_action_table:
    ; Subroutines for drawing a menu item. I choose to do a subroutine dispatch for this,
    ; to make it possible for some widgets to draw itself differently (e.g. checkboxes, comboboxes etc).
    ;
    ; Enters: AI=16, Y=row number * 2
    ; Leave with: AI=16, $00[0x2]

    dw cm_draw_toggle
    dw cm_draw_jsr
    dw cm_draw_submenu
    dw cm_draw_back
    dw cm_draw_choice
    dw cm_draw_toggle_jsr
    dw cm_draw_choice_jsr
    dw cm_draw_numfield
    dw cm_draw_preset
    dw cm_draw_toggle_bit


macro item_index_to_vram_index()
    ; Assumes AI=16
    ; Messes with A, X
    ;
    ; Find screen position from Y (item number)
    TYA : ASL : ASL : ASL : ASL : ASL
    CLC : ADC #$0206 : TAX
endmacro


cm_draw_toggle:
    ; grab the memory address (long)
    LDA ($02) : INC $02 : INC $02 : STA $04
    LDA ($02) : INC $02 : STA $06

    ; Draw the text first (since it uses A)
    %item_index_to_vram_index()
  PHX
    JSR cm_draw_text
  PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$001C : TAX

  %a8()
    ; set palette
    LDA $0E : STA $1001, X : STA $1003, X : STA $1005, X

    ; grab the value at that memory address
    LDA [$04] : BNE .checked

    ; No
    LDA.b #$0D : STA $1000, X
    LDA.b #$38 : STA $1002, X

    BRA .end

  .checked
    ; Yes
    LDA.b #$18 : STA $1000, X
    LDA.b #$2E : STA $1002, X
    LDA.b #$3C : STA $1004, X

  .end
  %a16()
    RTS


cm_draw_toggle_jsr:
    ; just skip the JSR address
    INC $02 : INC $02
    JSR cm_draw_toggle
    RTS


cm_draw_jsr:
    ; skip jsr address
    INC $02 : INC $02

    ; draw text normally
    %item_index_to_vram_index()
    JSR cm_draw_text
    RTS


cm_draw_submenu:
    INC $02 : INC $02 ; skip submenu address

    ; draw text normally
    %item_index_to_vram_index()
    JSR cm_draw_text
    
    RTS


cm_draw_back:
    ; just draw the text
    %item_index_to_vram_index()
    JSR cm_draw_text
    RTS


cm_draw_choice:
    ; grab the memory address (long)
    LDA ($02) : INC $02 : INC $02 : STA $04
    LDA ($02) : INC $02 : STA $06

    ; Draw the text first (since it uses A)
    %item_index_to_vram_index()
  PHX
    JSR cm_draw_text
  PLX

    ; set position for ON/OFF
    TXA : CLC : ADC #$001C : TAX

    LDY #$0000
    LDA #$0000
  %a8()
    ; grab the value at that memory address
    LDA [$04] : TAY

    ; find the correct text that should be drawn (the selected choice)
    INY : INY ; uh, skipping the first text that we already draw..
  .loop_choices
    DEY : BEQ .found

  .loop_text
    LDA ($02) : %a16() : INC $02 : %a8()
    CMP.b #$FF : BEQ .loop_choices
    BRA .loop_text

  .found
    JSR cm_draw_text
  %a16()
    RTS


cm_draw_choice_jsr:
    ; just skip the JSR address
    INC $02 : INC $02
    JSR cm_draw_choice
    RTS


cm_draw_numfield:
    ; grab the memory address (long)
    LDA ($02) : INC $02 : INC $02 : STA $04
    LDA ($02) : INC $02 : STA $06

    ; skip bounds and increment value
    INC $02 : INC $02 : INC $02

    ; Draw the text
    %item_index_to_vram_index()
  PHX
    JSR cm_draw_text
  PLX

    ; set position for the number
    TXA : CLC : ADC #$001C : TAX

    LDA [$04] : AND #$00FF : JSL hex_to_dec

    ; Clear out the area (black tile)
    LDA #$24F5 : STA $1000, X
                 STA $1000+2, X
                 STA $1000+4, X

    ; Set palette
  %a8()
    LDA.b #$24 : ORA $0E : STA $0F
    LDA.b #$20 : STA $0E
  %a16()

    ; Draw numbers
    LDA !ram_hex2dec_first_digit : BEQ .second_digit
    CLC : ADC $0E : STA $1000, X
    INX : INX

  .second_digit
    LDA !ram_hex2dec_second_digit : BEQ .third_digit
    CLC : ADC $0E : STA $1000, X
    INX : INX

  .third_digit
    LDA !ram_hex2dec_third_digit : CLC : ADC $0E : STA $1000, X

    RTS


cm_draw_preset:
  %a16()
    INC $02 : INC $02
    %item_index_to_vram_index()
    JSR cm_draw_text
    RTS


cm_draw_toggle_bit:
    ; grab the memory address (long)
    LDA ($02) : INC $02 : INC $02 : STA $04
    LDA ($02) : INC $02 : STA $06
    ; grab bitmask
    LDA ($02) : INC $02 : STA $07

    ; Draw the text first (since it uses A)
    %item_index_to_vram_index()
  PHX
    JSR cm_draw_text
  PLX

    ; Set position for ON/OFF
    TXA : CLC : ADC #$001C : TAX

  %a8()
    ; set palette
    LDA $0E : STA $1001, X : STA $1003, X : STA $1005, X

    ; grab the value at that memory address
    LDA [$04] : AND $07 : BNE .checked

    ; No
    LDA.b #$0D : STA $1000, X
    LDA.b #$38 : STA $1002, X

    BRA .end

  .checked
    ; Yes
    LDA.b #$18 : STA $1000, X
    LDA.b #$2E : STA $1002, X
    LDA.b #$3C : STA $1004, X

  .end
  %a16()
    RTS

; ------
; Data
; ------

incsrc cm_mainmenu.asm

cm_hud_table:
    incbin ../resources/cm_gfx.bin
