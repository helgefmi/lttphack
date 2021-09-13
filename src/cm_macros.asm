!NUMBER_OF_COMMANDS = 80
!COMMAND_ID = -1

!CM_HEADER_ID = 0

!LIST_ITEM = -1

!LAST_HEADER_SIZE = 0
!MENU_ITEM = 0
!LAST_HEADER = "OOPS"

this = 0
macro menu_header(name, size)
	if !MENU_ITEM < !LAST_HEADER_SIZE
		error "!LAST_HEADER has too few items !MENU_ITEM < !LAST_HEADER_SIZE"
	endif

	!LAST_HEADER_SIZE = <size>
	!MENU_ITEM = 0
.name_pointers
	dw .header_text
	fillword EMPTY_THING : fill <size>*2
	dw 0

.header_text
	db "<name>", $FF

	!CM_HEADER_ID #= !CM_HEADER_ID+1
	!LAST_HEADER = "<name>"

endmacro

macro add_self()
	%add_menu_item(++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
endmacro

macro add_menu_item(label)
	!MENU_ITEM #= !MENU_ITEM+1

	if !MENU_ITEM > !LAST_HEADER_SIZE
		error "!LAST_HEADER has too many items\! !MENU_ITEM > !LAST_HEADER_SIZE"
	endif

	pushpc
	org .name_pointers+(!MENU_ITEM*2) : dw <label>
	pullpc

.ITEM_!{CM_HEADER_ID}_!{MENU_ITEM}

endmacro

;===================================================================================================

!LIST_HEADER_ID = 0
!LAST_LIST_SIZE = 0
macro list_header(size)
.LIST_HEADER!LIST_HEADER_ID
	!LIST_ITEM = 0
..table
	fillword $0000 : fill <size>*2

	!LIST_HEADER_ID #= !LIST_HEADER_ID+1
	!LAST_LIST_SIZE = <size>
endmacro

macro add_list_item(l)
	!LIST_ITEM #= !LIST_ITEM+1
	if !LIST_ITEM > !LAST_LIST_SIZE
			error "Too many items\! !LIST_ITEM > !LAST_LIST_SIZE"
	endif

	pushpc
	org ..table-2+(!LIST_ITEM*2) : dw <l>
	pullpc
endmacro

macro list_item(text)
	%add_list_item(++++)

++++
	db "<text>", $FF
endmacro

;===================================================================================================
; Each command is defined here so that everything is organized automatically
; ADDRESS_TEXT should always follow ADDRESS
; Except for NUMFIELD ranges and CHOICE list size
; FUNC should always be last
;===================================================================================================
ActionLengths:
	fillbyte 0 : fill !NUMBER_OF_COMMANDS

ActionIcons:
	fillbyte 0 : fill !NUMBER_OF_COMMANDS

ActionDoRoutines:
	fillword ACTION_EXIT : fill !NUMBER_OF_COMMANDS*2

ActionDrawRoutines:
	fillword ACTION_EXIT-1 : fill !NUMBER_OF_COMMANDS*2

macro MenuAction(name, args, icon)
	!COMMAND_ID #= !COMMAND_ID+1
	!CM_<name> := !COMMAND_ID

	if greaterequal(!COMMAND_ID,!NUMBER_OF_COMMANDS)
		error "Too many commands\! !COMMAND_ID >= !NUMBER_OF_COMMANDS"
	endif

	org ActionLengths+!COMMAND_ID : db <args> ; includes the ID byte
	org ActionIcons+!COMMAND_ID : db <icon>
	org ActionDoRoutines+(2*!COMMAND_ID) : dw CMDO_<name>
	org ActionDrawRoutines+(2*!COMMAND_ID) : dw CMDRAW_<name>-1
endmacro

pushpc

;---------------------------------------------------------------------------------------------------
%MenuAction("HEADER", 0, $2F)

;---------------------------------------------------------------------------------------------------
; leave UW after header, so it can go right to preset type
%MenuAction("PRESET_UW", 3, $6E)
macro preset_UW(name, category, segment, scene)
	%preset("UW", "<name>", "<category>", "<segment>", "<scene>")
endmacro

%MenuAction("PRESET_OW", 3, $6E)
macro preset_OW(name, category, segment, scene)
	%preset("OW", "<name>", "<category>", "<segment>", "<scene>")
endmacro

macro preset(type, name, category, segment, scene)
#presetmenu_<category>_<segment>_<scene>:
	%add_self()
	db !CM_PRESET_<type>
	dw presetdata_<category>_<segment>_<scene>
	db "<name>", $FF

#presetdata_<category>_<segment>_<scene>:
	dw presetpersistent_<category>_<segment>_<scene>_end
	dw presetSRAM_<category>_<segment>_<scene>_end
endmacro

macro existing_preset(category, segment, scene)
	%add_menu_item(presetmenu_<category>_<segment>_<scene>)
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("LITESTATE", 2, $6E)
macro litestate(name, id)
	%add_self()
	db !CM_LITESTATE
	db <id>
	db "<name>", $FF
endmacro


;---------------------------------------------------------------------------------------------------
%MenuAction("LABEL", 1, $2F)
macro label(name)
	%add_self()
	db !CM_LABEL
	db "<name>", $FF
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("TOGGLE", 3, $6B)
macro toggle(name, addr)
	%add_self()
	db !CM_TOGGLE
	dw <addr>
	db "<name>", $FF
endmacro

%MenuAction("TOGGLE_LONG", 4, $6B)
macro toggle_long(name, addr)
	%add_self()
	db !CM_TOGGLE_LONG
	dl <addr>
	db "<name>", $FF
endmacro

%MenuAction("TOGGLE_FUNC", 6, $6B)
macro toggle_func(name, addr, func)
	%add_self()
	db !CM_TOGGLE_FUNC
	dw <addr>
	dl select(equal(<func>,this), ?here, <func>)
	db "<name>", $FF

#?here:
endmacro

%MenuAction("TOGGLE_CUSTOMTEXT", 6, $6B)
macro toggle_customtext(name, addr, addrtext)
	%add_self()
	db !CM_TOGGLE_CUSTOMTEXT
	dw <addr>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

macro toggle_customtext_here(name, addr)
	%toggle_customtext(<name>, <addr>, this)
	%list_header(2)
endmacro

%MenuAction("TOGGLE_FUNC_CUSTOMTEXT", 9, $6B)
macro toggle_func_customtext(name, addr, func, addrtext)
	%add_self()
	db !CM_TOGGLE_FUNC_CUSTOMTEXT
	dw <addr>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	dl <func>
	db "<name>", $FF

#?here:
endmacro

macro toggle_func_customtext_here(name, addr, func)
	%toggle_func_customtext(<name>, <addr>, <func>, this)
	%list_header(2)
endmacro

%MenuAction("TOGGLE_LONG_FUNC", 7, $6B)
macro toggle_long_func(name, addr, func)
	%add_self()
	db !CM_TOGGLE_LONG_FUNC
	dl <addr>
	dl select(equal(<func>,this), ?here, <func>)
	db "<name>", $FF

#?here:
endmacro

%MenuAction("TOGGLE_LONG_FUNC_CUSTOMTEXT", 10, $6B)
macro toggle_long_func_customtext(name, addr, func, addrtext)
	%add_self()
	db !CM_TOGGLE_LONG_FUNC_CUSTOMTEXT
	dl <addr>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	dl <func>
	db "<name>", $FF

#?here:
endmacro

macro toggle_long_func_customtext_here(name, addr, func)
	%toggle_long_func_customtext(<name>, <addr>, <func>, this)
	%list_header(2)
endmacro

%MenuAction("TOGGLE_ROOMFLAG", 2, $6B)
macro toggle_roomflag(name, bit)
	%add_self()
	db !CM_TOGGLE_ROOMFLAG
	db <bit>
	db "<name>", $FF

#?here:
endmacro

;---------------------------------------------------------------------------------------------------
macro toggle_onoff(name, addr)
	;%toggle_customtext(<name>, <addr>, CMDRAW_ONOFF)
	%toggle(<name>, <addr>)
endmacro

macro toggle_func_onoff(name, addr, func)
	;%toggle_func_customtext(<name>, <addr>, <func>, CMDRAW_ONOFF)
	%toggle_func(<name>, <addr>, <func>)
endmacro

macro toggle_func_onoff_here(name, addr)
	;%toggle_func_customtext(<name>, <addr>, ?here, CMDRAW_ONOFF)
	%toggle_func(<name>, <addr>, ?here)
#?here:
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("SUBMENU", 4, $69)
macro submenu(name, addr)
	%add_self()
	db !CM_SUBMENU
	dl <addr>
	db "<name>", $FF
endmacro

%MenuAction("SUBMENU_VARIABLE", 4, $69)
macro submenu_variable(name, addr)
	%add_self()
	db !CM_SUBMENU_VARIABLE
	dl select(equal(<addr>,this), ?here, <addr>)
	db "<name>", $FF

#?here:
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("NUMFIELD", 6, $6D)
macro numfield(name, addr, start, end, increment)
	%add_self()
	db !CM_NUMFIELD
	dw <addr>
	db <start>, <end>, <increment>
	db "<name>", $FF
endmacro

%MenuAction("NUMFIELD_HEX", 6, $6D)
macro numfield_hex(name, addr, start, end, increment)
	%add_self()
	db !CM_NUMFIELD_HEX
	dw <addr>
	db <start>, <end>, <increment>
	db "<name>", $FF
endmacro

%MenuAction("NUMFIELD_HEX_UPDATEWHOLEMENU", 6, $6D)
macro numfield_hex_update(name, addr, start, end, increment)
	%add_self()
	db !CM_NUMFIELD_HEX_UPDATEWHOLEMENU
	dw <addr>
	db <start>, <end>, <increment>
	db "<name>", $FF
endmacro

%MenuAction("NUMFIELD_LONG", 7, $6D)
macro numfield_long(name, addr, start, end, increment)
	%add_self()
	db !CM_NUMFIELD_LONG
	dl <addr>
	db <start>, <end>, <increment>
	db "<name>", $FF
endmacro

%MenuAction("NUMFIELD_LONG_2DIGITS", 7, $6D)
macro numfield_long_2digits(name, addr, start, end, increment)
	%add_self()
	db !CM_NUMFIELD_LONG_2DIGITS
	dl <addr>
	db <start>, <end>, <increment>
	db "<name>", $FF
endmacro

%MenuAction("NUMFIELD_LONG_HEX", 7, $6D)
macro numfield_long_hex(name, addr, start, end, increment)
	%add_self()
	db !CM_NUMFIELD_LONG_HEX
	dl <addr>
	db <start>, <end>, <increment>
	db "<name>", $FF
endmacro

%MenuAction("NUMFIELD_FUNC", 9, $6D)
macro numfield_func(name, addr, start, end, increment, func)
	%add_self()
	db !CM_NUMFIELD_FUNC
	dw <addr>
	db <start>, <end>, <increment>
	dl select(equal(<func>,this), ?here, <func>)
	db "<name>", $FF
#?here:
endmacro

%MenuAction("NUMFIELD_FUNC_HEX", 9, $6D)
macro numfield_func_hex(name, addr, start, end, increment, func)
	%add_self()
	db !CM_NUMFIELD_FUNC_HEX
	dw <addr>
	db <start>, <end>, <increment>
	dl select(equal(<func>,this), ?here, <func>)
	db "<name>", $FF
#?here:
endmacro

%MenuAction("NUMFIELD_FUNC_PRGTEXT", 12, $6D)
macro numfield_func_prgtext(name, addr, start, end, increment, func, text)
	%add_self()
	db !CM_NUMFIELD_FUNC_PRGTEXT
	dw <addr>
	db <start>, <end>, <increment>
	dl select(equal(<func>,this), ?here, <func>)
	dl <text>
	db "<name>", $FF

#?here:
endmacro

%MenuAction("NUMFIELD_LONG_FUNC", 10, $6D)
macro numfield_long_func(name, addr, start, end, increment, func)
	%add_self()
	db !CM_NUMFIELD_LONG_FUNC
	dl <addr>
	db <start>, <end>, <increment>
	dl select(equal(<func>,this), ?here, <func>)
	db "<name>", $FF
#?here:
endmacro

%MenuAction("NUMFIELD_LONG_FUNC_HEX", 10, $6D)
macro numfield_long_func_hex(name, addr, start, end, increment, func)
	%add_self()
	db !CM_NUMFIELD_LONG_FUNC_HEX
	dl <addr>
	db <start>, <end>, <increment>
	dl select(equal(<func>,this), ?here, <func>)
	db "<name>", $FF
#?here:
endmacro

%MenuAction("NUMFIELD_LONG_FUNC_PRGTEXT", 13, $6D)
macro numfield_long_func_prgtext(name, addr, start, end, increment, func, text)
	%add_self()
	db !CM_NUMFIELD_LONG_FUNC_PRGTEXT
	dl <addr>
	db <start>, <end>, <increment>
	dl select(equal(<func>,this), ?here, <func>)
	dl <text>
	db "<name>", $FF

#?here:
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("TOGGLE_BIT0", 3, $6B)
%MenuAction("TOGGLE_BIT1", 3, $6B)
%MenuAction("TOGGLE_BIT2", 3, $6B)
%MenuAction("TOGGLE_BIT3", 3, $6B)
%MenuAction("TOGGLE_BIT4", 3, $6B)
%MenuAction("TOGGLE_BIT5", 3, $6B)
%MenuAction("TOGGLE_BIT6", 3, $6B)
%MenuAction("TOGGLE_BIT7", 3, $6B)
macro toggle_bit(name, addr, bitx)
	%add_self()
	db !CM_TOGGLE_BIT<bitx>
	dw <addr>
	db "<name>", $FF
endmacro

%MenuAction("TOGGLE_BIT0_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT1_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT2_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT3_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT4_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT5_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT6_CUSTOMTEXT", 6, $6B)
%MenuAction("TOGGLE_BIT7_CUSTOMTEXT", 6, $6B)
macro toggle_bit_customtext(name, addr, bitx, addrtext)
	%add_self()
	db !CM_TOGGLE_BIT<bitx>_CUSTOMTEXT
	dw <addr>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

macro toggle_bit_customtext_here(name, addr, bitx)
	%toggle_bit_customtext(<name>, <addr>, <bitx>, this)
	%list_header(2)
endmacro

%MenuAction("TOGGLE_BIT0_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT1_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT2_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT3_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT4_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT5_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT6_LONG", 4, $6B)
%MenuAction("TOGGLE_BIT7_LONG", 4, $6B)
macro toggle_bit_long(name, addr, bitx)
	%add_self()
	db !CM_TOGGLE_BIT<bitx>_LONG
	dl <addr>
	db "<name>", $FF
endmacro

%MenuAction("TOGGLE_BIT0_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT1_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT2_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT3_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT4_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT5_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT6_LONG_CUSTOMTEXT", 7, $6B)
%MenuAction("TOGGLE_BIT7_LONG_CUSTOMTEXT", 7, $6B)
macro toggle_bit_long_customtext(name, addr, bitx, addrtext)
	%add_self()
	db !CM_TOGGLE_BIT<bitx>_LONG_CUSTOMTEXT
	dl <addr>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

macro toggle_bit_long_customtext_here(name, addr, bitx)
	%toggle_bit_long_customtext(<name>, <addr>, <bitx>, this)
	%list_header(2)
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("FUNC", 4, $6A)
macro func(name, addr)
	%add_self()
	db !CM_FUNC
	dl select(equal(<addr>,this), ?here, <addr>)
	db "<name>", $FF

#?here:
endmacro

; this one is a bit more special and does some register fixing before going
%MenuAction("FUNC_FILTERED", 4, $6A)
macro func_filtered(name, addr)
	%add_self()
	db !CM_FUNC_FILTERED
	dl select(equal(<addr>,this), ?here, <addr>)
	db "<name>", $FF

#?here:
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("CTRL_SHORTCUT", 3, $6F)
macro ctrl_shortcut(name, addr)
	%add_self()
	db !CM_CTRL_SHORTCUT
	dw <addr>
	db "<name>", $FF
endmacro

%MenuAction("CTRL_SHORTCUT_FINAL", 4, $6F)
macro ctrl_shortcut_final(name, addr)
	%add_self()
	db !CM_CTRL_SHORTCUT_FINAL
	dl <addr>
	db "<name>", $FF
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("CHOICE", 7, $6C)
macro choice(name, addr, max, addrtext)
	%add_self()
	db !CM_CHOICE
	dw <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

macro choice_here(name, addr, max)
	%choice(<name>, <addr>, <max>, this)
	%list_header(<max>)
endmacro

%MenuAction("CHOICE_LONG", 8, $6C)
macro choice_long(name, addr, max, addrtext)
	%add_self()
	db !CM_CHOICE_LONG
	dl <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

macro choice_long_here(name, addr, max)
	%choice_long(<name>, <addr>, <max>, this)
	%list_header(<max>)
endmacro

; for text that can be programmatically decided
%MenuAction("CHOICE_PRGTEXT", 7, $6C)
macro choice_prgtext(name, addr, max, addrtext)
	%add_self()
	db !CM_CHOICE_PRGTEXT
	dw <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

; for text that can be programmatically decided
%MenuAction("CHOICE_LONG_PRGTEXT", 8, $6C)
macro choice_long_prgtext(name, addr, max, addrtext)
	%add_self()
	db !CM_CHOICE_LONG_PRGTEXT
	dl <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

;---------------------------------------------------------------------------------------------------
%MenuAction("CHOICE_FUNC", 10, $6C)
macro choice_func(name, addr, max, func, addrtext)
	%add_self()
	db !CM_CHOICE_FUNC
	dw <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	dl <func>
	db "<name>", $FF

#?here:
endmacro

macro choice_func_here(name, addr, max, func)
	%choice_func(<name>, <addr>, <max>, <func>, this)
	%list_header(<max>)
endmacro

%MenuAction("CHOICE_LONG_FUNC", 11, $6C)
macro choice_long_func(name, addr, max, func, addrtext)
	%add_self()
	db !CM_CHOICE_LONG_FUNC
	dl <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	dl <func>
	db "<name>", $FF

#?here:
endmacro

macro choice_long_func_here(name, addr, max, func)
	%choice_long_func(<name>, <addr>, <max>, <func>, this)
	%list_header(<max>)
endmacro

%MenuAction("CHOICE_LONG_FUNC_FILTERED", 11, $6C)
macro choice_long_func_filtered(name, addr, max, func, addrtext)
	%add_self()
	db !CM_CHOICE_LONG_FUNC_FILTERED
	dl <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	dl <func>
	db "<name>", $FF

#?here:
endmacro

macro choice_long_func_filtered_here(name, addr, max, func)
	%choice_long_func_filtered(<name>, <addr>, <max>, <func>, this)
	%list_header(<max>)
endmacro

; for text that can be programmatically decided
%MenuAction("CHOICE_FUNC_PRGTEXT", 10, $6C)
macro choice_func_prgtext(name, addr, max, func, addrtext)
	%add_self()
	db !CM_CHOICE_FUNC_PRGTEXT
	dw <addr>
	db <max>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	dl <func>
	db "<name>", $FF

#?here:
endmacro

; for text that can be programmatically decided
%MenuAction("CHOICE_LONG_FUNC_PRGTEXT", 11, $6C)
macro choice_long_func_prgtext(name, addr,  max, func, addrtext)
	%add_self()
	db !CM_CHOICE_LONG_FUNC_PRGTEXT
	dl <addr>
	db <max>
	dl <func>
	dl select(equal(<addrtext>,this), ?here, <addrtext>)
	db "<name>", $FF

#?here:
endmacro

;===================================================================================================
; END OF COMMAND DEFINITIONS
;===================================================================================================

pullpc
EMPTY_THING:
	dw "TEST", $FF
