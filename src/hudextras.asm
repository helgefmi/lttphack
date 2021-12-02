!white = $3C10
!blue = $2C10
!yellow = $3410
!red = $3810
!gray = $2010

function char(n) = $2150+n

!BROWN_PAL #= (0<<10)
!RED_PAL #= (1<<10)
!YELLOW_PAL #= (2<<10)
!BLUE_PAL #= (3<<10)
!GRAY_PAL #= (4<<10)
!REDYELLOW #= (5<<10)
!TEXT_PAL #= (6<<10)
!GREEN_PAL #= (7<<10)

!VFLIP #= (1<<15)
!HFLIP #= (1<<14)

!P3 = $2000
!SYNCED = char($10)|!BLUE_PAL
!DESYNC = char($11)|!RED_PAL
!HAMMER = char($12)|!BROWN_PAL

pushpc

org $008B7D
HUD_NMI_DMA_SIZE:
	dw $200 ; make hud bigger, doesn't seem to cost any cycles

org $0EFD3E
	dw $6145, $6244 ; make the higher textbox slightly lower

org $0DFAAE
	JMP fire_hud_irq

org $0DDD24
	JSR fire_hud_irq
	PLB
	RTL

org $0DDD14
	JSR fire_hud_irq
	PLB
	RTL

; some nice free rom here
org $0DDB07
fire_hud_irq:
	JSL CacheSA1Stuff ; cache the big boy stuff we need for hud

	; don't want to be transferring too much
	; certain things will get designated as slow
	LDA.b !config_extra_sa1_required
	BEQ .noextra

	JSL Extra_SA1_Transfers
	SEP #$30

.noextra
	LDA.b #$83 ; request a hud update from SA-1
	STA.w $2200

	INC.b $16

	RTS

warnpc $0DDB3F

; for boss cycle counters
org $05A39B
	JML ResetLanmoCycles

org $05A40E
	JSL UpdateLanmoCycles
	NOP

org $06919F
	JSL ResetAgaCycles
	NOP

org $1ED632
	JSL UpdateAgaCycles
	NOP

pullpc

;===================================================================================================

UpdateLanmoCycles:
	INC.w $0D80,X
	INC.w SA1IRAM.BossCycles,X
	LDA.b #$18
	RTL

ResetLanmoCycles:
	STA.l $7FF81E,X
	STZ.w SA1IRAM.BossCycles,X
	RTL

ResetAgaCycles:
	STZ.w $0DC0,X

	STZ.w SA1IRAM.BossCycles+0
	STZ.w SA1IRAM.BossCycles+1
	STZ.w SA1IRAM.BossCycles+2

	RTL

UpdateAgaCycles:
	INC.w $0D80,X
	LDY.b #$04

	INC.w SA1IRAM.BossCycles,X
	RTL

;===================================================================================================
; A = address
; Y = color
;===================================================================================================
Draw:
.all_one
	STA.b SA1IRAM.SCRATCH+10
	STY.b SA1IRAM.SCRATCH+12
	BRA .digit1

.all_two
	STA.b SA1IRAM.SCRATCH+10
	STY.b SA1IRAM.SCRATCH+12
	BRA .digit10_always

.all_three
	STA.b SA1IRAM.SCRATCH+10
	STY.b SA1IRAM.SCRATCH+12
	BRA .digit100_always

.short_three
	STA.b SA1IRAM.SCRATCH+10
	STY.b SA1IRAM.SCRATCH+12
	JSR .set_conditional_flags_d3

.digit100
	BVC .digit10

.digit100_always
	LDA.b (SA1IRAM.SCRATCH+10)
	XBA
	AND.w #$000F
	ORA.b SA1IRAM.SCRATCH+12
	STA.w SA1RAM.HUD+10,X
	BRA .digit10_always

.short_two
	STA.b SA1IRAM.SCRATCH+10
	STY.b SA1IRAM.SCRATCH+12
	JSR .set_conditional_flags_d2

.digit10
	BCC .digit1

.digit10_always
	LDA.b (SA1IRAM.SCRATCH+10)
	AND.w #$00F0
	LSR
	LSR
	LSR
	LSR
	ORA.b SA1IRAM.SCRATCH+12
	STA.w SA1RAM.HUD+12,X

.digit1
	LDA.b (SA1IRAM.SCRATCH+10)
	AND.w #$000F
	ORA.b SA1IRAM.SCRATCH+12
	STA.w SA1RAM.HUD+14,X

.done
	RTS

.set_conditional_flags_d3
	LDA.b (SA1IRAM.SCRATCH+10)
	CLC
	ADC.w #$7F00 ; overflow set if digit 3 exists

.set_conditional_flags_d2
	LDA.b (SA1IRAM.SCRATCH+10)
	CMP.w #$0010 ; carry set if digit 2 or 3 exists
	RTS

;===================================================================================================

hex_to_dec_fast:
	PHP
	REP #$30

	ASL : TAX

	LDA.w hex_to_dec_fast_table,X
	TAY : AND.w #$000F : STA.b SA1IRAM.SCRATCH+4
	TYA : AND.w #$00F0 : LSR : LSR : LSR : LSR : STA.b SA1IRAM.SCRATCH+2
	TYA : XBA : AND.w #$000F : STA.b SA1IRAM.SCRATCH+0

	PLP
	RTS

