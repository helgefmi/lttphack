RNG_SUBMENU:
%menu_header("RNG CONTROL", 13)

;===================================================================================================
%choice_here("Prize packs", SA1RAM.drop_rng, 3)
	%list_item("Vanilla")
	%list_item("Always")
	%list_item("Never")

;===================================================================================================
%choice_prgtext("Frame rule", SA1RAM.framerule, $41, this)
	BEQ ++

	DEC
	JML CMDRAW_HEX_2_DIGITS

++	JML CMDRAW_UNFIXED

;===================================================================================================
%choice_prgtext("Pokeys", SA1RAM.pokey_rng, 17, this)
	BEQ ..random
	DEC

	REP #$21
	PHA

	AND.w #$0003 ; get for first pokey
	ASL ; multiply by 4 since that's the length of the string
	ASL

	ADC.w #..directions
	JSL CMDRAW_WORD_LONG_LONG

	PLA ; recover value
	AND.w #$00C0 ; the top 2 bits for second pokey, already shifted for us too!
	ADC.w #..directions ; carry should be clear always, I hope

	JSL CMDRAW_WORD_LONG_LONG
	RTL

..directions
	db "ul ", $FF
	db "ur ", $FF
	db "dr ", $FF
	db "dl ", $FF

..random
	JML CMDRAW_RANDOM

;===================================================================================================
%choice_here("Agahnim", SA1RAM.agahnim_rng, 3)
	%list_item("Random")
	%list_item("Yellow")
	%list_item("Blue")

;===================================================================================================
%choice_here("Helmasaur", SA1RAM.helmasaur_rng, 3)
	%list_item("Random")
	%list_item("No fireball")
	%list_item("Fireball")

;===================================================================================================
%choice_prgtext("First Vitty", SA1RAM.vitreous_rng, 10, this)
	BEQ ..random

	CLC
	AND.b #$0F
	ADC.b #4 ; slot 5 is a value of 1
	PHA

	REP #$20
	LDA.w #..slot ; draw the word slot
	JSL CMDRAW_WORD_LONG_LONG

	SEP #$20
	PLA
	JML CMDRAW_1_CHARACTER

..random
	JML CMDRAW_RANDOM

..slot
	db "Slot ", $FF ; with a space, yes

;===================================================================================================
%choice_here("Ganon warps", SA1RAM.ganon_warp_rng, 3)
	%list_item("Random")
	%list_item("No warp")
	%list_item("Warp")

;===================================================================================================
%choice_here("Ganon warp to", SA1RAM.ganon_warp_location_rng, 5)
	%list_item("Random")
	%list_item("Far left")
	%list_item("Bottom left")
	%list_item("Bottom right")
	%list_item("Far right")

;===================================================================================================
%choice_here("Eyegore walk", SA1RAM.eyegore_rng, 4)
	%list_item("Random")
	%list_item("Short")
	%list_item("Medium")
	%list_item("Long")

;===================================================================================================
%choice_here("Arrghus walk", SA1RAM.arrghus_rng, 6)
	%list_item("Random")
	%list_item("Shortest")
	%list_item("Short")
	%list_item("Medium")
	%list_item("Long")
	%list_item("Longest")

;===================================================================================================
%choice_prgtext("Turtle walk", SA1RAM.turtles_rng, 33, this)
	BEQ ..random

	DEC ; special text for shortest
	BEQ ..shortest

	CMP.b #$1F ; more special text
	BEQ ..slowest

	JML CMDRAW_HEX_2_DIGITS

..slowest_text
	db "Slowest", $FF

..slowest
	REP #$20
	LDA.w #..slowest_text

..write
	JSL CMDRAW_WORD_LONG_LONG
	RTL

..shortest
	REP #$20
	LDA.w #..shortest_text
	BRA ..write

..shortest_text
	db "Shortest", $FF

..random
	JML CMDRAW_RANDOM

;===================================================================================================
%choice_prgtext("Lanmola exit", SA1RAM.lanmola_rng, 65, this)
	BNE ..notrandom

	JML CMDRAW_RANDOM

..notrandom
	DEC

	SEP #$20
	PHA

	AND.b #$38 ; middle 3 bits for first character
	LSR
	LSR
	LSR
	JSL CMDRAW_1_CHARACTER

	LDA.b #','
	JSL CMDRAW_1_CHARACTER

	PLA
	AND.b #$07
	JML CMDRAW_1_CHARACTER

..random
	JML CMDRAW_RANDOM

;===================================================================================================
%choice_here("Conveyor belt", SA1RAM.conveyor_rng, 5)
	%list_item("Random")
	%list_item("Right")
	%list_item("Left")
	%list_item("Down")
	%list_item("Up")
