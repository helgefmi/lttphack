; Line 0 never transfers, can be used for dummy writes
; Using macros instead of routines is stupid, yes
; but we really need to save as many cycles as we can

!CURRENT_ROW = $0A

!white = $3C10
!blue = $2C10
!yellow = $3410
!red = $3810
!gray = $2010

!HUD_EXTRAS_BUFFER = $7EC700

; shouldn't actually need to clear every frame
; only when counters are messed with
macro draw_all_three(address, color, Xoff)
;first_digit
	LDA <address>+1 : AND #$000F
	ORA.w #<color>
	STA !HUD_EXTRAS_BUFFER+10+<Xoff>, X

;second_digit
	LDA <address>+0 : AND #$00F0
	LSR #4
	ORA.w #<color>
	STA !HUD_EXTRAS_BUFFER+12+<Xoff>, X

;third_digit
	LDA <address>+0
	AND #$000F
	ORA.w #<color>
	STA !HUD_EXTRAS_BUFFER+14+<Xoff>, X
endmacro

macro draw_all_two(address, color, Xoff)
;second_digit
	LDA <address>
	LSR #4
	ORA.w #<color>
	STA !HUD_EXTRAS_BUFFER+12+<Xoff>, X

;third_digit
	LDA <address>
	AND #$000F
	ORA.w #<color>
	STA !HUD_EXTRAS_BUFFER+14+<Xoff>, X
endmacro

macro draw_three(address, color, Xoff)
	SEP #$21
	LDA <address>+1
	ADC.b #$7E ; overflow set if 2 or 3 digits; carry is set for fewer cycles

	LDA <address>
	AND #$F0
	ORA <address>+1
	CMP.b #1 ; carry set if 2 or 3 digits
	REP #$20
?templabel:
?.first_digit
	LDA <address>+1 : AND #$000F
	BVC ?..blank

?..draw
	ORA.w #<color> ; 3 cycles
	BNE ?..continue ; 3 cycles
	; 6 cycles total

?..blank ; 1 for branch
	NOP ; 2 cycles
	LDA #$207F ; 3 cycles
	; 6 cycles total

?..continue
	STA !HUD_EXTRAS_BUFFER+10+<Xoff>, X

	; match cycles
?.second_digit
	LDA <address> : AND #$00F0
	BCC ?..blank

	; can't LSR first or we lose carry flag
?..draw
	LSR #4 ; 8 cycles
	ORA.w #<color> ; 3 cycles
	BNE ?..continue ; 3 cycles
	; 14 cycles total

?..blank ; 1 for branch
	NOP ; 2 cycles
	NOP #4 ; 8 cycles
	LDA #$207F ; 3 cycles
	; 14 cycles total

?..continue
	STA !HUD_EXTRAS_BUFFER+12+<Xoff>, X

?.third_digit
	LDA <address>
	AND #$000F
	ORA.w #<color> : STA !HUD_EXTRAS_BUFFER+14+<Xoff>, X
endmacro

macro draw_two(address, color, Xoff)
	LDA <address> : AND #$00F0
	CMP.w #1
?templabel:
	; match cycles
?.second_digit
	BCC ?..blank

	; can't LSR first or we lose carry flag
?..draw
	LSR #4 ; 8 cycles
	ORA.w #<color> ; 3 cycles
	BNE ?..continue ; 3 cycles
	; 14 cycles total

?..blank ; 1 for branch
	NOP #4 ; 8 cycles
	NOP ; 2 cycles
	LDA #$207F ; 3 cycles
	; 14 cycles total

?..continue
	STA !HUD_EXTRAS_BUFFER+12+<Xoff>, X

?.third_digit
	LDA <address>
	AND #$000F
	ORA.w #<color> : STA !HUD_EXTRAS_BUFFER+14+<Xoff>, X
endmacro

draw2_white_lttp:
	LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700, X
	LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC702, X
	RTL

draw3_white_aligned_left_lttp:
	; Clear "leading" 0's
	LDA #$207F : STA $7EC702, X
	LDA #$207F : STA $7EC704, X

	LDA !ram_hex2dec_first_digit : BEQ .draw_second_digit
	ORA #$3C90 : STA $7EC700, X
	INX #2

.draw_second_digit
	LDA !ram_hex2dec_second_digit : ORA #$3C90 : STA $7EC700, X
	INX #2

.draw_third_digit
	LDA !ram_hex2dec_third_digit : ORA #$3C90 : STA $7EC700, X
	RTL

macro update_counter_line()
	SEP #$10
	LSR ; A will hold whether or not this counter is active
	BCC ++ ; if clear, load 0 to X for a dummy write

	; need to match cycles here