hex_to_dec_fast_table:
	dw $000, $001, $002, $003, $004, $005, $006, $007, $008, $009
	dw $010, $011, $012, $013, $014, $015, $016, $017, $018, $019
	dw $020, $021, $022, $023, $024, $025, $026, $027, $028, $029
	dw $030, $031, $032, $033, $034, $035, $036, $037, $038, $039
	dw $040, $041, $042, $043, $044, $045, $046, $047, $048, $049
	dw $050, $051, $052, $053, $054, $055, $056, $057, $058, $059
	dw $060, $061, $062, $063, $064, $065, $066, $067, $068, $069
	dw $070, $071, $072, $073, $074, $075, $076, $077, $078, $079
	dw $080, $081, $082, $083, $084, $085, $086, $087, $088, $089
	dw $090, $091, $092, $093, $094, $095, $096, $097, $098, $099
	dw $100, $101, $102, $103, $104, $105, $106, $107, $108, $109
	dw $110, $111, $112, $113, $114, $115, $116, $117, $118, $119
	dw $120, $121, $122, $123, $124, $125, $126, $127, $128, $129
	dw $130, $131, $132, $133, $134, $135, $136, $137, $138, $139
	dw $140, $141, $142, $143, $144, $145, $146, $147, $148, $149
	dw $150, $151, $152, $153, $154, $155, $156, $157, $158, $159
	dw $160, $161, $162, $163, $164, $165, $166, $167, $168, $169
	dw $170, $171, $172, $173, $174, $175, $176, $177, $178, $179
	dw $180, $181, $182, $183, $184, $185, $186, $187, $188, $189
	dw $190, $191, $192, $193, $194, $195, $196, $197, $198, $199
	dw $200, $201, $202, $203, $204, $205, $206, $207, $208, $209
	dw $210, $211, $212, $213, $214, $215, $216, $217, $218, $219
	dw $220, $221, $222, $223, $224, $225, $226, $227, $228, $229
	dw $230, $231, $232, $233, $234, $235, $236, $237, $238, $239
	dw $240, $241, $242, $243, $244, $245, $246, $247, $248, $249
	dw $250, $251, $252, $253, $254, $255, $256, $257, $258, $259
	dw $260, $261, $262, $263, $264, $265, $266, $267, $268, $269
	dw $270, $271, $272, $273, $274, $275, $276, $277, $278, $279
	dw $280, $281, $282, $283, $284, $285, $286, $287, $288, $289
	dw $290, $291, $292, $293, $294, $295, $296, $297, $298, $299
	dw $300, $301, $302, $303, $304, $305, $306, $307, $308, $309
	dw $310, $311, $312, $313, $314, $315, $316, $317, $318, $319
	dw $320, $321, $322, $323, $324, $325, $326, $327, $328, $329
	dw $330, $331, $332, $333, $334, $335, $336, $337, $338, $339
	dw $340, $341, $342, $343, $344, $345, $346, $347, $348, $349
	dw $350, $351, $352, $353, $354, $355, $356, $357, $358, $359
	dw $360, $361, $362, $363, $364, $365, $366, $367, $368, $369
	dw $370, $371, $372, $373, $374, $375, $376, $377, $378, $379
	dw $380, $381, $382, $383, $384, $385, $386, $387, $388, $389
	dw $390, $391, $392, $393, $394, $395, $396, $397, $398, $399
	dw $400, $401, $402, $403, $404, $405, $406, $407, $408, $409
	dw $410, $411, $412, $413, $414, $415, $416, $417, $418, $419
	dw $420, $421, $422, $423, $424, $425, $426, $427, $428, $429
	dw $430, $431, $432, $433, $434, $435, $436, $437, $438, $439
	dw $440, $441, $442, $443, $444, $445, $446, $447, $448, $449
	dw $450, $451, $452, $453, $454, $455, $456, $457, $458, $459
	dw $460, $461, $462, $463, $464, $465, $466, $467, $468, $469
	dw $470, $471, $472, $473, $474, $475, $476, $477, $478, $479
	dw $480, $481, $482, $483, $484, $485, $486, $487, $488, $489
	dw $490, $491, $492, $493, $494, $495, $496, $497, $498, $499
	dw $500, $501, $502, $503, $504, $505, $506, $507, $508, $509
	dw $510, $511, $512, $513, $514, $515, $516, $517, $518, $519
	dw $520, $521, $522, $523, $524, $525, $526, $527, $528, $529
	dw $530, $531, $532, $533, $534, $535, $536, $537, $538, $539
	dw $540, $541, $542, $543, $544, $545, $546, $547, $548, $549
	dw $550, $551, $552, $553, $554, $555, $556, $557, $558, $559
	dw $560, $561, $562, $563, $564, $565, $566, $567, $568, $569
	dw $570, $571, $572, $573, $574, $575, $576, $577, $578, $579
	dw $580, $581, $582, $583, $584, $585, $586, $587, $588, $589
	dw $590, $591, $592, $593, $594, $595, $596, $597, $598, $599
	dw $600, $601, $602, $603, $604, $605, $606, $607, $608, $609
	dw $610, $611, $612, $613, $614, $615, $616, $617, $618, $619
	dw $620, $621, $622, $623, $624, $625, $626, $627, $628, $629
	dw $630, $631, $632, $633, $634, $635, $636, $637, $638, $639
	dw $640, $641, $642, $643, $644, $645, $646, $647, $648, $649
	dw $650, $651, $652, $653, $654, $655, $656, $657, $658, $659
	dw $660, $661, $662, $663, $664, $665, $666, $667, $668, $669
	dw $670, $671, $672, $673, $674, $675, $676, $677, $678, $679
	dw $680, $681, $682, $683, $684, $685, $686, $687, $688, $689
	dw $690, $691, $692, $693, $694, $695, $696, $697, $698, $699
	dw $700, $701, $702, $703, $704, $705, $706, $707, $708, $709
	dw $710, $711, $712, $713, $714, $715, $716, $717, $718, $719
	dw $720, $721, $722, $723, $724, $725, $726, $727, $728, $729
	dw $730, $731, $732, $733, $734, $735, $736, $737, $738, $739
	dw $740, $741, $742, $743, $744, $745, $746, $747, $748, $749
	dw $750, $751, $752, $753, $754, $755, $756, $757, $758, $759
	dw $760, $761, $762, $763, $764, $765, $766, $767, $768, $769
	dw $770, $771, $772, $773, $774, $775, $776, $777, $778, $779
	dw $780, $781, $782, $783, $784, $785, $786, $787, $788, $789
	dw $790, $791, $792, $793, $794, $795, $796, $797, $798, $799
	dw $800, $801, $802, $803, $804, $805, $806, $807, $808, $809
	dw $810, $811, $812, $813, $814, $815, $816, $817, $818, $819
	dw $820, $821, $822, $823, $824, $825, $826, $827, $828, $829
	dw $830, $831, $832, $833, $834, $835, $836, $837, $838, $839
	dw $840, $841, $842, $843, $844, $845, $846, $847, $848, $849
	dw $850, $851, $852, $853, $854, $855, $856, $857, $858, $859
	dw $860, $861, $862, $863, $864, $865, $866, $867, $868, $869
	dw $870, $871, $872, $873, $874, $875, $876, $877, $878, $879
	dw $880, $881, $882, $883, $884, $885, $886, $887, $888, $889
	dw $890, $891, $892, $893, $894, $895, $896, $897, $898, $899
	dw $900, $901, $902, $903, $904, $905, $906, $907, $908, $909
	dw $910, $911, $912, $913, $914, $915, $916, $917, $918, $919
	dw $920, $921, $922, $923, $924, $925, $926, $927, $928, $929
	dw $930, $931, $932, $933, $934, $935, $936, $937, $938, $939
	dw $940, $941, $942, $943, $944, $945, $946, $947, $948, $949
	dw $950, $951, $952, $953, $954, $955, $956, $957, $958, $959
	dw $960, $961, $962, $963, $964, $965, $966, $967, $968, $969
	dw $970, $971, $972, $973, $974, $975, $976, $977, $978, $979
	dw $980, $981, $982, $983, $984, $985, $986, $987, $988, $989
	dw $990, $991, $992, $993, $994, $995, $996, $997, $998, $999

;===================================================================================================

draw_hud_extras:
	PHP
	PHB
	PHK
	PLB

	; clear up sentriess
	REP #$20

	LDA.b SA1IRAM.TIMER_FLAG
	AND.w #$FF7F
	STA.b SA1IRAM.TIMER_FLAG

	SEP #$10

	LDA.w #$207F
	LDX.b #$16
--	STA.w SA1RAM.HUD+$26+($40*0),X
	STA.w SA1RAM.HUD+$26+($40*1),X
	STA.w SA1RAM.HUD+$26+($40*2),X
	STA.w SA1RAM.HUD+$26+($40*3),X
	STA.w SA1RAM.HUD+$26+($40*4),X

	DEX
	DEX
	BPL --

	LDX.b #62
