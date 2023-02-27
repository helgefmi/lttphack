pushpc

; Underworld
org $02B917 : JSL UpdateOnUWTransition
org $01C411 : JSL UpdateOnUWStairs
org $01C5CF : JSL UpdateOnSwitchPress
org $02A0B1 : JSL UpdateOnUWMirror
org $0794EB : JSL UpdateOnUWPitTransition
org $01C4B8 : JSL UpdateOnKillRoom
org $06B949 : JSL UpdateOnPegSwitch
org $07D127 : JSL UpdateOnWarpTile
org $07BC9A : JSL UpdateOnIntraroomStairs
org $01D2C0 : JSL UpdateOnBombableWallUW
org $01D2DE : JSL UpdateOnBombableFloor
org $01CA56 : JSL UpdateOnMovingWallStart : NOP
org $01C927 : JSL UpdateOnMovingWallEndPodMire
org $01C9DB : JSL UpdateOnMovingWallEndDesert
org $01C78C : JSL UpdateOnGanonKill
org $01F6A7 : JSL UpdateOnTriforceDoor

; This causes some double triggers, but always on the same frame
; so it should be fine
org $01C3A7 : JSL UpdateOnInterRoomStairs

org $09969E : STZ.w $0380 ; just changes order of operations for the STZ
JSL UpdateOnExplodingWall ; so that this can replace STZ dp LDA dp

; Overworld
org $02A9BA : JSL UpdateOnOWTransition
org $1BBD73 : JSL UpdateOnOWUWTransition
org $05AFC6 : JSL UpdateOnOWMirror
org $07A995 : JSL UpdateOnOWMirror2
org $0794DB : JSL UpdateOnOWPitTransition
org $04E8CF : JSL UpdateOnOWToSpecial
org $04E966 : JSL UpdateOnSpecialToOW
org $1EEED8 : JSL UpdateOnWhirlPool
org $1EEE83 : JSL UpdateOnOWMirror
org $1BC209 : JSL UpdateOnBombableWallOW
org $08E06A : JSL UpdateOnFlute

; Messaging
org $028818 : JSL UpdateOnItemMenu
org $0DDFD3 : JSL UpdateOnItemMenuClose
org $0EF27C : JSL UpdateOnExitingText
org $1CFD7E : JML UpdateOnEnteringMessaging
org $05FC83 : JSL UpdateOnKey ; bonk key
org $06D192 : JSL UpdateOnKey ; normal key
org $078FFB : JSL UpdateOnBonk
org $07999D : PHB : JSL UpdateOnReceiveItem


; Wait for key
org $0EFB90
	LDA.b $F4 ; vanilla pointlessly used absolute; dp is better
	JSL idle_waitkey ; now we have an easy 4 bytes here for the JSL

; EndMessage
org $0EFBBB : JSL idle_endmessage

; MenuActive
org $0DDF1E : JSL idle_menu

; BottleMenu
org $0DE0E2 : JSL idle_menu

; Choosing
org $0EF881 : JSL idle_choose : ORA.b #$00
org $0EF8F9 : JSL idle_choose : ORA.b #$00
org $0EF718 : JSL idle_chooseb : NOP

; Waiting
org $0EFA61 : JSL idle_holdA

org $0EF77E : JSL idle_item_toss : AND.b #$C0

pullpc

!UPDATE_TIMER = $02
!RESET_TIMER = $41

; Underworld updates
UpdateOnUWTransition:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b $67 : AND.b #$03
	RTL

UpdateOnUWStairs:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	JML $07F243

UpdateOnSwitchPress:
	STA.b $11
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDX.b $0C
	RTL

UpdateOnUWMirror:
	STA.b $11 : STZ.b $B0
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	RTL

UpdateOnUWPitTransition:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.l $01C31F,X
	RTL

UpdateOnKillRoom:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$05 : STA.b $11
	RTL

UpdateOnBombableWallOW:
UpdateOnExitingText:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$01 : STA.b $14
	RTL

UpdateOnPegSwitch:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$16 : STA.b $11
	RTL

UpdateOnWarpTile:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$15 : STA.b $11
	RTL

UpdateOnIntraroomStairs:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$07 : STA.b $10
	RTL

UpdateOnInterRoomStairs:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	JML $02B861

UpdateOnBombableWallUW:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$09 : STA.b $11
	RTL

UpdateOnBombableFloor:
	SEP #$30
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$1B
	RTL