;.normalwrite
	LDX !CURRENT_ROW ; 3
	TXA ; 2
	BRA + ; 2
	; 7 total

++ ; 1 for branch taken
	LDA !CURRENT_ROW ; 4
	LDX #$00 ; 2
	; 7 total

+
	ADC.w #$0000 : STA !CURRENT_ROW ; if carry was clear, this won't increment

	;TXA : ASL #4 : TAX ; multiply X by 16
	;TXA : DEC : ASL #6; multiply X by 64
	;REP #$11
	;ADC #$0030
	;TAX
	TXA : ASL : TAY
	REP #$10
	LDX counter_line, Y 

endmacro

counter_line:
	dw $0200 ; to write to nowhere useful
	dw 0<<6+$2E
	dw 1<<6+$2E
	dw 2<<6+$2E
	dw 3<<6+$2E
	dw 4<<6+$2E

hex_to_hex_lol: ; this exists purely to keep coords even

hex_to_dec:
	REP #$10
	ASL : TAX
	LDA.l hex_to_dec_fast_table, X
	SEP #$20 ; slightly faster overall to use this
	TAY : AND #$0F : STA !ram_hex2dec_third_digit
	TYA : AND #$F0 : LSR #4 : STA !ram_hex2dec_second_digit
	XBA : AND #$0F : STA !ram_hex2dec_first_digit
	REP #$20 : TYA
	RTL

macro hex_to_dec_fast()
	PHP
	REP #$10
	ASL : TAY
	LDA.w hex_to_dec_fast_table, Y
	SEP #$20 ; slightly faster overall to use this
	TAY : AND #$0F : STA !ram_hex2dec_third_digit
	TYA : AND #$F0 : LSR #4 : STA !ram_hex2dec_second_digit
	XBA : AND #$0F : STA !ram_hex2dec_first_digit
	REP #$20 : TYA
	PLP
endmacro

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

empty_char_dma: ; can't use 1 word, since DMA won't increment
	fillword !EMPTY : fill !EXTRAS_SIZE

draw_counters:
	PHP
	PHB : PHK : PLB
	%a16()
	%i8()
	; counters will never decrease, so I think this is fine
	;STZ $2182 ; to be bank $7E
	;LDA.w #!HUD_EXTRAS_BUFFER+16 : STA $2181
	;LDY.b #empty_char_dma>>16 : STY $4304 ; source bank
	;LDA.w #empty_char_dma : STA $4302 ; source address
	;LDA #$8000 : STA $4300
	;LDA.w #!EXTRAS_SIZE : STA $4305
	;LDY #$01 : STY $420B

	LDA #$0001 : STA !CURRENT_ROW ; start at 1 so that 0 can be a dummy write

	LDA !timer_allowed : BIT #$0080 : BNE .roomtime
	JMP .calccoordposition

.roomtime
	AND #$FF7F : STA !timer_allowed
	LDA !ram_counters_real : %update_counter_line()
	%draw_all_two(!room_time_F_disp, !yellow, 0)
	%draw_three(!room_time_S_disp, !white, -4)

.lagtime
	LDA !ram_counters_lag : %update_counter_line()
	%draw_three(!lag_frames_disp, !red, 0)

.idletime
	LDA !ram_counters_idle : %update_counter_line()
	%draw_three(!idle_frames_disp, !white, 0)

.segmenttime
	LDA !ram_counters_segment : BNE .doseg
	JMP .coordinates

.doseg
	%update_counter_line()
	%draw_all_two(!seg_time_F_disp, !gray, 0)
	%draw_all_two(!seg_time_S_disp, !yellow, -4)
	%draw_three(!seg_time_M_disp, !white, -8)
	BRA .coordinates
.calccoordposition
	CLC : LDA #$0001
	ADC !ram_counters_real
	ADC !ram_counters_lag
	ADC !ram_counters_idle
	ADC !ram_counters_segment
	STA !CURRENT_ROW

.coordinates
	LDA !ram_xy_toggle : %update_counter_line()
	; can't macro this, since 1 byte for each part

	; Y coord
;first_digit
	LDA $21 : AND #$000F
	ORA.w #!yellow
	STA !HUD_EXTRAS_BUFFER+10, X

;second_digit
	LDA $20 : AND #$00F0 : LSR #4
	ORA.w #!yellow
	STA !HUD_EXTRAS_BUFFER+12, X

;third_digit
	LDA $20 : AND #$000F
	ORA.w #!yellow
	STA !HUD_EXTRAS_BUFFER+14, X

	; X coord
