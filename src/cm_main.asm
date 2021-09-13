!SELECTED = $3480
!UNSELECTED = $3800
!SHORTCUTTING = $3C80
!HEADER = $3100

;===================================================================================================

cm_mainmenu:
%menu_header("LTTPHACK !VERSION", 13)
	%submenu_variable("Presets", PRESET_SUBMENU)
	%submenu("Y Items", ITEMS_SUBMENU)
	%submenu("Equipment", EQUIPMENT_SUBMENU)
	%submenu("Game state", GAMESTATE_SUBMENU)
	%submenu("Link state", LINKSTATE_SUBMENU)
	%submenu("Gameplay", GAMEPLAY_SUBMENU)
	%submenu("RNG control", RNG_SUBMENU)
	%submenu("HUD extras", HUDEXTRAS_SUBMENU)
	%submenu("Lite states (BETA)", LITESTATES_SUBMENU)
	%submenu("Room master", ROOMLOAD_SUBMENU)
	%submenu("Shortcuts", SHORTCUTS_SUBMENU)
	%submenu("Preset config", PRESET_CONFIG_SUBMENU)
	%submenu("Configuration", CONFIG_SUBMENU)

;===================================================================================================

CM_Main:
	PHB : PHK : PLB

	LDA.b #$14 : STA.w $2142

	PHD
	PEA.w $3000
	PLD

	JSL SNES_ENABLE_CUSTOM_NMI

	JSR CM_PrepPPU
	JSL CM_CacheWRAM

	REP #$20

	STZ.b SA1IRAM.SHORTCUT_USED
	STZ.b SA1IRAM.CONTROLLER_1
	STZ.b SA1IRAM.CONTROLLER_1_FILTERED

	LDA.w #15
	STA.w SA1RAM.cm_input_timer

	LDA.b SA1IRAM.cm_submodule
	CMP.w #2
	BEQ .fine

	; assume something went wrong if it's not 2
	STZ.b SA1IRAM.cm_submodule

	BRA .loop

.fine
	SEP #$20

	LDA.w !config_cm_save_place
	BEQ .loop

	JSR EmptyEntireMenu
	JSR CM_ResetStackAndMenu
	JSR DrawCurrentMenu
	JSL NMI_RequestFullMenuUpdate

.loop
	SEP #$30

	LDA.b #$81
	STA.w $4200

	STZ.w $0012

--	LDA.w $0012
	BEQ --

	LDX.b SA1IRAM.cm_submodule

	JSR (.submodules,X)
	BRA .loop

.submodules
	dw CM_Init
	dw CM_DrawMenu
	dw CM_Active
	dw CM_Return
	dw CM_ShortcutConfig
	dw CM_SetLiteState
	dw CM_DeleteLiteState

;===================================================================================================

CM_DrawMenu:
	LDX.b #$04
	STX.b SA1IRAM.cm_submodule

	JSR DrawCurrentMenu
	JSL NMI_RequestFullMenuUpdate

	RTS

;===================================================================================================

CM_Return:
	REP #$20
	PLA ; remove the return of the JSR
	PLD
	PLB

	JSL SetHUDItemGraphics
	JSL CM_Exiting

	LDA.b #$81 : STA.w $4200

	RTL

;===================================================================================================

CM_Exiting:
	REP #$20

	LDA.w #$0002
	STA.w SA1IRAM.cm_submodule

	SEP #$20

	STZ.w $4200

	LDA.b #$80
	STA.w $2100

	JSL LoadCustomHUDGFX
	JSL reinit_sentry_addresses

	SEP #$30
	LDA.b #$15 : STA.w $2142

	STZ.b $12
	INC.b $15 ; trigger a CGRAM update

	JSL SNES_DISABLE_CUSTOM_NMI

	RTL

;===================================================================================================

CM_ShortcutConfig:
	REP #$30
	LDY.w #$0001
	JSR CMDO_SAVE_ADDRESS_00

	REP #$20
	LDA.b SA1IRAM.CONTROLLER_1
	CMP.b [SA1IRAM.cm_writer]
	BNE .notheld

	INC.b SA1IRAM.preset_scratch
	LDA.b SA1IRAM.preset_scratch
	CMP.w #$0061
	BCC CM_UpdateHeldOption

	JSL CM_MenuSFX_shortcut_done

