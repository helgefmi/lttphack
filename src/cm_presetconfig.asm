PRESET_CONFIG_SUBMENU:
%menu_header("PRESET CONFIGURATION", 6)

;===================================================================================================
; PRESET LIST
%choice_here("Preset category", !config_preset_category, 8)
	%list_item("Any% NMG")
	%list_item("100% NMG")
	%list_item("Low%")
	%list_item("Low% Legacy")
	%list_item("AD RMG")
	%list_item("AD 2014")
	%list_item("Any% RMG")
	%list_item("Boss RTAs")

;===================================================================================================
%submenu_variable("Safeties", SAFETIES_SUBMENU)

;===================================================================================================
%toggle_onoff("Death reload", !config_death_reload)

;===================================================================================================
%toggle("Random bats", SA1RAM.ganon_bats)

;===================================================================================================
%toggle("Use preset load", !config_use_custom_load)

;===================================================================================================
%func("Save loadout", this)

	LDX.b #$21
--	LDA.l $7EF340,X
	STA.w !config_custom_load,X
	DEX
	BPL --

	LDA.l $7EF36C : STA.w !config_custom_load_2+0
	LDA.l $7EF36D : STA.w !config_custom_load_2+1
	LDA.l $7EF36E : STA.w !config_custom_load_2+2
	LDA.l $7EF37B : STA.w !config_custom_load_2+3
	LDA.w $0303 : STA.w !config_custom_load_2+4

	RTL

;===================================================================================================
;===================================================================================================
;===================================================================================================

SAFETIES_SUBMENU:
	SEP #$30

	LDA.w !config_preset_category
	ASL
	CLC
	ADC.w !config_preset_category
	TAX

	REP #$21

	LDA.l .pointers-1,X
	AND.w #$FF00
	STA.b SA1IRAM.cm_cursor

	LDA.l .pointers+1,X
	STA.b SA1IRAM.cm_cursor+2

	RTL

; PRESET LIST
.pointers
	dl presetsafeties_nmg
	dl presetsafeties_100nmg
	dl presetsafeties_lownmg
	dl presetsafeties_lowleg
	dl presetsafeties_ad2020
	dl presetsafeties_adold
	dl presetsafeties_anyrmg
	dl presetsafeties_bossrta

;===================================================================================================

presetsafeties_nmg:
%menu_header("NMG SAFETIES", 5)

%toggle_onoff("Sanc heart", !config_safeties_nmg_sanc_heart)

%choice_here("Powder", !config_safeties_nmg_powder, 4)
	%list_item("No")
	%list_item("Mushroom")
	%list_item("Powder")
	%list_item("Half magic")

%choice_here("Gold; Silvers", !config_safeties_nmg_gs, 3)
	%list_item("No")
	%list_item("Silvers")
	%list_item("Both")

%choice_here("Bottles", !config_safeties_nmg_bottles, 3)
	%list_item("No")
	%list_item("Early")
	%list_item("Late")

%toggle_onoff("Red mail", !config_safeties_nmg_red_mail)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_100nmg:
%menu_header("100% NMG SAFETIES", 1)

%toggle_onoff("Blue boom", !config_safeties_100nmg_trinexx_boom)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_lownmg:
%menu_header("LOW% NMG SAFETIES", 1)

%add_menu_item(NO_SAFETIES)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_lowleg:
%menu_header("LOW% (LEGACY) SAFETIES", 1)
%add_menu_item(NO_SAFETIES)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_ad2020:
%menu_header("ALL DUNGEONS SAFETIES", 1)

%toggle_onoff("Silvers", !config_safeties_ad2020_silvers)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_adold:
%menu_header("ALL DUNGEONS (OLD) SAFETIES", 1)

%toggle_onoff("Silvers", !config_safeties_adold_silvers)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_anyrmg:
%menu_header("ANY% RMG SAFETIES", 1)

%toggle_onoff("Hookshot", !config_safeties_anyrmg_hook)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetsafeties_bossrta:
%menu_header("BOSS RTA SAFETIES", 1)

#NO_SAFETIES:
%label("No safeties available")


;===================================================================================================
; Fudged menu to make merging the boss RTAs possible
;===================================================================================================
BOSSRTA_SUBMENU:

%menu_header("Boss RTA", 1)
%submenu_variable("Lanmo RTA", BOSSPRESET_SUBMENU)

BOSSPRESET_SUBMENU:
	LDA.b SA1IRAM.cm_cursor
	ASL
	CLC
	ADC.w SA1IRAM.cm_cursor

	REP #$21
	AND.w #$00FF
	TAX

	LDA.l .pointers-1,X
	AND.w #$FF00
	STA.b SA1IRAM.cm_cursor+0

	LDA.l .pointers+1,X
	STA.b SA1IRAM.cm_cursor+2

	JSL SetPresetMenuArea

	RTL

.pointers
	dl presetheader_lanmorta