;first_digit
	LDA $23 : AND #$000F
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+04, X

;second_digit
	LDA $22 : AND #$00F0 : LSR #4
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+06, X

;third_digit
	LDA $22 : AND #$000F
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+08, X

;-----------------------------------------------------------------
; Input display stuff
;-----------------------------------------------------------------
; this will always write to its buffer, but
; NMI will be cycle controlled to not always draw this on bg3
; the rest of the time it will just draw all blanks
hud_draw_input_display:
	LDA !ram_input_display
	AND #$0003
	ASL : TAX
	LDA !ram_ctrl1

	JSR (.options, X)

;-----------------------------------------------------------------
; Other
;-----------------------------------------------------------------
draw_quickwarp: ; cycle controlled
	SEP #$30 ; M=8 for just this is few cycles faster
	LDA !ram_qw_toggle : LSR ; shift toggle into carry
	LDA $E2 : AND #$06 ; this tests the bits for camera
	ORA $1B ; make QW only display in overworld, where $1B = 0
	ROL ; roll carry flag into bottom bit
	; if we're on a quick warp on the overworld
	; then we'll have $0D
	; if the camera matches but we're in the underworld
	; then we'll have $0F, and it will fail
	CMP #$0D ; 6 shifted left once and with a carry flag in bottom bit
	REP #$20 ; faster because it removes an AND #$00FF to get rid of leakage

	BEQ .qw

.notqw
	LDA #!EMPTY ; 3
	STA $7EC80A ; 6
	STA $7EC80C ; 6
	; this will always be non zero, so we get an extra cycle for branch taken
	BNE ++ ; 3
	; 18 cycles total

.qw ; 1 for branch
	LDA #$340C ; 3
	STA $7EC80A ; 6
	INC ; 2
	STA $7EC80C ; 6
	; 18 cycles total

++	; Naked label. Avert your eyes.

;-----------------------------------------------------------------
;-----------------------------------------------------------------
; END OF CYCLE CONTROLLED EXTRAS
;-----------------------------------------------------------------
;-----------------------------------------------------------------

extra_ram:
	LDA !ram_extra_ram_watch : BEQ .nowatch
	LDA #$0001 : %update_counter_line()
	CPX.w #(5<<6+$2E) : BCS .nowatch ; line 6 is too many
	LDA !ram_extra_ram_watch : ASL : TAY
	LDA extra_ram_watch_routines, Y
	PEA.w .return-1 ; so we can RTS back
	PHA ; push the location of the routine
	RTS
.return

.nowatch ; Oh no! The nudists are everywhere
done_extras:
	PLB : PLP
	RTL

macro add_input_character_a(pos, topbottom)
++	INY ; next character
	%add_input_character_afirst(<pos>, <topbottom>)
endmacro

macro add_input_character_afirst(pos, topbottom)
	LSR ; shift bit into carry
	; cycle control here
	BCS ?inputheld

?inputnotheld:
	STX.w (!POS_MEM_INPUT_DISPLAY_<topbottom>)+<pos> ; 5
	NOP ; 2
	BRA ++ ; 2
	; 9 cycles total

?inputheld: ; 1 for branch taken
	STY.w (!POS_MEM_INPUT_DISPLAY_<topbottom>)+<pos> ; 5
	REP #$00 ; 3
	; 9 cycles total
endmacro

; this one goes backwards, since the bottom nibble is all 0
macro add_input_character_b(pos, topbottom)
++	INY ; next character
	ASL ; shift bit into carry
	; cycle control here
	BCS ?inputheld

?inputnotheld:
	STX.w !POS_MEM_INPUT_DISPLAY_<topbottom>+<pos> ; 5
	NOP ; 2
	BRA ++ ; 2
	; 9 cycles total

?inputheld: ; 1 for branch taken
	STY.w !POS_MEM_INPUT_DISPLAY_<topbottom>+<pos> ; 5
	REP #$00 ; 3
	; 9 cycles total
endmacro

hud_draw_input_display_options:
	dw .off
	dw .cool
	dw .lame
	dw .off

.off
	STA $72
	AND #$000F : ORA #$2D70 : LDA !POS_MEM_INPUT_DISPLAY_BOT+2
	SEP #$30
	LDA $72+0 : AND #$C0 : LSR #5 : STA $74
	LDA $72+1 : AND #$40 : LSR #3 : ORA $74
	ASL $73 : ADC #$70 ; a in place
	REP #$20
	LDA !POS_MEM_INPUT_DISPLAY_BOT+6
	LDA $72 : AND #$0030 : LSR #4 : ORA #$2C00
	LDA !POS_MEM_INPUT_DISPLAY_BOT+4
	ASL $72 : ASL $72
	LDA #$2C04 : ADC #$0000 : LDA !POS_MEM_INPUT_DISPLAY_TOP+2
	ASL $72
	LDA #$6C04 : ADC #$0000 : LDA !POS_MEM_INPUT_DISPLAY_TOP+6
	LDA #$2C06 : LDA !POS_MEM_INPUT_DISPLAY_TOP+4
	RTS

