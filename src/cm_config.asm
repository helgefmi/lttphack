CONFIG_SUBMENU:
%menu_header("CONFIGURATION", 6)

;===================================================================================================
%submenu("System and ROM", SYSTEM_SUBMENU)

;===================================================================================================
%toggle_onoff("Rerandomize", !config_rerandomize_toggle)

;===================================================================================================
%toggle_func_onoff_here("Music", !config_feature_music)
	LDA.w !config_feature_music

	REP #$20
	BNE ..unmute

..mute
	LDA.w #MutedInstruments
	BRA ..transfer

..unmute
	LDA.w #UnmutedInstruments

..transfer
	JSR transfer_adsr

	LDA.w $0133 : STA.w $012C

	RTL

#mute_music:
	REP #$20
	LDA.w #MutedInstruments
	JSR transfer_adsr
	RTL

#transfer_adsr:
	STA.w $0000
	LDA.w #$0000
	PHD
	TCD

	SEP #$30
	LDA.b #$FF : STA.w $2140
	STZ.w $4200

	LDA.b #UnmutedInstruments>>16
	JSL $00891D

	SEP #$30

	PLD
	RTS

;===================================================================================================
%toggle_customtext_here("Menu open", !config_cm_save_place)
	%list_item("Main menu")
	%list_item("Save place")

;===================================================================================================
%choice_here("HUD font", !config_hud_font, 22)
	%list_item("LTTP")
	%list_item("Klonoa")
	%list_item("TI-83")
	%list_item("Shin-chan")
	%list_item("SMT")
	%list_item("Mario World")
	%list_item("DKC")
	%list_item("ZAMN")
	%list_item("Emerald")
	%list_item("Earthbound")
	%list_item("FF6")
	%list_item("Lufia 2")
	%list_item("Goonies 2")
	%list_item("Pac-Man")
	%list_item("DOOM")
	%list_item("Undertale")
	%list_item("Planet X-3")
	%list_item("Skyroads")
	%list_item("Yoshi's")
	%list_item("S. Metroid")
	%list_item("Tazmania")
	%list_item("Black Bass")

;===================================================================================================
%submenu("Color config", COLOR_CONFIG_SUBMENU)

;===================================================================================================
!color_count = 21
!color_id = -1

COLORS_YAY:
	fillword $0000 : fill !color_count*2

macro fixed_color(val, name)
	!color_id #= !color_id+1
	%list_item("<name>")
	pushpc
		org COLORS_YAY+!color_id*2 : dw color(<val>)
	pullpc
endmacro

COLOR_CONFIG_SUBMENU:
%menu_header("COLOR CONFIG", 7)
%choice_func("Menu BG", !config_hud_bg, !color_count, set_color, color_list)

%choice_func("Header FG", !config_hud_header_fg, !color_count, set_color, color_list)
%choice_func("Header HL", !config_hud_header_hl, !color_count, set_color, color_list)
%choice_func("Header BG", !config_hud_header_bg, !color_count, set_color, color_list)

%choice_func("Selection FG", !config_hud_sel_fg, !color_count, set_color, color_list)
%choice_func("Selection BG", !config_hud_sel_bg, !color_count, set_color, color_list)

%choice_func("Inactive FG", !config_hud_dis_fg, !color_count, set_color, color_list)
;%choice_func("Inactive BG", !config_hud_dis_bg, !color_count, set_color, color_list)

set_color:
	BIT.b SA1IRAM.cm_ax
	BVC .dontreset

	LDA.b SA1IRAM.cm_cursor
	TAX
	ASL
	TAY

	LDA.l .defaults,X
	STA.w !config_hud_bg,Y

.dontreset
	RTL

.defaults
	db  0 ; HUD BG: black

	db  1 ; Header FG: white
	db  0 ; Header HL: black
	db 10 ; Header BG: lui

	db  9 ; Selection FG: me
	db  8 ; Selection BG: mine

	db  3 ; Inactive FG: gray

