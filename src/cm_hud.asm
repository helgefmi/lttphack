HUDEXTRAS_SUBMENU:
	%menu_header("HUD EXTRAS", 16)

;===================================================================================================
%choice_here("Health display", !ram_heart_display, 2)
	%list_item("Numerical")
	%list_item("Vanilla")

;===================================================================================================
%choice_here("Input display", !ram_input_display, 4)
	%list_item("Off")
	%list_item("Graphical")
	%list_item("Classic")
	%list_item("Classic Gray")

;===================================================================================================
!counter_count = 17
%choice("Counter 1", !ram_counter1, !counter_count, counter_names)
%choice("Counter 2", !ram_counter2, !counter_count, counter_names)
%choice("Counter 3", !ram_counter3, !counter_count, counter_names)
%choice("Counter 4", !ram_counter4, !counter_count, counter_names)
%choice("Counter 5", !ram_counter5, !counter_count, counter_names)

#counter_address:
	fillword $001A : fill !counter_count*2

!counterid = -1
macro new_counter(addr, name)
	!counterid #= !counterid+1
	%list_item("<name>")
	pushpc
	org counter_address+!counterid*2
	dw <addr>
	pullpc

endmacro

#counter_names:
%list_header(!counter_count)
	%new_counter($001A, "Off")
	%new_counter($001A, "Room time")
	%new_counter($001A, "Lag")
	%new_counter($001A, "Idle")
	%new_counter($001A, "Segment")
	%new_counter($001A, "Coordinates")
	%new_counter($002A, "Subpixels")
	%new_counter($001A, "Room ID")
	%new_counter($00A9, "Quadrant")
	%new_counter($0114, "Tile")
	%new_counter($02A2, "Spooky")
	%new_counter($0B08, "Arc variable")
	%new_counter($0690, "WEST SOMARIA")
	%new_counter($03C4, "Anc index")
	%new_counter($039D, "Hookslot")
	%new_counter($C000, "Pits")
	%new_counter($0E50, "Boss HP")

#reinit_counteraddr:
	REP #$30

	PHB
	PHK
	PLB
	LDX.w #$0008

--	LDA.w !ram_counter1,X
	ASL
	TAY
	LDA.w counter_address,Y
	STA.w SA1IRAM.CNTADD1,X
	DEX
	DEX
	BPL --

	SEP #$30

	LDA.w !ram_linecounter1
	ORA.w !ram_linecounter2
	ORA.w !ram_linecounter3
	ORA.w !ram_linecounter4
	CMP.b #$01
	LDA.b #$00
	ROR
	STA.b !ram_extra_sa1_required

	PLB
	RTL

;===================================================================================================
!linecounter_count = 7
%choice("Line 1", !ram_linecounter1, !linecounter_count, linecounter_names)
%choice("Line 2", !ram_linecounter2, !linecounter_count, linecounter_names)
%choice("Line 3", !ram_linecounter3, !linecounter_count, linecounter_names)

#linecounter_names:
%list_header(!linecounter_count)
	%list_item("Off")
	%list_item("Room flags")
	%list_item("Camera X")
	%list_item("Camera Y")
	%list_item("Ancilla 0-4")
	%list_item("Ancilla 5-9")
	%list_item("Ancilla IXd")

;===================================================================================================
!ancprop_count = 12
%choice("Ancilla prop 1", !ram_ancprop1, !ancprop_count, ancprop_names)
%choice("Ancilla prop 2", !ram_ancprop2, !ancprop_count, ancprop_names)
%choice("Ancilla prop 3", !ram_ancprop3, !ancprop_count, ancprop_names)

#ancillawatch_props:
	fillword $0C4A : fill !ancprop_count*2

!anccounterid = -1
macro new_ancprop(addr, name)
	!anccounterid #= !anccounterid+1
	%list_item("<name>")
	pushpc
	org ancillawatch_props+!anccounterid*2
	dw <addr>
	pullpc

endmacro

#ancprop_names:
%list_header(!ancprop_count)
	%new_ancprop($0C4A, "ID")
	%new_ancprop($0BFA, "Y coord")
	%new_ancprop($0C04, "X coord")
	%new_ancprop($029E, "Altitude")
	%new_ancprop($0C7C, "Layer")
	%new_ancprop($0C5E, "Extension")
	%new_ancprop($03E4, "Tile prop")
	%new_ancprop($03A4, "EG check")
	%new_ancprop($0C72, "Direction")
	%new_ancprop($0BFA, "Delta X")
	%new_ancprop($0C04, "Delta Y")
	%new_ancprop($0BFA, "Delta X")

;===================================================================================================
%toggle_onoff("Heart lag", !ram_heartlag_spinner)

;===================================================================================================
%toggle_onoff("QW indicator", !ram_qw_toggle)

;===================================================================================================
%toggle_onoff("Lanmola cycs", !ram_toggle_lanmola_cycles)
