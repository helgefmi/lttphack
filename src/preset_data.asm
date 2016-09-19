preset_data:
; Location Presets


.save_1
db $2 ; Dungeon
dw $104 ; Room Index
dw $2110 ; BG1 Vertical Scroll
dw $2110 ; BG2 Vertical Scroll
dw $900 ; BG1 Horizontal Scroll
dw $900 ; BG2 Horizontal Scroll
dw $978 ; Link X
dw $21B5 ; Link Y
dw $17F ; Camera X
dw $17F ; Camera Y
dw $816 ; Door Settings
dw $2100 ; Relative Coords HU
dw $2000 ; Relative Coords FU
dw $2110 ; Relative Coords HD
dw $2110 ; Relative Coords FD
dw $900 ; Relative Coords HL
dw $900 ; Relative Coords FL
dw $900 ; Relative Coords HR
dw $A00 ; Relative Coords FR
dw $0 ; Quadrant 1
dw $200 ; Quadrant 2
db $3 ; Main Graphics
db $FF ; Music Track
db $0 ; Starting Floor
db $FF ; Palace No
db $0 ; Door Orientation
db $0 ; Starting Background
dw .after_state_1


.save_2
db $2 ; Dungeon
dw $61 ; Room Index
dw $D10 ; BG1 Vertical Scroll
dw $D10 ; BG2 Vertical Scroll
dw $280 ; BG1 Horizontal Scroll
dw $280 ; BG2 Horizontal Scroll
dw $2F8 ; Link X
dw $D96 ; Link Y
dw $FF ; Camera X
dw $187 ; Camera Y
dw $0 ; Door Settings
dw $D00 ; Relative Coords HU
dw $C00 ; Relative Coords FU
dw $D10 ; Relative Coords HD
dw $D10 ; Relative Coords FD
dw $200 ; Relative Coords HL
dw $200 ; Relative Coords FL
dw $200 ; Relative Coords HR
dw $300 ; Relative Coords FR
dw $202 ; Quadrant 1
dw $200 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $0 ; Starting Background
dw .after_state_2


.save_3
db $2 ; Dungeon
dw $60 ; Room Index
dw $C8C ; BG1 Vertical Scroll
dw $C8C ; BG2 Vertical Scroll
dw $100 ; BG1 Horizontal Scroll
dw $100 ; BG2 Horizontal Scroll
dw $1A6 ; Link X
dw $CF8 ; Link Y
dw $17F ; Camera X
dw $103 ; Camera Y
dw $0 ; Door Settings
dw $C00 ; Relative Coords HU
dw $C00 ; Relative Coords FU
dw $C10 ; Relative Coords HD
dw $D10 ; Relative Coords FD
dw $100 ; Relative Coords HL
dw $0 ; Relative Coords FL
dw $100 ; Relative Coords HR
dw $100 ; Relative Coords FR
dw $200 ; Quadrant 1
dw $1 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_3


.save_4
db $2 ; Dungeon
dw $50 ; Room Index
dw $B10 ; BG1 Vertical Scroll
dw $B10 ; BG2 Vertical Scroll
dw $100 ; BG1 Horizontal Scroll
dw $100 ; BG2 Horizontal Scroll
dw $178 ; Link X
dw $B90 ; Link Y
dw $17F ; Camera X
dw $188 ; Camera Y
dw $0 ; Door Settings
dw $B00 ; Relative Coords HU
dw $A00 ; Relative Coords FU
dw $B10 ; Relative Coords HD
dw $B10 ; Relative Coords FD
dw $100 ; Relative Coords HL
dw $0 ; Relative Coords FL
dw $100 ; Relative Coords HR
dw $100 ; Relative Coords FR
dw $200 ; Quadrant 1
dw $201 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_4


.save_5
db $2 ; Dungeon
dw $1 ; Room Index
dw $B ; BG1 Vertical Scroll
dw $B ; BG2 Vertical Scroll
dw $200 ; BG1 Horizontal Scroll
dw $200 ; BG2 Horizontal Scroll
dw $252 ; Link X
dw $78 ; Link Y
dw $7F ; Camera X
dw $83 ; Camera Y
dw $0 ; Door Settings
dw $0 ; Relative Coords HU
dw $0 ; Relative Coords FU
dw $10 ; Relative Coords HD
dw $110 ; Relative Coords FD
dw $200 ; Relative Coords HL
dw $200 ; Relative Coords FL
dw $200 ; Relative Coords HR
dw $300 ; Relative Coords FR
dw $2 ; Quadrant 1
dw $0 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_5


.save_6
db $2 ; Dungeon
dw $52 ; Room Index
dw $A0B ; BG1 Vertical Scroll
dw $A0B ; BG2 Vertical Scroll
dw $400 ; BG1 Horizontal Scroll
dw $400 ; BG2 Horizontal Scroll
dw $451 ; Link X
dw $A78 ; Link Y
dw $7F ; Camera X
dw $83 ; Camera Y
dw $0 ; Door Settings
dw $A00 ; Relative Coords HU
dw $A00 ; Relative Coords FU
dw $A10 ; Relative Coords HD
dw $B10 ; Relative Coords FD
dw $400 ; Relative Coords HL
dw $400 ; Relative Coords FL
dw $400 ; Relative Coords HR
dw $500 ; Relative Coords FR
dw $202 ; Quadrant 1
dw $0 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_6


.save_7
db $2 ; Dungeon
dw $62 ; Room Index
dw $C00 ; BG1 Vertical Scroll
dw $C00 ; BG2 Vertical Scroll
dw $400 ; BG1 Horizontal Scroll
dw $400 ; BG2 Horizontal Scroll
dw $478 ; Link X
dw $C61 ; Link Y
dw $7F ; Camera X
dw $78 ; Camera Y
dw $0 ; Door Settings
dw $C00 ; Relative Coords HU
dw $C00 ; Relative Coords FU
dw $C10 ; Relative Coords HD
dw $D10 ; Relative Coords FD
dw $400 ; Relative Coords HL
dw $400 ; Relative Coords FL
dw $400 ; Relative Coords HR
dw $500 ; Relative Coords FR
dw $202 ; Quadrant 1
dw $0 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_7


