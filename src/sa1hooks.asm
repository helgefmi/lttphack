pushpc
org $008000
struct SA1IRAM $003000
	.SHORTCUT_USED: skip 2
	.corruption_watcher: skip 2

	.SCRATCH: skip 16

	.CONTROLLER_1:
	.CopyOf_F2: skip 1
	.CopyOf_F0: skip 1

	.CONTROLLER_1_FILTERED:
	.CopyOf_F6: skip 1
	.CopyOf_F4: skip 1

	.CONTROLLER_1_NEW:

	.JOYPAD2_NEW: skip 2

	.CachedThisFrame: skip 1
	.cm_submodule: skip 2
	.cm_cursor: skip 1 ; keep these together
	.cm_current_menu: skip 4
	.cm_current_selection: skip 4
	.cm_current_draw: skip 4
	.cm_draw_color: skip 2

	; these can be shared because they're never used at the same time
	.cm_writer:
	.cm_draw_type_offset: skip 2
	.cm_draw_filler: skip 2

	.cm_leftright: skip 1 ; N=left V=right
	.cm_updown: skip 1 ; N=up V=down
	.cm_ax: skip 1 ; N=A V=X
	.cm_y: skip 1 ; 
	.cm_shoulder: skip 1 ; N=l V=r
	skip 1 ; for safety

	.cm_writer_args: skip 4

	.preset_addr: skip 3

	.preset_prog: skip 3
	.preset_prog_end: skip 2

	.preset_pert: skip 3
	.preset_pert_end: skip 2

	.preset_reader: skip 3
	.preset_reader2: skip 3
	.preset_writer: skip 2
	.preset_type: skip 2
	.preset_scratch: skip 4

	.litestate_act: skip 2
	.litestate_last: skip 2
	.litestate_off: skip 2

	reset bytes

.savethis_start
	.TIMER_FLAG: skip 2

.timers_start
	.ROOM_TIME_F: skip 2
	.ROOM_TIME_S: skip 2
	.ROOM_TIME_LAG: skip 2
	.ROOM_TIME_IDLE: skip 2

	.SEG_TIME_F: skip 2
	.SEG_TIME_S: skip 2
	.SEG_TIME_M: skip 2
.timers_end
	.ROOM_TIME_F_DISPLAY: skip 2
	.ROOM_TIME_S_DISPLAY: skip 2
	.ROOM_TIME_LAG_DISPLAY: skip 2
	.ROOM_TIME_IDLE_DISPLAY: skip 2

	.SEG_TIME_F_DISPLAY: skip 2
	.SEG_TIME_S_DISPLAY: skip 2
	.SEG_TIME_M_DISPLAY: skip 2

	.SNTVAL1: skip 2
	.SNTVAL2: skip 2
	.SNTVAL3: skip 2
	.SNTVAL4: skip 2
	.SNTVAL5: skip 2

	.SNTADD1: skip 2
	.SNTADD2: skip 2
	.SNTADD3: skip 2
	.SNTADD4: skip 2
	.SNTADD5: skip 2

	.CopyOf_12: skip 1
	.CopyOf_1A: skip 1
	.CopyOf_1B: skip 1
	.CopyOf_20: skip 1
	.CopyOf_21: skip 1
	.CopyOf_22: skip 1
	.CopyOf_23: skip 1

	.CopyOf_57: skip 1
	.CopyOf_5B: skip 1
	.CopyOf_6C: skip 1
	.CopyOf_0372: skip 1

	.CopyOf_A0: skip 1
	.CopyOf_A1: skip 1
	.CopyOf_A4: skip 1
	.CopyOf_E2: skip 1

	.CopyOf_7EF36C: skip 1
	.CopyOf_7EF36D: skip 1
	.CopyOf_7EF3CA: skip 1

	; not copied, but just moved in rom
	.Moved_0208: skip 1
	.Moved_0209: skip 1
	.Moved_020A: skip 1

	.Moved_04A0: skip 2
	.Moved_04B4: skip 1

	; extra stuff
	.BossCycles: skip 16 ; 16 to be safe

	print ""
	print "SA1 dp: $", pc
	print "Saved: ", bytes, "/640 (acceptable savestate limit)"

	.QuickSwapLR: skip 1