--	STA.w SA1RAM.HUD+10+($40*5),X ; +10 to not erase magic bar
	STA.w SA1RAM.HUD+($40*6),X
	STA.w SA1RAM.HUD+($40*7),X
	STA.w SA1RAM.HUD+($40*8),X
	DEX
	DEX
	BPL --

	LDX.b #14
--	STA.w SA1RAM.HUD+$90,X
	DEX
	DEX
	BPL --

	LDA.w !config_heart_display
	ASL
	TAX
	JSR (draw_hearts_options,X)

;===================================================================================================

	REP #$30

	JSR GetHUDLagTile
	STA.w SA1RAM.HUD+$02

	SEP #$10

	LDX.w !config_state_icons : BNE ++

	LDA.w #$207F
	STA.w SA1RAM.HUD+$042
	STA.w SA1RAM.HUD+$082
	STA.w SA1RAM.HUD+$0C2
	STA.w SA1RAM.HUD+$102
	BRA draw_hud_sentry

	; super speed
++	LDA.w #char($1C)|!RED_PAL
	LDX.b SA1IRAM.CopyOf_0372 : BNE ++

	AND.w #$E3FF
	ORA.w #!GRAY_PAL

++	STA.w SA1RAM.HUD+$042

	; water walk
	LDA.w #char($1D)|!BLUE_PAL
	LDX.b SA1IRAM.CopyOf_5B : BNE ++

	AND.w #$E3FF
	ORA.w #!GRAY_PAL

++	STA.w SA1RAM.HUD+$082

	; door state
	LDA.w #char($1A)|!BROWN_PAL
	LDX.b SA1IRAM.CopyOf_6C : BNE ++

	AND.w #$E3FF
	ORA.w #!GRAY_PAL

++	STA.w SA1RAM.HUD+$0C2

	; stair drag
	LDA.w #char($1B)|!BROWN_PAL
	LDX.b SA1IRAM.CopyOf_57 : BNE ++

	AND.w #$E3FF
	ORA.w #!GRAY_PAL

++	STA.w SA1RAM.HUD+$102


;===================================================================================================

draw_hud_sentry:
	REP #$30
	LDA.w #$002E ; start place
	LDX.w #$0000

.next_sentry
	PHA
	PHX

	LDA.b SA1IRAM.SNTVAL1,X
	PHA

	LDA.w !config_sentry1,X
	ASL
	TAY
	LDA.w sentry_routines,Y
	TAY

	LDA 5,S ; get write spot
	TAX

	PLA

	PEA.w .return-1

	DEY ; jump address
	PHY

	RTS ; call routine

.return
	REP #$31
	PLX

	PLA ; next row
	ADC.w #$0040

	INX
	INX
	CPX.w #10
	BCC .next_sentry

;===================================================================================================

draw_hud_linesentrys:
	REP #$30
	LDA.w #5*64+10 ; start position
	LDY.w #$0000

	; later rows should be further left
	PEA.w 5*64+10
	BRA .start

.next_sentry
	PHA

.start
	PHY

	TAX ; get spot

	LDA.w !config_linesentry1,Y

	ASL
	TAY

	LDA.w linesentry_routines,Y
	DEC

	PEA.w .return-1

	PHA

	LDA 5,S ; get value address position
	ASL
	ASL
	ASL
	TAY

	RTS ; call routine

.return
	REP #$31
	PLY

	PLA ; next row
	ADC.w #$0040

	INY
	INY
	CPY.w #6
	BCC .next_sentry

;===================================================================================================

hud_draw_input_display:
	LDA.w !config_input_display
	AND.w #$0003
	ASL : TAX

	LDA.b SA1IRAM.CONTROLLER_1
	XBA

	JSR (.options,X)

;===================================================================================================
; clean up the stuff right under items
	REP #$30

	LDA.w #$207F
	STA.w SA1RAM.HUD+$10A
	STA.w SA1RAM.HUD+$10C
	STA.w SA1RAM.HUD+$10E

	LDA.b SA1IRAM.CopyOf_1B
	LSR
	BCC draw_quickwarp

	JSR draw_boss_cycles

	BRA .skip

;===================================================================================================

#draw_quickwarp:
	SEP #$30
	LDA.w !config_qw_toggle
	EOR.b #$01
	ORA.b SA1IRAM.CopyOf_1B
	BNE .skip

	LDA.b SA1IRAM.CopyOf_E2 : AND.b #$06 : CMP.b #$06

	REP #$30 : PHP

	LDA.w #$300C

	PLP : BNE .not_qw

	ORA.w #$3800

.not_qw
	STA.w SA1RAM.HUD+$10A
	INC
	STA.w SA1RAM.HUD+$10C

.skip
draw_floor:
	SEP #$20
	LDA.b SA1IRAM.CopyOf_1B
	LSR
	LDA.b SA1IRAM.Moved_04A0
	REP #$20
	BEQ .skip
	BCC .skip

	LDA.w #$251E
	STA.w SA1RAM.HUD+$A8
	INC
	STA.w SA1RAM.HUD+$EA
	INC
	STA.w SA1RAM.HUD+$E8
	LDA.w #$250F
	STA.w SA1RAM.HUD+$AA

	LDY.w #0
	LDA.b SA1IRAM.CopyOf_A4
	BIT.w #$0080
	BNE .drawem_flip

	AND.w #$00FF
	BRA .drawem

.drawem_flip
	INY
	INY
	ORA.w #$FF00
	EOR.w #$FFFF

.drawem
	ASL
	TAX
	LDA.l $0AFD00,X
	STA.w SA1RAM.HUD+$A8,Y
	LDA.l $0AFD16,X
	STA.w SA1RAM.HUD+$E8,Y

.skip
draw_timer:
	LDA.b SA1IRAM.Moved_04B4
	AND.w #$00FF
	BIT.w #$0080
	BNE .skip

	JSR hex_to_dec_fast

	LDA.b SA1IRAM.SCRATCH+4
	BNE ++
	LDA.w #10

++	ASL
	TAX

	LDA.l $0AFD00-2,X
	STA.w SA1RAM.HUD+$AA
	LDA.l $0AFD16-2,X
	STA.w SA1RAM.HUD+$EA

	LDA.b SA1IRAM.SCRATCH+2
	BEQ .skip
	ASL
	TAX
	LDA.l $0AFD00-2,X
	STA.w SA1RAM.HUD+$A8
	LDA.l $0AFD16-2,X
	STA.w SA1RAM.HUD+$E8

.skip
;===================================================================================================
done_extras:
	PLB : PLP
	RTL

;===================================================================================================
draw_hearts_options:
	dw .practicehack
	dw .vanilla

