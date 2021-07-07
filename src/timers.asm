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

; This causes some double triggers, but always on the same frame
; so it should be fine
org $01C3A7 : JSL UpdateOnInterRoomStairs

org $09969E : STZ $0380 ; just changes order of operations for the STZ
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
org $1BC209 : JSL UpdateOnBombableWallOW
org $08E06A : JSL UpdateOnFlute

; Messaging
org $028818 : JSL UpdateOnItemMenu
org $0DDFD3 : JSL UpdateOnItemMenuClose
org $0EF27C : JSL UpdateOnExitingText
org $1CFD7E : JSL UpdateOnEnteringMessaging
org $05FC83 : JSL UpdateOnKey ; bonk key
org $06D192 : JSL UpdateOnKey ; normal key
org $078FFB : JSL UpdateOnBonk
org $07999D : PHB : JSL UpdateOnReceiveItem

org $0DFA90 : PHB : JSL StupidMVN : NOP

!reset = $42
!update = $02
pullpc

macro update_timer()
	LDA #$02 : STA !timer_allowed
endmacro

macro reset_timer()
	LDA #$41 : STA !timer_allowed
endmacro

StupidMVN:
	LDA #$80 : TSB !timer_allowed
	REP #$30
	LDA #$0149
	RTL

; Underworld updates
UpdateOnUWTransition:
	%reset_timer()
	LDA $67 : AND #$03
	RTL

UpdateOnUWStairs:
	%reset_timer()
	JML $07F243

UpdateOnSwitchPress:
	STA $11
	%update_timer()
	LDX $0C
	RTL

UpdateOnUWMirror:
	STA $11 : STZ $0B
	%reset_timer()
	RTL

UpdateOnUWPitTransition:
	%reset_timer()
	LDA $01C31F, X
	RTL

UpdateOnKillRoom:
	%update_timer()
	LDA #$05 : STA $11
	RTL

UpdateOnBombableWallOW:
UpdateOnExitingText:
	%update_timer()
	LDA #$01 : STA $14
	RTL

UpdateOnPegSwitch:
	%update_timer()
	LDA #$16 : STA $11
	RTL

UpdateOnWarpTile:
	%reset_timer()
	LDA #$15 : STA $11
	RTL

UpdateOnIntraroomStairs:
	%update_timer()
	LDA #$07 : STA $10
	RTL

UpdateOnInterRoomStairs:
	%reset_timer()
	JML $02B861

UpdateOnBombableWallUW:
	%update_timer()
	LDA #$09 : STA $11
	RTL

UpdateOnBombableFloor:
	SEP #$30
	%update_timer()
	LDA #$1B
	RTL

UpdateOnExplodingWall:
	%update_timer()
	STZ $50
	LDA $EE
	RTL

UpdateOnMovingWallStart:
	%update_timer()
	LDA #$01 : STA $02E4
	RTL

; mire/pod: 1704->17

UpdateOnMovingWallEndPodMire:
	LDA.l !ram_fast_moving_walls : BEQ .slowwalls
	SED
	CLC
	LDA !room_time_F : ADC.w #$47
	CMP.w #$60 : BCC ++
	SBC.w #$60
++	STA !room_time_F
	LDA !room_time_S : ADC.w #$16
	STA !room_time_S
	CLD

.slowwalls
	LDY #$02 : STY !timer_allowed
	LDY #$00 : STY $AE, X
	RTL

; desert: 918->10
UpdateOnMovingWallEndDesert:
	LDA.l !ram_fast_moving_walls : BEQ .slowwalls
	SED
	CLC
	LDA !room_time_F : ADC.w #$08
	CMP.w #$60 : BCC ++
	SBC.w #$60
++	STA !room_time_F
	LDA !room_time_S : ADC.w #$09
	STA !room_time_S
	CLD

.slowwalls
	LDY #$02 : STY !timer_allowed
	LDY #$00 : STY $AE, X
	RTL

; Overworld updates
UpdateOnOWUWTransition:
	%reset_timer()
	STZ $11 : STZ $B0
	RTL

UpdateOnOWTransition:
	%reset_timer()
	INC $11 : LDA $00
	RTL

UpdateOnOWMirror:
	%reset_timer()
	LDA #$23 : STA $11
	RTL

UpdateOnOWMirror2:
	%reset_timer()
	LDA #$14 : STA $5D
	RTL

UpdateOnOWPitTransition:
	%reset_timer()
	JML $1BB860 ; Overworld_Hole

UpdateOnOWToSpecial:
	%reset_timer()
	LDA #$17 : STA $11
	RTL

UpdateOnSpecialToOW:
	%reset_timer()
	LDA #$24 : STA $11
	RTL

UpdateOnWhirlPool:
	%reset_timer()
	LDA #$2E : STA $11
	RTL

UpdateOnFlute:
	%reset_timer()
	LDA #$0A : STA $11
	RTL

; Messaging updates
UpdateOnEnteringMessaging:
UpdateOnItemMenu:
	%update_timer()
	LDA #$0E : STA $10
	RTL

UpdateOnItemMenuClose:
	STA $10
	%update_timer()
	LDA $11
	RTL

; Other updates
UpdateOnKey:
	STA $7EF36F
	%update_timer()
	RTL

UpdateOnBonk:
	%update_timer()
	STA $5D ; needs $02
	RTL

UpdateOnReceiveItem:
	LDA #$07 : PHA : PLB ; to make up for PHK : PLB
	%update_timer()
	LDA $4D
	RTL

; !timer_allowed bitfield:
; 7 - timers have been set and are awaiing a hud update
; 6 - reset timer
; 5
; 4
; 3
; 2 - Update without blocking further updates
; 1 - One update then no more
; 0 - 

dotimers:
	SEP #$20
	LDA !timer_allowed 
	BMI .donothing
	BEQ .donothing

	BIT !timer_allowed
	REP #$30

	LDA #$000F ; transferring 16 bytes
	LDX.w #!room_time_F+$0F
	LDY.w #!room_time_F_disp+$0F

	MVP $00,$00

	BVC .dontreset

	STZ !room_time_F+0
	STZ !room_time_F+2
	STZ !room_time_F+4
	STZ !room_time_F+6

.dontreset
	SEP #$30
	LDA #$80 : STA !timer_allowed

.donothing
	RTS