.save_8
db $2 ; Dungeon
dw $52 ; Room Index
dw $B10 ; BG1 Vertical Scroll
dw $B10 ; BG2 Vertical Scroll
dw $466 ; BG1 Horizontal Scroll
dw $466 ; BG2 Horizontal Scroll
dw $4DE ; Link X
dw $BA3 ; Link Y
dw $E5 ; Camera X
dw $188 ; Camera Y
dw $0 ; Door Settings
dw $B00 ; Relative Coords HU
dw $A00 ; Relative Coords FU
dw $B10 ; Relative Coords HD
dw $B10 ; Relative Coords FD
dw $400 ; Relative Coords HL
dw $400 ; Relative Coords FL
dw $400 ; Relative Coords HR
dw $500 ; Relative Coords FR
dw $202 ; Quadrant 1
dw $200 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $0 ; Starting Background
dw .after_state_8


.save_9
db $2 ; Dungeon
dw $1 ; Room Index
dw $B ; BG1 Vertical Scroll
dw $B ; BG2 Vertical Scroll
dw $300 ; BG1 Horizontal Scroll
dw $300 ; BG2 Horizontal Scroll
dw $39C ; Link X
dw $78 ; Link Y
dw $17F ; Camera X
dw $83 ; Camera Y
dw $0 ; Door Settings
dw $0 ; Relative Coords HU
dw $0 ; Relative Coords FU
dw $10 ; Relative Coords HD
dw $110 ; Relative Coords FD
dw $300 ; Relative Coords HL
dw $200 ; Relative Coords FL
dw $300 ; Relative Coords HR
dw $300 ; Relative Coords FR
dw $2 ; Quadrant 1
dw $1 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_9


.save_10
db $2 ; Dungeon
dw $50 ; Room Index
dw $B0B ; BG1 Vertical Scroll
dw $B0B ; BG2 Vertical Scroll
dw $100 ; BG1 Horizontal Scroll
dw $100 ; BG2 Horizontal Scroll
dw $190 ; Link X
dw $B78 ; Link Y
dw $17F ; Camera X
dw $183 ; Camera Y
dw $0 ; Door Settings
dw $B00 ; Relative Coords HU
dw $A00 ; Relative Coords FU
dw $B10 ; Relative Coords HD
dw $B10 ; Relative Coords FD
dw $100 ; Relative Coords HL
dw $0 ; Relative Coords FL
dw $100 ; Relative Coords HR
dw $100 ; Relative Coords FR
dw $200 ; Quadrant 1
dw $201 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_10


.save_11
db $2 ; Dungeon
dw $60 ; Room Index
dw $CC4 ; BG1 Vertical Scroll
dw $CC4 ; BG2 Vertical Scroll
dw $100 ; BG1 Horizontal Scroll
dw $100 ; BG2 Horizontal Scroll
dw $178 ; Link X
dw $D31 ; Link Y
dw $17F ; Camera X
dw $13C ; Camera Y
dw $0 ; Door Settings
dw $D00 ; Relative Coords HU
dw $C00 ; Relative Coords FU
dw $D10 ; Relative Coords HD
dw $D10 ; Relative Coords FD
dw $100 ; Relative Coords HL
dw $0 ; Relative Coords FL
dw $100 ; Relative Coords HR
dw $100 ; Relative Coords FR
dw $200 ; Quadrant 1
dw $201 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $1 ; Starting Background
dw .after_state_11


.save_12
db $2 ; Dungeon
dw $60 ; Room Index
dw $CFC ; BG1 Vertical Scroll
dw $CFC ; BG2 Vertical Scroll
dw $100 ; BG1 Horizontal Scroll
dw $100 ; BG2 Horizontal Scroll
dw $178 ; Link X
dw $D6A ; Link Y
dw $17F ; Camera X
dw $174 ; Camera Y
dw $0 ; Door Settings
dw $D00 ; Relative Coords HU
dw $C00 ; Relative Coords FU
dw $D10 ; Relative Coords HD
dw $D10 ; Relative Coords FD
dw $100 ; Relative Coords HL
dw $0 ; Relative Coords FL
dw $100 ; Relative Coords HR
dw $100 ; Relative Coords FR
dw $200 ; Quadrant 1
dw $201 ; Quadrant 2
db $4 ; Main Graphics
db $10 ; Music Track
db $0 ; Starting Floor
db $2 ; Palace No
db $0 ; Door Orientation
db $0 ; Starting Background
dw .after_state_12


; State Changes