.practicehack
	SEP #$21
	LDA.b SA1IRAM.CopyOf_7EF36C
	SBC.b SA1IRAM.CopyOf_7EF36D
	CMP.b #$04

	REP #$30
	LDA.w #$24A0
	ADC.w #$0000
	STA.w SA1RAM.HUD+$90

	LDA.b SA1IRAM.CopyOf_7EF36D
	AND.w #$00FF
	LSR
	LSR
	LSR
	JSR hex_to_dec_fast

	LDA.b SA1IRAM.SCRATCH+2
	ORA.w #$3C90
	STA.w SA1RAM.HUD+$92

	LDA.b SA1IRAM.SCRATCH+4
	ORA.w #$3C90
	STA.w SA1RAM.HUD+$94

	LDA.b SA1IRAM.CopyOf_7EF36D
	AND.w #$0007
	ORA.w #$3490
	STA.w SA1RAM.HUD+$96

	LDA.w #$207F
	STA.w SA1RAM.HUD+$98

	; containers
	LDA.w #$24A2
	STA.w SA1RAM.HUD+$9A

	LDA.b SA1IRAM.CopyOf_7EF36C
	AND.w #$00FF
	LSR
	LSR
	LSR
	JSR hex_to_dec_fast

	LDA.b SA1IRAM.SCRATCH+2
	ORA.w #$3C90
	STA.w SA1RAM.HUD+$9C

	LDA.b SA1IRAM.SCRATCH+4
	ORA.w #$3C90
	STA.w SA1RAM.HUD+$9E

	RTS

;------------------------------------------------------------------------------

.vanilla
	REP #$20
	; --LIFE--
	LDA.w #$288B
	STA.w SA1RAM.HUD+$02C
	LDA.w #$288F
	STA.w SA1RAM.HUD+$02E
	LDA.w #$24AB
	STA.w SA1RAM.HUD+$030
	LDA.w #$24AC
	STA.w SA1RAM.HUD+$032
	LDA.w #$688F
	STA.w SA1RAM.HUD+$034
	LDA.w #$688B
	STA.w SA1RAM.HUD+$036

	LDA.b SA1IRAM.CopyOf_7EF36C
	LSR
	LSR
	LSR
	AND.w #$1F1F ; shift both right at once
	SEP #$10
	TAX ; X has max health
	XBA
	TAY ; Y has current health

	LDA.w #SA1RAM.HUD+$068
	STA.b SA1IRAM.SCRATCH+0
	STA.b SA1IRAM.SCRATCH+2

..next_filled_heart
	CPX.b #1 ; do we have at least 1 HP?
	BMI ..done_hearts

	CPY.b #1
	BMI ..do_max_health

	LDA.w #$24A0
	BRA ..add_heart

..do_max_health
	LDA.w #$24A2

..add_heart
	STA.b (SA1IRAM.SCRATCH+0)

	DEY
	DEX

	LDA.b SA1IRAM.SCRATCH+0
	INC
	INC
	CMP.w #SA1RAM.HUD+$07C
	BEQ ..nextrow
	CMP.w #SA1RAM.HUD+$0BC
	BNE ..fine

..nextrow
	ADC.w #$002B ; +1 carry +2 from inc

..fine
	STA.b SA1IRAM.SCRATCH+0
	CPY.b #1 ; save pointer when we have 0 hearts left to add
	BNE ..skip_save

	STA.b SA1IRAM.SCRATCH+2

..skip_save

	BRA ..next_filled_heart

..done_hearts
	LDA.b SA1IRAM.CopyOf_7EF36D
	AND.w #$0007
	BEQ ..skip_partial

	CMP.w #$0005
	LDA.w #$24A0
	BCS ..more_than_half

	INC ; 1-4 means half heart

..more_than_half
	STA.b (SA1IRAM.SCRATCH+2)

..skip_partial
	SEP #$20
	LDA.b SA1IRAM.Moved_020A
	BEQ ..done

	; heart refill animation
	LDA.b SA1IRAM.Moved_0209
	ASL
	TAX
	REP #$20
	LDA.l $0DFA29,X
	STA.b (SA1IRAM.SCRATCH+2)

..done
	RTS

;===================================================================================================

GetHUDLagTile:
	LDA.w !config_hudlag_spinner
	BNE .dohudlag

	LDA.w #$207F
	RTS

.dohudlag
	LDA.b SA1IRAM.CopyOf_1A
	AND.w #$000C
	LSR
	LSR
	; Desired results:
	; 00  ->  00
	; 01  ->  01
	; 10  ->  11
	; 11  ->  10
	; b0 = b1 ^ b0
	; b1 = b1

	LSR ; put b1 in b0
	STA.b SA1IRAM.SCRATCH+0
	ROL ; back to normal

	EOR.b SA1IRAM.SCRATCH+0 ; b0 ^ b1
	ROR ; get to bits 14 and 15
	ROR
	ROR

	ORA.w #$253F
	RTS

;===================================================================================================

; wrap at 7a
hud_draw_input_display_options:
	dw .off
	dw .cool
	dw .classic
	dw .classicgray

.off
	RTS

;---------------------------------------------------------------------------------------------------

.cool
	STA.b SA1IRAM.SCRATCH ; dpad
	AND.w #$000F : ORA.w #$2D70 : STA.w SA1RAM.HUD+$66+2

	; need buttons in this order: xbya
	SEP #$30

	LDA.b SA1IRAM.SCRATCH+0 : AND.b #$C0
	LSR : LSR : LSR : LSR : LSR ; b and y in place
	STA.b SA1IRAM.SCRATCH+2

	LDA.b SA1IRAM.SCRATCH+1 : AND.b #$40
	LSR : LSR : LSR ; x in place
	ORA.b SA1IRAM.SCRATCH+2
	
	; this ASL takes care of one for figuring out LR inputs
	ASL.b SA1IRAM.SCRATCH+1 : ADC.b #$70 ; a in place

	; #$70 is the character offset we want
	; top byte contains $29 from doing dpad, which is what we want
	REP #$20
	STA.w SA1RAM.HUD+$66+6

	; start and select
	LDA.b SA1IRAM.SCRATCH : AND.w #$0030
	LSR : LSR : LSR : LSR
	ORA.w #$2C00
	STA.w SA1RAM.HUD+$66+4

	; L and R
	ASL.b SA1IRAM.SCRATCH : ASL.b SA1IRAM.SCRATCH ; L into carry and remember where R is
	LDA.w #$2C04 : ADC.w #$0000 : STA.w SA1RAM.HUD+$26+2

	ASL.b SA1IRAM.SCRATCH ; R into carry
	LDA.w #$6C04 : ADC.w #$0000 : STA.w SA1RAM.HUD+$26+6

	LDA.w #$2C06 : STA.w SA1RAM.HUD+$26+4

	RTS

;---------------------------------------------------------------------------------------------------

.classic
	REP #$70 ; clear overflow means classic
	BRA ++

.classicgray
	REP #$20
	SEP #$40 ; set overflow means classic gray

	; Y will hold the current input character
++	STA.b SA1IRAM.SCRATCH+0
	XBA
	LSR
	LSR
	LSR
	LSR
	STA.b SA1IRAM.SCRATCH+1 ; for high byte

	LDX.w #$0000

..next_button
	LDY.w .classic_locations,X

	TXA
	LSR

	LSR.b SA1IRAM.SCRATCH
	BCC ..nopress

..press
	ORA.w #$2570
	BRA ..addchr

..nopress
	BVC ..nochar
	ORA.w #$3170

