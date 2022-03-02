HUDEXTRAS_SUBMENU:
	%menu_header("HUD EXTRAS", 20)

;===================================================================================================
%choice_here("Health display", !config_heart_display, 2)
	%list_item("Numerical")
	%list_item("Vanilla")

;===================================================================================================
%choice_here("Input display", !config_input_display, 4)
	%list_item("Off")
	%list_item("Graphical")
	%list_item("Classic")
	%list_item("Classic Gray")

;===================================================================================================
!sentry_count = 20
%choice("Sentry 1", !config_sentry1, !sentry_count, sentry_names)
%choice("Sentry 2", !config_sentry2, !sentry_count, sentry_names)
%choice("Sentry 3", !config_sentry3, !sentry_count, sentry_names)
%choice("Sentry 4", !config_sentry4, !sentry_count, sentry_names)
%choice("Sentry 5", !config_sentry5, !sentry_count, sentry_names)

#sentry_address:
	fillword $001A : fill !sentry_count*2

!sentryid = -1
macro new_sentry(addr, name)
	!sentryid #= !sentryid+1
	%list_item("<name>")
	pushpc
	org sentry_address+!sentryid*2
	dw <addr>
	pullpc

endmacro

#sentry_names:
%list_header(!sentry_count)
	%new_sentry($001A, "Off")
	%new_sentry($001A, "Room time")
	%new_sentry($001A, "Lag")
	%new_sentry($001A, "Idle")
	%new_sentry($001A, "Segment")
	%new_sentry($001A, "Coordinates")
	%new_sentry($002A, "Subpixels")
	%new_sentry($001A, "Room ID")
	%new_sentry($00A9, "Quadrant")
	%new_sentry($008A, "Screen ID")
	%new_sentry($0114, "Tile (UW)")
	%new_sentry($00EC, "Tile index")
	%new_sentry($02A2, "Spooky")
	%new_sentry($0B08, "Arc variable")
	%new_sentry($0690, "WEST SOMARIA")
	%new_sentry($03C4, "Anc index")
	%new_sentry($039D, "Hookslot")
	%new_sentry($C000, "Pits")
	%new_sentry($0E50, "Boss HP")
	%new_sentry($0374, "Hovering")

#reinit_sentry_addresses:
	REP #$30

	PHB
	PHK
	PLB

	LDX.w #$0008

--	LDA.w !config_sentry1,X
	ASL
	TAY
	LDA.w sentry_address,Y
	STA.w SA1IRAM.SNTADD1,X
	DEX
	DEX
	BPL --

	SEP #$30

	LDA.w !config_linesentry1
	ORA.w !config_linesentry2
	ORA.w !config_linesentry3
	ORA.w !config_linesentry4
	CMP.b #$01
	LDA.b #$00
	ROR
	STA.b !config_extra_sa1_required

	PLB
	RTL

;===================================================================================================
!linesentry_count = 9
%choice("Line 1", !config_linesentry1, !linesentry_count, linesentry_names)
%choice("Line 2", !config_linesentry2, !linesentry_count, linesentry_names)
%choice("Line 3", !config_linesentry3, !linesentry_count, linesentry_names)
%choice("Line 4", !config_linesentry4, !linesentry_count, linesentry_names)

#linesentry_names:
%list_header(!linesentry_count)
	%list_item("Off")
	%list_item("Room flags")
	%list_item("UW Camera X")
	%list_item("UW Camera Y")
	%list_item("OW Trans X")
	%list_item("OW Trans Y")
	%list_item("Ancilla 0-4")
	%list_item("Ancilla 5-9")
	%list_item("Ancilla MSX")

;===================================================================================================
!ancprop_count = 10
%choice("Ancilla prop 1", !config_ancprop1, !ancprop_count, ancprop_names)
%choice("Ancilla prop 2", !config_ancprop2, !ancprop_count, ancprop_names)
%choice("Ancilla prop 3", !config_ancprop3, !ancprop_count, ancprop_names)
%choice("Ancilla prop 4", !config_ancprop4, !ancprop_count, ancprop_names)

#ancillawatch_props:
	fillword $0C4A : fill !ancprop_count*2

!ancsentryid = -1
macro new_ancprop(addr, name)
	!ancsentryid #= !ancsentryid+1
	%list_item("<name>")
	pushpc
	org ancillawatch_props+!ancsentryid*2
	dw <addr>
	pullpc

endmacro

#ancprop_names:
%list_header(!ancprop_count)
	%new_ancprop($0C4A, "ID")
	%new_ancprop($0C04, "X coord")
	%new_ancprop($0BFA, "Y coord")
	%new_ancprop($029E, "Altitude")
	%new_ancprop($0C7C, "Layer")
	%new_ancprop($0C5E, "Extension")
	%new_ancprop($03E4, "Tile prop")
	%new_ancprop($03A4, "EG check")
	%new_ancprop($0C72, "Direction")
	%new_ancprop($03B1, "Decay")

;===================================================================================================

%toggle_onoff("Hide lines", !config_hide_lines)

%toggle_onoff("HUD lag", !config_hudlag_spinner)

%toggle_onoff("State icons", !config_state_icons)

%toggle_onoff("Quick warp", !config_qw_toggle)

%toggle_onoff("Boss cycles", !config_toggle_boss_cycles)
