ITEMS_SUBMENU:
%menu_header("ITEMS", 23)
;===================================================================================================
%choice_func_here("Bow", SA1RAM.cm_item_bow, 3, cm_set_bow)
	%list_item("No")
	%list_item("Normal")
	%list_item("Silver")

#cm_set_bow:
	LDA.w SA1RAM.cm_item_bow
	ASL
	TAX
	BEQ ++

	LDA.l $7EF377
	BNE ++

	DEX

++	TXA
	STA.l $7EF340
	RTL

;===================================================================================================
%choice_long_here("Boomerang", $7EF341, 3)
	%list_item("No")
	%list_item("Blue")
	%list_item("Red")

;===================================================================================================
%toggle_long("Hookshot", $7EF342)

;===================================================================================================
#BOMBS_SETTER:
%numfield_long_2digits("Bombs", $7EF343, 0, 30, 5)

;===================================================================================================
%choice_long_here("Powder", $7EF344, 3)
	%list_item("No")
	%list_item("Shroom")
	%list_item("Powder")

;===================================================================================================
%toggle_long("Fire rod", $7EF345)

%toggle_long("Ice rod", $7EF346)

%toggle_long("Bombos", $7EF347)

%toggle_long("Ether", $7EF348)

%toggle_long("Quake", $7EF349)

;===================================================================================================
%toggle_long("Lamp", $7EF34A)
%toggle_long("Hammer", $7EF34B)

;===================================================================================================
%choice_long_here("Flute", $7EF34C, 4)
	%list_item("No")
	%list_item("Shovel")
	%list_item("Flute (off)")
	%list_item("Flute")

;===================================================================================================
%toggle_long("Net", $7EF34D)

%toggle_long("Book", $7EF34E)

;===================================================================================================
%choice_long("Bottle 1", $7EF35C, 9, bottle_items)

%choice_long("Bottle 2", $7EF35D, 9, bottle_items)

%choice_long("Bottle 3", $7EF35E, 9, bottle_items)

%choice_long("Bottle 4", $7EF35F, 9, bottle_items)

;===================================================================================================
%toggle_long("Somaria", $7EF350)

%toggle_long("Byrna", $7EF351)

%toggle_long("Cape", $7EF352)

%toggle_bit_long("Mirror", $7EF353, 1)

;===================================================================================================
#bottle_items:
%list_header(9)
	%list_item("No")
	%list_item("Shroooom")
	%list_item("Empty")
	%list_item("Red")
	%list_item("Green")
	%list_item("Blue")
	%list_item("Fairy")
	%list_item("Bee")
	%list_item("Golden bee")