..addchr
	STA.w SA1RAM.HUD,Y

..nochar
	INX
	INX
	CPX.w #23
	BCC ..next_button

	RTS

;---------------------------------------------------------------------------------------------------

.classic_locations
	dw $68+4  ; dpad right
	dw $68+0  ; dpad left
	dw $68+2  ; dpad down
	dw $28+2  ; dpad up

	dw $68+10 ; start
	dw $28+10 ; select
	dw $28+6  ; Y
	dw $68+6  ; B

	dw $28+4  ; R shoulder
	dw $28+0  ; L shoulder
	dw $28+8  ; X
	dw $68+8  ; A

;===================================================================================================

draw_boss_cycles:
	LDA.w !config_toggle_boss_cycles
	LSR
	BCC .no

	LDA.b SA1IRAM.CopyOf_A0
	CMP.w #$0033 : BEQ .three ; lanmo
	CMP.w #$000D : BEQ .three ; agahnim

	BRA .no

.three
	LDA.w #$0002
	BRA .start

.start
	TAX
	ASL
	TAY

.next
	LDA.b SA1IRAM.BossCycles,X
	AND.w #$00FF
	ORA.w #$2010
	STA.w SA1RAM.HUD+$10A,Y

	DEY
	DEY
	DEX
	BPL .next

.no
	RTS

;===================================================================================================

DrawCoordinates:
	PHY ; y coordinate first as it's right-to-left
	LDA.w #!yellow
	STA.b SA1IRAM.SCRATCH+10
	LDA.b SA1IRAM.CopyOf_20
	JSR DrawHex

	PLY ; x coordinate after
	LDA.w #!white
	STA.b SA1IRAM.SCRATCH+10
	LDA.b SA1IRAM.CopyOf_22
	BRA DrawHex

DrawHex_next_digit:
	LSR
	LSR
	LSR
	LSR

DrawHex:
.draw_n_digits
	PHA ; remember coordinates
	AND.w #$000F ; get digit
	ORA.b SA1IRAM.SCRATCH+10 ; add in color
	STA.w SA1RAM.HUD+14,X
	PLA ; recover value
	DEX
	DEX
	DEY
	BNE .next_digit
	RTS

.white
	PHA
	LDA.w #!white
	BRA .start

.yellow
	PHA
	LDA.w #!yellow
	BRA .start

.gray
	PHA
	LDA.w #!gray
	BRA .start

.red
	PHA
	LDA.w #!red
	BRA .start

.start
	STA.b SA1IRAM.SCRATCH+10
	PLA
	BRA DrawHex


DrawHEXForward:
	PHA
	BRA .start

.white
	PHA
	LDA.w #!white
	BRA .set_color

.yellow
	PHA
	LDA.w #!yellow
	BRA .set_color

.gray
	PHA
	LDA.w #!gray
	BRA .set_color

.red
	PHA
	LDA.w #!red
	BRA .set_color

.set_color
	STA.b SA1IRAM.SCRATCH+10

.start
	PHX ; save X
	TYA ; get offset for Y
	ASL
	ADC 1,S ; get X offset

	PLX ; kill the X we pushed
	SEC
	SBC.w #16 ; to account for DrawHEX offset
	TAX ; after our last digit
	PLA ; get val back

	PHX ; save new position
	JSR DrawHex

	PLA
	CLC
	ADC.w #16
	TAX

	RTS

DrawHEX2ForwardSaveY:
	PHY
	LDY.w #2
	JSR DrawHEXForward
	PLY
	RTS

.white
	PHY
	LDY.w #2
	JSR DrawHEXForward_white
	PLY
	RTS

.yellow
	PHY
	LDY.w #2
	JSR DrawHEXForward_yellow
	PLY
	RTS

.red
	PHY
	LDY.w #2
	JSR DrawHEXForward_red
	PLY
	RTS

.gray
	PHY
	LDY.w #2
	JSR DrawHEXForward_gray
	PLY
	RTS

DrawHEX4ForwardSaveY:
	PHY
	LDY.w #4
	JSR DrawHEXForward
	PLY
	RTS

.white
	PHY
	LDY.w #4
	JSR DrawHEXForward_white
	PLY
	RTS

.yellow
	PHY
	LDY.w #4
	JSR DrawHEXForward_yellow
	PLY
	RTS

.red
	PHY
	LDY.w #4
	JSR DrawHEXForward_red
	PLY
	RTS

.gray
	PHY
	LDY.w #4
	JSR DrawHEXForward_gray
	PLY
	RTS

;===================================================================================================

sentry_routines:
	dw sentry_nothing
	dw sentry_room
	dw sentry_lag
	dw sentry_idle
	dw sentry_segment
	dw sentry_coords
	dw sentry_subpixels
	dw sentry_roomid
	dw sentry_quadrant
	dw sentry_screenid
	dw sentry_tile
	dw sentry_spooky
	dw sentry_arcvar
	dw sentry_westsom
	dw sentry_index
	dw sentry_hookslot
	dw sentry_pit
	dw sentry_bosshp
	dw sentry_hover

;===================================================================================================

sentry_nothing:
	RTS

;---------------------------------------------------------------------------------------------------

sentry_room:
	LDY.w #!yellow ; color
	LDA.w #SA1IRAM.ROOM_TIME_F_DISPLAY ; address
	JSR Draw_all_two

	DEX ; down 4
	DEX
	DEX
	DEX
	LDY.w #!white ; color
	LDA.w #SA1IRAM.ROOM_TIME_S_DISPLAY ; address
	JMP Draw_short_three

;---------------------------------------------------------------------------------------------------

sentry_lag:
	LDY.w #!red ; color
	LDA.w #SA1IRAM.ROOM_TIME_LAG_DISPLAY ; address
	JMP Draw_short_three

;---------------------------------------------------------------------------------------------------

sentry_idle:
	LDA.w SA1IRAM.ROOM_TIME_IDLE_DISPLAY

	PHX
	JSR hex_to_dec_fast
	PLX

	XBA
	SEP #$20

	LDA.b SA1IRAM.SCRATCH+2
	ASL
	ASL
	ASL
	ASL
	ORA.b SA1IRAM.SCRATCH+4

	REP #$20
	STA.b SA1IRAM.SCRATCH

	LDY.w #!white
	LDA.w #SA1IRAM.SCRATCH
	JMP Draw_short_three

;---------------------------------------------------------------------------------------------------

sentry_segment:
	LDY.w #!gray
	LDA.w #SA1IRAM.SEG_TIME_F_DISPLAY
	JSR Draw_all_two

	DEX
	DEX
	DEX
	DEX
	LDY.w #!yellow
	LDA.w #SA1IRAM.SEG_TIME_S_DISPLAY
	JSR Draw_all_two

	DEX
	DEX
	DEX
	DEX
	LDY.w #!white
	LDA.w #SA1IRAM.SEG_TIME_M_DISPLAY
	JMP Draw_short_three

;---------------------------------------------------------------------------------------------------

sentry_coords:
	LDY.w #4
	JMP DrawCoordinates

;---------------------------------------------------------------------------------------------------