#CM_AbortHeldOption:
	LDA.w #$0004
	STA.b SA1IRAM.cm_submodule
	BRA CM_UpdateHeldOption

.notheld
	STA.b [SA1IRAM.cm_writer]
	STZ.b SA1IRAM.preset_scratch

;===================================================================================================

CM_UpdateHeldOption:
	SEP #$30
	LDY.b SA1IRAM.cm_cursor
	JSR DrawCurrentRow_ShiftY
	JSL NMI_RequestCurrentRowUpdateUnless

	RTS

;===================================================================================================

CM_SetLiteState:
	REP #$20

	LDA.b SA1IRAM.CONTROLLER_1
	CMP.w #$4000
	BNE CM_AbortHeldOption

	LDA.b SA1IRAM.preset_scratch
	CMP.w #60
	BCS .save_litestate

	INC
	STA.b SA1IRAM.preset_scratch
	BRA CM_UpdateHeldOption

.save_litestate
	LDA.b SA1IRAM.litestate_act
	JSL SaveLiteState
	JSL CM_MenuSFX_shortcut_done

	BRA CM_AbortHeldOption

;===================================================================================================

CM_DeleteLiteState:
	REP #$20

	LDA.b SA1IRAM.CONTROLLER_1
	CMP.w #$0040
	BNE CM_AbortHeldOption

	LDA.b SA1IRAM.preset_scratch
	CMP.w #60
	BCS .delete_litestate

	INC
	STA.b SA1IRAM.preset_scratch
	BRA CM_UpdateHeldOption

.delete_litestate
	LDA.b SA1IRAM.litestate_act
	JSL DeleteLiteState
	JSL CM_MenuSFX_empty

	BRA CM_AbortHeldOption

;===================================================================================================

CM_PrepPPU:
	SEP #$30

	LDA.b #$80 : STA.w $2100
	STZ.w $4200

	; transfer menu tileset
	REP #$10

	LDA.b #$80 : STA.w $2115

	LDX.w #$7000 : STX.w $2116
	LDX.w #cm_gfx>>0 : STX.w $4352
	LDA.b #cm_gfx>>16 : STA.w $4354
	LDX.w #$1800 : STX.w $4355
	LDX.w #$1801 : STX.w $4350
	LDA.b #$20 : STA.w $420B

	RTS

;===================================================================================================

; save temp variables that the menu uses
CM_CacheWRAM:
	SEP #$30

	; Bow
	LDA.l $7EF340 : BEQ ++
	CMP.b #$03
	LDA.b #$01
	ADC.b #$00
++	STA.w SA1RAM.cm_item_bow

	; MaxHP
	LDA.l $7EF36C
	LSR #3
	STA.w SA1RAM.cm_equipment_maxhp

	RTL

;===================================================================================================

CM_Init:
	JSR EmptyEntireMenu
	JSR CM_ResetStackAndMenu

	SEP #$20

	LDA.b #$02 : STA.b SA1IRAM.cm_submodule
	STZ.w SA1RAM.cm_input_timer

	RTS

;===================================================================================================
; Menu sounds; here for standardization, even though they're simple routines
;===================================================================================================
CM_MenuSFX:
.beep
	PEA.w $0C00
	BRA .continue

.boop
	PEA.w $002D
	BRA .continue

.bink
	PEA.w $2000
	BRA .continue

.fill
	PEA.w $0A00
	BRA .continue

.empty
	PEA.w $0700
	BRA .continue

.poof
	PEA.w $0014
	BRA .continue

.oof
	PEA.w $0026
	BRA .continue

.shortcut_done
	PEA.w $2F00
	BRA .continue

.setshortcut
.switch
	PEA.w $2500
	BRA .continue

.submenu
	PEA.w $2400
	BRA .continue

.submenuback
	PEA.w $1300
	BRA .continue

.error
	PEA.w $003C
	BRA .continue

.continue
	PHP
	REP #$20
	PHA ; save our A

	LDA.w $012E
	BNE .sfx_busy

	LDA 4,S ; get our PEA
	STA.w $012E