.state_1
dl $7EF000 : db $2 : dw $0
dl $7EF004 : db $2 : dw $0
dl $7EF002 : db $2 : dw $0
dl $7EF006 : db $2 : dw $0
dl $7EF00A : db $2 : dw $0
dl $7EF00E : db $2 : dw $0
dl $7EF012 : db $2 : dw $0
dl $7EF016 : db $2 : dw $0
dl $7EF01A : db $2 : dw $0
dl $7EF01E : db $2 : dw $0
dl $7EF022 : db $2 : dw $0
dl $7EF026 : db $2 : dw $0
dl $7EF02A : db $2 : dw $0
dl $7EF02E : db $2 : dw $0
dl $7EF032 : db $2 : dw $0
dl $7EF036 : db $2 : dw $0
dl $7EF040 : db $2 : dw $0
dl $7EF044 : db $2 : dw $0
dl $7EF048 : db $2 : dw $0
dl $7EF04C : db $2 : dw $0
dl $7EF050 : db $2 : dw $0
dl $7EF054 : db $2 : dw $0
dl $7EF052 : db $2 : dw $0
dl $7EF05C : db $2 : dw $0
dl $7EF060 : db $2 : dw $0
dl $7EF064 : db $2 : dw $0
dl $7EF068 : db $2 : dw $0
dl $7EF06C : db $2 : dw $0
dl $7EF070 : db $2 : dw $0
dl $7EF074 : db $2 : dw $0
dl $7EF078 : db $2 : dw $0
dl $7EF07C : db $2 : dw $0
dl $7EF080 : db $2 : dw $0
dl $7EF084 : db $2 : dw $0
dl $7EF088 : db $2 : dw $0
dl $7EF08C : db $2 : dw $0
dl $7EF090 : db $2 : dw $0
dl $7EF094 : db $2 : dw $0
dl $7EF098 : db $2 : dw $0
dl $7EF09C : db $2 : dw $0
dl $7EF0A0 : db $2 : dw $0
dl $7EF0A4 : db $2 : dw $0
dl $7EF0A2 : db $2 : dw $0
dl $7EF0A6 : db $2 : dw $0
dl $7EF0AA : db $2 : dw $0
dl $7EF0AE : db $2 : dw $0
dl $7EF0B2 : db $2 : dw $0
dl $7EF0B6 : db $2 : dw $0
dl $7EF0BA : db $2 : dw $0
dl $7EF0BE : db $2 : dw $0
dl $7EF0C2 : db $2 : dw $0
dl $7EF0C6 : db $2 : dw $0
dl $7EF0CA : db $2 : dw $0
dl $7EF0CE : db $2 : dw $0
dl $7EF0D2 : db $2 : dw $0
dl $7EF0D6 : db $2 : dw $0
dl $7EF0DA : db $2 : dw $0
dl $7EF0DE : db $2 : dw $0
dl $7EF0E2 : db $2 : dw $0
dl $7EF0E6 : db $2 : dw $0
dl $7EF0EA : db $2 : dw $0
dl $7EF0EE : db $2 : dw $0
dl $7EF0F2 : db $2 : dw $0
dl $7EF0F6 : db $2 : dw $0
dl $7EF100 : db $2 : dw $0
dl $7EF104 : db $2 : dw $0
dl $7EF102 : db $2 : dw $0
dl $7EF106 : db $2 : dw $0
dl $7EF10A : db $2 : dw $0
dl $7EF10E : db $2 : dw $0
dl $7EF112 : db $2 : dw $0
dl $7EF116 : db $2 : dw $0
dl $7EF11A : db $2 : dw $0
dl $7EF11E : db $2 : dw $0
dl $7EF122 : db $2 : dw $0
dl $7EF126 : db $2 : dw $0
dl $7EF12A : db $2 : dw $0
dl $7EF12E : db $2 : dw $0
dl $7EF132 : db $2 : dw $0
dl $7EF136 : db $2 : dw $0
dl $7EF13A : db $2 : dw $0
dl $7EF144 : db $2 : dw $0
dl $7EF142 : db $2 : dw $0
dl $7EF146 : db $2 : dw $0
dl $7EF14A : db $2 : dw $0
dl $7EF14E : db $2 : dw $0
dl $7EF152 : db $2 : dw $0
dl $7EF15C : db $2 : dw $0
dl $7EF160 : db $2 : dw $0
dl $7EF164 : db $2 : dw $0
dl $7EF168 : db $2 : dw $0
dl $7EF16C : db $2 : dw $0
dl $7EF170 : db $2 : dw $0
dl $7EF174 : db $2 : dw $0
dl $7EF178 : db $2 : dw $0
dl $7EF17C : db $2 : dw $0
dl $7EF180 : db $2 : dw $0
dl $7EF184 : db $2 : dw $0
dl $7EF188 : db $2 : dw $0
dl $7EF18C : db $2 : dw $0
dl $7EF190 : db $2 : dw $0
dl $7EF194 : db $2 : dw $0
dl $7EF198 : db $2 : dw $0
dl $7EF19C : db $2 : dw $0
dl $7EF1A0 : db $2 : dw $0
dl $7EF1A4 : db $2 : dw $0
dl $7EF1A2 : db $2 : dw $0
dl $7EF1A6 : db $2 : dw $0
dl $7EF1AA : db $2 : dw $0
dl $7EF1AE : db $2 : dw $0
dl $7EF1B2 : db $2 : dw $0
dl $7EF1B6 : db $2 : dw $0
dl $7EF1BA : db $2 : dw $0
dl $7EF1BE : db $2 : dw $0
dl $7EF1C2 : db $2 : dw $0
dl $7EF1C6 : db $2 : dw $0
dl $7EF1CA : db $2 : dw $0
dl $7EF1CE : db $2 : dw $0
dl $7EF1D2 : db $2 : dw $0
dl $7EF1D6 : db $2 : dw $0
dl $7EF1DA : db $2 : dw $0
dl $7EF1DE : db $2 : dw $0
dl $7EF1E2 : db $2 : dw $0
dl $7EF1E6 : db $2 : dw $0
dl $7EF1EA : db $2 : dw $0
dl $7EF1EE : db $2 : dw $0
dl $7EF1F2 : db $2 : dw $0
dl $7EF1F6 : db $2 : dw $0
dl $7EF200 : db $2 : dw $0
dl $7EF204 : db $2 : dw $0
dl $7EF202 : db $2 : dw $0
dl $7EF206 : db $2 : dw $0
dl $7EF20A : db $2 : dw $0
dl $7EF20E : db $2 : dw $F000
dl $7EF212 : db $2 : dw $0
dl $7EF216 : db $2 : dw $0
dl $7EF21A : db $2 : dw $0
dl $7EF21E : db $2 : dw $0
dl $7EF222 : db $2 : dw $0
dl $7EF226 : db $2 : dw $0
dl $7EF22A : db $2 : dw $0
dl $7EF22E : db $2 : dw $0
dl $7EF232 : db $2 : dw $0
dl $7EF236 : db $2 : dw $0
dl $7EF23A : db $2 : dw $0
dl $7EF244 : db $2 : dw $0
dl $7EF242 : db $2 : dw $0
dl $7EF24C : db $2 : dw $0
dl $7EF250 : db $2 : dw $0
dl $7EF254 : db $2 : dw $0
dl $7EF258 : db $2 : dw $0
dl $7EF25C : db $2 : dw $0
dl $7EF260 : db $2 : dw $0
dl $7EF264 : db $2 : dw $0
dl $7EF268 : db $2 : dw $0
dl $7EF26C : db $2 : dw $0
dl $7EF270 : db $2 : dw $0
dl $7EF274 : db $2 : dw $0
dl $7EF278 : db $2 : dw $0
dl $7EF27C : db $2 : dw $0
dl $7EF280 : db $2 : dw $0
dl $7EF284 : db $2 : dw $0
dl $7EF288 : db $2 : dw $0
dl $7EF28C : db $2 : dw $0
dl $7EF290 : db $2 : dw $0
dl $7EF294 : db $2 : dw $0
dl $7EF298 : db $2 : dw $0
dl $7EF29C : db $2 : dw $0
dl $7EF2A0 : db $2 : dw $0
dl $7EF29E : db $2 : dw $0
dl $7EF2A2 : db $2 : dw $0
dl $7EF2A6 : db $2 : dw $0
dl $7EF2AA : db $2 : dw $0
dl $7EF2AE : db $2 : dw $0
dl $7EF2B2 : db $2 : dw $0
dl $7EF2B6 : db $2 : dw $0
dl $7EF2BA : db $2 : dw $0
dl $7EF2BE : db $2 : dw $0
dl $7EF2C2 : db $2 : dw $0
dl $7EF2C6 : db $2 : dw $0
dl $7EF2CA : db $2 : dw $0
dl $7EF2CE : db $2 : dw $0
dl $7EF2D2 : db $2 : dw $0
dl $7EF2D6 : db $2 : dw $0
dl $7EF2DA : db $2 : dw $0
dl $7EF2DE : db $2 : dw $0
dl $7EF2E2 : db $2 : dw $0
dl $7EF2E6 : db $2 : dw $0
dl $7EF2EA : db $2 : dw $0
dl $7EF2EE : db $2 : dw $0
dl $7EF2F2 : db $2 : dw $0
dl $7EF2F6 : db $2 : dw $0
dl $7EF300 : db $2 : dw $0
dl $7EF304 : db $2 : dw $0
dl $7EF302 : db $2 : dw $0
dl $7EF306 : db $2 : dw $0
dl $7EF30A : db $2 : dw $0
dl $7EF30E : db $2 : dw $0
dl $7EF312 : db $2 : dw $0
dl $7EF316 : db $2 : dw $0
dl $7EF31A : db $2 : dw $0
dl $7EF31E : db $2 : dw $0
dl $7EF322 : db $2 : dw $0
dl $7EF326 : db $2 : dw $0
dl $7EF32A : db $2 : dw $0
dl $7EF32E : db $2 : dw $0
dl $7EF332 : db $2 : dw $0
dl $7EF336 : db $2 : dw $0
dl $7EF340 : db $2 : dw $0
dl $7EF344 : db $2 : dw $0
dl $7EF348 : db $2 : dw $0
dl $7EF34C : db $2 : dw $0
dl $7EF350 : db $2 : dw $0
dl $7EF354 : db $2 : dw $0
dl $7EF358 : db $2 : dw $0
dl $7EF35C : db $2 : dw $0
dl $7EF360 : db $2 : dw $0
dl $7EF364 : db $2 : dw $0
dl $7EF368 : db $2 : dw $0
dl $7EF36C : db $2 : dw $1818
dl $7EF370 : db $2 : dw $0
dl $7EF374 : db $2 : dw $0
dl $7EF378 : db $2 : dw $F800
dl $7EF37C : db $2 : dw $0
dl $7EF380 : db $2 : dw $0
dl $7EF384 : db $2 : dw $0
dl $7EF388 : db $2 : dw $0
dl $7EF38C : db $2 : dw $0
dl $7EF390 : db $2 : dw $0
dl $7EF394 : db $2 : dw $0
dl $7EF398 : db $2 : dw $0
dl $7EF39C : db $2 : dw $0
dl $7EF3A0 : db $2 : dw $0
dl $7EF39E : db $2 : dw $0
dl $7EF3A2 : db $2 : dw $0
dl $7EF3A6 : db $2 : dw $0
dl $7EF3AA : db $2 : dw $0
dl $7EF3AE : db $2 : dw $0
dl $7EF3B2 : db $2 : dw $0
dl $7EF3B6 : db $2 : dw $0
dl $7EF3BA : db $2 : dw $0
dl $7EF3BE : db $2 : dw $0
dl $7EF3C2 : db $2 : dw $0
dl $7EF3C6 : db $1 : dw $10
dl $7EF3CA : db $2 : dw $0
dl $7EF3CE : db $2 : dw $0
dl $7EF3D2 : db $2 : dw $0
dl $7EF3D6 : db $2 : dw $0
dl $7EF3DA : db $2 : dw $8C01
dl $7EF3DE : db $2 : dw $8C01
dl $7EF3E2 : db $2 : dw $55
dl $7EF3E6 : db $2 : dw $0
dl $7EF3EA : db $2 : dw $0
dl $7EF3EE : db $2 : dw $0
dl $7EF3F2 : db $2 : dw $0
dl $7EF3F6 : db $2 : dw $0
dl $7EF400 : db $2 : dw $FF00
dl $7EF404 : db $2 : dw $0
dl $7EF402 : db $2 : dw $FF
dl $7EF406 : db $2 : dw $0
dl $7EF40A : db $2 : dw $0
dl $7EF40E : db $2 : dw $0
dl $7EF412 : db $2 : dw $0
dl $7EF416 : db $2 : dw $0
dl $7EF41A : db $2 : dw $0
dl $7EF41E : db $2 : dw $0
dl $7EF422 : db $2 : dw $0
dl $7EF426 : db $2 : dw $0
dl $7EF42A : db $2 : dw $0
dl $7EF42E : db $2 : dw $0
dl $7EF432 : db $2 : dw $0
dl $7EF436 : db $2 : dw $0
dl $7EF440 : db $2 : dw $0
dl $7EF444 : db $2 : dw $0
dl $7EF448 : db $2 : dw $0
dl $7EF44C : db $2 : dw $0
dl $7EF450 : db $2 : dw $0
dl $7EF454 : db $2 : dw $0
dl $7EF458 : db $2 : dw $0
dl $7EF45C : db $2 : dw $0
dl $7EF460 : db $2 : dw $0
dl $7EF464 : db $2 : dw $0
dl $7EF468 : db $2 : dw $0
dl $7EF46C : db $2 : dw $0
dl $7EF470 : db $2 : dw $0
dl $7EF474 : db $2 : dw $0
dl $7EF478 : db $2 : dw $0
dl $7EF47C : db $2 : dw $0
dl $7EF480 : db $2 : dw $0
dl $7EF484 : db $2 : dw $0
dl $7EF488 : db $2 : dw $0
dl $7EF48C : db $2 : dw $0
dl $7EF490 : db $2 : dw $0
dl $7EF494 : db $2 : dw $0
dl $7EF498 : db $2 : dw $0
dl $7EF49C : db $2 : dw $0
dl $7EF4A0 : db $2 : dw $0
dl $7EF49E : db $2 : dw $0
dl $7EF4A2 : db $2 : dw $0
dl $7EF4A6 : db $2 : dw $0
dl $7EF4AA : db $2 : dw $0
dl $7EF4AE : db $2 : dw $0
dl $7EF4B2 : db $2 : dw $0
dl $7EF4B6 : db $2 : dw $0
dl $7EF4BA : db $2 : dw $0
dl $7EF4BE : db $2 : dw $0
dl $7EF4C2 : db $2 : dw $0
dl $7EF4C6 : db $2 : dw $0
dl $7EF4CA : db $2 : dw $0
dl $7EF4CE : db $2 : dw $0
dl $7EF4D2 : db $2 : dw $0
dl $7EF4D6 : db $2 : dw $0
dl $7EF4DA : db $2 : dw $0
dl $7EF4DE : db $2 : dw $0
dl $7EF4E2 : db $2 : dw $0
dl $7EF4E6 : db $2 : dw $0
dl $7EF4EA : db $2 : dw $0
dl $7EF4EE : db $2 : dw $0
dl $7EF4F2 : db $2 : dw $0
dl $7EF4F6 : db $2 : dw $0
dl $7EF4FA : db $2 : dw $0
dl $7EF4FE : db $2 : dw $BAEA
dl $7E040E : db $2 : dw $0
dl $7E0408 : db $1 : dw $2
dl $7E0400 : db $2 : dw $0
dl $7EF36F : db $1 : dw $FF
dl $7E0402 : db $2 : dw $0
dl $7EF3FE : db $2 : dw $0
dl $7EF2FE : db $2 : dw $0
dl $7EF1FE : db $2 : dw $0
dl $7EF0FE : db $2 : dw $0
dl $7EF4FC : db $2 : dw $0
dl $7EF3FC : db $2 : dw $0
dl $7EF2FC : db $2 : dw $0
dl $7EF1FC : db $2 : dw $0
dl $7EF0FC : db $2 : dw $0
dl $7EF3FA : db $2 : dw $0
dl $7EF2FA : db $2 : dw $0
dl $7EF1FA : db $2 : dw $0
dl $7EF0FA : db $2 : dw $0
dl $7EF4F8 : db $2 : dw $0
dl $7EF3F8 : db $2 : dw $0
dl $7EF2F8 : db $2 : dw $0
dl $7EF1F8 : db $2 : dw $0
dl $7EF0F8 : db $2 : dw $0
dl $7EF4F4 : db $2 : dw $0
dl $7EF3F4 : db $2 : dw $0
dl $7EF2F4 : db $2 : dw $0
dl $7EF1F4 : db $2 : dw $0
dl $7EF0F4 : db $2 : dw $0
dl $7EF4F0 : db $2 : dw $0
dl $7EF3F0 : db $2 : dw $0
dl $7EF2F0 : db $2 : dw $0
dl $7EF1F0 : db $2 : dw $0
dl $7EF0F0 : db $2 : dw $0
dl $7EF4EC : db $2 : dw $0
dl $7EF3EC : db $2 : dw $0
dl $7EF2EC : db $2 : dw $0
dl $7EF1EC : db $2 : dw $0
dl $7EF0EC : db $2 : dw $0
dl $7EF4E8 : db $2 : dw $0
dl $7EF3E8 : db $2 : dw $0
dl $7EF2E8 : db $2 : dw $0
dl $7EF1E8 : db $2 : dw $0
dl $7EF0E8 : db $2 : dw $0
dl $7EF4E4 : db $2 : dw $0
dl $7EF3E4 : db $2 : dw $0
dl $7EF2E4 : db $2 : dw $0
dl $7EF1E4 : db $2 : dw $0
dl $7EF0E4 : db $2 : dw $0
dl $7EF4E0 : db $2 : dw $0
dl $7EF3E0 : db $2 : dw $AA01
dl $7EF2E0 : db $2 : dw $0
dl $7EF1E0 : db $2 : dw $0
dl $7EF0E0 : db $2 : dw $0
dl $7EF4DC : db $2 : dw $0
dl $7EF3DC : db $2 : dw $8C01
dl $7EF2DC : db $2 : dw $0
dl $7EF1DC : db $2 : dw $0
dl $7EF0DC : db $2 : dw $0
dl $7EF4D8 : db $2 : dw $0
dl $7EF3D8 : db $2 : dw $6100
dl $7EF2D8 : db $2 : dw $0
dl $7EF1D8 : db $2 : dw $0
dl $7EF0D8 : db $2 : dw $0
dl $7EF4D4 : db $2 : dw $0
dl $7EF3D4 : db $2 : dw $0
dl $7EF2D4 : db $2 : dw $0
dl $7EF1D4 : db $2 : dw $0
dl $7EF0D4 : db $2 : dw $0
dl $7EF4D0 : db $2 : dw $0
dl $7EF3D0 : db $2 : dw $0
dl $7EF2D0 : db $2 : dw $0
dl $7EF1D0 : db $2 : dw $0
dl $7EF0D0 : db $2 : dw $0
dl $7EF4CC : db $2 : dw $0
dl $7EF3CC : db $1 : dw $5
dl $7EF2CC : db $2 : dw $0
dl $7EF1CC : db $2 : dw $0
dl $7EF0CC : db $2 : dw $0
dl $7EF2A4 : db $2 : dw $0
dl $7EF4C8 : db $2 : dw $0
dl $7EF3C8 : db $2 : dw $0
dl $7EF2C8 : db $2 : dw $0
dl $7EF1C8 : db $2 : dw $0
dl $7EF0C8 : db $2 : dw $0
dl $7EF3A4 : db $2 : dw $0
dl $7EF4C4 : db $2 : dw $0
dl $7EF3C4 : db $2 : dw $0
dl $7EF2C4 : db $2 : dw $0
dl $7EF1C4 : db $2 : dw $0
dl $7EF0C4 : db $2 : dw $0
dl $7EF4A4 : db $2 : dw $0
dl $7EF4C0 : db $2 : dw $0
dl $7EF3C0 : db $2 : dw $0
dl $7EF2C0 : db $2 : dw $0
dl $7EF1C0 : db $2 : dw $0
dl $7EF0C0 : db $2 : dw $0
dl $7EF0A8 : db $2 : dw $0
dl $7EF0AC : db $2 : dw $0
dl $7EF4AC : db $2 : dw $0
dl $7EF2B0 : db $2 : dw $0
dl $7EF1B0 : db $2 : dw $0
dl $7EF4BC : db $2 : dw $0
dl $7EF3BC : db $2 : dw $0
dl $7EF2BC : db $2 : dw $0
dl $7EF1BC : db $2 : dw $0
dl $7EF0BC : db $2 : dw $0
dl $7EF1A8 : db $2 : dw $0
dl $7EF1AC : db $2 : dw $0
dl $7EF4A8 : db $2 : dw $0
dl $7EF3B0 : db $2 : dw $0
dl $7EF3AC : db $2 : dw $0
dl $7EF4B8 : db $2 : dw $0
dl $7EF3B8 : db $2 : dw $0
dl $7EF2B8 : db $2 : dw $0
dl $7EF1B8 : db $2 : dw $0
dl $7EF0B8 : db $2 : dw $0
dl $7EF2A8 : db $2 : dw $0
dl $7EF2AC : db $2 : dw $0
dl $7EF0B0 : db $2 : dw $0
dl $7EF4B0 : db $2 : dw $0
dl $7EF3A8 : db $2 : dw $0
dl $7EF4B4 : db $2 : dw $0
dl $7EF3B4 : db $2 : dw $0
dl $7EF2B4 : db $2 : dw $0
dl $7EF1B4 : db $2 : dw $0
dl $7EF0B4 : db $2 : dw $0
dl $7EF008 : db $2 : dw $0
dl $7EF00C : db $2 : dw $0
dl $7EF010 : db $2 : dw $0
dl $7EF014 : db $2 : dw $0
dl $7EF018 : db $2 : dw $0
dl $7EF01C : db $2 : dw $0
dl $7EF020 : db $2 : dw $0
dl $7EF024 : db $2 : dw $0
dl $7EF028 : db $2 : dw $0
dl $7EF02C : db $2 : dw $0
dl $7EF030 : db $2 : dw $0
dl $7EF034 : db $2 : dw $0
dl $7EF038 : db $2 : dw $0
dl $7EF03C : db $2 : dw $0
dl $7EF058 : db $2 : dw $0
dl $7EF03A : db $2 : dw $0
dl $7EF03E : db $2 : dw $0
dl $7EF042 : db $2 : dw $0
dl $7EF046 : db $2 : dw $0
dl $7EF04A : db $2 : dw $0
dl $7EF04E : db $2 : dw $0
dl $7EF056 : db $2 : dw $0
dl $7EF05A : db $2 : dw $0
dl $7EF05E : db $2 : dw $0
dl $7EF062 : db $2 : dw $0
dl $7EF066 : db $2 : dw $0
dl $7EF06A : db $2 : dw $0
dl $7EF06E : db $2 : dw $0
dl $7EF072 : db $2 : dw $0
dl $7EF076 : db $2 : dw $0
dl $7EF07A : db $2 : dw $0
dl $7EF07E : db $2 : dw $0
dl $7EF082 : db $2 : dw $0
dl $7EF086 : db $2 : dw $0
dl $7EF08A : db $2 : dw $0
dl $7EF08E : db $2 : dw $0
dl $7EF092 : db $2 : dw $0
dl $7EF096 : db $2 : dw $0
dl $7EF09A : db $2 : dw $0
dl $7EF09E : db $2 : dw $0
dl $7EF108 : db $2 : dw $0
dl $7EF10C : db $2 : dw $0
dl $7EF110 : db $2 : dw $0
dl $7EF114 : db $2 : dw $0
dl $7EF118 : db $2 : dw $0
dl $7EF11C : db $2 : dw $0
dl $7EF120 : db $2 : dw $0
dl $7EF124 : db $2 : dw $0
dl $7EF128 : db $2 : dw $0
dl $7EF12C : db $2 : dw $0
dl $7EF130 : db $2 : dw $0
dl $7EF134 : db $2 : dw $0
dl $7EF138 : db $2 : dw $0
dl $7EF13C : db $2 : dw $0
dl $7EF140 : db $2 : dw $0
dl $7EF148 : db $2 : dw $0
dl $7EF14C : db $2 : dw $0
dl $7EF150 : db $2 : dw $0
dl $7EF154 : db $2 : dw $0
dl $7EF158 : db $2 : dw $0
dl $7EF13E : db $2 : dw $0
dl $7EF156 : db $2 : dw $0
dl $7EF15A : db $2 : dw $0
dl $7EF15E : db $2 : dw $0
dl $7EF162 : db $2 : dw $0
dl $7EF166 : db $2 : dw $0
dl $7EF16A : db $2 : dw $0
dl $7EF16E : db $2 : dw $0
dl $7EF172 : db $2 : dw $0
dl $7EF176 : db $2 : dw $0
dl $7EF17A : db $2 : dw $0
dl $7EF17E : db $2 : dw $0
dl $7EF182 : db $2 : dw $0
dl $7EF186 : db $2 : dw $0
dl $7EF18A : db $2 : dw $0
dl $7EF18E : db $2 : dw $0
dl $7EF192 : db $2 : dw $0
dl $7EF196 : db $2 : dw $0
dl $7EF19A : db $2 : dw $0
dl $7EF19E : db $2 : dw $0
dl $7EF208 : db $2 : dw $2
dl $7EF20C : db $2 : dw $F000
dl $7EF210 : db $2 : dw $0
dl $7EF214 : db $2 : dw $0
dl $7EF218 : db $2 : dw $0
dl $7EF21C : db $2 : dw $0
dl $7EF220 : db $2 : dw $0
dl $7EF224 : db $2 : dw $0
dl $7EF228 : db $2 : dw $0
dl $7EF22C : db $2 : dw $0
dl $7EF230 : db $2 : dw $0
dl $7EF234 : db $2 : dw $0
dl $7EF238 : db $2 : dw $0
dl $7EF23C : db $2 : dw $0
dl $7EF240 : db $2 : dw $0
dl $7EF248 : db $2 : dw $0
dl $7EF23E : db $2 : dw $0
dl $7EF246 : db $2 : dw $0
dl $7EF24A : db $2 : dw $0
dl $7EF24E : db $2 : dw $0
dl $7EF252 : db $2 : dw $0
dl $7EF256 : db $2 : dw $0
dl $7EF25A : db $2 : dw $0
dl $7EF25E : db $2 : dw $0
dl $7EF262 : db $2 : dw $0
dl $7EF266 : db $2 : dw $0
dl $7EF26A : db $2 : dw $0
dl $7EF26E : db $2 : dw $0
dl $7EF272 : db $2 : dw $0
dl $7EF276 : db $2 : dw $0
dl $7EF27A : db $2 : dw $0
dl $7EF27E : db $2 : dw $0
dl $7EF282 : db $2 : dw $0
dl $7EF286 : db $2 : dw $0
dl $7EF28A : db $2 : dw $0
dl $7EF28E : db $2 : dw $0
dl $7EF292 : db $2 : dw $0
dl $7EF296 : db $2 : dw $0
dl $7EF29A : db $2 : dw $0
dl $7EF308 : db $2 : dw $0
dl $7EF30C : db $2 : dw $0
dl $7EF310 : db $2 : dw $0
dl $7EF314 : db $2 : dw $0
dl $7EF318 : db $2 : dw $0
dl $7EF31C : db $2 : dw $0
dl $7EF320 : db $2 : dw $0
dl $7EF324 : db $2 : dw $0
dl $7EF328 : db $2 : dw $0
dl $7EF32C : db $2 : dw $0
dl $7EF330 : db $2 : dw $0
dl $7EF334 : db $2 : dw $0
dl $7EF338 : db $2 : dw $0
dl $7EF33C : db $2 : dw $0
dl $7EF33A : db $2 : dw $0
dl $7EF33E : db $2 : dw $0
dl $7EF342 : db $2 : dw $0
dl $7EF346 : db $2 : dw $0
dl $7EF34A : db $2 : dw $0
dl $7EF34E : db $2 : dw $0
dl $7EF352 : db $2 : dw $0
dl $7EF356 : db $2 : dw $0
dl $7EF35A : db $2 : dw $0
dl $7EF35E : db $2 : dw $0
dl $7EF362 : db $2 : dw $0
dl $7EF366 : db $2 : dw $0
dl $7EF36A : db $2 : dw $0
dl $7EF36E : db $2 : dw $0
dl $7EF372 : db $2 : dw $0
dl $7EF376 : db $2 : dw $0
dl $7EF37A : db $2 : dw $0
dl $7EF37E : db $2 : dw $0
dl $7EF382 : db $2 : dw $0
dl $7EF386 : db $2 : dw $0
dl $7EF38A : db $2 : dw $0
dl $7EF38E : db $2 : dw $0
dl $7EF392 : db $2 : dw $0
dl $7EF396 : db $2 : dw $0
dl $7EF39A : db $2 : dw $0
dl $7EF408 : db $2 : dw $0
dl $7EF40C : db $2 : dw $0
dl $7EF410 : db $2 : dw $0
dl $7EF414 : db $2 : dw $0
dl $7EF418 : db $2 : dw $0
dl $7EF41C : db $2 : dw $0
dl $7EF420 : db $2 : dw $0
dl $7EF424 : db $2 : dw $0
dl $7EF428 : db $2 : dw $0
dl $7EF42C : db $2 : dw $0
dl $7EF430 : db $2 : dw $0
dl $7EF434 : db $2 : dw $0
dl $7EF438 : db $2 : dw $0
dl $7EF43C : db $2 : dw $0
dl $7EF43A : db $2 : dw $0
dl $7EF43E : db $2 : dw $0
dl $7EF442 : db $2 : dw $0
dl $7EF446 : db $2 : dw $0
dl $7EF44A : db $2 : dw $0
dl $7EF44E : db $2 : dw $0
dl $7EF452 : db $2 : dw $0
dl $7EF456 : db $2 : dw $0
dl $7EF45A : db $2 : dw $0
dl $7EF45E : db $2 : dw $0
dl $7EF462 : db $2 : dw $0
dl $7EF466 : db $2 : dw $0
dl $7EF46A : db $2 : dw $0
dl $7EF46E : db $2 : dw $0
dl $7EF472 : db $2 : dw $0
dl $7EF476 : db $2 : dw $0
dl $7EF47A : db $2 : dw $0
dl $7EF47E : db $2 : dw $0
dl $7EF482 : db $2 : dw $0
dl $7EF486 : db $2 : dw $0
dl $7EF48A : db $2 : dw $0
dl $7EF48E : db $2 : dw $0
dl $7EF492 : db $2 : dw $0
dl $7EF496 : db $2 : dw $0
dl $7EF49A : db $2 : dw $0
.after_state_1