.savethis_end

	; ancilla watch
	.LINEVAL:
	.LINE1VAL: skip 16
	.LINE2VAL: skip 16
	.LINE3VAL: skip 16
	.LINE4VAL: skip 16

	print "SA1 mirroring: $", pc

endstruct

;===================================================================================================

org $00F7E1
SA1Reset00:
	JML SA1Reset

SA1NMI00:
	JML SA1NMI

SA1IRQ00:
	JML SA1IRQ

SNES_CUSTOM_NMI_BOUNCE:
	JML SNES_CUSTOM_NMI

SNES_CORRUPTION_IRQ_BOUNCE:
	JML SNES_CORRUPTION_IRQ
warnpc $00F800

org $00FFB7 ; this barely fits
ReadJoyPad_long:
--	LSR.w $4212
	BCS --
	JSR.w $0083D1
	RTL


; This is critical to the survival of the SA1
; during somaria glitches, the SA-1 will listen for writes here
; and if the SNES goes too far, it triggers an IRQ

; save irq type 2 (#$82) to sa1 when starting
org $01F7EC
	JMP CorruptionSave

org $01FEAA
CorruptionSave:
	STY.b $0C
	STY.w SA1IRAM.corruption_watcher
	RTS

org $028B07
	JSL UWOverlayWrapper

incsrc sa1hud.asm
incsrc sa1sram.asm

pullpc

;===================================================================================================

SNES_CORRUPTION_IRQ:
	SEP #$20 ; we don't need to preserve A, so it's fine
	LDA.b #$80 : STA.l $2202 ; acknowledge IRQ
	PLP ; recover processor from the interrupt

	PLA ; remove address of interrupted location
	PHP ; push this so next pull is bigger
	PLA ; remove bank of interrupted location
	PLA ; remove routine that makes holes

	JML $01B897 ; return to exit of the loop

UWOverlayWrapper:
	JSL EnableCorruptionWatcher
	JSL $01B83E
	JSL DisableCorruptionWatcher
	RTL


EnableCorruptionWatcher:
	PHP
	SEP #$20
	LDA.b #$80 : STA.w $2201 ; enable IRQ from here
	LDA.b #$82 : STA.w $2200

	PLP
	RTL

DisableCorruptionWatcher:
	PHP
	SEP #$20

	LDA.b #$00 : STA.w $2201

	REP #$30
	LDA.w #$FFFF : STA.w SA1IRAM.corruption_watcher

	SEP #$20

	LDA.w !config_somaria_pits : BEQ ++

	STZ.b $12

	; wait for NMI once for the main vram transfers
--	LDA.b $12 : BEQ --

	JSL Shortcut_ShowPits

++	PLP
	RTL

RecoverFromCorruption:
	SEP #$20

	LDA.b #$80 : STA.w $2202 ; acknowledge IRQ
	JSL DisableCorruptionWatcher

	RTL

; watch for this to be a bad value
; if it's FFFF, then NMI occured and things are fine
CorruptionWatcher:
	SEP #$20
	LDA.b #$40 : STA.w $2209 ; irq vector

	REP #$30
	STZ.b SA1IRAM.corruption_watcher

	LDA.w #SNES_CORRUPTION_IRQ_BOUNCE
	STA.w $220E ; snes IRQ vector

.watch
	LDA.b SA1IRAM.corruption_watcher
	CMP.w #$FFFF
	BEQ .done

	CMP.w #$1080
	BCC .watch

	SEP #$20
	LDA.b #$C0 : STA.w $2209 ; trigger irq

	REP #$20
	LDA.w #$FFFF

--	CMP.b SA1IRAM.corruption_watcher
	BNE --

.done
	SEP #$20
	LDA.b #$00 : STA.w $2209 ; disable IRQ from snes
	RTS


;===================================================================================================
; CacheSA1Stuff is critical to balancing lag
; so if it isn't called from the HUD, we need to call it here
; otherwise, we're a lot less laggy than vanilla
; this is run every frame
;===================================================================================================
WasteTimeIfNeeded:
	LSR.w SA1IRAM.CachedThisFrame
	BCS ++

	JSL CacheSA1Stuff

++	STZ.b $12

	JML $008034

CacheSA1Stuff:
	REP #$30 ; 16 bit first

	LDA.w #$3000
	TCD

	LDA.w $001A : STA.b SA1IRAM.CopyOf_1A
	LDA.w $0020 : STA.b SA1IRAM.CopyOf_20
	LDA.w $0022 : STA.b SA1IRAM.CopyOf_22
	LDA.w $00A0 : STA.b SA1IRAM.CopyOf_A0
	LDA.l $7EF36C : STA.b SA1IRAM.CopyOf_7EF36C

	LDX.b SA1IRAM.SNTADD1 : LDA.l $7E0000,X : STA.b SA1IRAM.SNTVAL1
	LDX.b SA1IRAM.SNTADD2 : LDA.l $7E0000,X : STA.b SA1IRAM.SNTVAL2
	LDX.b SA1IRAM.SNTADD3 : LDA.l $7E0000,X : STA.b SA1IRAM.SNTVAL3
	LDX.b SA1IRAM.SNTADD4 : LDA.l $7E0000,X : STA.b SA1IRAM.SNTVAL4
	LDX.b SA1IRAM.SNTADD5 : LDA.l $7E0000,X : STA.b SA1IRAM.SNTVAL5

	LDA.w #$0001 ; top byte 0x00

	; 8 bit stuff
	SEP #$30

	STA.b SA1IRAM.CachedThisFrame ; flag this with that 01

	LDA.w $00E2 : STA.b SA1IRAM.CopyOf_E2
	LDA.w $0057 : STA.b SA1IRAM.CopyOf_57
	LDA.w $005B : STA.b SA1IRAM.CopyOf_5B
	LDA.w $006C : STA.b SA1IRAM.CopyOf_6C
	LDA.w $00A4 : STA.b SA1IRAM.CopyOf_A4
	LDA.w $0372 : STA.b SA1IRAM.CopyOf_0372
	LDA.l $7EF3CA : STA.b SA1IRAM.CopyOf_7EF3CA

	LDA.b #$00 : TCD

	RTL

Extra_SA1_Transfers:
	SEP #$30

	LDY.b #$00

.next
	LDA.w !config_linesentry1,Y
	ASL
	TAX

	PHY
	PHP

	TYA
	ASL
	ASL
	ASL
	TAY

	JSR (.subs,X)

	PLP
	PLY

	INY
	INY
	CPY.b #06
	BCC .next

	RTL

.subs
	dw .nothing
	dw .roomflag
	dw .camerax
	dw .cameray
	dw .owtran
	dw .owtran
	dw .ancilla04
	dw .ancilla59
	dw .ancillaIX

.owtran

.nothing
	RTS

.roomflag
	LDA.w $0401 : STA.w SA1IRAM.LINEVAL+0,Y
	LDA.w $0403 : STA.w SA1IRAM.LINEVAL+1,Y
	LDA.w $0408 : STA.w SA1IRAM.LINEVAL+2,Y

	RTS

.camerax
	LDA.b $A6 : STA.w SA1IRAM.LINEVAL+0,Y

	REP #$20
	LDA.b $E2 : STA.w SA1IRAM.LINEVAL+1,Y

	LDA.w $0608 : STA.w SA1IRAM.LINEVAL+3,Y
	LDA.w $060C : STA.w SA1IRAM.LINEVAL+5,Y
	LDA.w $060A : STA.w SA1IRAM.LINEVAL+7,Y
	LDA.w $060E : STA.w SA1IRAM.LINEVAL+9,Y
	RTS

.cameray
	LDA.b $A7 : STA.w SA1IRAM.LINEVAL+0,Y

	REP #$20
	LDA.b $E8 : STA.w SA1IRAM.LINEVAL+1,Y

	LDA.w $0600 : STA.w SA1IRAM.LINEVAL+3,Y
	LDA.w $0604 : STA.w SA1IRAM.LINEVAL+5,Y
	LDA.w $0602 : STA.w SA1IRAM.LINEVAL+7,Y
	LDA.w $0606 : STA.w SA1IRAM.LINEVAL+9,Y

	RTS

.ancilla04
	PEA.w $0000
	BRA .saveancilla

.ancilla59
	PEA.w $0005
	BRA .saveancilla

.ancillaIX
	REP #$31
	LDA.w $03C4
	AND.w #$00FF
	DEC

	CMP.w #$0080 ; if negative, show slots 0-4
	BCS .ancilla04

	CMP.w #5
	BCC .ancilla04

	PHA
	BRA .saveancilla


.saveancilla
	REP #$30
	PLA ; get offset of our property
	STA.w SA1IRAM.LINEVAL+10,Y

	PHY ; save Y
	TYA
	LSR ; /8 for props
	LSR
	LSR
	TAY
	LDA.w !config_ancprop1,Y
	PLY

	ASL
	TAX
	STA.w SA1IRAM.LINEVAL+8,Y

	LDA.l ancillawatch_props,X
	STA.w SA1IRAM.LINEVAL+12,Y
	CLC
	ADC.w SA1IRAM.LINEVAL+10,Y
	STA.w SA1IRAM.LINEVAL+14,Y
	TAX

	LDA.b $00,X : STA.w SA1IRAM.LINEVAL+0,Y
	LDA.b $02,X : STA.w SA1IRAM.LINEVAL+2,Y
	LDA.b $04,X : STA.w SA1IRAM.LINEVAL+4,Y

	RTS


;===================================================================================================

InitSA1:
	REP #$20

	LDA.w #$0020
	STA.w $2200

	LDA.w #SA1Reset00
	STA.w $2203

	LDA.w #SA1NMI00
	STA.w $2205

	LDA.w #SA1IRQ00
	STA.w $2207

	LDA.w #$8180
	STA.w $2220
	STA.w $2222

	SEP #$20
	LDA.b #$80
	STA.w $2226

	LDA.b #$03
	STA.w $2224

	LDA.b #$FF
	STA.w $2202
	STA.w $2229
	STZ.w $2228

	REP #$20

	LDA.w #$FFFF
	STA.w SA1IRAM.litestate_last
	STA.w SA1IRAM.litestate_act

	STZ.b $F0
	STZ.b $F2
	STZ.b $F4
	STZ.b $F6

	STZ.w SA1IRAM.CopyOf_F0
	STZ.w SA1IRAM.CopyOf_F2
	STZ.w SA1IRAM.CopyOf_F4
	STZ.w SA1IRAM.CopyOf_F6

	STZ.w SA1IRAM.cm_submodule
	STZ.w SA1IRAM.preset_addr
	STZ.w SA1IRAM.TIMER_FLAG

	STZ.w SA1IRAM.SEG_TIME_F
	STZ.w SA1IRAM.SEG_TIME_S
	STZ.w SA1IRAM.SEG_TIME_M
	STZ.w SA1IRAM.SEG_TIME_F_DISPLAY
	STZ.w SA1IRAM.SEG_TIME_S_DISPLAY
	STZ.w SA1IRAM.SEG_TIME_M_DISPLAY

	STZ.w SA1IRAM.SHORTCUT_USED
	STZ.w $2200

	SEP #$30
	RTL

;===================================================================================================

SA1Reset:
	SEI
	CLC
	XCE

	REP #$FB

	LDA.w #$0000
	TCD

	LDA.w #$37FF
	TCS

	PHK
	PLB

	LDA.w #SNES_CUSTOM_NMI_BOUNCE ; set up custom NMI vector
	STA.w $220C

	SEP #$30
	STZ.w $2209 ; but don't use it
	STZ.w $2210

	STZ.w $2230
	STZ.w $2231

	LDA.b #$80
	STA.w $2227

	LDA.b #$03
	STA.w $2225 ; image 3 for page $60

	LDA.b #$FF
	STA.w $222A

	LDA.b #$F0
	STA.w $220B

	LDA.b #$90
	STA.w $220A

	REP #$34
	LDX.w #(SA1RAM.end_of_clearable_sa1ram-SA1RAM.clearable_sa1ram)-1

--	STZ.w SA1RAM.clearable_sa1ram,X
	DEX
	DEX
	BPL --

--	BRA --

; SA1IRAM.TIMER_FLAG bitfield:
; 7 - timers have been set and are awaiting a hud update
; 6 - reset timer
; 5
; 4
; 3
; 2 - Update without blocking further updates
; 1 - One update then no more
; 0 - 
SA1NMI:
	REP #$30
	PHA
	PHX
	PHY
	PHD
	PHB

	SEP #$30
	LDA.b #$10
	STA.l $00220B

	PHK
	PLB

	LDA.w $2301
	AND.b #$03
	ASL
	TAX

	JSR.w (.nmis,X)

#SA1NMI_EXIT:
	REP #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	RTI

.nmis
	dw .disable_custom_nmi
	dw .enable_custom_nmi
	dw SA1NMI_SENTRIES
	dw .nothing_at_all

.disable_custom_nmi
	STZ.w $2209

.nothing_at_all
	RTS

.enable_custom_nmi
	LDA.b #$10
	STA.w $2209
	RTS

;---------------------------------------------------------------------------------------------------

SA1NMI_SENTRIES:
	SED

.update_sentries
	; if $12 = 1, then we weren't done with game code
	; that means we're in a lag frame
	LDA.b SA1IRAM.CopyOf_12
	LSR
	REP #$20
	LDA.b SA1IRAM.ROOM_TIME_LAG : ADC.w #$0000 ; carry set from $12 being 1
	STA.b SA1IRAM.ROOM_TIME_LAG

	SEP #$21 ; include carry so we can do +0+1 without an extra CLC
	LDA.b SA1IRAM.ROOM_TIME_F : ADC.b #$00
	CMP.b #$60
	BCC .rtFOK

.rtF60
	LDA.b #$00

.rtFOK
	STA.b SA1IRAM.ROOM_TIME_F

	REP #$20 ; seconds have 3 digits
	LDA.b SA1IRAM.ROOM_TIME_S : ADC.w #$0000 ; increments by 1 if F>=60
	STA.b SA1IRAM.ROOM_TIME_S

	SEP #$21 ; include carry
	LDA.b SA1IRAM.SEG_TIME_F : ADC.b #$00
	CMP.b #$60
	BCC .stFOK

.stF60
	LDA.b #$00

.stFOK
	STA.b SA1IRAM.SEG_TIME_F

	LDA.b SA1IRAM.SEG_TIME_S : ADC.b #$00 ; increments by 1 if F>=60
	CMP.b #$60
	BCC .stSOK

.stS60
	LDA.b #$00

.stSOK
	STA.b SA1IRAM.SEG_TIME_S

	REP #$20
	LDA.b SA1IRAM.SEG_TIME_M : ADC.w #$0000 ; increments by 1 if S>=60
	STA.b SA1IRAM.SEG_TIME_M

.dont_update_sentries
	CLD

	SEP #$20
	LDA.b SA1IRAM.TIMER_FLAG 
	BMI .donothing
	BEQ .donothing

	BIT.b SA1IRAM.TIMER_FLAG
	REP #$30

	LDA.w #SA1IRAM.timers_end-SA1IRAM.timers_start-1

	LDX.w #SA1IRAM.ROOM_TIME_F
	LDY.w #SA1IRAM.ROOM_TIME_F_DISPLAY

	MVN $00,$00

	BVC .dontreset

	STZ.b SA1IRAM.ROOM_TIME_F+0
	STZ.b SA1IRAM.ROOM_TIME_F+2
	STZ.b SA1IRAM.ROOM_TIME_F+4
	STZ.b SA1IRAM.ROOM_TIME_F+6

.dontreset
	SEP #$30

	LDA.b #$80
	STA.b SA1IRAM.TIMER_FLAG

.donothing
++	RTS

;---------------------------------------------------------------------------------------------------

; For everything not a timer
SA1IRQ:
	SEI

	REP #$30
	PHA
	PHX
	PHY
	PHD
	PHB

	SEP #$30

	LDA.b #$80
	STA.l $00220B

	PHK
	PLB

	LDA.w $2301 ; get IRQ type
	AND.b #$03
	ASL
	TAX

	JSR (.irq_type,X)

	REP #$30
	PLB
	PLD
	PLY
	PLX
	PLA
	RTI

.irq_nothing
	RTS

.irq_type
	dw .irq_nothing
	dw .irq_shortcuts
	dw CorruptionWatcher
	dw .irq_hud

	dw .irq_nothing
	dw .irq_nothing
	dw .irq_nothing
	dw .irq_nothing

.irq_hud
	JSL draw_hud_extras
	RTS

.irq_shortcuts
	JSL DoShortCuts
	RTS