.sfx_busy
	LDA 2,S ; move the P to top of stack
	STA 4,S

	PLA ; recover A
	STA 1,S ; recover it again
	PLA

	PLP
	RTL

;===================================================================================================

CM_BackToTipTop:
	JSR EmptyCurrentMenu
	JSR CM_ResetStackAndMenu
	JSR DrawCurrentMenu
	JSL NMI_RequestFullMenuUpdate
	RTS

;===================================================================================================

CM_ExitTime:
	LDA.b #$06
	STA.b SA1IRAM.cm_submodule
	RTS

;===================================================================================================

CM_Active:
	SEP #$30
	LDY.b SA1IRAM.cm_cursor

	JSR CM_getcontroller
	BNE .actionable_action
	BCS CM_GoBack

	BIT.b SA1IRAM.cm_updown
	BMI .pressed_up
	BVS .pressed_down

	; start / select is lowest priority
	LDA.b SA1IRAM.CopyOf_F4
	BIT.b #$10
	BNE CM_ExitTime
	BIT.b #$20
	BNE CM_BackToTipTop
	RTS

.pressed_up
	DEC.b SA1IRAM.cm_cursor
	BRA CM_AdjustForWrap

.pressed_down
	INC.b SA1IRAM.cm_cursor
	BRA CM_AdjustForWrap

.actionable_action
	LDY.b #1 ; for when the routine uses it
	LDA.b [SA1IRAM.cm_current_selection]
	ASL
	TAX

	JSR (ActionDoRoutines,X)

	SEP #$30
	LDY.b SA1IRAM.cm_cursor
	JSR DrawCurrentRow_ShiftY
	JSL NMI_RequestCurrentRowUpdateUnless
	RTS

;===================================================================================================

CM_AdjustForWrap:
	PHY

	LDA.b SA1IRAM.cm_cursor
	BMI .find_max

	INC
	ASL
	TAY

	; just check if we hit the end of the headers
	REP #$20
	LDA.b [SA1IRAM.cm_current_menu],Y
	SEP #$20
	BNE .not_max
	BRA .reset_too_far ; oops!

#CM_DontGoBack:
	STZ.b SA1IRAM.cm_cursor
	CPY.b #$00 ; are we at the top of the menu
	BNE .moved_cursor
	RTS ; just leave if we're already at the top too

#CM_GoBack:
	JSR EmptyCurrentMenu
	JSR CM_PullMenuFromStack
	JSR DrawCurrentMenu
	JSL CM_MenuSFX_submenuback
	JSL NMI_RequestFullMenuUpdate
	RTS

.find_max
	LDY.b #0 ; increment first, to skip header and condense loop

	REP #$20

.next_check
	INY
	INY
	LDA.b [SA1IRAM.cm_current_menu],Y
	BNE .next_check

	SEP #$20
	TYA
	LSR
	DEC
	DEC

.reset_too_far
	STA.b SA1IRAM.cm_cursor

.not_max
	PLY

.moved_cursor
	JSL CM_MenuSFX_boop

;===================================================================================================

CM_ReDrawCursorPosition:
	PHY
	JSR DrawCurrentRow_ShiftY

	SEP #$10
	LDY.b SA1IRAM.cm_cursor
	PHY

	JSR DrawCurrentRow_ShiftY
	JSR CM_UpdateCurrentSelection

	PLY
	PLX
	JSL NMI_Request2RowsUpdate

	RTS

;===================================================================================================
; Puts presses into the 6th and 7th bits for easy testing
; Carry = B
; Zero  = No actions
;===================================================================================================
CM_getcontroller:
	REP #$20
	STZ.b SA1IRAM.cm_leftright
	STZ.b SA1IRAM.cm_ax
	STZ.b SA1IRAM.cm_y

	LDA.b SA1IRAM.CONTROLLER_1

	CMP.w SA1RAM.cm_last_input
	STA.w SA1RAM.cm_last_input

	BEQ .same_as_last_frame

	LDX.b #15
	STX.w SA1RAM.cm_input_timer

	CMP.b SA1IRAM.CONTROLLER_1_FILTERED
	SEP #$20
	BNE .no_presses