.cool
	STA $72 ; dpad
	AND #$000F : ORA #$2D70 : STA !POS_MEM_INPUT_DISPLAY_BOT+2

	; need buttons in this order: xbya
	SEP #$30
	LDA $72+0 : AND #$C0 : LSR #5 : STA $74 ; b and y in place
	LDA $72+1 : AND #$40 : LSR #3 : ORA $74 ; ; x in place
	; this ASL takes care of one for figuring out LR inputs
	ASL $73 : ADC #$70 ; a in place

	; #$70 is the character offset we want
	; top byte contains $29 from doing dpad, which is what we want
	REP #$20
	STA !POS_MEM_INPUT_DISPLAY_BOT+6

	; start and select
	LDA $72 : AND #$0030 : LSR #4 : ORA #$2C00
	STA !POS_MEM_INPUT_DISPLAY_BOT+4

	; L and R
	ASL $72 : ASL $72 ; L into carry and remember where R is
	LDA #$2C04 : ADC #$0000 : STA !POS_MEM_INPUT_DISPLAY_TOP+2

	ASL $72 ; R into carry
	LDA #$6C04 : ADC #$0000 : STA !POS_MEM_INPUT_DISPLAY_TOP+6

	LDA #$2C06 : STA  !POS_MEM_INPUT_DISPLAY_TOP+4
	; old input display was 206 cycles
	; new is 133ish?
	RTS

.lame
	SEP #$20
	REP #$10
	; basically: this bank | bank $7E
	PEA.w ((hud_draw_input_display>>8)&$FF00)|$807E
	PLB ; proper bank

	; Y will hold the current input character
	LDY.w #$2400

	LDX.w #!EMPTY ; X will hold the empty character always

	; order: rlduSsYB....RLXA
	; Starting with the low byte

	; special macro to not increment Y
	%add_input_character_afirst(4, "BOT") ; dpad right
	%add_input_character_a(0, "BOT") ; dpad left
	%add_input_character_a(2, "BOT") ; dpad down
	%add_input_character_a(2, "TOP") ; dpad up

	%add_input_character_a(10, "BOT") ; start
	%add_input_character_a(10, "TOP") ; select
	%add_input_character_a(6, "TOP") ; Y
	%add_input_character_a(6, "BOT") ; B

++	XBA ; switch to high byte
	%add_input_character_b(8, "BOT") ; A
	%add_input_character_b(8, "TOP") ; X
	%add_input_character_b(0, "TOP") ; L shoulder
	%add_input_character_b(4, "TOP") ; R shoulder

++	PLB ; get this bank back
	RTS

extra_ram_watch_routines:
	dw .nothing-1
	dw .subpixels-1
	dw .spooky-1
	dw .arc-1
	dw .icebreaker-1

.icebreaker
	LDA $6C : AND #$00FF : BEQ ..nodoor
	LDA.w #$216A : BRA ++

..nodoor
	LDA.w #!EMPTY

++	STA !HUD_EXTRAS_BUFFER+06, X

.subpixels
	; can't macro this, since 1 byte addresses
; first digit
	LDA $2A : AND #$000F
	ORA.w #!yellow
	STA !HUD_EXTRAS_BUFFER+14, X

; second digit
	LDA $2A : AND #$00F0 : LSR #4
	ORA.w #!yellow
	STA !HUD_EXTRAS_BUFFER+12, X

; first digit
	LDA $2B : AND #$000F
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+10, X

; second digit
	LDA $2B : AND #$00F0 : LSR #4
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+08, X

.nothing
	RTS

.spooky
; first digit
	LDA $02A2 : AND #$000F
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+14, X

; second digit
	LDA $02A2 : AND #$00F0 : LSR #4
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+12, X
	RTS

.arc
	LDA $0B08 : TAY

; fourth digit
	AND #$000F
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+14, X

; third digit
	TYA : AND #$00F0 : LSR #4
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+12, X

; second digit
	TYA : XBA : AND #$000F
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+10, X

; first digit
	TYA : XBA : AND #$00F0 : LSR #4
	ORA.w #!white
	STA !HUD_EXTRAS_BUFFER+8, X

	RTS