sentry_subpixels:
	PHA
	AND.w #$00FF
	LDY.w #2
	JSR DrawHex_yellow

	PLA
	XBA
	AND.w #$00FF
	LDY.w #2
	JMP DrawHex_white

;---------------------------------------------------------------------------------------------------

sentry_roomid:
	; calculate correct room id first
	LDA.b SA1IRAM.CopyOf_21 : AND.w #$00FE
	ASL : ASL : ASL
	STA.b SA1IRAM.SCRATCH+14

	LDA.b SA1IRAM.CopyOf_23 : AND.w #$00FE : LSR ; bit 0 is off, so it clears carry
	ADC.b SA1IRAM.SCRATCH+14 : STA.b SA1IRAM.SCRATCH+14

	LDA.b SA1IRAM.CopyOf_1B
	AND.w #$00FF
	BEQ .overworld

	LDA.b SA1IRAM.SCRATCH+14
	CMP.b SA1IRAM.CopyOf_A0
	BNE .desync

.sync
	PEA.w !SYNCED
	LDA.w #!gray
	BRA .draw

.desync
	PEA.w !DESYNC
	LDA.w #!red
	BRA .draw

.overworld
	PEA.w char($11)|!GRAY_PAL

	LDA.w #$608B
	STA.w SA1RAM.HUD+14,X
	STA.w SA1RAM.HUD+12,X
	STA.w SA1RAM.HUD+10,X

	TXA
	SEC
	SBC.w #$0006
	TAX
	BRA ++

.draw
	STA.b SA1IRAM.SCRATCH+10

	LDA.b SA1IRAM.SCRATCH+14
	LDY.w #3
	JSR DrawHex

++	PLA
	STA.w SA1RAM.HUD+14,X
	DEX
	DEX

	LDY.w #3
	LDA.b SA1IRAM.CopyOf_A0
	JMP DrawHex_white

;---------------------------------------------------------------------------------------------------

sentry_screenid:
	STA.b SA1IRAM.SCRATCH+4

	LDA.b SA1IRAM.CopyOf_1B
	AND.w #$00FF
	BNE NoDisplaySentry

	LDA.b SA1IRAM.CopyOf_20
	AND.w #$1E00
	ASL A
	ASL A
	ASL A
	STA.b SA1IRAM.SCRATCH+12

	LDA.b SA1IRAM.CopyOf_22
	AND.w #$1E00
	ORA.b SA1IRAM.SCRATCH+12

	XBA
	LSR

	PHX

	TAX

	LDA.b SA1IRAM.CopyOf_20 : ORA.b SA1IRAM.CopyOf_22
	CMP.w #$1000

	LDA.l $02A4E3,X
	PLX

	AND.w #$00FF
	ORA.b SA1IRAM.CopyOf_7EF3CA

	STA.b SA1IRAM.SCRATCH+6
	BCS .way_off_screen

	CMP.b SA1IRAM.SCRATCH+4
	BNE .wrong

.match
	PEA.w !SYNCED
	LDA.w #!gray
	BRA .draw

.wrong
.way_off_screen
	PEA.w !DESYNC
	LDA.w #!red

.draw
	STA.b SA1IRAM.SCRATCH+10

	LDA.b SA1IRAM.SCRATCH+6
	LDY.w #2
	JSR DrawHex

	PLA
	STA.w SA1RAM.HUD+14,X
	DEX
	DEX

	LDY.w #2
	LDA.b SA1IRAM.SCRATCH+4
	JMP DrawHex_white

;---------------------------------------------------------------------------------------------------

sentry_pit:
	TAY

	LDA.b SA1IRAM.CopyOf_1B
	AND.w #$00FF
	BEQ NoDisplaySentry

	TYA

	AND.w #$00FF
	LDY.w #2
	JSR DrawHex_white

	PHX
	LDX.b SA1IRAM.CopyOf_A0
	LDA.l RoomHasPitDamage,X
	PLX

	LSR
	BCS .pitdamage

.warphole
	LDA.w #char($16)|!GRAY_PAL
	BRA .drawflag

.pitdamage
	LDA.w #char($16)|!YELLOW_PAL

.drawflag
	STA.w SA1RAM.HUD+14,X
	RTS

;---------------------------------------------------------------------------------------------------

NoDisplaySentry:
	LDA.w #$608B : STA.w SA1RAM.HUD+12,X
	STA.w SA1RAM.HUD+14,X
	RTS

;---------------------------------------------------------------------------------------------------

sentry_tile:
	AND.w #$00FF
	TAY

	LDA.w #char(24)|!GREEN_PAL
	STA.w SA1RAM.HUD+10,X

	LDA.b SA1IRAM.CopyOf_1B
	AND.w #$00FF
	BEQ NoDisplaySentry

	TYA
	LDY.w #2
	JMP DrawHex_white

;---------------------------------------------------------------------------------------------------

sentry_quadrant:
	TAY

	LDA.b SA1IRAM.CopyOf_1B
	AND.w #$00FF
	BEQ NoDisplaySentry

	TYA
	LSR
	BCS .east
	; $AA is 0 or 2, and will be the only bit remaining, no matter what

.west
	BEQ .northwest

.southwest
	LDY.w #2
	LDA.w #char(5+2)|!RED_PAL
	BRA .doQuadrant

.northwest
	LDY.w #3
	LDA.w #char(5+3)|!RED_PAL
	BRA .doQuadrant

.east
	BEQ .northeast

.southeast
	LDY.w #1
	LDA.w #char(5+1)|!RED_PAL
	BRA .doQuadrant

.northeast
	LDY.w #0
	LDA.w #char(5+0)|!RED_PAL

.doQuadrant
	STY.b SA1IRAM.SCRATCH+14

	STA.w SA1RAM.HUD+10,X

.calc_correct_quadrant
	LDA.w #$0100 ; checking the same bit on both coordinates

	BIT.b SA1IRAM.CopyOf_22 : BNE ..east

..west
	BIT.b SA1IRAM.CopyOf_20 : BEQ ..northwest

	; using the gray pal means we only need to ORA if desynched
	; and can leave it alone otherwise
..southwest
	LDY.w #2
	LDA.w #char(5+2)|!GRAY_PAL
	BRA .drawQuadrant

..northwest
	LDY.w #3
	LDA.w #char(5+3)|!GRAY_PAL
	BRA .drawQuadrant

..east
	BIT.b SA1IRAM.CopyOf_20 : BEQ ..northeast

..southeast
	LDY.w #1
	LDA.w #char(5+1)|!GRAY_PAL
	BRA .drawQuadrant

..northeast
	LDY.w #0
	LDA.w #char(5+0)|!GRAY_PAL

.drawQuadrant
	CPY.b SA1IRAM.SCRATCH+14
	BEQ .sync

.desync
	ORA.w #!TEXT_PAL
	STA.w SA1RAM.HUD+14,X

	LDA.w #!DESYNC
	BRA .drawSync

.sync
	STA.w SA1RAM.HUD+14,X
	LDA.w #!SYNCED

.drawSync
	STA.w SA1RAM.HUD+12,X
	RTS

;---------------------------------------------------------------------------------------------------

