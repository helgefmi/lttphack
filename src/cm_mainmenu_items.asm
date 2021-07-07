; ITEMS {{{

cm_main_goto_items:
	%cm_submenu("Items", cm_submenu_items)

cm_submenu_items:
	dw cm_items_bow
	dw cm_items_boom
	dw cm_items_hook
	dw cm_equipment_bombs
	dw cm_items_powder
	dw cm_items_fire_rod
	dw cm_items_ice_rod
	dw cm_items_bombos
	dw cm_items_ether
	dw cm_items_quake
	dw cm_items_lantern
	dw cm_items_hammer
	dw cm_items_flute
	dw cm_items_net
	dw cm_items_book
	dw cm_items_submenu_bottles
	dw cm_items_somaria
	dw cm_items_byrna
	dw cm_items_cape
	dw cm_items_mirror
	dw !menu_end
	%cm_header("ITEMS")

cm_items_bow:
	dw !CM_ACTION_CHOICE_JSR
	dw #.set_ram_value
	dl #!ram_cm_item_bow
	%cm_item("Bow")
	%cm_item("No")
	%cm_item("Normal")
	%cm_item("Silver")
	db !list_end

.set_ram_value
	; 0 = No bow
	; 1/2 = Normal bow without/with arrows
	; 3/4 = Silver bow without/with arrows
	ASL : TAX : BEQ .end

	LDA !ram_equipment_arrows : BNE .end
	DEX
.end
	TXA : STA !ram_item_bow
	RTS

cm_items_boom:
	dw !CM_ACTION_CHOICE
	dl #!ram_item_boom
	%cm_item("Boomerang")
	%cm_item("No")
	%cm_item("Blue")
	%cm_item("Red")
	db !list_end

cm_items_hook:
	%cm_toggle("Hookshot", !ram_item_hook)

cm_items_powder:
	dw !CM_ACTION_CHOICE
	dl #!ram_item_powder
	%cm_item("Powder")
	%cm_item("No")
	%cm_item("Shroom")
	%cm_item("Powder")
	db !list_end

cm_items_fire_rod:
	%cm_toggle("Fire rod", !ram_item_fire_rod)

cm_items_ice_rod:
	%cm_toggle("Ice rod", !ram_item_ice_rod)

cm_items_bombos:
	%cm_toggle("Bombos", !ram_item_bombos)

cm_items_ether:
	%cm_toggle("Ether", !ram_item_ether)

cm_items_quake:
	%cm_toggle("Quake", !ram_item_2quake)

cm_items_lantern:
	%cm_toggle("Lantern", !ram_item_lantern)

cm_items_hammer:
	%cm_toggle("Hammer", !ram_item_hammer)

cm_items_flute:
	dw !CM_ACTION_CHOICE
	dl #!ram_item_flute
	%cm_item("Flute")
	%cm_item("No")
	%cm_item("Shovel")
	%cm_item("Flute (off)")
	%cm_item("Flute")
	db !list_end

cm_items_net:
	%cm_toggle("Net", !ram_item_net)

cm_items_book:
	%cm_toggle("Book", !ram_item_book)

cm_items_somaria:
	%cm_toggle("Somaria", !ram_item_somaria)

cm_items_byrna:
	%cm_toggle("Byrna", !ram_item_byrna)

cm_items_cape:
	%cm_toggle("Cape", !ram_item_cape)

cm_items_mirror:
	%cm_toggle_jsr("Mirror", !ram_cm_item_mirror)

.toggle
	; 0 -> 2
	ASL : STA !ram_item_mirror
	RTS

; Bottles submenu

cm_items_submenu_bottles:
	%cm_submenu("Bottles", cm_submenu_bottles)

cm_submenu_bottles:
	dw cm_items_bottle_1
	dw cm_items_bottle_2
	dw cm_items_bottle_3
	dw cm_items_bottle_4
	dw !menu_end
	%cm_header("BOTTLES")

macro bottle_contents()
	%cm_item("No bottle")
	%cm_item("Shroooom")
	%cm_item("Empty")
	%cm_item("Red")
	%cm_item("Green")
	%cm_item("Blue")
	%cm_item("Fairy")
	%cm_item("Bee")
	%cm_item("Golden bee")
	db !list_end
endmacro

cm_items_bottle_1:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array
	%cm_item("Bottle 1")
	%bottle_contents()

cm_items_bottle_2:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array+1
	%cm_item("Bottle 2")
	%bottle_contents()

cm_items_bottle_3:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array+2
	%cm_item("Bottle 3")
	%bottle_contents()

cm_items_bottle_4:
	dw !CM_ACTION_CHOICE
	dl !ram_item_bottle_array+3
	%cm_item("Bottle 4")
	%bottle_contents()

; }}}