.state_2
dl $7EF3C8 : db $1 : dw $3
dl $7E0402 : db $2 : dw $0
dl $7E040A : db $1 : dw $1B
dl $7E040E : db $2 : dw $1C
dl $7EF360 : db $2 : dw $1
dl $7EF36F : db $1 : dw $0
dl $7EF2FB : db $1 : dw $0
dl $7EF208 : db $2 : dw $2
dl $7EF216 : db $1 : dw $0
dl $7EF35A : db $1 : dw $1
dl $7EF0AA : db $2 : dw $F
dl $7EF36D : db $1 : dw $14
dl $7EF3C5 : db $1 : dw $1
dl $7EF3C6 : db $1 : dw $11
dl $7EF359 : db $1 : dw $1
dl $7EF2BB : db $1 : dw $0
dl $7EF0C2 : db $2 : dw $F
dl $7EF362 : db $2 : dw $1
dl $7EF051 : db $1 : dw $0
dl $7EF3CC : db $1 : dw $0
dl $7E0403 : db $1 : dw $0
dl $7E0400 : db $2 : dw $0
dl $7E0408 : db $1 : dw $F
.after_state_2


.state_3
dl $7EF0C2 : db $2 : dw $F
dl $7E0400 : db $2 : dw $0
dl $7E0408 : db $2 : dw $0
dl $7EF0C0 : db $2 : dw $5
dl $7E040E : db $2 : dw $4
dl $7E0402 : db $2 : dw $0
.after_state_3