.handle_all_new
	JSR .repeatables ; get udlrLR

	; get A and X, but only new presses
	LDA.b SA1IRAM.CopyOf_F6
	STA.b SA1IRAM.cm_ax

	; get new B presses in carry
	; this also puts Y presses in bit 7
	LDA.b SA1IRAM.CopyOf_F4
	ASL
	AND.b #$80 ; get rid of other bits
	STA.b SA1IRAM.cm_y

	; now combine see if anything actionable was pressed
	ORA.b SA1IRAM.cm_leftright
	ORA.b SA1IRAM.cm_ax
	ORA.b SA1IRAM.cm_shoulder
	AND.b #$C0

	RTS


.same_as_last_frame
	CMP.w #$0001
	SEP #$22 ; set zero flag
	BCS .holding_buttons
	RTS

.holding_buttons
	LDA.w SA1RAM.cm_input_timer
	BEQ .continue

	DEC
	STA.w SA1RAM.cm_input_timer

.no_presses
	LDA.b #$00 ; get 0
	CLC
	RTS

.continue
	LDA.b #4
	STA.w SA1RAM.cm_input_timer

.repeatables
	; get left and right
	LDA.b SA1IRAM.CopyOf_F0
	LSR
	ROR.b SA1IRAM.cm_leftright
	LSR
	ROR.b SA1IRAM.cm_leftright

	; get up and down
	LSR
	ROR.b SA1IRAM.cm_updown
	LSR
	ROR.b SA1IRAM.cm_updown

	; get l and r
	LDA.b SA1IRAM.CopyOf_F2
	ASL
	ASL
	STA.b SA1IRAM.cm_shoulder

	; get actionable presses

	LDA.b SA1IRAM.cm_leftright
	ORA.b SA1IRAM.cm_shoulder
	AND.b #$C0
	CLC ; no B press
	RTS

;===================================================================================================
; X points to first empty slot
;===================================================================================================
CM_ResetStackAndMenu:
	REP #$20

	STZ.w SA1RAM.CM_SubMenuIndex

	LDA.w #cm_mainmenu<<8
	STA.b SA1IRAM.cm_cursor+0

	LDA.w #cm_mainmenu>>8
	STA.b SA1IRAM.cm_cursor+2

CM_UpdateCurrentSelection:
	REP #$20
	SEP #$10

	LDA.b SA1IRAM.cm_cursor
	INC
	ASL
	TAY

	LDA.b [SA1IRAM.cm_current_menu],Y
	STA.b SA1IRAM.cm_current_selection+0

	LDY.b SA1IRAM.cm_current_menu+2
	STY.b SA1IRAM.cm_current_selection+2

	RTS

;===================================================================================================

CM_PushMenuToStack:
	PHX
	PHY
	PHP

	REP #$20
	SEP #$10

	LDX.w SA1RAM.CM_SubMenuIndex

	LDA.b SA1IRAM.cm_cursor+0
	STA.w SA1RAM.CM_SubMenuStack,X

	INX
	INX
	LDA.b SA1IRAM.cm_cursor+2
	STA.w SA1RAM.CM_SubMenuStack,X

	INX
	INX
	STX.w SA1RAM.CM_SubMenuIndex

	JSR CM_UpdateCurrentSelection

	PLP
	PLY
	PLX
	RTS

;===================================================================================================

; carry = successful pull
CM_PullMenuFromStack:
	PHX
	PHY

	SEC ; set carry now, so we can just jump on success
	PHP
	SEP #$10

	LDX.w SA1RAM.CM_SubMenuIndex
	CPX.b #$04
	BCC .cannot

	DEX
	DEX
	DEX
	DEX

	REP #$20
	LDA.w SA1RAM.CM_SubMenuStack+0,X
	STA.b SA1IRAM.cm_cursor+0

	LDA.w SA1RAM.CM_SubMenuStack+2,X
	STA.b SA1IRAM.cm_cursor+2

	STX.w SA1RAM.CM_SubMenuIndex
	JSR CM_UpdateCurrentSelection

	PLP
	PLY
	PLX
	RTS

.cannot
	PLP
	PLY
	PLX

	CLC
	JMP CM_ResetStackAndMenu