color_list:
%list_header(!color_count)
	%fixed_color($000000, "Black")
	%fixed_color($F8F8F8, "White")
	%fixed_color($C06000, "Brown")
	%fixed_color($A8A8A8, "Gray")

	%fixed_color($C00000, "Red")
	%fixed_color($E0A800, "Yellow")
	%fixed_color($20C028, "Green")
	%fixed_color($4870D0, "Blue")

	%fixed_color($C8C8F8, "Periwinkle")
	%fixed_color($000090, "Dark Blue")
	%fixed_color($06A969, "Lui green")
	%fixed_color($20A8F8, "Glan blue") ; fantasy

	%fixed_color($F8B000, "Mike orange")
	%fixed_color($782878, "Purple")
	%fixed_color($605800, "Garbage")
	%fixed_color($8090A0, "Blilver")

	%fixed_color($F858A8, "Pink")
	%fixed_color($F76D61, "Peach42")
	%fixed_color($2AA8D9, "Siriusly?")
	%fixed_color($BADA55, "BADA55")

	%fixed_color($FFBFFF, "Blunt pink")

;===================================================================================================
UnmutedInstruments:
	dw .end-.start, $3D00

.start
	db $00, $FF, $E0, $B8, $04, $70
	db $01, $FF, $E0, $B8, $07, $90
	db $02, $FF, $E0, $B8, $09, $C0
	db $03, $FF, $E0, $B8, $04, $00
	db $04, $FF, $E0, $B8, $04, $00
	db $05, $FF, $E0, $B8, $04, $70
	db $06, $FF, $E0, $B8, $04, $70
	db $07, $FF, $E0, $B8, $04, $70
	db $08, $FF, $E0, $B8, $07, $A0
	db $09, $8F, $E9, $B8, $01, $E0
	db $0A, $8A, $E9, $B8, $01, $E0
	db $0B, $FF, $E0, $B8, $03, $00
	db $0C, $FF, $E0, $B8, $03, $A0
	db $0D, $FF, $E0, $B8, $01, $00
	db $0E, $FF, $EF, $B8, $0E, $A0
	db $0F, $FF, $EF, $B8, $06, $00
	db $10, $FF, $E0, $B8, $03, $D0
	db $11, $8F, $E0, $B8, $03, $00
	db $12, $8F, $E0, $B8, $06, $F0
	db $13, $FD, $E0, $B8, $07, $A0
	db $14, $FF, $E0, $B8, $07, $A0
	db $15, $FF, $E0, $B8, $03, $D0
	db $16, $8F, $E0, $B8, $03, $00
	db $17, $FF, $E0, $B8, $02, $C0
	db $18, $FE, $8F, $B8, $06, $F0

.end
	dw $0000, $0800

;---------------------------------------------------------------------------------------------------

SYSTEM_SUBMENU:
%menu_header("SYSTEM AND ROM", 6)

%info1d("CPU version", SA1RAM.CPUVERSION)
%info1d("PPU1 version", SA1RAM.PPU1VERSION)
%info1d("PPU2 version", SA1RAM.PPU2VERSION)
%info1d("SA-1 version", $00230E)

%info4h("ROM checksum 1", $00FFDC)
%info4h("ROM checksum 2", $00FFDE)

;===================================================================================================

MutedInstruments:
	dw .end-.start, $3D00

.start
	db $00, $00, $00, $00, $04, $70
	db $01, $00, $00, $00, $07, $90
	db $02, $00, $00, $00, $09, $C0
	db $03, $00, $00, $00, $04, $00
	db $04, $00, $00, $00, $04, $00
	db $05, $00, $00, $00, $04, $70
	db $06, $FF, $E0, $B8, $04, $70 ; mirror uses this, leave unmuted
	db $07, $00, $00, $00, $04, $70
	db $08, $00, $00, $00, $07, $A0
	db $09, $00, $00, $00, $01, $E0
	db $0A, $00, $00, $00, $01, $E0
	db $0B, $00, $00, $00, $03, $00
	db $0C, $00, $00, $00, $03, $A0
	db $0D, $00, $00, $00, $01, $00
	db $0E, $00, $00, $00, $0E, $A0
	db $0F, $00, $00, $00, $06, $00
	db $10, $00, $00, $00, $03, $D0
	db $11, $00, $00, $00, $03, $00
	db $12, $00, $00, $00, $06, $F0
	db $13, $00, $00, $00, $07, $A0
	db $14, $00, $00, $00, $07, $A0
	db $15, $00, $00, $00, $03, $D0
	db $16, $00, $00, $00, $03, $00
	db $17, $00, $00, $00, $02, $C0
	db $18, $00, $00, $00, $06, $F0

.end
	dw $0000, $0800