.state_4
dl $7E0400 : db $2 : dw $0
dl $7E0402 : db $2 : dw $0
dl $7EF0A0 : db $2 : dw $5
dl $7EF0C0 : db $2 : dw $5
dl $7E040E : db $2 : dw $4
dl $7E0408 : db $2 : dw $0
.after_state_4


.state_5
dl $7E0400 : db $2 : dw $0
dl $7EF36D : db $1 : dw $10
dl $7E0402 : db $2 : dw $0
dl $7EF0A0 : db $2 : dw $5
dl $7EF002 : db $2 : dw $C
dl $7E040E : db $2 : dw $10
dl $7E0408 : db $2 : dw $0
.after_state_5


.state_6
dl $7EF002 : db $2 : dw $C
dl $7E0408 : db $2 : dw $0
dl $7E0402 : db $2 : dw $0
dl $7EF0A4 : db $2 : dw $F
dl $7E040E : db $2 : dw $1C
dl $7E0400 : db $2 : dw $0
.after_state_6


.state_7
dl $7E0400 : db $2 : dw $0
dl $7E0408 : db $2 : dw $0
dl $7EF0C4 : db $2 : dw $F
dl $7EF0A4 : db $2 : dw $F
dl $7E040E : db $2 : dw $1C
dl $7E0402 : db $2 : dw $0
.after_state_7


