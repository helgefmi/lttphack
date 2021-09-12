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


; Waitkey
org $0EFB90
	LDA.b $F4 ; vanilla pointlessly used absolute; dp is better
	JSL idle_waitkey ; now we have an easy 4 bytes here for the JSL

; EndMessage
org $0EFBBB : JSL idle_endmessage

; MenuActive
org $0DDF1E : JSL idle_menu

; BottleMenu
org $0DE0E2 : JSL idle_menu

pullpc

macro update_timer()
	LDA.b #$02 : STA.w SA1IRAM.TIMER_FLAG
endmacro

macro reset_timer()
	LDA.b #$41 : STA.w SA1IRAM.TIMER_FLAG
endmacro

; Underworld updates
UpdateOnUWTransition:
	%reset_timer()
	LDA.b $67 : AND.b #$03
	RTL

UpdateOnUWStairs:
	%reset_timer()
	JML $07F243

UpdateOnSwitchPress:
	STA.b $11
	%update_timer()
	LDX.b $0C
	RTL

UpdateOnUWMirror:
	STA.b $11 : STZ.b $B0
	%reset_timer()
	RTL

UpdateOnUWPitTransition:
	%reset_timer()
	LDA.l $01C31F,X
	RTL

UpdateOnKillRoom:
	%update_timer()
	LDA.b #$05 : STA.b $11
	RTL

UpdateOnBombableWallOW:
UpdateOnExitingText:
	%update_timer()
	LDA.b #$01 : STA.b $14
	RTL

UpdateOnPegSwitch:
	%update_timer()
	LDA.b #$16 : STA.b $11
	RTL

UpdateOnWarpTile:
	%reset_timer()
	LDA.b #$15 : STA.b $11
	RTL

UpdateOnIntraroomStairs:
	%update_timer()
	LDA.b #$07 : STA.b $10
	RTL

UpdateOnInterRoomStairs:
	%reset_timer()
	JML $02B861

UpdateOnBombableWallUW:
	%update_timer()
	LDA.b #$09 : STA.b $11
	RTL

UpdateOnBombableFloor:
	SEP #$30
	%update_timer()
	LDA.b #$1B
	RTL

UpdateOnExplodingWall:
	%update_timer()
	STZ.b $50
	LDA.b $EE
	RTL

UpdateOnGanonKill:
	%update_timer()
	STZ.b $B0
	STZ.b $AE
	RTL

UpdateOnTriforceDoor:
	%update_timer()
	STZ.b $11
	STZ.b $B0
	RTL

UpdateOnMovingWallStart:
	%update_timer()
	LDA.b #$01 : STA.w $02E4
	RTL

; mire/pod: 1704->17

UpdateOnMovingWallEndPodMire:
	LDA.w !config_fast_moving_walls : BEQ .slowwalls
	SED
	CLC
	LDA.w SA1IRAM.ROOM_TIME_F : ADC.w #$47
	CMP.w #$60 : BCC ++
	SBC.w #$60
++	STA.w SA1IRAM.ROOM_TIME_F
	LDA.w SA1IRAM.ROOM_TIME_S : ADC.w #$16
	STA.w SA1IRAM.ROOM_TIME_S
	CLD

.slowwalls
	LDY.b #$02 : STY.w SA1IRAM.TIMER_FLAG
	LDY.b #$00 : STY.b $AE,X
	RTL

; desert: 918->10
UpdateOnMovingWallEndDesert:
	LDA.w !config_fast_moving_walls : BEQ .slowwalls
	SED
	CLC
	LDA.w SA1IRAM.ROOM_TIME_F : ADC.w #$08
	CMP.w #$60 : BCC ++
	SBC.w #$60
++	STA.w SA1IRAM.ROOM_TIME_F
	LDA.w SA1IRAM.ROOM_TIME_S : ADC.w #$09
	STA.w SA1IRAM.ROOM_TIME_S
	CLD

.slowwalls
	LDY.b #$02 : STY.w SA1IRAM.TIMER_FLAG
	LDY.b #$00 : STY.b $AE,X
	RTL

; Overworld updates
UpdateOnOWUWTransition:
	%reset_timer()
	STZ.b $11 : STZ.b $B0
	RTL

UpdateOnOWTransition:
	%reset_timer()
	INC.b $11 : LDA.b $00
	RTL

UpdateOnOWMirror:
	%reset_timer()
	LDA.b #$23 : STA.b $11
	RTL

UpdateOnOWMirror2:
	%reset_timer()
	LDA.b #$14 : STA.b $5D
	RTL

UpdateOnOWPitTransition:
	%reset_timer()
	JML $1BB860 ; Overworld_Hole

UpdateOnOWToSpecial:
	%reset_timer()
	LDA.b #$17 : STA.b $11
	RTL

UpdateOnSpecialToOW:
	%reset_timer()
	LDA.b #$24 : STA.b $11
	RTL

UpdateOnWhirlPool:
	%reset_timer()
	LDA.b #$2E : STA.b $11
	RTL

UpdateOnFlute:
	%reset_timer()
	LDA.b #$0A : STA.b $11
	RTL

; Messaging updates
UpdateOnEnteringMessaging:
UpdateOnItemMenu:
	%update_timer()
	LDA.b #$0E : STA.b $10
	RTL

UpdateOnItemMenuClose:
	STA.b $10
	%update_timer()
	LDA.b $11
	RTL

; Other updates
UpdateOnKey:
	STA.l $7EF36F
	%update_timer()
	RTL

UpdateOnBonk:
	%update_timer()
	STA.b $5D ; needs $02
	RTL

UpdateOnReceiveItem:
	LDA.b #$07 : PHA : PLB ; to make up for PHK : PLB
	%update_timer()
	LDA.b $4D
	RTL

;===================================================================================================
; Idle frames
;===================================================================================================
macro inc_idle()
	REP #$21
	SED
	LDA.w SA1IRAM.ROOM_TIME_IDLE : ADC.w #$0001 : STA.w SA1IRAM.ROOM_TIME_IDLE
	CLD
	SEP #$20
endmacro

idle_waitkey:
	; LDA $F4 from entry point
	ORA.b $F6 : AND.b #$C0 : BNE .pressed_key
	%inc_idle()
	LDA.b $F4 : ORA.b $F6 : AND.b #$C0 
.pressed_key
	RTL

idle_endmessage:
	LDA.b $F4 : ORA.b $F6 : BNE .pressed_key

	%inc_idle()
	LDA.b $F4 : ORA.b $F6

.pressed_key
	RTL

idle_menu:
	LDA.b $F4 : BNE .pressed_key

	%inc_idle()
	LDA.b $F4

.pressed_key
	AND.b #$10
	RTL
