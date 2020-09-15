; RNG CONTROL {{{

cm_main_goto_rng_control:
	%cm_submenu("RNG control", cm_submenu_rng_control)

cm_submenu_rng_control:
	dw cm_rng_drops
	dw cm_rng_framerule
	dw cm_rng_pokey
	dw cm_rng_agahnim
	dw cm_rng_helmasaur
	dw cm_rng_vitreous
	dw cm_rng_ganon_warp
	dw cm_rng_ganon_warp_location
	dw cm_rng_eyegore
	dw cm_rng_arrghus
	dw cm_rng_turtles
	dw cm_rng_lanmola
	dw cm_rng_conveyor
	dw !menu_end
	%cm_header("RNG CONTROL")

cm_rng_pokey:
	dw !CM_ACTION_CHOICE
	dl !ram_pokey_rng
	%cm_item("Pokeys")
	%cm_item("Random")
	%cm_item("ul ul")
	%cm_item("ur ul")
	%cm_item("dr ul")
	%cm_item("dl ul")
	%cm_item("ul ur")
	%cm_item("ur ur")
	%cm_item("dr ur")
	%cm_item("dl ur")
	%cm_item("ul dr")
	%cm_item("ur dr")
	%cm_item("dr dr")
	%cm_item("dl dr")
	%cm_item("ul dl")
	%cm_item("ur dl")
	%cm_item("dr dl")
	%cm_item("dl dl")
	db !list_end

cm_rng_agahnim:
	dw !CM_ACTION_CHOICE
	dl !ram_agahnim_rng
	%cm_item("Agahnim")
	%cm_item("Random")
	%cm_item("Yellow")
	%cm_item("Blue")
	db !list_end

cm_rng_helmasaur:
	dw !CM_ACTION_CHOICE
	dl !ram_helmasaur_rng
	%cm_item("Helmasaur")
	%cm_item("Random")
	%cm_item("No fireball")
	%cm_item("Fireball")
	db !list_end

cm_rng_ganon_warp:
	dw !CM_ACTION_CHOICE
	dl !ram_ganon_warp_rng
	%cm_item("Ganon warps")
	%cm_item("Random")
	%cm_item("No warp")
	%cm_item("Warp")
	db !list_end

cm_rng_ganon_warp_location:
	dw !CM_ACTION_CHOICE
	dl !ram_ganon_warp_location_rng
	%cm_item("Ganon warp to")
	%cm_item("Random")
	%cm_item("Far left")
	%cm_item("Bottom left")
	%cm_item("Bottom right")
	%cm_item("Far right")
	db !list_end

cm_rng_eyegore:
	dw !CM_ACTION_CHOICE
	dl !ram_eyegore_rng
	%cm_item("Eyegore walk")
	%cm_item("Random")
	%cm_item("Short")
	%cm_item("Medium")
	%cm_item("Long")
	db !list_end

cm_rng_arrghus:
	dw !CM_ACTION_CHOICE
	dl !ram_arrghus_rng
	%cm_item("Arrghus walk")
	%cm_item("Random")
	%cm_item("Shortest")
	%cm_item("Short")
	%cm_item("Medium")
	%cm_item("Long")
	%cm_item("Longest")
	db !list_end

cm_rng_turtles:
	dw !CM_ACTION_CHOICE
	dl !ram_turtles_rng
	%cm_item("Turtles walk")
	%cm_item("Random")
	%cm_item("Shortest")
	%cm_item("01")
	%cm_item("02")
	%cm_item("03")
	%cm_item("04")
	%cm_item("05")
	%cm_item("06")
	%cm_item("07")
	%cm_item("08")
	%cm_item("09")
	%cm_item("0A")
	%cm_item("0B")
	%cm_item("0C")
	%cm_item("0D")
	%cm_item("0E")
	%cm_item("0F")
	%cm_item("10")
	%cm_item("11")
	%cm_item("12")
	%cm_item("13")
	%cm_item("14")
	%cm_item("15")
	%cm_item("16")
	%cm_item("17")
	%cm_item("18")
	%cm_item("19")
	%cm_item("1A")
	%cm_item("1B")
	%cm_item("1C")
	%cm_item("1D")
	%cm_item("1E")
	%cm_item("Slowest")
	db !list_end

cm_rng_framerule:
	dw !CM_ACTION_CHOICE
	dl !ram_framerule
	%cm_item("Frame rule")
	%cm_item("Random")
	%cm_item("00")
	%cm_item("01")
	%cm_item("02")
	%cm_item("03")
	%cm_item("04")
	%cm_item("05")
	%cm_item("06")
	%cm_item("07")
	%cm_item("08")
	%cm_item("09")
	%cm_item("0A")
	%cm_item("0B")
	%cm_item("0C")
	%cm_item("0D")
	%cm_item("0E")
	%cm_item("0F")
	%cm_item("10")
	%cm_item("11")
	%cm_item("12")
	%cm_item("13")
	%cm_item("14")
	%cm_item("15")
	%cm_item("16")
	%cm_item("17")
	%cm_item("18")
	%cm_item("19")
	%cm_item("1A")
	%cm_item("1B")
	%cm_item("1C")
	%cm_item("1D")
	%cm_item("1E")
	%cm_item("1F")
	%cm_item("20")
	%cm_item("21")
	%cm_item("22")
	%cm_item("23")
	%cm_item("24")
	%cm_item("25")
	%cm_item("26")
	%cm_item("27")
	%cm_item("28")
	%cm_item("29")
	%cm_item("2A")
	%cm_item("2B")
	%cm_item("2C")
	%cm_item("2D")
	%cm_item("2E")
	%cm_item("2F")
	%cm_item("30")
	%cm_item("31")
	%cm_item("32")
	%cm_item("33")
	%cm_item("34")
	%cm_item("35")
	%cm_item("36")
	%cm_item("37")
	%cm_item("38")
	%cm_item("39")
	%cm_item("3A")
	%cm_item("3B")
	%cm_item("3C")
	%cm_item("3D")
	%cm_item("3E")
	%cm_item("3F")
	db !list_end

cm_rng_lanmola:
	dw !CM_ACTION_CHOICE
	dl !ram_lanmola_rng
	%cm_item("Lanmola exit")
	%cm_item("Random")
	%cm_item("0,0")
	%cm_item("0,1")
	%cm_item("0,2")
	%cm_item("0,3")
	%cm_item("0,4")
	%cm_item("0,5")
	%cm_item("0,6")
	%cm_item("0,7")
	%cm_item("1,0")
	%cm_item("1,1")
	%cm_item("1,2")
	%cm_item("1,3")
	%cm_item("1,4")
	%cm_item("1,5")
	%cm_item("1,6")
	%cm_item("1,7")
	%cm_item("2,0")
	%cm_item("2,1")
	%cm_item("2,2")
	%cm_item("2,3")
	%cm_item("2,4")
	%cm_item("2,5")
	%cm_item("2,6")
	%cm_item("2,7")
	%cm_item("3,0")
	%cm_item("3,1")
	%cm_item("3,2")
	%cm_item("3,3")
	%cm_item("3,4")
	%cm_item("3,5")
	%cm_item("3,6")
	%cm_item("3,7")
	%cm_item("4,0")
	%cm_item("4,1")
	%cm_item("4,2")
	%cm_item("4,3")
	%cm_item("4,4")
	%cm_item("4,5")
	%cm_item("4,6")
	%cm_item("4,7")
	%cm_item("5,0")
	%cm_item("5,1")
	%cm_item("5,2")
	%cm_item("5,3")
	%cm_item("5,4")
	%cm_item("5,5")
	%cm_item("5,6")
	%cm_item("5,7")
	%cm_item("6,0")
	%cm_item("6,1")
	%cm_item("6,2")
	%cm_item("6,3")
	%cm_item("6,4")
	%cm_item("6,5")
	%cm_item("6,6")
	%cm_item("6,7")
	%cm_item("7,0")
	%cm_item("7,1")
	%cm_item("7,2")
	%cm_item("7,3")
	%cm_item("7,4")
	%cm_item("7,5")
	%cm_item("7,6")
	%cm_item("7,7")
	db !list_end

cm_rng_conveyor:
	dw !CM_ACTION_CHOICE
	dl !ram_conveyor_rng
	%cm_item("Conveyor belt")
	%cm_item("Random")
	%cm_item("Right")
	%cm_item("Left")
	%cm_item("Down")
	%cm_item("Up")
	db !list_end

cm_rng_drops:
	dw !CM_ACTION_CHOICE
	dl !ram_drop_rng
	%cm_item("Prize packs")
	%cm_item("Vanilla")
	%cm_item("Always")
	%cm_item("Never")
	db !list_end

cm_rng_vitreous:
	dw !CM_ACTION_CHOICE
	dl !ram_vitreous_rng
	%cm_item("First Vitty")
	%cm_item("Random")
	%cm_item("Slot 5")
	%cm_item("Slot 6")
	%cm_item("Slot 7")
	%cm_item("Slot 8")
	%cm_item("Slot 9")
	%cm_item("Slot A")
	%cm_item("Slot B")
	%cm_item("Slot C")
	%cm_item("Slot D")
	db !list_end

; }}}