UpdateOnExplodingWall:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	STZ.b $50
	LDA.b $EE
	RTL

UpdateOnGanonKill:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	STZ.b $B0
	STZ.b $AE
	RTL

UpdateOnTriforceDoor:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	STZ.b $11
	STZ.b $B0
	RTL

UpdateOnMovingWallStart:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$01 : STA.w $02E4
	RTL

; mire/pod slow: 17"04 | fast: 00"17
UpdateOnMovingWallEndPodMire:
	LDA.w !config_fast_moving_walls : BEQ .slowwalls
	LDA.w #$1647 : STA.w SA1IRAM.TIMER_ADD_SSFF

.slowwalls
	LDY.b #$02 : STY.w SA1IRAM.TIMER_FLAG
	LDY.b #$00 : STY.b $AE,X
	RTL

; desert slow: 09"18 | fast: 00"10
UpdateOnMovingWallEndDesert:
	LDA.w !config_fast_moving_walls : BEQ .slowwalls

	LDA.w #$0908 : STA.w SA1IRAM.TIMER_ADD_SSFF

.slowwalls
	LDY.b #$02 : STY.w SA1IRAM.TIMER_FLAG
	LDY.b #$00 : STY.b $AE,X
	RTL

; Overworld updates
UpdateOnOWUWTransition:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	STZ.b $11 : STZ.b $B0
	RTL

UpdateOnOWTransition:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	INC.b $11 : LDA.b $00
	RTL

UpdateOnOWMirror:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$23 : STA.b $11
	RTL

UpdateOnOWMirror2:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$14 : STA.b $5D
	RTL

UpdateOnOWPitTransition:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	JML $1BB860 ; Overworld_Hole

UpdateOnOWToSpecial:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$17 : STA.b $11
	RTL

UpdateOnSpecialToOW:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$24 : STA.b $11
	RTL

UpdateOnWhirlPool:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$2E : STA.b $11
	RTL

UpdateOnFlute:
	LDA.b #!RESET_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$0A : STA.b $11
	RTL

; Messaging updates
UpdateOnEnteringMessaging:
UpdateOnItemMenu:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b #$0E : STA.b $10
	RTL

UpdateOnItemMenuClose:
	STA.b $10
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b $11
	RTL

; Other updates
UpdateOnKey:
	STA.l $7EF36F
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	RTL

UpdateOnBonk:
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	STA.b $5D ; needs $02
	RTL

UpdateOnReceiveItem:
	LDA.b #$07 : PHA : PLB ; to make up for PHK : PLB
	LDA.b #!UPDATE_TIMER : STA.w SA1IRAM.TIMER_FLAG ; update timer
	LDA.b $4D
	RTL

;===================================================================================================
; Idle frames
;===================================================================================================
idle_waitkey:
	; LDA $F4 from entry point
	ORA.b $F6 : AND.b #$C0 : BNE .pressed_key

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

.pressed_key
	RTL

;---------------------------------------------------------------------------------------------------

idle_endmessage:
	LDA.b $F4 : ORA.b $F6 : BNE .pressed_key

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

	ORA.b #$00

.pressed_key
	RTL

;---------------------------------------------------------------------------------------------------

idle_menu:
	LDA.b $F4 : BNE .pressed_key

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

.pressed_key
	AND.b #$10
	RTL

;---------------------------------------------------------------------------------------------------

idle_choose:
	LDA.b $F6
	AND.b #$C0
	ORA.b $F4

	BIT.b #$DC
	BNE .pressed_key

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

.pressed_key
	RTL

;---------------------------------------------------------------------------------------------------

idle_chooseb:
	LDA.b $F6
	LDY.b $F4
	AND.b #$C0
	ORA.b $F4

	BIT.b #$CC
	BNE .pressed_key

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

.pressed_key
	RTL

;---------------------------------------------------------------------------------------------------

idle_item_toss:
	LDA.b $F6
	AND.b #$C0
	ORA.b $F4
	AND.b #$CF
	BNE .pressed_key

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

.pressed_key
	LDA.b $F4
	ORA.b $F6
	RTL

;---------------------------------------------------------------------------------------------------

idle_holdA:
	LDA.b $F2 : BPL .no_a_press

	REP #$20
	INC.w SA1IRAM.ROOM_TIME_IDLE
	SEP #$20

.no_a_press
	AND.b #$80
	RTL
