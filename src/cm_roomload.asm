ROOMLOAD_SUBMENU:
%menu_header("ROOM EDITOR", 10)

;===================================================================================================
%numfield_hex_update("Set room", SA1RAM.loadroomid, $00, $FF, $10)

;===================================================================================================

%func("Load Selected Room", this)
	REP #$30
	JSL CM_Exiting
	JML LoadArbitraryRoom