sentry_hookslot:
	PHA

	LDA.w #char(2)|!RED_PAL
	STA.w SA1RAM.HUD+10,X

	PLA

;---------------------------------------------------------------------------------------------------

sentry_raw:
	AND.w #$00FF
	LDY.w #2
	JMP DrawHex_white

;---------------------------------------------------------------------------------------------------

sentry_index:
	JSR sentry_raw

	LDA.w #char(4)|!BLUE_PAL
	STA.w SA1RAM.HUD+14,X

	RTS

;---------------------------------------------------------------------------------------------------

sentry_bosshp:
	JSR sentry_raw

	LDA.w #$2CA1
	STA.w SA1RAM.HUD+14,X

	RTS

;---------------------------------------------------------------------------------------------------

sentry_spooky:
	JSR sentry_raw

	LDA.w #char(3)|!RED_PAL
	STA.w SA1RAM.HUD+14,X

	RTS

;---------------------------------------------------------------------------------------------------

sentry_arcvar:
	LDY.w #4
	JMP DrawHex_white

;---------------------------------------------------------------------------------------------------

sentry_westsom:
	PHA

	LDA.w #char(23)|!BLUE_PAL
	STA.w SA1RAM.HUD+6,X

	PLA

	LDY.w #4
	CMP.w #$0010
	BCS .bad

.good
	JMP DrawHex_gray

.bad
	JMP DrawHex_red

;---------------------------------------------------------------------------------------------------

sentry_hover:
	AND.w #$00FF

	CMP.w #$0000
	BEQ ++

	; carry guaranteed to be set since CMP #0
	PHA
	LDA.w #$001E
	SBC 1,S
	PLY

	PHX
	JSR hex_to_dec_fast
	PLX

	LDA.b SA1IRAM.SCRATCH+2
	ASL
	ASL
	ASL
	ASL
	ORA.b SA1IRAM.SCRATCH+4

++	STA.b SA1IRAM.SCRATCH

	LDY.w #!white
	LDA.w #SA1IRAM.SCRATCH
	JMP Draw_short_two

;===================================================================================================
; full line sentries
;===================================================================================================
linesentry_routines:
	dw linesentry_nothing
	dw linesentry_roomdata
	dw linesentry_camerax
	dw linesentry_cameray
	dw linesentry_owtranx
	dw linesentry_owtrany
	dw linesentry_ancilla04
	dw linesentry_ancilla59
	dw linesentry_ancillaIX
	dw linesentry_nothing
	dw linesentry_nothing

;===================================================================================================

linesentry_nothing:
	RTS

;===================================================================================================

linesentry_roomdata:
	LDA.w SA1IRAM.LINEVAL+1,Y : AND.w #$0FFF : STA.b SA1IRAM.SCRATCH+10
	LDA.w SA1IRAM.LINEVAL-1,Y : AND.w #$F000 : ORA.b SA1IRAM.SCRATCH+10

	; rearrange it into the order we want
	; Start: dddd qqqq hkcc cccc
	; End:   hkcc cccc dddd qqqq
	XBA 
	STA.b SA1IRAM.SCRATCH+10

	LDA.w #char($19)|!RED_PAL : STA.w SA1RAM.HUD,X ; flag symbol

	LDY.w #0

.next_flag
	INX
	INX
	LDA.w .char,Y
	ASL.b SA1IRAM.SCRATCH+10
	BCS .on

.off
	AND.w #$E3FF
	ORA.w #!GRAY_PAL

.on
	STA.w SA1RAM.HUD,X
	INY
	INY
	CPY.w #32
	BCC .next_flag

	RTS

.char
	dw $20A0|!RED_PAL
	dw $2071|!YELLOW_PAL
	dw $2071|!YELLOW_PAL
	dw $20A8|!BLUE_PAL
	dw char($15)|!REDYELLOW
	dw char($15)|!REDYELLOW
	dw char($15)|!REDYELLOW
	dw char($15)|!REDYELLOW
	dw char($1A)|!BROWN_PAL
	dw char($1A)|!BROWN_PAL
	dw char($1A)|!BROWN_PAL
	dw char($1A)|!BROWN_PAL
	dw char($14)|!HFLIP|!BLUE_PAL
	dw char($14)|!RED_PAL
	dw char($14)|!HFLIP|!VFLIP|!GREEN_PAL
	dw char($14)|!VFLIP|!YELLOW_PAL

;===================================================================================================

linesentry_camerax:
	LDA.w #char(9)
	PEA.w !white
	BRA ++

linesentry_cameray:
	LDA.w #char(11)
	PEA.w !yellow

++	STA.b SA1IRAM.SCRATCH+14 ; save the icon

	PLA
	STA.b SA1IRAM.SCRATCH+10
	STA.b SA1IRAM.SCRATCH+12


	LDA.w #char($13)|!GRAY_PAL ; camera icon
	STA.w SA1RAM.HUD,X
	INX
	INX

	LDA.w SA1IRAM.LINEVAL+1,Y : JSR DrawHEX4ForwardSaveY
	PHX ; save X for sync icon
	INX
	INX

	; check which set to use
	LDA.w SA1IRAM.LINEVAL+0,Y
	BIT.w #$0002
	BNE .set2

	; +3 and +5 which are done first should be color of axis
.set1
	LDA.w SA1IRAM.LINEVAL+3,Y
	STA.b SA1IRAM.SCRATCH+4

	LDA.w SA1IRAM.LINEVAL+5,Y
	STA.b SA1IRAM.SCRATCH+6

	LDA.b SA1IRAM.SCRATCH+12 
	PEA.w !gray ; other set is gray
	BRA .draw

.set2
	LDA.w SA1IRAM.LINEVAL+7,Y
	STA.b SA1IRAM.SCRATCH+4

	LDA.w SA1IRAM.LINEVAL+9,Y
	STA.b SA1IRAM.SCRATCH+6

	PEI.b (SA1IRAM.SCRATCH+12) ; +3 and +5 should have gray
	LDA.w #!gray 

