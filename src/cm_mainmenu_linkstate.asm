; LINK STATE {{{
cm_main_goto_link_state:
	%cm_submenu("Link state", cm_submenu_link_state)

cm_submenu_link_state:
	dw cm_link_state_armed_waterwalk
	dw cm_link_state_activate_superbunny
	dw cm_link_state_activate_lonk
	dw cm_link_state_finish_mirrordoor
	dw cm_link_state_statue_drag
	dw cm_link_state_searchindex
	dw cm_link_state_armed_eg
	dw cm_link_state_eg_strength
	dw !menu_end
	%cm_header("LINK STATE")

cm_link_state_armed_waterwalk:
	dw !CM_ACTION_CHOICE
	dl $5B
	%cm_item("Waterwalk")
	%cm_item("Unarmed")
	%cm_item("Armed")
	%cm_item("Armed (2)")
	%cm_item("Deathholed")
	db !list_end
	
cm_link_state_statue_drag:
	%cm_toggle("Statue drag", $02FA)

cm_link_state_activate_superbunny:
	%cm_jsr("Activate superbunny")

.routine
	LDA $5D : CMP #$17 : BNE nothappening
	STZ $5D : LDA #$14 : BRA setSound

cm_link_state_activate_lonk:
	%cm_jsr("Activate Lonk")

.routine
	LDA $5D : BNE nothappening
	LDA #$17 : STA $5D : LDA #$26 : BRA setSound

nothappening:
	SEP #$20
	LDA #$3C

setSound:
	STA $012E
	STZ $012F ; no default menu sounds
	RTS

cm_link_state_finish_mirrordoor:
	%cm_jsr("Finish mirror door")
.routine
	REP #$20
	LDA.l !ram_cm_old_gamemode : CMP #$0007 : BEQ .allow
	CMP #$010E : BNE nothappening
	LDA $010C : CMP #$1A07 : BNE nothappening
.allow
	LDA #$0111 : STA $C8
++	SEP #$20
	STZ $012F ; no default menu sounds
	LDA #$15 : STA $012D
	RTS

cm_link_state_armed_eg:
	%cm_toggle("Armed EG", $047A)

cm_link_state_eg_strength:
	dw !CM_ACTION_CHOICE
	dl !ram_eg_strength
	%cm_item("EG strength")
	%cm_item("EG 0")
	%cm_item("Strong")
	%cm_item("Weak")
	db !list_end

cm_link_state_searchindex:
	%cm_numfield("Anc Index", $7E03C4, #$00, #$FF, #$05)