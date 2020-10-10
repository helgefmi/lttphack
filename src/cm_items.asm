ITEMS_SUBMENU:
%menu_header("ITEMS", 23)
;===================================================================================================
%choice_func_here("Bow", SA1RAM.cm_item_bow, 3, cm_set_bow)
	%list_item("No")
	%list_item("Normal")
	%list_item("Silver")

#cm_set_bow:
	ASL
	TAX
	BEQ ++

	LDA.l !ram_equipment_arrows
	BNE ++

	DEX

++	TXA
	STA.l !ram_item_bow
	RTL

;===================================================================================================
%choice_long_here("Boomerang", !ram_item_boom, 3)
	%list_item("No")
	%list_item("Blue")
	%list_item("Red")

;===================================================================================================
%toggle_long("Hookshot", !ram_item_hook)

;===================================================================================================
#BOMBS_SETTER:
%numfield_long_2digits("Bombs", !ram_item_bombs, 0, 30, 5)

;===================================================================================================
%choice_long_here("Powder", !ram_item_powder, 3)
	%list_item("No")
	%list_item("Shroom")
	%list_item("Powder")

;===================================================================================================
%toggle_long("Fire rod", !ram_item_fire_rod)
%toggle_long("Ice rod", !ram_item_ice_rod)
%toggle_long("Bombos", !ram_item_bombos)
%toggle_long("Ether", !ram_item_ether)
%toggle_long("Quake", !ram_item_quake)

;===================================================================================================
%toggle_long("Lamp", !ram_item_lantern)
%toggle_long("Hammer", !ram_item_hammer)

;===================================================================================================
%choice_long_here("Flute", !ram_item_flute, 4)
	%list_item("No")
	%list_item("Shovel")
	%list_item("Flute (off)")
	%list_item("Flute")

;===================================================================================================
%toggle_long("Net", !ram_item_net)
%toggle_long("Book", !ram_item_book)

;===================================================================================================
%choice_long("Bottle 1", !ram_item_bottle_1, 9, bottle_items)
%choice_long("Bottle 2", !ram_item_bottle_2, 9, bottle_items)
%choice_long("Bottle 3", !ram_item_bottle_3, 9, bottle_items)
%choice_long("Bottle 4", !ram_item_bottle_4, 9, bottle_items)

;===================================================================================================
%toggle_long("Somaria", !ram_item_somaria)
%toggle_long("Byrna", !ram_item_byrna)
%toggle_long("Cape", !ram_item_cape)
%toggle_bit_long("Mirror", !ram_item_mirror, 1)

;===================================================================================================
#bottle_items:
%list_header(9)
	%list_item("No bottle")
	%list_item("Shroooom")
	%list_item("Empty")
	%list_item("Red")
	%list_item("Green")
	%list_item("Blue")
	%list_item("Fairy")
	%list_item("Bee")
	%list_item("Golden bee")