.state_8
dl $7E0400 : db $2 : dw $0
dl $7E0402 : db $2 : dw $0
dl $7E040E : db $2 : dw $1C
dl $7EF0A4 : db $2 : dw $F
dl $7EF0C4 : db $2 : dw $F
dl $7E0408 : db $2 : dw $F
.after_state_8


.state_9
dl $7E0400 : db $2 : dw $0
dl $7E0402 : db $2 : dw $0
dl $7EF002 : db $2 : dw $C
dl $7EF0A4 : db $2 : dw $F
dl $7E040E : db $2 : dw $10
dl $7E0408 : db $2 : dw $C
.after_state_9


.state_10
dl $7EF002 : db $2 : dw $C
dl $7EF36D : db $1 : dw $C
dl $7E0408 : db $2 : dw $5
dl $7EF0A0 : db $2 : dw $5
dl $7E0402 : db $2 : dw $0
dl $7E040E : db $2 : dw $4
dl $7E0400 : db $2 : dw $0
.after_state_10


.state_11
dl $7E0400 : db $2 : dw $0
dl $7E0408 : db $2 : dw $5
dl $7EF0A0 : db $2 : dw $5
dl $7EF0C0 : db $2 : dw $5
dl $7E040E : db $2 : dw $4
dl $7E0402 : db $2 : dw $0
.after_state_11


.state_12
dl $7E0408 : db $1 : dw $5
dl $7EF0C0 : db $2 : dw $5
.after_state_12
