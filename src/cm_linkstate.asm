LINKSTATE_SUBMENU:
%menu_header("LINK STATE", 8)

;===================================================================================================
%choice_here("Waterwalk", $005B, 4)
	%list_item("Unarmed")
	%list_item("Armed")
	%list_item("Armed (2)")
	%list_item("Deathholed")

;===================================================================================================
%func_filtered("Activate superbunny", this)
	LDA.b $5D
	CMP.b #$17
	BNE .nothappening

	STZ.b $5D
	JML CM_MenuSFX_poof

.nothappening
	JML CM_MenuSFX_error

%func_filtered("Activate Lonk", this)
	LDA.b $5D
	BNE .nothappening

	LDA.b #$17
	STA.b $5D
	JML CM_MenuSFX_oof

;===================================================================================================
%func_filtered("Finish mirror door", this)

	REP #$20
	LDA.b $10 : CMP.w #$0007 : BEQ .allow
	CMP.w #$010E : BNE .nothappening
	LDA.w $010C : CMP.w #$1A07 : BNE .nothappening

.allow
	LDA.w #$0111 : STA.b $C8
	RTL

;===================================================================================================
%toggle("Statue drag", $02FA)

;===================================================================================================
%numfield_hex("Anc Index", $03C4, 0, $7F, 5)

;===================================================================================================
%toggle("Armed EG", $047A)

%choice_here("EG strength", $044A, 3)
	%list_item("EG 0")
	%list_item("Strong")
	%list_item("Weak")