.draw
	STA.b SA1IRAM.SCRATCH+10 ; set 1 color
	PLA
	STA.b SA1IRAM.SCRATCH+12 ; save set 2 color to here (don't need axis color anymore)

	LDA.w SA1IRAM.LINEVAL+1,Y ; save camera position
	PHA

	INY ; so we start at the +3
	JSR .draw1 ; draw first 2 camera values

	INC.b SA1IRAM.SCRATCH+14
	JSR .draw1

	LDA.b SA1IRAM.SCRATCH+12
	STA.b SA1IRAM.SCRATCH+10

	DEC.b SA1IRAM.SCRATCH+14
	JSR .draw1 ; draw first next 2 camera values

	INC.b SA1IRAM.SCRATCH+14
	JSR .draw1

	PLA ; get camera position
	PLX ; get HUD position of sync icon

	CMP.b SA1IRAM.SCRATCH+4
	BCC .desync
	DEC
	CMP.b SA1IRAM.SCRATCH+6
	BCS .desync

.sync
	LDA.w #!SYNCED
	BRA .drawsync

.desync
	LDA.w #!DESYNC

.drawsync
	STA.w SA1RAM.HUD,X
	RTS

.draw1
	INY
	INY
	LDA.b SA1IRAM.SCRATCH+10
	ORA.b SA1IRAM.SCRATCH+14
	STA.w SA1RAM.HUD,X
	INX
	INX

	LDA.w SA1IRAM.LINEVAL,Y
	JMP DrawHEX4ForwardSaveY

;===================================================================================================

linesentry_owtranx:
	PEA.w $02A83B
	PEA.w char(9)|!white
	LDA.w #$FFFF
	BRA linesentry_owtran

linesentry_owtrany:
	PEA.w $02A7BB
	PEA.w char(11)|!yellow
	LDA.w #$FFF0

; 1,S - Bank
; 2,S - table
linesentry_owtran:
	STA.b SA1IRAM.SCRATCH+6 ; increment amount
	PLA : STA.b SA1IRAM.SCRATCH+8 ; icon
	AND.w #$FC00 : ORA.w #$0010 : STA.b SA1IRAM.SCRATCH+10

	LDA.b SA1IRAM.CopyOf_1B
	AND.w #$00FF
	BEQ ++

	; gray if overworld
	LDA.w #$1C00
	TRB.b SA1IRAM.SCRATCH+8
	TRB.b SA1IRAM.SCRATCH+10

	LDA.w #!GRAY_PAL
	TSB.b SA1IRAM.SCRATCH+8
	TSB.b SA1IRAM.SCRATCH+10


++	PHB

	LDA.b SA1IRAM.CopyOf_20
	AND.w #$1E00
	ASL A
	ASL A
	ASL A
	STA.b SA1IRAM.SCRATCH+12

	LDA.b SA1IRAM.CopyOf_22
	AND.w #$1E00
	ORA.b SA1IRAM.SCRATCH+12

	XBA
	STA.b SA1IRAM.SCRATCH+12

	PEA.w $0202
	PLB : PLB

;---------------------------------------------------------------------------------------------------

	STZ.b SA1IRAM.SCRATCH+4

	JSR .draw_one

	INC.b SA1IRAM.SCRATCH+8

	LDA.b SA1IRAM.SCRATCH+6 : EOR.w #$FFFF : INC : STA.b SA1IRAM.SCRATCH+6
	LDA.w $02A77B,Y : AND.w #$00FF : INC : XBA : STA.b SA1IRAM.SCRATCH+4

	INX : INX : INX : INX
	JSR .draw_one

	PLB
	PLA

	RTS

.draw_one
	LDY.b SA1IRAM.SCRATCH+12

	LDA (4,S),Y
	CLC : ADC.b SA1IRAM.SCRATCH+4

	JSR DrawHEX4ForwardSaveY

	LDA.b SA1IRAM.SCRATCH+8
	STA.w SA1RAM.HUD,X
	INX
	INX

	TYA : AND.w #$00FF : LSR : PHA
	CLC : ADC.b SA1IRAM.SCRATCH+6
	AND.w #$00FF
	TAY

	LDA.w $02A4E3,Y
	ORA.b SA1IRAM.CopyOf_7EF3CA
	PLY

	JMP DrawHEX2ForwardSaveY


;===================================================================================================

linesentry_ancilla04:
	LDA.w #$A82F
	BRA linesentry_ancilla_all

linesentry_ancilla59:
	LDA.w #$3C2F
	BRA linesentry_ancilla_all

linesentry_ancillaIX:
	LDA.w #char(4)|!BLUE_PAL

linesentry_ancilla_all:
	STA.w SA1RAM.HUD+2,X

	TXA
	CLC
	ADC.w #$0004
	PHA

	PHX

	LDA.w #5
	STA.b SA1IRAM.SCRATCH+14

	LDX.w SA1IRAM.LINEVAL+8,Y
	LDA.w .icons,X

	PLX

	STA.w SA1RAM.HUD,X

	LDA.w SA1IRAM.LINEVAL+8,Y

	LDX.w SA1IRAM.LINEVAL+8,Y
	LDA.w .vectors,X

	PLX
	PHA

	RTS

.icons
	dw char(1)|!RED_PAL
	dw $202D|!RED_PAL
	dw $202E|!RED_PAL
	dw char(3)|!RED_PAL
	dw char(27)|!RED_PAL
	dw char(2)|!RED_PAL
	dw char(24)|!BLUE_PAL
	dw char(22)|!YELLOW_PAL
	dw char(20)|!GREEN_PAL
	dw char(10)|!RED_PAL
	dw char(12)|!RED_PAL

.vectors
	dw linesentry_ancilla_id-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_y-1
	dw linesentry_ancilla_altitude-1
	dw linesentry_ancilla_layer-1
	dw linesentry_ancilla_itemget-1
	dw linesentry_ancilla_tile-1
	dw linesentry_ancilla_egcheck-1
	dw linesentry_ancilla_direction-1
	dw linesentry_ancilla_decay-1

	; placeholders
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1
	dw linesentry_ancilla_x-1

;---------------------------------------------------------------------------------------------------

linesentry_ancilla_x:
linesentry_ancilla_itemget:
linesentry_ancilla_tile:
linesentry_ancilla_direction:
linesentry_ancilla_layer:
linesentry_ancilla_altitude:
linesentry_ancilla_decay:
.next_ancilla
	INX
	INX

	LDA.w SA1IRAM.LINEVAL,Y
	JSR DrawHEX2ForwardSaveY_white

.continue
	INY

	DEC.b SA1IRAM.SCRATCH+14
	BNE .next_ancilla

	RTS

;---------------------------------------------------------------------------------------------------

linesentry_ancilla_y:
.next_ancilla
	INX
	INX

	LDA.w SA1IRAM.LINEVAL,Y
	JSR DrawHEX2ForwardSaveY_yellow

.continue
	INY

	DEC.b SA1IRAM.SCRATCH+14
	BNE .next_ancilla

	RTS

;---------------------------------------------------------------------------------------------------

linesentry_ancilla_id:
.next_ancilla
	INX
	INX

	LDA.w SA1IRAM.LINEVAL,Y
	AND.w #$00FF : BEQ .zero

	CMP.w #$0A : BEQ .replace
	CMP.w #$3C : BEQ .replace
	CMP.w #$13 : BNE .normal

.replace
	JSR DrawHEX2ForwardSaveY_red
	BRA .continue

.zero
	JSR DrawHEX2ForwardSaveY_gray
	BRA .continue

.normal
	JSR DrawHEX2ForwardSaveY_white

.continue
	INY

	DEC.b SA1IRAM.SCRATCH+14
	BNE .next_ancilla

	RTS

;---------------------------------------------------------------------------------------------------

linesentry_ancilla_egcheck:
.next_ancilla
	INX
	INX

	LDA.w SA1IRAM.LINEVAL,Y
	AND.w #$00FF : BEQ .zero

.bad
	JSR DrawHEX2ForwardSaveY_red
	BRA .continue

.zero
	JSR DrawHEX2ForwardSaveY_gray

.continue
	INY

	DEC.b SA1IRAM.SCRATCH+14
	BNE .next_ancilla

	RTS
