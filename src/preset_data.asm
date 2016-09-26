; Preset locations

preset_esc_bed:
db $02 ; Dungeon
dw $0104 ; Room Index
dw $2110 ; BG1 Vertical Scroll
dw $2110 ; BG2 Vertical Scroll
dw $0900 ; BG1 Horizontal Scroll
dw $0900 ; BG2 Horizontal Scroll
dw $0940 ; Link X
dw $215A ; Link Y
dw $017F ; Camera X
dw $017F ; Camera Y
dw $0816 ; Door Settings
dw $2100 ; Relative Coords HU
dw $2000 ; Relative Coords FU
dw $2110 ; Relative Coords HD
dw $2110 ; Relative Coords FD
dw $0900 ; Relative Coords HL
dw $0900 ; Relative Coords FL
dw $0900 ; Relative Coords HR
dw $0A00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $03 ; Main Graphics
db $FF ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_bed_after

preset_esc_courtyard:
db $02 ; Dungeon
dw $0055 ; Room Index
dw $0B10 ; BG1 Vertical Scroll
dw $0B10 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $0BC6 ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0B00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0B10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $01 ; Main Graphics
db $03 ; Music Track
db $FF ; Starting Floor
db $FF ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_courtyard_after

preset_esc_entrance:
db $01 ; Overworld
dw $001B ; Screen Index
dw $07F9 ; Link X
dw $0709 ; Link Y
dw $06C0 ; BG1 Vertical Scroll
dw $06AB ; BG2 Vertical Scroll
dw $39EC ; BG1 Horizontal Scroll
dw $0785 ; BG2 Horizontal Scroll
dw $0804 ; Scroll X
dw $0718 ; Scroll Y
dw $05B2 ; Unknown 1
dw $0005 ; Unknown 2
dw $0009 ; Unknown 3
dw sram_esc_entrance_after

preset_esc_1st_keyguard:
db $02 ; Dungeon
dw $0001 ; Room Index
dw $0000 ; BG1 Vertical Scroll
dw $0000 ; BG2 Vertical Scroll
dw $0280 ; BG1 Horizontal Scroll
dw $0280 ; BG2 Horizontal Scroll
dw $02F8 ; Link X
dw $0062 ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0000 ; Relative Coords HU
dw $0000 ; Relative Coords FU
dw $0010 ; Relative Coords HD
dw $0110 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $00 ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_esc_1st_keyguard_after

preset_esc_big_room:
db $02 ; Dungeon
dw $0082 ; Room Index
dw $110B ; BG1 Vertical Scroll
dw $110B ; BG2 Vertical Scroll
dw $0400 ; BG1 Horizontal Scroll
dw $0400 ; BG2 Horizontal Scroll
dw $040B ; Link X
dw $1178 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1100 ; Relative Coords HU
dw $1000 ; Relative Coords FU
dw $1110 ; Relative Coords HD
dw $1110 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FF ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_esc_big_room_after

preset_esc_2nd_keyguard:
db $02 ; Dungeon
dw $0071 ; Room Index
dw $0F0B ; BG1 Vertical Scroll
dw $0F0B ; BG2 Vertical Scroll
dw $0200 ; BG1 Horizontal Scroll
dw $0200 ; BG2 Horizontal Scroll
dw $02AD ; Link X
dw $0F78 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0F00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0F10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FF ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_esc_2nd_keyguard_after

preset_esc_ball_n_chains:
db $02 ; Dungeon
dw $0070 ; Room Index
dw $0E00 ; BG1 Vertical Scroll
dw $0E00 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0050 ; Link X
dw $0E2D ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0E00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0E10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0000 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0000 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FE ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_ball_n_chains_after

preset_esc_keyguard_revisited:
db $02 ; Dungeon
dw $0072 ; Room Index
dw $0F00 ; BG1 Vertical Scroll
dw $0F00 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $0F2D ; Link Y
dw $00FF ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0F00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0F10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FF ; Starting Floor
db $02 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_keyguard_revisited_after

preset_esc_secret_passage:
db $02 ; Dungeon
dw $0051 ; Room Index
dw $0A21 ; BG1 Vertical Scroll
dw $0A21 ; BG2 Vertical Scroll
dw $0280 ; BG1 Horizontal Scroll
dw $0280 ; BG2 Horizontal Scroll
dw $02F8 ; Link X
dw $0A8E ; Link Y
dw $00FF ; Camera X
dw $0099 ; Camera Y
dw $0000 ; Door Settings
dw $0A00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0A10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $01 ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_secret_passage_after

preset_esc_snake_avoidance_room:
db $02 ; Dungeon
dw $0041 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $FFCF ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $03A8 ; Link X
dw $082D ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0800 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0810 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0300 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0300 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $01 ; Starting Floor
db $00 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_snake_avoidance_room_after

preset_esc_keyrat:
db $02 ; Dungeon
dw $0021 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $0500 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $0280 ; BG2 Horizontal Scroll
dw $02F8 ; Link X
dw $052D ; Link Y
dw $00FF ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0500 ; Relative Coords HU
dw $0400 ; Relative Coords FU
dw $0510 ; Relative Coords HD
dw $0510 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FF ; Starting Floor
db $00 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_keyrat_after

preset_esc_last_two_screens:
db $02 ; Dungeon
dw $0011 ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0300 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $0378 ; Link X
dw $022D ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0300 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0300 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0001 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FF ; Starting Floor
db $00 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_esc_last_two_screens_after

preset_east_before_cutscene:
db $02 ; Dungeon
dw $0002 ; Room Index
dw $0110 ; BG1 Vertical Scroll
dw $0110 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $01AC ; Link Y
dw $00FF ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0100 ; Relative Coords HU
dw $0000 ; Relative Coords FU
dw $0110 ; Relative Coords HD
dw $0110 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $00 ; Starting Floor
db $00 ; Palace No
db $01 ; Door Orientation
db $01 ; Starting Background
dw sram_east_before_cutscene_after

preset_east_after_cutscene:
db $02 ; Dungeon
dw $0012 ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $0245 ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $00 ; Starting Floor
db $00 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_east_after_cutscene_after

preset_east_octoroc:
db $01 ; Overworld
dw $0025 ; Screen Index
dw $0B10 ; Link X
dw $07E5 ; Link Y
dw $068F ; BG1 Vertical Scroll
dw $071E ; BG2 Vertical Scroll
dw $0A4F ; BG1 Horizontal Scroll
dw $0A9E ; BG2 Horizontal Scroll
dw $0B1B ; Scroll X
dw $078B ; Scroll Y
dw $1814 ; Unknown 1
dw $0000 ; Unknown 2
dw $0002 ; Unknown 3
dw sram_east_octoroc_after

preset_east_outside_palace:
db $01 ; Overworld
dw $002E ; Screen Index
dw $0C70 ; Link X
dw $0A08 ; Link Y
dw $0A00 ; BG1 Vertical Scroll
dw $0A00 ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C7D ; Scroll X
dw $0A6D ; Scroll Y
dw $0000 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_east_outside_palace_after

preset_east_entrance:
db $01 ; Overworld
dw $001E ; Screen Index
dw $0F50 ; Link X
dw $0637 ; Link Y
dw $0791 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0D6F ; BG1 Horizontal Scroll
dw $0EDE ; BG2 Horizontal Scroll
dw $0F5B ; Scroll X
dw $066F ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_east_entrance_after

preset_east_stalfos_room:
db $02 ; Dungeon
dw $00A8 ; Room Index
dw $150A ; BG1 Vertical Scroll
dw $150A ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1128 ; Link X
dw $1577 ; Link Y
dw $017F ; Camera X
dw $0182 ; Camera Y
dw $0000 ; Door Settings
dw $1500 ; Relative Coords HU
dw $1400 ; Relative Coords FU
dw $1510 ; Relative Coords HD
dw $1510 ; Relative Coords FD
dw $1100 ; Relative Coords HL
dw $1000 ; Relative Coords FL
dw $1100 ; Relative Coords HR
dw $1100 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0201 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $04 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_east_stalfos_room_after

preset_east_dark_key_room:
db $02 ; Dungeon
dw $00BA ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $160B ; BG2 Vertical Scroll
dw $00B0 ; BG1 Horizontal Scroll
dw $1400 ; BG2 Horizontal Scroll
dw $14CA ; Link X
dw $1678 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $1400 ; Relative Coords HL
dw $1400 ; Relative Coords FL
dw $1400 ; Relative Coords HR
dw $1500 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $04 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_east_dark_key_room_after

preset_east_big_key_dmg_boost:
db $02 ; Dungeon
dw $00B9 ; Room Index
dw $160B ; BG1 Vertical Scroll
dw $160B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1225 ; Link X
dw $1678 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $04 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_east_big_key_dmg_boost_after

preset_east_big_chest_room:
db $02 ; Dungeon
dw $00A8 ; Room Index
dw $140B ; BG1 Vertical Scroll
dw $140B ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $11B2 ; Link X
dw $1478 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1400 ; Relative Coords HU
dw $1400 ; Relative Coords FU
dw $1410 ; Relative Coords HD
dw $1510 ; Relative Coords FD
dw $1100 ; Relative Coords HL
dw $1000 ; Relative Coords FL
dw $1100 ; Relative Coords HR
dw $1100 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0001 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $04 ; Palace No
db $02 ; Door Orientation
db $01 ; Starting Background
dw sram_east_big_chest_room_after

preset_east_gwg:
db $02 ; Dungeon
dw $00A9 ; Room Index
dw $1400 ; BG1 Vertical Scroll
dw $1400 ; BG2 Vertical Scroll
dw $1280 ; BG1 Horizontal Scroll
dw $1280 ; BG2 Horizontal Scroll
dw $12F8 ; Link X
dw $142B ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1400 ; Relative Coords HU
dw $1400 ; Relative Coords FU
dw $1410 ; Relative Coords HD
dw $1510 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $04 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_east_gwg_after

preset_east_pot_room:
db $02 ; Dungeon
dw $0099 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $1300 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1278 ; Link X
dw $132D ; Link Y
dw $007F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $1300 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1310 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $04 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_east_pot_room_after

preset_east_zeldagamer_room:
db $02 ; Dungeon
dw $00D9 ; Room Index
dw $1B0B ; BG1 Vertical Scroll
dw $1B0B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1225 ; Link X
dw $1B78 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1B00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1B10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $04 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_east_zeldagamer_room_after

preset_east_armos:
db $02 ; Dungeon
dw $00D8 ; Room Index
dw $1A00 ; BG1 Vertical Scroll
dw $1A00 ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1178 ; Link X
dw $1A30 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1A00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1A10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $1100 ; Relative Coords HL
dw $1000 ; Relative Coords FL
dw $1100 ; Relative Coords HR
dw $1100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $04 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_east_armos_after

preset_desert_outside_eastern_palace:
db $01 ; Overworld
dw $001E ; Screen Index
dw $0F50 ; Link X
dw $0638 ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0ED6 ; BG1 Horizontal Scroll
dw $0ED6 ; BG2 Horizontal Scroll
dw $0F5B ; Scroll X
dw $066D ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_desert_outside_eastern_palace_after

preset_desert_ep_spinspeed:
db $02 ; Dungeon
dw $0105 ; Room Index
dw $2110 ; BG1 Vertical Scroll
dw $2110 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $21C2 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $2100 ; Relative Coords HU
dw $2000 ; Relative Coords FU
dw $2110 ; Relative Coords HD
dw $2110 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0F ; Main Graphics
db $18 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_ep_spinspeed_after

preset_desert_unholy_spinspeed:
db $01 ; Overworld
dw $002A ; Screen Index
dw $0407 ; Link X
dw $0B9A ; Link Y
dw $0B20 ; BG1 Vertical Scroll
dw $0B1E ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0400 ; BG2 Horizontal Scroll
dw $0485 ; Scroll X
dw $0B8D ; Scroll Y
dw $0900 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_desert_unholy_spinspeed_after

preset_desert_water_dash:
db $01 ; Overworld
dw $002C ; Screen Index
dw $08D2 ; Link X
dw $0BE2 ; Link Y
dw $0B20 ; BG1 Vertical Scroll
dw $0B1E ; BG2 Vertical Scroll
dw $0830 ; BG1 Horizontal Scroll
dw $0860 ; BG2 Horizontal Scroll
dw $08DD ; Scroll X
dw $0B8D ; Scroll Y
dw $090C ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_desert_water_dash_after

preset_desert_desert_entrance:
db $01 ; Overworld
dw $0030 ; Screen Index
dw $0128 ; Link X
dw $0CB8 ; Link Y
dw $0D2B ; BG1 Vertical Scroll
dw $0C56 ; BG2 Vertical Scroll
dw $01D5 ; BG1 Horizontal Scroll
dw $00AA ; BG2 Horizontal Scroll
dw $012F ; Scroll X
dw $0CC3 ; Scroll Y
dw $0294 ; Unknown 1
dw $0008 ; Unknown 2
dw $FFF6 ; Unknown 3
dw sram_desert_desert_entrance_after

preset_desert_keybonk:
db $02 ; Dungeon
dw $0073 ; Room Index
dw $0F00 ; BG1 Vertical Scroll
dw $0F00 ; BG2 Vertical Scroll
dw $0700 ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $0778 ; Link X
dw $0F22 ; Link Y
dw $017F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0F00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0F10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0700 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0700 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $FF ; Starting Floor
db $06 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_keybonk_after

preset_desert_pre_cannonball_room:
db $02 ; Dungeon
dw $0085 ; Room Index
dw $100B ; BG1 Vertical Scroll
dw $100B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0ACB ; Link X
dw $1078 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1000 ; Relative Coords HU
dw $1000 ; Relative Coords FU
dw $1010 ; Relative Coords HD
dw $1110 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0000 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $FF ; Starting Floor
db $06 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_pre_cannonball_room_after

preset_desert_pot_room:
db $02 ; Dungeon
dw $0073 ; Room Index
dw $0F0B ; BG1 Vertical Scroll
dw $0F0B ; BG2 Vertical Scroll
dw $0700 ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $0725 ; Link X
dw $0F78 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0F00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0F10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0700 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0700 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $FF ; Starting Floor
db $06 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_pot_room_after

preset_desert_desert2_spinspeed:
db $02 ; Dungeon
dw $0083 ; Room Index
dw $1110 ; BG1 Vertical Scroll
dw $1110 ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $11C3 ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $1100 ; Relative Coords HU
dw $1000 ; Relative Coords FU
dw $1110 ; Relative Coords HD
dw $1110 ; Relative Coords FD
dw $0600 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0600 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $FF ; Starting Floor
db $06 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_desert2_spinspeed_after

preset_desert_popo_genocide_room:
db $02 ; Dungeon
dw $0053 ; Room Index
dw $0A10 ; BG1 Vertical Scroll
dw $0A10 ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $0AC6 ; Link Y
dw $007F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $0A00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0A10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $0600 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0600 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $06 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_popo_genocide_room_after

preset_desert_torches:
db $02 ; Dungeon
dw $0043 ; Room Index
dw $0900 ; BG1 Vertical Scroll
dw $0900 ; BG2 Vertical Scroll
dw $0700 ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $0778 ; Link X
dw $092E ; Link Y
dw $017F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0900 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0910 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0700 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0700 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $06 ; Palace No
db $01 ; Door Orientation
db $01 ; Starting Background
dw sram_desert_torches_after

preset_desert_lanmolas:
db $02 ; Dungeon
dw $0043 ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $064A ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $082E ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0800 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0810 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0600 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0600 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $12 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $06 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_desert_lanmolas_after

preset_hera_outside_desert_palace:
db $01 ; Overworld
dw $0030 ; Screen Index
dw $0128 ; Link X
dw $0C41 ; Link Y
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $00A2 ; BG1 Horizontal Scroll
dw $00A2 ; BG2 Horizontal Scroll
dw $012F ; Scroll X
dw $0C6D ; Scroll Y
dw $0016 ; Unknown 1
dw $0000 ; Unknown 2
dw $000E ; Unknown 3
dw sram_hera_outside_desert_palace_after

preset_hera_fake_flippers:
db $01 ; Overworld
dw $0035 ; Screen Index
dw $09E8 ; Link X
dw $0F7C ; Link Y
dw $0D8F ; BG1 Vertical Scroll
dw $0F1E ; BG2 Vertical Scroll
dw $0880 ; BG1 Horizontal Scroll
dw $0900 ; BG2 Horizontal Scroll
dw $097D ; Scroll X
dw $0F8B ; Scroll Y
dw $1860 ; Unknown 1
dw $FFF2 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_hera_fake_flippers_after

preset_hera_dm:
db $02 ; Dungeon
dw $00F1 ; Room Index
dw $FFC0 ; BG1 Vertical Scroll
dw $1F10 ; BG2 Vertical Scroll
dw $00FF ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $0378 ; Link X
dw $1FC1 ; Link Y
dw $017F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1F00 ; Relative Coords HU
dw $1E00 ; Relative Coords FU
dw $1F10 ; Relative Coords HD
dw $1F10 ; Relative Coords FD
dw $0300 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0300 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0201 ; Quadrant 2
db $06 ; Main Graphics
db $12 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_hera_dm_after

preset_hera_after_mirror:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $071E ; Link X
dw $03C0 ; Link Y
dw $02D9 ; BG1 Vertical Scroll
dw $031E ; BG2 Vertical Scroll
dw $062D ; BG1 Horizontal Scroll
dw $06AA ; BG2 Horizontal Scroll
dw $0729 ; Scroll X
dw $038D ; Scroll Y
dw $1816 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF6 ; Unknown 3
dw sram_hera_after_mirror_after

preset_hera_entrance:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $08F0 ; Link X
dw $0085 ; Link Y
dw $007A ; BG1 Vertical Scroll
dw $0021 ; BG2 Vertical Scroll
dw $07DB ; BG1 Horizontal Scroll
dw $087C ; BG2 Horizontal Scroll
dw $08FB ; Scroll X
dw $0090 ; Scroll Y
dw $00D0 ; Unknown 1
dw $000D ; Unknown 2
dw $FFF4 ; Unknown 3
dw sram_hera_entrance_after

preset_hera_tile_room:
db $02 ; Dungeon
dw $0077 ; Room Index
dw $0E00 ; BG1 Vertical Scroll
dw $0E00 ; BG2 Vertical Scroll
dw $0E00 ; BG1 Horizontal Scroll
dw $0E00 ; BG2 Horizontal Scroll
dw $0E78 ; Link X
dw $0E45 ; Link Y
dw $007F ; Camera X
dw $0077 ; Camera Y
dw $0000 ; Door Settings
dw $0E00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0E10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $14 ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_hera_tile_room_after

preset_hera_torches:
db $02 ; Dungeon
dw $0087 ; Room Index
dw $1010 ; BG1 Vertical Scroll
dw $1010 ; BG2 Vertical Scroll
dw $0F00 ; BG1 Horizontal Scroll
dw $0F00 ; BG2 Horizontal Scroll
dw $0F78 ; Link X
dw $10BC ; Link Y
dw $017F ; Camera X
dw $0087 ; Camera Y
dw $0000 ; Door Settings
dw $1000 ; Relative Coords HU
dw $1000 ; Relative Coords FU
dw $1010 ; Relative Coords HD
dw $1110 ; Relative Coords FD
dw $0F00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0F00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $00 ; Starting Floor
db $14 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_hera_torches_after

preset_hera_beetles:
db $02 ; Dungeon
dw $0077 ; Room Index
dw $0EE2 ; BG1 Vertical Scroll
dw $0EE2 ; BG2 Vertical Scroll
dw $0EF0 ; BG1 Horizontal Scroll
dw $0EF0 ; BG2 Horizontal Scroll
dw $0F68 ; Link X
dw $0F4E ; Link Y
dw $016F ; Camera X
dw $0159 ; Camera Y
dw $0000 ; Door Settings
dw $0F00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0F10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0F00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0F00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0201 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $14 ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_hera_beetles_after

preset_hera_petting_zoo:
db $02 ; Dungeon
dw $0031 ; Room Index
dw $060F ; BG1 Vertical Scroll
dw $060F ; BG2 Vertical Scroll
dw $0280 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $03B8 ; Link X
dw $067C ; Link Y
dw $017F ; Camera X
dw $0087 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0300 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0300 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0001 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $02 ; Starting Floor
db $14 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_hera_petting_zoo_after

preset_hera_moldorm:
db $02 ; Dungeon
dw $0017 ; Room Index
dw $0206 ; BG1 Vertical Scroll
dw $020D ; BG2 Vertical Scroll
dw $0E80 ; BG1 Horizontal Scroll
dw $0F00 ; BG2 Horizontal Scroll
dw $0FA8 ; Link X
dw $027A ; Link Y
dw $017F ; Camera X
dw $0085 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0F00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0F00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $04 ; Starting Floor
db $14 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_hera_moldorm_after

preset_aga_outside_hera:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $08F0 ; Link X
dw $007C ; Link Y
dw $0016 ; BG1 Vertical Scroll
dw $0018 ; BG2 Vertical Scroll
dw $087C ; BG1 Horizontal Scroll
dw $087C ; BG2 Horizontal Scroll
dw $08FB ; Scroll X
dw $0087 ; Scroll Y
dw $0050 ; Unknown 1
dw $0006 ; Unknown 2
dw $FFF4 ; Unknown 3
dw sram_aga_outside_hera_after

preset_aga_first_rupee_tree:
db $02 ; Dungeon
dw $00E6 ; Room Index
dw $FFC0 ; BG1 Vertical Scroll
dw $1D10 ; BG2 Vertical Scroll
dw $00FF ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C78 ; Link X
dw $1DB8 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1D00 ; Relative Coords HU
dw $1C00 ; Relative Coords FU
dw $1D10 ; Relative Coords HD
dw $1D10 ; Relative Coords FD
dw $0C00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0C00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $06 ; Main Graphics
db $12 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_aga_first_rupee_tree_after

preset_aga_lost_woods:
db $01 ; Overworld
dw $0000 ; Screen Index
dw $0405 ; Link X
dw $0079 ; Link Y
dw $009C ; BG1 Vertical Scroll
dw $0015 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0400 ; BG2 Horizontal Scroll
dw $048D ; Scroll X
dw $0084 ; Scroll Y
dw $0180 ; Unknown 1
dw $0009 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_aga_lost_woods_after

preset_aga_after_lost_woods:
db $01 ; Overworld
dw $0000 ; Screen Index
dw $0388 ; Link X
dw $03D0 ; Link Y
dw $01AF ; BG1 Vertical Scroll
dw $031E ; BG2 Vertical Scroll
dw $00D9 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $0385 ; Scroll X
dw $038D ; Scroll Y
dw $1860 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_aga_after_lost_woods_after

preset_aga_tower_entrance:
db $01 ; Overworld
dw $001B ; Screen Index
dw $07F8 ; Link X
dw $065C ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0716 ; BG1 Horizontal Scroll
dw $077E ; BG2 Horizontal Scroll
dw $0803 ; Scroll X
dw $066D ; Scroll Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_aga_tower_entrance_after

preset_aga_dark_room_of_despair:
db $02 ; Dungeon
dw $00D0 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $1A0B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $0125 ; Link X
dw $1A78 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1A00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1A10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $0100 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0100 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $02 ; Starting Floor
db $08 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_aga_dark_room_of_despair_after

preset_aga_dark_room_of_melancholy:
db $02 ; Dungeon
dw $00C0 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $190B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $0125 ; Link X
dw $1978 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0100 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0100 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $03 ; Starting Floor
db $08 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_aga_dark_room_of_melancholy_after

preset_aga_red_spears:
db $02 ; Dungeon
dw $00C0 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $1800 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $0178 ; Link X
dw $182C ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0100 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0100 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $03 ; Starting Floor
db $08 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_aga_red_spears_after

preset_aga_circle_of_pot:
db $02 ; Dungeon
dw $00B0 ; Room Index
dw $1610 ; BG1 Vertical Scroll
dw $1610 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $16C4 ; Link Y
dw $007F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $0000 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0000 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $04 ; Starting Floor
db $08 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_aga_circle_of_pot_after

preset_aga_agahnim:
db $02 ; Dungeon
dw $0030 ; Room Index
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $062D ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0000 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0000 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $06 ; Starting Floor
db $08 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_aga_agahnim_after

preset_pod_pyramid:
db $01 ; Overworld
dw $005B ; Screen Index
dw $07F0 ; Link X
dw $0660 ; Link Y
dw $0601 ; BG1 Vertical Scroll
dw $0602 ; BG2 Vertical Scroll
dw $0778 ; BG1 Horizontal Scroll
dw $0778 ; BG2 Horizontal Scroll
dw $07F7 ; Scroll X
dw $066F ; Scroll Y
dw $002E ; Unknown 1
dw $FFFE ; Unknown 2
dw $FFF8 ; Unknown 3
dw sram_pod_pyramid_after

preset_pod_pod_overworld:
db $01 ; Overworld
dw $006E ; Screen Index
dw $0C70 ; Link X
dw $0A0C ; Link Y
dw $0A00 ; BG1 Vertical Scroll
dw $0A00 ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C7D ; Scroll X
dw $0A6D ; Scroll Y
dw $0000 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_pod_pod_overworld_after

preset_pod_entrance:
db $01 ; Overworld
dw $005E ; Screen Index
dw $0F50 ; Link X
dw $064C ; Link Y
dw $0791 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0D6F ; BG1 Horizontal Scroll
dw $0EDE ; BG2 Horizontal Scroll
dw $0F5B ; Scroll X
dw $066F ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_pod_entrance_after

preset_pod_main_hub:
db $02 ; Dungeon
dw $004A ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1480 ; BG1 Horizontal Scroll
dw $1480 ; BG2 Horizontal Scroll
dw $14F8 ; Link X
dw $081B ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0800 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0810 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $1400 ; Relative Coords HL
dw $1400 ; Relative Coords FL
dw $1400 ; Relative Coords HR
dw $1500 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_pod_main_hub_after

preset_pod_hammeryump:
db $02 ; Dungeon
dw $002A ; Room Index
dw $0400 ; BG1 Vertical Scroll
dw $0400 ; BG2 Vertical Scroll
dw $1400 ; BG1 Horizontal Scroll
dw $1400 ; BG2 Horizontal Scroll
dw $1478 ; Link X
dw $0424 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0400 ; Relative Coords HU
dw $0400 ; Relative Coords FU
dw $0410 ; Relative Coords HD
dw $0510 ; Relative Coords FD
dw $1400 ; Relative Coords HL
dw $1400 ; Relative Coords FL
dw $1400 ; Relative Coords HR
dw $1500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_pod_hammeryump_after

preset_pod_before_sexy_statue:
db $02 ; Dungeon
dw $003A ; Room Index
dw $0688 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $14C0 ; BG1 Horizontal Scroll
dw $1500 ; BG2 Horizontal Scroll
dw $1578 ; Link X
dw $062C ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1500 ; Relative Coords HL
dw $1400 ; Relative Coords FL
dw $1500 ; Relative Coords HR
dw $1500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_pod_before_sexy_statue_after

preset_pod_mimics:
db $02 ; Dungeon
dw $002B ; Room Index
dw $0400 ; BG1 Vertical Scroll
dw $0400 ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $0422 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0400 ; Relative Coords HU
dw $0400 ; Relative Coords FU
dw $0410 ; Relative Coords HD
dw $0510 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0000 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_pod_mimics_after

preset_pod_turtle_room:
db $02 ; Dungeon
dw $000B ; Room Index
dw $FFC0 ; BG1 Vertical Scroll
dw $0010 ; BG2 Vertical Scroll
dw $00FF ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $00C8 ; Link Y
dw $007F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $0000 ; Relative Coords HU
dw $0000 ; Relative Coords FU
dw $0010 ; Relative Coords HD
dw $0110 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_pod_turtle_room_after

preset_pod_helma:
db $02 ; Dungeon
dw $006A ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $1500 ; BG2 Horizontal Scroll
dw $1578 ; Link X
dw $0C24 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0C00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0C10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $1500 ; Relative Coords HL
dw $1400 ; Relative Coords FL
dw $1500 ; Relative Coords HR
dw $1500 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0001 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_pod_helma_after

preset_thieves_outside_pod:
db $01 ; Overworld
dw $005E ; Screen Index
dw $0F50 ; Link X
dw $063E ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0ED6 ; BG1 Horizontal Scroll
dw $0ED6 ; BG2 Horizontal Scroll
dw $0F5B ; Scroll X
dw $066D ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_thieves_outside_pod_after

preset_thieves_ow_hammerdash:
db $01 ; Overworld
dw $006E ; Screen Index
dw $0C06 ; Link X
dw $0A6A ; Link Y
dw $0A06 ; BG1 Vertical Scroll
dw $0A0C ; BG2 Vertical Scroll
dw $0D6B ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C85 ; Scroll X
dw $0A79 ; Scroll Y
dw $0000 ; Unknown 1
dw $FFF4 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_thieves_ow_hammerdash_after

preset_thieves_getting_flute:
db $01 ; Overworld
dw $0072 ; Screen Index
dw $04DA ; Link X
dw $0C0C ; Link Y
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $04AE ; BG1 Horizontal Scroll
dw $045C ; BG2 Horizontal Scroll
dw $04E1 ; Scroll X
dw $0C6D ; Scroll Y
dw $000C ; Unknown 1
dw $0000 ; Unknown 2
dw $0004 ; Unknown 3
dw sram_thieves_getting_flute_after

preset_thieves_usain_bolt:
db $01 ; Overworld
dw $002A ; Screen Index
dw $0407 ; Link X
dw $0B99 ; Link Y
dw $0B20 ; BG1 Vertical Scroll
dw $0B1E ; BG2 Vertical Scroll
dw $040F ; BG1 Horizontal Scroll
dw $0400 ; BG2 Horizontal Scroll
dw $0485 ; Scroll X
dw $0B8D ; Scroll Y
dw $0900 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_thieves_usain_bolt_after

preset_thieves_after_activating_flute:
db $01 ; Overworld
dw $0018 ; Screen Index
dw $01CA ; Link X
dw $0798 ; Link Y
dw $082B ; BG1 Vertical Scroll
dw $0734 ; BG2 Vertical Scroll
dw $0226 ; BG1 Horizontal Scroll
dw $014C ; BG2 Horizontal Scroll
dw $01D1 ; Scroll X
dw $07A3 ; Scroll Y
dw $092A ; Unknown 1
dw $000A ; Unknown 2
dw $0004 ; Unknown 3
dw sram_thieves_after_activating_flute_after

preset_thieves_darkworld:
db $01 ; Overworld
dw $0050 ; Screen Index
dw $0161 ; Link X
dw $0553 ; Link Y
dw $04F5 ; BG1 Vertical Scroll
dw $04F5 ; BG2 Vertical Scroll
dw $00E8 ; BG1 Horizontal Scroll
dw $00E3 ; BG2 Horizontal Scroll
dw $0168 ; Scroll X
dw $0562 ; Scroll Y
dw $079E ; Unknown 1
dw $FFFB ; Unknown 2
dw $000D ; Unknown 3
dw sram_thieves_darkworld_after

preset_thieves_entrance:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $01F8 ; Link X
dw $07C2 ; Link Y
dw $06B2 ; BG1 Vertical Scroll
dw $0764 ; BG2 Vertical Scroll
dw $0136 ; BG1 Horizontal Scroll
dw $017E ; BG2 Horizontal Scroll
dw $0203 ; Scroll X
dw $07D1 ; Scroll Y
dw $0BAE ; Unknown 1
dw $000C ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_thieves_entrance_after

preset_thieves_after_big_key:
db $02 ; Dungeon
dw $00DB ; Room Index
dw $1AFB ; BG1 Vertical Scroll
dw $1AFB ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $17BA ; Link X
dw $1B68 ; Link Y
dw $017F ; Camera X
dw $0173 ; Camera Y
dw $0000 ; Door Settings
dw $1B00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1B10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_thieves_after_big_key_after

preset_thieves_fire_room:
db $02 ; Dungeon
dw $00BC ; Room Index
dw $170B ; BG1 Vertical Scroll
dw $170B ; BG2 Vertical Scroll
dw $1800 ; BG1 Horizontal Scroll
dw $1800 ; BG2 Horizontal Scroll
dw $181D ; Link X
dw $1778 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1700 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1710 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $1800 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1800 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_fire_room_after

preset_thieves_hellway:
db $02 ; Dungeon
dw $00BB ; Room Index
dw $170B ; BG1 Vertical Scroll
dw $170B ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1716 ; Link X
dw $1778 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1700 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1710 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_hellway_after

preset_thieves_bombable_floor:
db $02 ; Dungeon
dw $0065 ; Room Index
dw $0D0B ; BG1 Vertical Scroll
dw $0D0B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0AE7 ; Link X
dw $0D78 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0D00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0D10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $16 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_bombable_floor_after

preset_thieves_prison:
db $02 ; Dungeon
dw $0045 ; Room Index
dw $090B ; BG1 Vertical Scroll
dw $090B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0AE4 ; Link X
dw $0978 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0900 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0910 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $16 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_prison_after

preset_thieves_after_gloves:
db $02 ; Dungeon
dw $0044 ; Room Index
dw $090B ; BG1 Vertical Scroll
dw $090B ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $08DC ; Link X
dw $0978 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0900 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0910 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $16 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_after_gloves_after

preset_thieves_pot_hammerdash:
db $02 ; Dungeon
dw $0045 ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $082C ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0800 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0810 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $16 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_pot_hammerdash_after

preset_thieves_blind:
db $02 ; Dungeon
dw $00BC ; Room Index
dw $1600 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $1619 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $1900 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1900 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_thieves_blind_after

preset_sw_outside_thieves:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $0238 ; Link X
dw $09C0 ; Link Y
dw $0904 ; BG1 Vertical Scroll
dw $091E ; BG2 Vertical Scroll
dw $0176 ; BG1 Horizontal Scroll
dw $01B6 ; BG2 Horizontal Scroll
dw $0243 ; Scroll X
dw $098B ; Scroll Y
dw $1836 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_sw_outside_thieves_after

preset_sw_cursed_dwarf:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $0280 ; Link X
dw $09C0 ; Link Y
dw $0904 ; BG1 Vertical Scroll
dw $091E ; BG2 Vertical Scroll
dw $019A ; BG1 Horizontal Scroll
dw $01FE ; BG2 Horizontal Scroll
dw $028B ; Scroll X
dw $098B ; Scroll Y
dw $183E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_sw_cursed_dwarf_after

preset_sw_got_tempered:
db $01 ; Overworld
dw $0062 ; Screen Index
dw $04D8 ; Link X
dw $0881 ; Link Y
dw $081B ; BG1 Vertical Scroll
dw $0821 ; BG2 Vertical Scroll
dw $0466 ; BG1 Horizontal Scroll
dw $0466 ; BG2 Horizontal Scroll
dw $04E3 ; Scroll X
dw $0890 ; Scroll Y
dw $000C ; Unknown 1
dw $FFFD ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_sw_got_tempered_after

preset_sw_dash_to_sw:
db $01 ; Overworld
dw $0051 ; Screen Index
dw $0348 ; Link X
dw $0600 ; Link Y
dw $06A2 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $02CA ; BG1 Horizontal Scroll
dw $02CA ; BG2 Horizontal Scroll
dw $034F ; Scroll X
dw $066F ; Scroll Y
dw $101A ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
dw sram_sw_dash_to_sw_after

preset_sw_mummy_room:
db $01 ; Overworld
dw $0040 ; Screen Index
dw $0248 ; Link X
dw $0250 ; Link Y
dw $0367 ; BG1 Vertical Scroll
dw $01F0 ; BG2 Vertical Scroll
dw $032C ; BG1 Horizontal Scroll
dw $01CA ; BG2 Horizontal Scroll
dw $024F ; Scroll X
dw $025F ; Scroll Y
dw $0EBA ; Unknown 1
dw $FFFE ; Unknown 2
dw $0006 ; Unknown 3
dw sram_sw_mummy_room_after

preset_sw_bomb_jump:
db $01 ; Overworld
dw $0040 ; Screen Index
dw $02E8 ; Link X
dw $025B ; Link Y
dw $021A ; BG1 Vertical Scroll
dw $01FD ; BG2 Vertical Scroll
dw $01F6 ; BG1 Horizontal Scroll
dw $0266 ; BG2 Horizontal Scroll
dw $02F3 ; Scroll X
dw $026A ; Scroll Y
dw $0F4E ; Unknown 1
dw $0003 ; Unknown 2
dw $000A ; Unknown 3
dw sram_sw_bomb_jump_after

preset_sw_key_pot:
db $02 ; Dungeon
dw $0056 ; Room Index
dw $0B0C ; BG1 Vertical Scroll
dw $0B0C ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D1A ; Link X
dw $0B78 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0B00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0B10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $0D00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0D00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0201 ; Quadrant 2
db $09 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $10 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_sw_key_pot_after

preset_sw_skull_entrance:
db $01 ; Overworld
dw $0040 ; Screen Index
dw $0098 ; Link X
dw $00C7 ; Link Y
dw $01CA ; BG1 Vertical Scroll
dw $0066 ; BG2 Vertical Scroll
dw $0086 ; BG1 Horizontal Scroll
dw $0012 ; BG2 Horizontal Scroll
dw $009F ; Scroll X
dw $00D3 ; Scroll Y
dw $0282 ; Unknown 1
dw $000A ; Unknown 2
dw $FFFE ; Unknown 3
dw sram_sw_skull_entrance_after

preset_sw_mummy_hellway:
db $02 ; Dungeon
dw $0049 ; Room Index
dw $090B ; BG1 Vertical Scroll
dw $090B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $12DC ; Link X
dw $0978 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0900 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0910 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $09 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $10 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_sw_mummy_hellway_after

preset_sw_mummy_key:
db $02 ; Dungeon
dw $0049 ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1278 ; Link X
dw $0815 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0800 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0810 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $09 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $10 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_sw_mummy_key_after

preset_sw_mothula:
db $02 ; Dungeon
dw $0039 ; Room Index
dw $070D ; BG1 Vertical Scroll
dw $070B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $12D0 ; Link X
dw $0778 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1200 ; Relative Coords HL
dw $1200 ; Relative Coords FL
dw $1200 ; Relative Coords HR
dw $1300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $09 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $10 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_sw_mothula_after

preset_ice_outside_skull:
db $01 ; Overworld
dw $0000 ; Screen Index
dw $0098 ; Link X
dw $00CB ; Link Y
dw $0066 ; BG1 Vertical Scroll
dw $0069 ; BG2 Vertical Scroll
dw $0016 ; BG1 Horizontal Scroll
dw $0016 ; BG2 Horizontal Scroll
dw $00A3 ; Scroll X
dw $00D6 ; Scroll Y
dw $0282 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ice_outside_skull_after

preset_ice_bridge_warp:
db $01 ; Overworld
dw $002C ; Screen Index
dw $0898 ; Link X
dw $0A0C ; Link Y
dw $0A5C ; BG1 Vertical Scroll
dw $0A00 ; BG2 Vertical Scroll
dw $0830 ; BG1 Horizontal Scroll
dw $0820 ; BG2 Horizontal Scroll
dw $089F ; Scroll X
dw $0A6D ; Scroll Y
dw $0004 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ice_bridge_warp_after

preset_ice_lottery:
db $01 ; Overworld
dw $0056 ; Screen Index
dw $0BE9 ; Link X
dw $0587 ; Link Y
dw $0520 ; BG1 Vertical Scroll
dw $051E ; BG2 Vertical Scroll
dw $0A80 ; BG1 Horizontal Scroll
dw $0B00 ; BG2 Horizontal Scroll
dw $0B7D ; Scroll X
dw $058D ; Scroll Y
dw $0960 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ice_lottery_after

preset_ice_medallion:
db $01 ; Overworld
dw $0057 ; Screen Index
dw $0F70 ; Link X
dw $040C ; Link Y
dw $0491 ; BG1 Vertical Scroll
dw $0400 ; BG2 Vertical Scroll
dw $0E7F ; BG1 Horizontal Scroll
dw $0EFE ; BG2 Horizontal Scroll
dw $0F7B ; Scroll X
dw $046F ; Scroll Y
dw $009E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_ice_medallion_after

preset_ice_zoras_domain:
db $01 ; Overworld
dw $000F ; Screen Index
dw $0F40 ; Link X
dw $0215 ; Link Y
dw $0221 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0E7A ; BG1 Horizontal Scroll
dw $0ECD ; BG2 Horizontal Scroll
dw $0F4A ; Scroll X
dw $026F ; Scroll Y
dw $0098 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF3 ; Unknown 3
dw sram_ice_zoras_domain_after

preset_ice_tiny_warp:
db $01 ; Overworld
dw $000F ; Screen Index
dw $0F40 ; Link X
dw $0221 ; Link Y
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0ECD ; BG1 Horizontal Scroll
dw $0ECD ; BG2 Horizontal Scroll
dw $0F4A ; Scroll X
dw $026F ; Scroll Y
dw $0098 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF3 ; Unknown 3
dw sram_ice_tiny_warp_after

preset_ice_ice_entrance:
db $01 ; Overworld
dw $0075 ; Screen Index
dw $0CB8 ; Link X
dw $0DCB ; Link Y
dw $0D70 ; BG1 Vertical Scroll
dw $0D69 ; BG2 Vertical Scroll
dw $0C2C ; BG1 Horizontal Scroll
dw $0C32 ; BG2 Horizontal Scroll
dw $0CBF ; Scroll X
dw $0DD6 ; Scroll Y
dw $0BC6 ; Unknown 1
dw $0007 ; Unknown 2
dw $FFFE ; Unknown 3
dw sram_ice_ice_entrance_after

preset_ice_ice2:
db $02 ; Dungeon
dw $000E ; Room Index
dw $010C ; BG1 Vertical Scroll
dw $010C ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D1E ; Link X
dw $0178 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0100 ; Relative Coords HU
dw $0000 ; Relative Coords FU
dw $0110 ; Relative Coords HD
dw $0110 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $12 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_ice2_after

preset_ice_penguin_switch_room:
db $02 ; Dungeon
dw $001E ; Room Index
dw $030D ; BG1 Vertical Scroll
dw $030B ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1DD8 ; Link X
dw $0378 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0300 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0310 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $12 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_penguin_switch_room_after

preset_ice_bombable_floor:
db $02 ; Dungeon
dw $001E ; Room Index
dw $0306 ; BG1 Vertical Scroll
dw $0300 ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D78 ; Link X
dw $0314 ; Link Y
dw $017F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0300 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0310 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $12 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_bombable_floor_after

preset_ice_conveyor_room:
db $02 ; Dungeon
dw $003E ; Room Index
dw $0610 ; BG1 Vertical Scroll
dw $0610 ; BG2 Vertical Scroll
dw $1D60 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D78 ; Link X
dw $06D0 ; Link Y
dw $017F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $12 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_conveyor_room_after

preset_ice_ipbj:
db $02 ; Dungeon
dw $003E ; Room Index
dw $0710 ; BG1 Vertical Scroll
dw $0710 ; BG2 Vertical Scroll
dw $1BD7 ; BG1 Horizontal Scroll
dw $1C00 ; BG2 Horizontal Scroll
dw $1C78 ; Link X
dw $07D3 ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1C00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1C00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $12 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_ipbj_after

preset_ice_penguin_room:
db $02 ; Dungeon
dw $004E ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1DB8 ; Link X
dw $0862 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0800 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0810 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $12 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_penguin_room_after

preset_ice_lonely_fireball:
db $02 ; Dungeon
dw $005E ; Room Index
dw $0B0D ; BG1 Vertical Scroll
dw $0B0B ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D10 ; Link X
dw $0B78 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0B00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0B10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FD ; Starting Floor
db $12 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_lonely_fireball_after

preset_ice_fall_in_hole:
db $02 ; Dungeon
dw $009E ; Room Index
dw $130D ; BG1 Vertical Scroll
dw $130B ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D70 ; Link X
dw $1378 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1300 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1310 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FB ; Starting Floor
db $12 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_fall_in_hole_after

preset_ice_kholdstare:
db $02 ; Dungeon
dw $00CE ; Room Index
dw $1808 ; BG1 Vertical Scroll
dw $1810 ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D40 ; Link X
dw $18AA ; Link Y
dw $017F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $1D00 ; Relative Coords HL
dw $1C00 ; Relative Coords FL
dw $1D00 ; Relative Coords HR
dw $1D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0B ; Main Graphics
db $16 ; Music Track
db $FA ; Starting Floor
db $12 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ice_kholdstare_after

preset_swamp_outside_ice:
db $01 ; Overworld
dw $0035 ; Screen Index
dw $0CB8 ; Link X
dw $0DCB ; Link Y
dw $0D6B ; BG1 Vertical Scroll
dw $0D6D ; BG2 Vertical Scroll
dw $0C3E ; BG1 Horizontal Scroll
dw $0C3E ; BG2 Horizontal Scroll
dw $0CC3 ; Scroll X
dw $0DDA ; Scroll Y
dw $0BC6 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_swamp_outside_ice_after

preset_swamp_links_house:
db $01 ; Overworld
dw $002C ; Screen Index
dw $08B8 ; Link X
dw $0B23 ; Link Y
dw $0ABF ; BG1 Vertical Scroll
dw $0AC5 ; BG2 Vertical Scroll
dw $0840 ; BG1 Horizontal Scroll
dw $0840 ; BG2 Horizontal Scroll
dw $08BF ; Scroll X
dw $0B32 ; Scroll Y
dw $0608 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0000 ; Unknown 3
dw sram_swamp_links_house_after

preset_swamp_swamp_overworld:
db $01 ; Overworld
dw $0073 ; Screen Index
dw $07AF ; Link X
dw $0DD9 ; Link Y
dw $0C8F ; BG1 Vertical Scroll
dw $0D1E ; BG2 Vertical Scroll
dw $06DF ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $0785 ; Scroll X
dw $0D93 ; Scroll Y
dw $08A0 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_swamp_swamp_overworld_after

preset_swamp_antifairy_room:
db $02 ; Dungeon
dw $010B ; Room Index
dw $2100 ; BG1 Vertical Scroll
dw $2100 ; BG2 Vertical Scroll
dw $1680 ; BG1 Horizontal Scroll
dw $1680 ; BG2 Horizontal Scroll
dw $16F8 ; Link X
dw $2122 ; Link Y
dw $00FF ; Camera X
dw $0177 ; Camera Y
dw $0000 ; Door Settings
dw $2100 ; Relative Coords HU
dw $2000 ; Relative Coords FU
dw $2110 ; Relative Coords HD
dw $2110 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $08 ; Main Graphics
db $18 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_antifairy_room_after

preset_swamp_entrance:
db $01 ; Overworld
dw $007B ; Screen Index
dw $0778 ; Link X
dw $0EEF ; Link Y
dw $0E99 ; BG1 Vertical Scroll
dw $0E91 ; BG2 Vertical Scroll
dw $06FC ; BG1 Horizontal Scroll
dw $06FA ; BG2 Horizontal Scroll
dw $077F ; Scroll X
dw $0EFE ; Scroll Y
dw $0520 ; Unknown 1
dw $000F ; Unknown 2
dw $0006 ; Unknown 3
dw sram_swamp_entrance_after

preset_swamp_first_key:
db $02 ; Dungeon
dw $0037 ; Room Index
dw $0700 ; BG1 Vertical Scroll
dw $0700 ; BG2 Vertical Scroll
dw $0E80 ; BG1 Horizontal Scroll
dw $0E80 ; BG2 Horizontal Scroll
dw $0EF8 ; Link X
dw $0728 ; Link Y
dw $00FF ; Camera X
dw $0177 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_first_key_after

preset_swamp_main_hub:
db $02 ; Dungeon
dw $0037 ; Room Index
dw $070B ; BG1 Vertical Scroll
dw $070B ; BG2 Vertical Scroll
dw $0E00 ; BG1 Horizontal Scroll
dw $0E00 ; BG2 Horizontal Scroll
dw $0E18 ; Link X
dw $0778 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_main_hub_after

preset_swamp_switch_room:
db $02 ; Dungeon
dw $0036 ; Room Index
dw $060B ; BG1 Vertical Scroll
dw $060B ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C17 ; Link X
dw $0678 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0C00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0C00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_switch_room_after

preset_swamp_sociable_firebar:
db $02 ; Dungeon
dw $0034 ; Room Index
dw $06BF ; BG1 Vertical Scroll
dw $06BF ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $072C ; Link Y
dw $007F ; Camera X
dw $0137 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_sociable_firebar_after

preset_swamp_backtracking:
db $02 ; Dungeon
dw $0035 ; Room Index
dw $060B ; BG1 Vertical Scroll
dw $060B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A19 ; Link X
dw $0678 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_backtracking_after

preset_swamp_hook_shot:
db $02 ; Dungeon
dw $0035 ; Room Index
dw $070B ; BG1 Vertical Scroll
dw $070B ; BG2 Vertical Scroll
dw $0B00 ; BG1 Horizontal Scroll
dw $0B00 ; BG2 Horizontal Scroll
dw $0BDA ; Link X
dw $0778 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0B00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0B00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0201 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_hook_shot_after

preset_swamp_hookdash:
db $02 ; Dungeon
dw $0036 ; Room Index
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0C80 ; BG1 Horizontal Scroll
dw $0C80 ; BG2 Horizontal Scroll
dw $0CF8 ; Link X
dw $062C ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0C00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0C00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_hookdash_after

preset_swamp_restock:
db $02 ; Dungeon
dw $0066 ; Room Index
dw $0D00 ; BG1 Vertical Scroll
dw $0D00 ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D78 ; Link X
dw $0D2A ; Link Y
dw $017F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0D00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0D10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $0D00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0D00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0201 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $0A ; Palace No
db $01 ; Door Orientation
db $01 ; Starting Background
dw sram_swamp_restock_after

preset_swamp_arrghus:
db $02 ; Dungeon
dw $0016 ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C78 ; Link X
dw $0212 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0C00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0C00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_swamp_arrghus_after

preset_mire_outside_swamp:
db $01 ; Overworld
dw $007B ; Screen Index
dw $077A ; Link X
dw $0EFA ; Link Y
dw $0E94 ; BG1 Vertical Scroll
dw $0E9C ; BG2 Vertical Scroll
dw $06F3 ; BG1 Horizontal Scroll
dw $06F4 ; BG2 Horizontal Scroll
dw $0781 ; Scroll X
dw $0F09 ; Scroll Y
dw $049E ; Unknown 1
dw $FFF4 ; Unknown 2
dw $FFFC ; Unknown 3
dw sram_mire_outside_swamp_after

preset_mire_dm:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $0689 ; Link X
dw $0332 ; Link Y
dw $02CF ; BG1 Vertical Scroll
dw $02D4 ; BG2 Vertical Scroll
dw $0611 ; BG1 Horizontal Scroll
dw $061B ; BG2 Horizontal Scroll
dw $0690 ; Scroll X
dw $0341 ; Scroll Y
dw $1682 ; Unknown 1
dw $FFFC ; Unknown 2
dw $FFF5 ; Unknown 3
dw sram_mire_dm_after

preset_mire_mire_darkworld_warp:
db $01 ; Overworld
dw $0030 ; Screen Index
dw $008E ; Link X
dw $0FA8 ; Link Y
dw $0F1E ; BG1 Vertical Scroll
dw $0F1E ; BG2 Vertical Scroll
dw $0006 ; BG1 Horizontal Scroll
dw $000C ; BG2 Horizontal Scroll
dw $0099 ; Scroll X
dw $0F8D ; Scroll Y
dw $1880 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF4 ; Unknown 3
dw sram_mire_mire_darkworld_warp_after

preset_mire_mire_entrance:
db $01 ; Overworld
dw $0070 ; Screen Index
dw $0128 ; Link X
dw $0CE6 ; Link Y
dw $F3D0 ; BG1 Vertical Scroll
dw $0C82 ; BG2 Vertical Scroll
dw $8562 ; BG1 Horizontal Scroll
dw $00A6 ; BG2 Horizontal Scroll
dw $0133 ; Scroll X
dw $0CF1 ; Scroll Y
dw $0414 ; Unknown 1
dw $000C ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_mire_mire_entrance_after

preset_mire_mire2:
db $02 ; Dungeon
dw $0098 ; Room Index
dw $1300 ; BG1 Vertical Scroll
dw $1300 ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1188 ; Link X
dw $132A ; Link Y
dw $017F ; Camera X
dw $0177 ; Camera Y
dw $0000 ; Door Settings
dw $1300 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1310 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $1100 ; Relative Coords HL
dw $1000 ; Relative Coords FL
dw $1100 ; Relative Coords HR
dw $1100 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0E ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_mire2_after

preset_mire_left_dash:
db $02 ; Dungeon
dw $00B2 ; Room Index
dw $1710 ; BG1 Vertical Scroll
dw $1710 ; BG2 Vertical Scroll
dw $0500 ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $0578 ; Link X
dw $17E2 ; Link Y
dw $017F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $1700 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1710 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $0500 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0500 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_left_dash_after

preset_mire_dodongos:
db $02 ; Dungeon
dw $00C1 ; Room Index
dw $1910 ; BG1 Vertical Scroll
dw $1910 ; BG2 Vertical Scroll
dw $0200 ; BG1 Horizontal Scroll
dw $0200 ; BG2 Horizontal Scroll
dw $0278 ; Link X
dw $19CF ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_dodongos_after

preset_mire_spark_gamble:
db $02 ; Dungeon
dw $00C1 ; Room Index
dw $180B ; BG1 Vertical Scroll
dw $180B ; BG2 Vertical Scroll
dw $0300 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $03D6 ; Link X
dw $1878 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0300 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0300 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_spark_gamble_after

preset_mire_spike_key:
db $02 ; Dungeon
dw $00C3 ; Room Index
dw $1800 ; BG1 Vertical Scroll
dw $1800 ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $1814 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0600 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0600 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_spike_key_after

preset_mire_basement:
db $02 ; Dungeon
dw $00A2 ; Room Index
dw $1400 ; BG1 Vertical Scroll
dw $1400 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $1444 ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1400 ; Relative Coords HU
dw $1400 ; Relative Coords FU
dw $1410 ; Relative Coords HD
dw $1510 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_mire_basement_after

preset_mire_cane_dash:
db $02 ; Dungeon
dw $0093 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $130B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0612 ; Link X
dw $1378 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1300 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1310 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $0600 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0600 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $0E ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_cane_dash_after

preset_mire_bombable_wall:
db $02 ; Dungeon
dw $0092 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $130B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $0515 ; Link X
dw $1378 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1300 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1310 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $0500 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0500 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $0E ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_bombable_wall_after

preset_mire_vitty:
db $02 ; Dungeon
dw $00A0 ; Room Index
dw $1400 ; BG1 Vertical Scroll
dw $1400 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $1428 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1400 ; Relative Coords HU
dw $1400 ; Relative Coords FU
dw $1410 ; Relative Coords HD
dw $1510 ; Relative Coords FD
dw $0000 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0000 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_mire_vitty_after

preset_trock_ouside_mire:
db $01 ; Overworld
dw $0070 ; Screen Index
dw $0128 ; Link X
dw $0CDA ; Link Y
dw $0C7D ; BG1 Vertical Scroll
dw $0C7C ; BG2 Vertical Scroll
dw $00A6 ; BG1 Horizontal Scroll
dw $00A6 ; BG2 Horizontal Scroll
dw $0133 ; Scroll X
dw $0CE9 ; Scroll Y
dw $0414 ; Unknown 1
dw $0004 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_trock_ouside_mire_after

preset_trock_icerod_overworld:
db $01 ; Overworld
dw $003F ; Screen Index
dw $0F70 ; Link X
dw $0E07 ; Link Y
dw $0E82 ; BG1 Vertical Scroll
dw $0E00 ; BG2 Vertical Scroll
dw $0EB5 ; BG1 Horizontal Scroll
dw $0EF6 ; BG2 Horizontal Scroll
dw $0F7B ; Scroll X
dw $0E6D ; Scroll Y
dw $001E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_trock_icerod_overworld_after

preset_trock_dm:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $0681 ; Link X
dw $032B ; Link Y
dw $02CB ; BG1 Vertical Scroll
dw $02CD ; BG2 Vertical Scroll
dw $060F ; BG1 Horizontal Scroll
dw $0613 ; BG2 Horizontal Scroll
dw $0688 ; Scroll X
dw $033A ; Scroll Y
dw $1602 ; Unknown 1
dw $FFF3 ; Unknown 2
dw $FFFD ; Unknown 3
dw sram_trock_dm_after

preset_trock_trock_overworld:
db $01 ; Overworld
dw $0007 ; Screen Index
dw $0DE9 ; Link X
dw $0077 ; Link Y
dw $0053 ; BG1 Vertical Scroll
dw $0013 ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D7D ; Scroll X
dw $0082 ; Scroll Y
dw $0060 ; Unknown 1
dw $000B ; Unknown 2
dw $0000 ; Unknown 3
dw sram_trock_trock_overworld_after

preset_trock_entrance:
db $01 ; Overworld
dw $0047 ; Screen Index
dw $0F08 ; Link X
dw $013D ; Link Y
dw $00B3 ; BG1 Vertical Scroll
dw $00DB ; BG2 Vertical Scroll
dw $0E96 ; BG1 Horizontal Scroll
dw $0E96 ; BG2 Horizontal Scroll
dw $0F13 ; Scroll X
dw $014A ; Scroll Y
dw $0614 ; Unknown 1
dw $0003 ; Unknown 2
dw $000A ; Unknown 3
dw sram_trock_entrance_after

preset_trock_lanterns:
db $02 ; Dungeon
dw $00C6 ; Room Index
dw $180B ; BG1 Vertical Scroll
dw $180B ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0DCD ; Link X
dw $1878 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0D00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0D00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $18 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_lanterns_after

preset_trock_roller_room:
db $02 ; Dungeon
dw $00C7 ; Room Index
dw $1800 ; BG1 Vertical Scroll
dw $1800 ; BG2 Vertical Scroll
dw $0E00 ; BG1 Horizontal Scroll
dw $0E00 ; BG2 Horizontal Scroll
dw $0E78 ; Link X
dw $1820 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_roller_room_after

preset_trock_lonely_pokey:
db $02 ; Dungeon
dw $00C6 ; Room Index
dw $1800 ; BG1 Vertical Scroll
dw $1800 ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C78 ; Link X
dw $1825 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0C00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0C00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_lonely_pokey_after

preset_trock_chomps:
db $02 ; Dungeon
dw $00B6 ; Room Index
dw $1700 ; BG1 Vertical Scroll
dw $1700 ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C78 ; Link X
dw $1721 ; Link Y
dw $007F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $1700 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1710 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $0C00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0C00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_chomps_after

preset_trock_pokies_1:
db $02 ; Dungeon
dw $0014 ; Room Index
dw $020B ; BG1 Vertical Scroll
dw $020B ; BG2 Vertical Scroll
dw $0880 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0819 ; Link X
dw $0278 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $18 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_pokies_1_after

preset_trock_pokies_2:
db $02 ; Dungeon
dw $0014 ; Room Index
dw $028E ; BG1 Vertical Scroll
dw $0310 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $03C4 ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0300 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0310 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_pokies_2_after

preset_trock_firebar_key:
db $02 ; Dungeon
dw $0014 ; Room Index
dw $0288 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0880 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $022B ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_firebar_key_after

preset_trock_lazer_skip:
db $02 ; Dungeon
dw $00C5 ; Room Index
dw $1910 ; BG1 Vertical Scroll
dw $1910 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $19DE ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_lazer_skip_after

preset_trock_switch_room:
db $02 ; Dungeon
dw $00C5 ; Room Index
dw $190B ; BG1 Vertical Scroll
dw $190B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A18 ; Link X
dw $1978 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $18 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_switch_room_after

preset_trock_trinexx:
db $02 ; Dungeon
dw $00B4 ; Room Index
dw $1600 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $161D ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FD ; Starting Floor
db $18 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_trock_trinexx_after

preset_gtower_outside_trock:
db $01 ; Overworld
dw $0047 ; Screen Index
dw $0F08 ; Link X
dw $013E ; Link Y
dw $00DD ; BG1 Vertical Scroll
dw $00E0 ; BG2 Vertical Scroll
dw $0E96 ; BG1 Horizontal Scroll
dw $0E96 ; BG2 Horizontal Scroll
dw $0F13 ; Scroll X
dw $014D ; Scroll Y
dw $0712 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_gtower_outside_trock_after

preset_gtower_entrance:
db $01 ; Overworld
dw $0043 ; Screen Index
dw $08F8 ; Link X
dw $0037 ; Link Y
dw $9180 ; BG1 Vertical Scroll
dw $0000 ; BG2 Vertical Scroll
dw $087A ; BG1 Horizontal Scroll
dw $087A ; BG2 Horizontal Scroll
dw $08FF ; Scroll X
dw $006D ; Scroll Y
dw $0050 ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
dw sram_gtower_entrance_after

preset_gtower_spike_skip:
db $02 ; Dungeon
dw $008B ; Room Index
dw $100C ; BG1 Vertical Scroll
dw $100C ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1715 ; Link X
dw $1078 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1000 ; Relative Coords HU
dw $1000 ; Relative Coords FU
dw $1010 ; Relative Coords HD
dw $1110 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $1A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_spike_skip_after

preset_gtower_firebar_room:
db $02 ; Dungeon
dw $007D ; Room Index
dw $120D ; BG1 Vertical Scroll
dw $120D ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $17BC ; Link X
dw $127A ; Link Y
dw $017F ; Camera X
dw $0085 ; Camera Y
dw $0000 ; Door Settings
dw $1200 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1210 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $1A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_firebar_room_after

preset_gtower_bombable_floor:
db $02 ; Dungeon
dw $009C ; Room Index
dw $1200 ; BG1 Vertical Scroll
dw $1200 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $1224 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1200 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1210 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $1900 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1900 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_bombable_floor_after

preset_gtower_ice_armos:
db $02 ; Dungeon
dw $001C ; Room Index
dw $0310 ; BG1 Vertical Scroll
dw $0310 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $199F ; Link X
dw $03A8 ; Link Y
dw $017F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0300 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0310 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $1900 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1900 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $1A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_ice_armos_after

preset_gtower_floor_2:
db $02 ; Dungeon
dw $000C ; Room Index
dw $0000 ; BG1 Vertical Scroll
dw $0000 ; BG2 Vertical Scroll
dw $1880 ; BG1 Horizontal Scroll
dw $1880 ; BG2 Horizontal Scroll
dw $18F8 ; Link X
dw $0026 ; Link Y
dw $00FF ; Camera X
dw $0077 ; Camera Y
dw $0000 ; Door Settings
dw $0000 ; Relative Coords HU
dw $0000 ; Relative Coords FU
dw $0010 ; Relative Coords HD
dw $0110 ; Relative Coords FD
dw $1800 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1800 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $01 ; Starting Floor
db $1A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_floor_2_after

preset_gtower_mimics1:
db $02 ; Dungeon
dw $006B ; Room Index
dw $0C10 ; BG1 Vertical Scroll
dw $0C10 ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $0CCC ; Link Y
dw $007F ; Camera X
dw $0087 ; Camera Y
dw $0000 ; Door Settings
dw $0C00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0C10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $02 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_mimics1_after

preset_gtower_mimics2:
db $02 ; Dungeon
dw $006B ; Room Index
dw $0D0B ; BG1 Vertical Scroll
dw $0D0B ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $16D8 ; Link X
dw $0D78 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0D00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0D10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $02 ; Starting Floor
db $1A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_mimics2_after

preset_gtower_spike_room:
db $02 ; Dungeon
dw $005B ; Room Index
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1778 ; Link X
dw $0C10 ; Link Y
dw $017F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0B00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0B10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $02 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_spike_room_after

preset_gtower_gauntlet:
db $02 ; Dungeon
dw $005C ; Room Index
dw $0A00 ; BG1 Vertical Scroll
dw $0A00 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $0A23 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0A00 ; Relative Coords HU
dw $0A00 ; Relative Coords FU
dw $0A10 ; Relative Coords HD
dw $0B10 ; Relative Coords FD
dw $1900 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1900 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $02 ; Starting Floor
db $1A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_gauntlet_after

preset_gtower_lanmola2:
db $02 ; Dungeon
dw $006C ; Room Index
dw $0D0B ; BG1 Vertical Scroll
dw $0D0B ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $19D5 ; Link X
dw $0D78 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0D00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0D10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $1900 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1900 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $03 ; Starting Floor
db $1A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_lanmola2_after

preset_gtower_wizz2:
db $02 ; Dungeon
dw $00A5 ; Room Index
dw $1500 ; BG1 Vertical Scroll
dw $1500 ; BG2 Vertical Scroll
dw $0B00 ; BG1 Horizontal Scroll
dw $0B00 ; BG2 Horizontal Scroll
dw $0B78 ; Link X
dw $1524 ; Link Y
dw $017F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $1500 ; Relative Coords HU
dw $1400 ; Relative Coords FU
dw $1510 ; Relative Coords HD
dw $1510 ; Relative Coords FD
dw $0B00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0B00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $04 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_wizz2_after

preset_gtower_torches2:
db $02 ; Dungeon
dw $0096 ; Room Index
dw $1310 ; BG1 Vertical Scroll
dw $1310 ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D78 ; Link X
dw $13A2 ; Link Y
dw $017F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $1300 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1310 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $0D00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0D00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $04 ; Starting Floor
db $1A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_torches2_after

preset_gtower_helma_key:
db $02 ; Dungeon
dw $003D ; Room Index
dw $0708 ; BG1 Vertical Scroll
dw $0700 ; BG2 Vertical Scroll
dw $1B00 ; BG1 Horizontal Scroll
dw $1B00 ; BG2 Horizontal Scroll
dw $1B78 ; Link X
dw $0724 ; Link Y
dw $017F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1B00 ; Relative Coords HL
dw $1A00 ; Relative Coords FL
dw $1B00 ; Relative Coords HR
dw $1B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $05 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_helma_key_after

preset_gtower_bombable_wall:
db $02 ; Dungeon
dw $003D ; Room Index
dw $060E ; BG1 Vertical Scroll
dw $060B ; BG2 Vertical Scroll
dw $1B00 ; BG1 Horizontal Scroll
dw $1B00 ; BG2 Horizontal Scroll
dw $1B16 ; Link X
dw $0678 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1B00 ; Relative Coords HL
dw $1A00 ; Relative Coords FL
dw $1B00 ; Relative Coords HR
dw $1B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $05 ; Starting Floor
db $1A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_bombable_wall_after

preset_gtower_moldorm_2:
db $02 ; Dungeon
dw $003D ; Room Index
dw $0708 ; BG1 Vertical Scroll
dw $0710 ; BG2 Vertical Scroll
dw $1A00 ; BG1 Horizontal Scroll
dw $1A00 ; BG2 Horizontal Scroll
dw $1A78 ; Link X
dw $07D0 ; Link Y
dw $007F ; Camera X
dw $0188 ; Camera Y
dw $0000 ; Door Settings
dw $0700 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0710 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $1A00 ; Relative Coords HL
dw $1A00 ; Relative Coords FL
dw $1A00 ; Relative Coords HR
dw $1B00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $05 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_moldorm_2_after

preset_gtower_agahnim_2:
db $02 ; Dungeon
dw $001D ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $1A00 ; BG1 Horizontal Scroll
dw $1A00 ; BG2 Horizontal Scroll
dw $1A78 ; Link X
dw $0226 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $1A00 ; Relative Coords HL
dw $1A00 ; Relative Coords FL
dw $1A00 ; Relative Coords HR
dw $1B00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $06 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_gtower_agahnim_2_after

preset_ganon_pyramid:
db $01 ; Overworld
dw $005B ; Screen Index
dw $07F0 ; Link X
dw $0668 ; Link Y
dw $0605 ; BG1 Vertical Scroll
dw $060A ; BG2 Vertical Scroll
dw $0778 ; BG1 Horizontal Scroll
dw $0778 ; BG2 Horizontal Scroll
dw $07F7 ; Scroll X
dw $0677 ; Scroll Y
dw $002E ; Unknown 1
dw $FFF6 ; Unknown 2
dw $FFF8 ; Unknown 3
dw sram_ganon_pyramid_after


; Preset SRAM changes

sram_esc_bed:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF208 : db $02 : dw $0002 ; Room $0104: Unknown (...............q)
dl $7EF20C : db $02 : dw $F000 ; Room $0106: Unknown (.dddb...........)
dl $7EF36C : db $02 : dw $1818 ; Health (goal)
dl $7EF378 : db $02 : dw $F800 ; ????
dl $7EF3D8 : db $02 : dw $4B00 ; 
dl $7EF3DC : db $02 : dw $8C01 ; Player name
dl $7EF3E0 : db $02 : dw $AA01 ; Player name
dl $7EF400 : db $02 : dw $FF00 ; Deaths
dl $7EF20E : db $02 : dw $F000 ; Room $0107: Unknown (.dddb...........)
dl $7EF3DA : db $02 : dw $8C01 ; Player name
dl $7EF3DE : db $02 : dw $8C01 ; Player name
dl $7EF3E2 : db $02 : dw $0055 ; Player name
dl $7EF402 : db $02 : dw $00FF ; Deaths
dl $7EF4FE : db $02 : dw $D0EA ; Inverse checksum
.after

sram_esc_courtyard:
dl $7EF2BB : db $01 : db $00 ; Overworld $3B: Unknown (........)
dl $7EF2FB : db $01 : db $00 ; Overworld $7B: Unknown (........)
dl $7EF360 : db $02 : dw $0001 ; Rupees (goal)
dl $7EF3C8 : db $01 : db $03 ; Entrances Phase
dl $7EF359 : db $01 : db $01 ; Sword
dl $7EF3C5 : db $01 : db $01 ; Game Phase 1
dl $7EF051 : db $01 : db $00 ; Room $0028: Swamp Palace (Entrance Room) (................)
dl $7EF0AA : db $02 : dw $000F ; Room $0055: Castle Secret Entrance / Uncle Death Room (.............qqq)
dl $7EF35A : db $01 : db $01 ; Shield
dl $7EF362 : db $02 : dw $0001 ; Rupees (actual)
dl $7EF3C6 : db $01 : db $11 ; Game Phase 2
dl $7FE0EF : db $01 : db $41 ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
.after

sram_esc_entrance:
dl $7FF027 : db $01 : db $01 ; 
dl $7FF054 : db $01 : db $80 ; 
dl $7FF035 : db $01 : db $01 ; 
.after

sram_esc_1st_keyguard:
dl $7FF027 : db $01 : db $00 ; 
dl $7EF36F : db $01 : db $00 ; Keys
dl $7FF054 : db $01 : db $00 ; 
dl $7EF002 : db $02 : dw $000C ; Room $0001: Hyrule Castle (North Corridor) (.............qq.)
dl $7EF0C2 : db $02 : dw $000F ; Room $0061: Hyrule Castle (Main Entrance Room) (.............qqq)
dl $7FE0EF : db $01 : db $00 ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
dl $7FF035 : db $01 : db $00 ; 
dl $7EF0A0 : db $02 : dw $0005 ; Room $0050: Hyrule Castle (West Corridor) (..............q.)
dl $7EF0C0 : db $02 : dw $0005 ; Room $0060: Hyrule Castle (West Entrance Room) (..............q.)
.after

sram_esc_big_room:
dl $7FE064 : db $02 : dw $0001 ; Room $72 persistent: Hyrule Castle (Map Chest Room)
dl $7EF0E4 : db $02 : dw $840F ; Room $0072: Hyrule Castle (Map Chest Room) (.d....K......qqq)
dl $7EF104 : db $02 : dw $000F ; Room $0082: Hyrule Castle (Basement Chasm Room) (.............qqq)
.after

sram_esc_2nd_keyguard:
dl $7EF0E2 : db $02 : dw $0002 ; Room $0071: Hyrule Castle (Boomerang Chest Room) (...............q)
dl $7EF102 : db $02 : dw $000F ; Room $0081: Hyrule Castle (.............qqq)
dl $7FE062 : db $02 : dw $0001 ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
.after

sram_esc_ball_n_chains:
dl $7EF341 : db $01 : db $01 ; Boomerang
dl $7EF0E2 : db $02 : dw $841B ; Room $0071: Hyrule Castle (Boomerang Chest Room) (.d....K.....qq.q)
dl $7FE064 : db $02 : dw $0000 ; Room $72 persistent: Hyrule Castle (Map Chest Room)
dl $7EF0E0 : db $02 : dw $0008 ; Room $0070: Hyrule Castle (Small Corridor to Jail Cells) (.............q..)
dl $7FE062 : db $02 : dw $0003 ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
.after

sram_esc_keyguard_revisited:
dl $7EF3C8 : db $01 : db $02 ; Entrances Phase
dl $7EF3CC : db $01 : db $01 ; Tagalong
dl $7EF3D3 : db $01 : db $00 ; Super Bomb Boom
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF3E5 : db $02 : dw $0000 ; Validity (checksum)
dl $7EF34A : db $01 : db $01 ; Torch
dl $7EF366 : db $02 : dw $4000 ; BigKey1
dl $7FE080 : db $02 : dw $0004 ; Room $80 persistent: Hyrule Castle (Jail Cell Room)
dl $7EF100 : db $02 : dw $043C ; Room $0080: Hyrule Castle (Jail Cell Room) (......K....cqqq.)
dl $7FE062 : db $02 : dw $0000 ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
.after

sram_esc_secret_passage:
dl $7EF0A2 : db $02 : dw $000F ; Room $0051: Hyrule Castle (Throne Room) (.............qqq)
dl $7FE080 : db $02 : dw $0000 ; Room $80 persistent: Hyrule Castle (Jail Cell Room)
.after

sram_esc_snake_avoidance_room:
dl $7EF3C8 : db $01 : db $04 ; Entrances Phase
dl $7EF082 : db $02 : dw $000F ; Room $0041: Hyrule Castle (First Dark Room) (.............qqq)
.after

sram_esc_keyrat:
dl $7EF042 : db $02 : dw $0003 ; Room $0021: Hyrule Castle (Key-rat Room) (...............q)
dl $7EF044 : db $02 : dw $8003 ; Room $0022: Hyrule Castle (Sewer Text Trigger Room) (.d.............q)
dl $7EF064 : db $02 : dw $801F ; Room $0032: Hyrule Castle (Sewer Key Chest Room) (.d..........qqqq)
dl $7EF084 : db $02 : dw $000C ; Room $0042: Hyrule Castle (6 Ropes Room) (.............qq.)
.after

sram_esc_last_two_screens:
dl $7EF022 : db $02 : dw $0005 ; Room $0011: Hyrule Castle (Bombable Stock Room) (..............q.)
dl $7EF042 : db $02 : dw $840F ; Room $0021: Hyrule Castle (Key-rat Room) (.d....K......qqq)
dl $7FDFC2 : db $02 : dw $0001 ; Room $21 persistent: Hyrule Castle (Key-rat Room)
.after

sram_east_before_cutscene:
dl $7EF004 : db $02 : dw $000F ; Room $0002: Hyrule Castle (Switch Room) (.............qqq)
dl $7EF022 : db $02 : dw $2005 ; Room $0011: Hyrule Castle (Bombable Stock Room) (...d..........q.)
dl $7FDF84 : db $02 : dw $000A ; Room $2 persistent: Hyrule Castle (Switch Room)
.after

sram_east_after_cutscene:
dl $7EF29B : db $01 : db $20 ; Overworld $1B: Unknown (...?....)
dl $7EF024 : db $02 : dw $000F ; Room $0012: Sanctuary (.............qqq)
dl $7EF3C8 : db $01 : db $01 ; Entrances Phase
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7EF3E3 : db $02 : dw $0000 ; Player name
dl $7EF3C7 : db $01 : db $01 ; Map Phase
dl $7EF3C5 : db $01 : db $02 ; Game Phase 1
dl $7EF3C6 : db $01 : db $15 ; Game Phase 2
.after

sram_east_octoroc:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7FE14B : db $01 : db $47 ; Overworld $E5 persistent: UNKNOWN
dl $7FE17B : db $01 : db $47 ; Overworld $FD persistent: UNKNOWN
dl $7FEF8D : db $01 : db $10 ; 
dl $7FDF84 : db $01 : db $00 ; Overworld $2 persistent: Northeast House
dl $7FDFEB : db $01 : db $AD ; Overworld $35 persistent: Lake Hylia
dl $7FE057 : db $01 : db $42 ; Overworld $6B persistent: Outside Haunted Grove
dl $7FDFC2 : db $01 : db $00 ; Overworld $21 persistent: UNKNOWN
dl $7FEFBF : db $01 : db $10 ; 
.after

sram_east_outside_palace:
dl $7FE14B : db $01 : db $00 ; Overworld $E5 persistent: UNKNOWN
dl $7FE167 : db $01 : db $42 ; Overworld $F3 persistent: UNKNOWN
dl $7FE17B : db $01 : db $00 ; Overworld $FD persistent: UNKNOWN
dl $7FEF8D : db $01 : db $00 ; 
dl $7FEF99 : db $01 : db $02 ; 
dl $7FDFEB : db $01 : db $00 ; Overworld $35 persistent: Lake Hylia
dl $7FE057 : db $01 : db $00 ; Overworld $6B persistent: Outside Haunted Grove
dl $7FE04E : db $01 : db $42 ; Overworld $67 persistent: UNKNOWN
dl $7FF004 : db $01 : db $04 ; 
dl $7FEFBF : db $01 : db $00 ; 
.after

sram_east_entrance:
dl $7FF060 : db $01 : db $40 ; 
dl $7FE103 : db $01 : db $52 ; Overworld $C1 persistent: UNKNOWN
dl $7FE167 : db $01 : db $00 ; Overworld $F3 persistent: UNKNOWN
dl $7FEF99 : db $01 : db $00 ; 
dl $7FE04E : db $01 : db $00 ; Overworld $67 persistent: UNKNOWN
dl $7FE06E : db $01 : db $52 ; Overworld $77 persistent: Black Ice Cave
dl $7FEFF2 : db $01 : db $11 ; 
dl $7FF004 : db $01 : db $00 ; 
.after

sram_east_stalfos_room:
dl $7EF36F : db $01 : db $00 ; Keys
dl $7FF060 : db $01 : db $00 ; 
dl $7EF152 : db $02 : dw $000F ; Room $00A9: Eastern Palace (Big Chest Room) (.............qqq)
dl $7EF172 : db $02 : dw $000F ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.............qqq)
dl $7EF192 : db $02 : dw $000F ; Room $00C9: Eastern Palace (Entrance Room) (.............qqq)
dl $7FE103 : db $01 : db $00 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
dl $7EF150 : db $02 : dw $0005 ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (..............q.)
dl $7FE06E : db $01 : db $00 ; Room $77 persistent: Tower of Hera (Entrance Room)
dl $7FEFF2 : db $01 : db $00 ; 
.after

sram_east_dark_key_room:
dl $7EF373 : db $01 : db $00 ; Magic filler
dl $7EF36E : db $01 : db $10 ; Magic Power
dl $7EF174 : db $02 : dw $0008 ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.............q..)
dl $7EF150 : db $02 : dw $000F ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (.............qqq)
dl $7EF154 : db $02 : dw $000A ; Room $00AA: Eastern Palace (Map Chest Room) (.............q.q)
.after

sram_east_big_key_dmg_boost:
dl $7EF360 : db $02 : dw $0015 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0015 ; Rupees (actual)
dl $7FE0F4 : db $02 : dw $0050 ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
dl $7EF174 : db $02 : dw $840C ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.d....K......qq.)
.after

sram_east_big_chest_room:
dl $7EF36D : db $01 : db $0C ; Health (actual)
dl $7EF172 : db $02 : dw $800F ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.d...........qqq)
dl $7EF366 : db $02 : dw $6000 ; BigKey1
dl $7EF170 : db $02 : dw $8015 ; Room $00B8: Eastern Palace (Big Key Room) (.d..........q.q.)
.after

sram_east_gwg:
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF340 : db $01 : db $02 ; Bow
dl $7EF152 : db $02 : dw $001F ; Room $00A9: Eastern Palace (Big Chest Room) (............qqqq)
dl $7FE0F4 : db $02 : dw $0000 ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
dl $7EF150 : db $02 : dw $200F ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (...d.........qqq)
.after

sram_east_pot_room:
dl $7EF360 : db $02 : dw $001B ; Rupees (goal)
dl $7EF132 : db $02 : dw $0003 ; Room $0099: Eastern Palace (Eyegore Key Room) (...............q)
dl $7EF152 : db $02 : dw $201F ; Room $00A9: Eastern Palace (Big Chest Room) (...d........qqqq)
dl $7EF362 : db $02 : dw $001B ; Rupees (actual)
dl $7EF36E : db $01 : db $20 ; Magic Power
dl $7FE0B2 : db $02 : dw $00D8 ; Room $99 persistent: Eastern Palace (Eyegore Key Room)
.after

sram_east_zeldagamer_room:
dl $7EF377 : db $01 : db $14 ; Arrows
dl $7EF1B4 : db $02 : dw $0002 ; Room $00DA: Eastern Palace (...............q)
dl $7EF132 : db $02 : dw $C403 ; Room $0099: Eastern Palace (Eyegore Key Room) (.dd...K........q)
dl $7EF1B2 : db $02 : dw $0003 ; Room $00D9: Eastern Palace (Canonball Room) (...............q)
.after

sram_east_armos:
dl $7EF34F : db $01 : db $00 ; Bottles
dl $7EF377 : db $01 : db $12 ; Arrows
dl $7EF1B0 : db $02 : dw $0005 ; Room $00D8: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room) (..............q.)
dl $7EF360 : db $02 : dw $001C ; Rupees (goal)
dl $7EF362 : db $02 : dw $001C ; Rupees (actual)
dl $7FE130 : db $02 : dw $07FF ; Room $D8 persistent: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room)
.after

sram_desert_outside_eastern_palace:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF377 : db $01 : db $00 ; Arrows
dl $7FF060 : db $01 : db $40 ; 
dl $7EF340 : db $01 : db $01 ; Bow
dl $7EF36C : db $01 : db $20 ; Health (goal)
dl $7EF374 : db $01 : db $04 ; Pendants
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF3E7 : db $02 : dw $0000 ; Deaths
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7FE103 : db $01 : db $52 ; Overworld $C1 persistent: UNKNOWN
dl $7FE130 : db $01 : db $00 ; Overworld $D8 persistent: UNKNOWN
dl $7EF190 : db $02 : dw $0801 ; Room $00C8: Eastern Palace (Armos Knights[Boss]) (.....k..........)
dl $7FE06E : db $01 : db $52 ; Overworld $77 persistent: Black Ice Cave
dl $7FE0B2 : db $01 : db $00 ; Overworld $99 persistent: UNKNOWN
dl $7FEFF2 : db $01 : db $11 ; 
.after

sram_desert_ep_spinspeed:
dl $7FF060 : db $01 : db $00 ; 
dl $7EF355 : db $01 : db $01 ; Boots
dl $7EF379 : db $01 : db $FC ; Ability Flags
dl $7EF3C7 : db $01 : db $03 ; Map Phase
dl $7EF20A : db $02 : dw $0002 ; Room $0105: Unknown (...............q)
dl $7FE103 : db $01 : db $00 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
dl $7FE06E : db $01 : db $00 ; Room $77 persistent: Tower of Hera (Entrance Room)
dl $7FEFF2 : db $01 : db $00 ; 
.after

sram_desert_unholy_spinspeed:
dl $7FE07C : db $01 : db $A0 ; Overworld $7E persistent: UNKNOWN
dl $7FE019 : db $01 : db $1E ; Overworld $4C persistent: UNKNOWN
dl $7FE06D : db $01 : db $A1 ; Overworld $76 persistent: UNKNOWN
dl $7FE161 : db $01 : db $A1 ; Overworld $F0 persistent: UNKNOWN
dl $7FE04E : db $01 : db $9F ; Overworld $67 persistent: UNKNOWN
dl $7FE06E : db $01 : db $2F ; Overworld $77 persistent: Black Ice Cave
dl $7FF020 : db $01 : db $40 ; 
.after

sram_desert_water_dash:
dl $7FF013 : db $01 : db $40 ; 
dl $7EF20E : db $02 : dw $F002 ; Room $0107: Unknown (.dddb..........q)
dl $7EF34E : db $01 : db $01 ; Book of Mudora
dl $7FE07C : db $01 : db $00 ; Overworld $7E persistent: UNKNOWN
dl $7FE019 : db $01 : db $00 ; Overworld $4C persistent: UNKNOWN
dl $7FE06D : db $01 : db $00 ; Overworld $76 persistent: UNKNOWN
dl $7FE161 : db $01 : db $00 ; Overworld $F0 persistent: UNKNOWN
dl $7FE04E : db $01 : db $00 ; Overworld $67 persistent: UNKNOWN
dl $7FE06E : db $01 : db $00 ; Overworld $77 persistent: Black Ice Cave
dl $7FF020 : db $01 : db $00 ; 
.after

sram_desert_desert_entrance:
dl $7FF013 : db $01 : db $00 ; 
dl $7FF028 : db $01 : db $20 ; 
dl $7FF038 : db $01 : db $02 ; 
dl $7FF094 : db $01 : db $02 ; 
dl $7FF019 : db $01 : db $02 ; 
dl $7FF032 : db $01 : db $20 ; 
.after

sram_desert_keybonk:
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF377 : db $01 : db $05 ; Arrows
dl $7FF028 : db $01 : db $00 ; 
dl $7FF038 : db $01 : db $00 ; 
dl $7FF094 : db $01 : db $00 ; 
dl $7EF340 : db $01 : db $02 ; Bow
dl $7EF0E6 : db $02 : dw $0001 ; Room $0073: Desert Palace (Big Chest Room) (................)
dl $7FF019 : db $01 : db $00 ; 
dl $7FE068 : db $02 : dw $0001 ; Room $74 persistent: Desert Palace (Map Chest Room)
dl $7EF0E8 : db $02 : dw $0003 ; Room $0074: Desert Palace (Map Chest Room) (...............q)
dl $7EF108 : db $02 : dw $000F ; Room $0084: Desert Palace (Main Entrance Room) (.............qqq)
dl $7FF032 : db $01 : db $00 ; 
.after

sram_desert_pre_cannonball_room:
dl $7EF0E6 : db $02 : dw $0405 ; Room $0073: Desert Palace (Big Chest Room) (......K.......q.)
dl $7EF0EA : db $02 : dw $0002 ; Room $0075: Desert Palace (Big Key Chest Room) (...............q)
dl $7EF10A : db $02 : dw $000A ; Room $0085: Desert Palace (East Entrance Room) (.............q.q)
.after

sram_desert_pot_room:
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF0EA : db $02 : dw $0017 ; Room $0075: Desert Palace (Big Key Chest Room) (............q.qq)
dl $7EF10A : db $02 : dw $400E ; Room $0085: Desert Palace (East Entrance Room) (..d..........qqq)
dl $7EF366 : db $02 : dw $7000 ; BigKey1
dl $7FE08A : db $02 : dw $001C ; Room $85 persistent: Desert Palace (East Entrance Room)
.after

sram_desert_desert2_spinspeed:
dl $7EF377 : db $01 : db $14 ; Arrows
dl $7EF354 : db $01 : db $01 ; Gloves
dl $7EF0E6 : db $02 : dw $041F ; Room $0073: Desert Palace (Big Chest Room) (......K.....qqqq)
dl $7EF106 : db $02 : dw $0007 ; Room $0083: Desert Palace (West Entrance Room) (..............qq)
dl $7FE068 : db $02 : dw $0000 ; Room $74 persistent: Desert Palace (Map Chest Room)
.after

sram_desert_popo_genocide_room:
dl $7EF37F : db $01 : db $00 ; Key for dungeon $03
dl $7EF0A6 : db $02 : dw $0008 ; Room $0053: Desert Palace (Popos 2 / Beamos Hellway Room) (.............q..)
dl $7EF0C6 : db $02 : dw $840A ; Room $0063: Desert Palace (Final Section Entrance Room) (.d....K......q.q)
dl $7FE08A : db $01 : db $00 ; Room $85 persistent: Desert Palace (East Entrance Room)
.after

sram_desert_torches:
dl $7EF086 : db $02 : dw $0001 ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (................)
dl $7EF0A6 : db $02 : dw $240F ; Room $0053: Desert Palace (Popos 2 / Beamos Hellway Room) (...d..K......qqq)
dl $7FE026 : db $02 : dw $06E0 ; Room $53 persistent: Desert Palace (Popos 2 / Beamos Hellway Room)
.after

sram_desert_lanmolas:
dl $7EF377 : db $01 : db $19 ; Arrows
dl $7EF086 : db $02 : dw $640D ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (..dd..K......qq.)
dl $7EF36E : db $01 : db $70 ; Magic Power
.after

sram_hera_outside_desert_palace:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF377 : db $01 : db $0C ; Arrows
dl $7EF36C : db $01 : db $28 ; Health (goal)
dl $7EF374 : db $01 : db $06 ; Pendants
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7EF3E9 : db $02 : dw $0000 ; Deaths
dl $7EF066 : db $02 : dw $0802 ; Room $0033: Desert Palace (Lanmolas[Boss]) (.....k.........q)
dl $7EF086 : db $02 : dw $E48D ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (.ddd..K..c...qq.)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7FE026 : db $01 : db $00 ; Overworld $53 persistent: Dark Sanctuary
.after

sram_hera_fake_flippers:
dl $7FEFBE : db $01 : db $08 ; 
dl $7FE048 : db $01 : db $48 ; Overworld $64 persistent: UNKNOWN
dl $7FE174 : db $01 : db $09 ; Overworld $FA persistent: UNKNOWN
dl $7FE07E : db $01 : db $01 ; Overworld $7F persistent: Dark Waterfall
dl $7FF02A : db $01 : db $08 ; 
dl $7FF02E : db $01 : db $02 ; 
dl $7FEF9F : db $01 : db $02 ; 
.after

sram_hera_dm:
dl $7EF377 : db $01 : db $0B ; Arrows
dl $7EF1E0 : db $02 : dw $000F ; Room $00F0: Cave (Lost Old Man Starting Cave) (.............qqq)
dl $7EF3C8 : db $01 : db $05 ; Entrances Phase
dl $7EF3CC : db $01 : db $04 ; Tagalong
dl $7FEFBE : db $01 : db $00 ; 
dl $7EF1E2 : db $02 : dw $000F ; Room $00F1: Cave (Lost Old Man Starting Cave) (.............qqq)
dl $7FE048 : db $01 : db $00 ; Room $64 persistent: Thieves Town (West Attic Room)
dl $7FE174 : db $01 : db $00 ; Room $FA persistent: Cave
dl $7FE07E : db $01 : db $00 ; Room $7F persistent: Ice Palace ( Big Spike Traps Room)
dl $7FF02A : db $01 : db $00 ; 
dl $7FF02E : db $01 : db $00 ; 
dl $7FEF9F : db $01 : db $00 ; 
.after

sram_hera_after_mirror:
dl $7FF10B : db $01 : db $20 ; 
dl $7FF117 : db $01 : db $04 ; 
dl $7EF353 : db $01 : db $02 ; Magic Mirror
dl $7EF3C8 : db $01 : db $01 ; Entrances Phase
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7FF136 : db $01 : db $20 ; 
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
.after

sram_hera_entrance:
dl $7FF10B : db $01 : db $00 ; 
dl $7FF117 : db $01 : db $00 ; 
dl $7FF04C : db $01 : db $20 ; 
dl $7FF136 : db $01 : db $00 ; 
.after

sram_hera_tile_room:
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7FF04C : db $01 : db $00 ; 
dl $7EF0EE : db $02 : dw $000F ; Room $0077: Tower of Hera (Entrance Room) (.............qqq)
dl $7EF10E : db $02 : dw $0402 ; Room $0087: Tower of Hera (Tile Room) (......K........q)
dl $7EF386 : db $01 : db $01 ; Key for dungeon $0A
dl $7FDFCB : db $01 : db $00 ; Room $25 persistent: Empty Clone Room
.after

sram_hera_torches:
dl $7EF0EE : db $02 : dw $800F ; Room $0077: Tower of Hera (Entrance Room) (.d...........qqq)
dl $7EF10E : db $02 : dw $040E ; Room $0087: Tower of Hera (Tile Room) (......K......qqq)
.after

sram_hera_beetles:
dl $7EF10E : db $02 : dw $041F ; Room $0087: Tower of Hera (Tile Room) (......K.....qqqq)
dl $7EF366 : db $02 : dw $7020 ; BigKey1
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7EF386 : db $01 : db $00 ; Key for dungeon $0A
.after

sram_hera_petting_zoo:
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF375 : db $01 : db $00 ; Bomb filler
dl $7EF062 : db $02 : dw $800F ; Room $0031: Tower of Hera (Hardhat Beetles Room) (.d...........qqq)
dl $7FDFE2 : db $02 : dw $0580 ; Room $31 persistent: Tower of Hera (Hardhat Beetles Room)
.after

sram_hera_moldorm:
dl $7EF357 : db $01 : db $01 ; Moon Pearl
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF02E : db $02 : dw $000F ; Room $0017: Tower of Hera (Moldorm Fall Room) (.............qqq)
dl $7EF04E : db $02 : dw $001F ; Room $0027: Tower of Hera (Big Chest) (............qqqq)
dl $7FDFCE : db $02 : dw $0024 ; Room $27 persistent: Tower of Hera (Big Chest)
.after

sram_aga_outside_hera:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7FEFD8 : db $01 : db $01 ; 
dl $7EF36C : db $01 : db $30 ; Health (goal)
dl $7EF374 : db $01 : db $07 ; Pendants
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7EF3F7 : db $02 : dw $0000 ; Deaths
dl $7EF3C7 : db $01 : db $04 ; Map Phase
dl $7EF00E : db $02 : dw $080F ; Room $0007: Tower of Hera (Moldorm[Boss]) (.....k.......qqq)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
dl $7FDFCE : db $01 : db $00 ; Overworld $27 persistent: UNKNOWN
dl $7FDFE2 : db $01 : db $00 ; Overworld $31 persistent: UNKNOWN
.after

sram_aga_first_rupee_tree:
dl $7FEFD8 : db $01 : db $00 ; 
dl $7EF1CC : db $02 : dw $000F ; Room $00E6: Cave (.............qqq)
dl $7EF1CE : db $02 : dw $000F ; Room $00E7: Cave (.............qqq)
dl $7FDFCB : db $01 : db $00 ; Room $25 persistent: Empty Clone Room
dl $7FE14E : db $02 : dw $0008 ; Room $E7 persistent: Cave
.after

sram_aga_lost_woods:
dl $7FF007 : db $01 : db $08 ; 
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF360 : db $02 : dw $0026 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0026 ; Rupees (actual)
dl $7FE14E : db $01 : db $00 ; Overworld $E7 persistent: UNKNOWN
dl $7FF006 : db $01 : db $08 ; 
.after

sram_aga_after_lost_woods:
dl $7FF007 : db $01 : db $00 ; 
dl $7FF0CB : db $01 : db $40 ; 
dl $7FF0CF : db $01 : db $20 ; 
dl $7EF300 : db $01 : db $40 ; Overworld $80: Unknown (..?.....)
dl $7EF360 : db $02 : dw $0076 ; Rupees (goal)
dl $7EF359 : db $01 : db $02 ; Sword
dl $7EF3C7 : db $01 : db $05 ; Map Phase
dl $7FEFB6 : db $01 : db $20 ; 
dl $7EF362 : db $02 : dw $0076 ; Rupees (actual)
dl $7FE1E8 : db $01 : db $E9 ; Overworld $134 persistent: UNKNOWN
dl $7FE132 : db $01 : db $01 ; Overworld $D9 persistent: UNKNOWN
dl $7FF006 : db $01 : db $00 ; 
dl $7FF0FA : db $01 : db $02 ; 
.after

sram_aga_tower_entrance:
dl $7FF0CB : db $01 : db $00 ; 
dl $7FF0CF : db $01 : db $00 ; 
dl $7EF29B : db $01 : db $60 ; Overworld $1B: Unknown (..??....)
dl $7FEFB6 : db $01 : db $00 ; 
dl $7FE0EF : db $01 : db $41 ; Overworld $B7 persistent: UNKNOWN
dl $7FEFAD : db $01 : db $01 ; 
dl $7FE1E8 : db $01 : db $00 ; Overworld $134 persistent: UNKNOWN
dl $7FE132 : db $01 : db $00 ; Overworld $D9 persistent: UNKNOWN
dl $7FF0FA : db $01 : db $00 ; 
.after

sram_aga_dark_room_of_despair:
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF377 : db $01 : db $08 ; Arrows
dl $7EF1A0 : db $02 : dw $0004 ; Room $00D0: Agahnim's Tower (Dark Maze) (..............q.)
dl $7EF1C0 : db $02 : dw $201E ; Room $00E0: Agahnim's Tower (Entrance Room) (...d........qqqq)
dl $7FE0EF : db $01 : db $00 ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
dl $7FEFAD : db $01 : db $00 ; 
dl $7FE140 : db $02 : dw $000F ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
.after

sram_aga_dark_room_of_melancholy:
dl $7EF1A0 : db $02 : dw $801F ; Room $00D0: Agahnim's Tower (Dark Maze) (.d..........qqqq)
dl $7FE120 : db $02 : dw $0020 ; Room $D0 persistent: Agahnim's Tower (Dark Maze)
dl $7EF180 : db $02 : dw $0001 ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (................)
.after

sram_aga_red_spears:
dl $7FE100 : db $02 : dw $0018 ; Room $C0 persistent: Agahnim's Tower (Dark Bridge Room)
dl $7EF180 : db $02 : dw $000F ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (.............qqq)
.after

sram_aga_circle_of_pot:
dl $7EF377 : db $01 : db $03 ; Arrows
dl $7FE0E0 : db $02 : dw $003F ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
dl $7EF180 : db $02 : dw $240F ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (...d..K......qqq)
dl $7EF160 : db $02 : dw $000C ; Room $00B0: Agahnim's Tower (Circle of Pots) (.............qq.)
.after

sram_aga_agahnim:
dl $7EF377 : db $01 : db $07 ; Arrows
dl $7EF360 : db $02 : dw $0077 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0077 ; Rupees (actual)
dl $7FDFE0 : db $02 : dw $0001 ; Room $30 persistent: Agahnim's Tower (Maiden Sacrifice Chamber)
dl $7FE0E0 : db $02 : dw $043F ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
dl $7FE120 : db $02 : dw $0000 ; Room $D0 persistent: Agahnim's Tower (Dark Maze)
dl $7FE140 : db $02 : dw $0000 ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
dl $7EF060 : db $02 : dw $000A ; Room $0030: Agahnim's Tower (Maiden Sacrifice Chamber) (.............q.q)
dl $7EF080 : db $02 : dw $000B ; Room $0040: Agahnim's Tower (Final Bridge Room) (.............q.q)
dl $7EF160 : db $02 : dw $240F ; Room $00B0: Agahnim's Tower (Circle of Pots) (...d..K......qqq)
.after

sram_pod_pyramid:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF040 : db $02 : dw $0802 ; Room $0020: Agahnim's Tower (Agahnim[Boss]) (.....k.........q)
dl $7EF3EB : db $02 : dw $0000 ; Deaths
dl $7EF3C7 : db $01 : db $06 ; Map Phase
dl $7EF3C5 : db $01 : db $03 ; Game Phase 1
dl $7EF282 : db $01 : db $20 ; Overworld $02: Unknown (...?....)
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FDFE0 : db $01 : db $00 ; Overworld $30 persistent: Desert of Mystery
dl $7FE0E0 : db $01 : db $00 ; Overworld $B0 persistent: UNKNOWN
dl $7FE100 : db $01 : db $00 ; Overworld $C0 persistent: UNKNOWN
dl $7EF060 : db $02 : dw $840A ; Room $0030: Agahnim's Tower (Maiden Sacrifice Chamber) (.d....K......q.q)
.after

sram_pod_pod_overworld:
dl $7FEFBC : db $01 : db $80 ; 
dl $7FEFB2 : db $01 : db $80 ; 
dl $7FEF91 : db $01 : db $08 ; 
dl $7FE00C : db $01 : db $DB ; Overworld $46 persistent: UNKNOWN
dl $7FE038 : db $01 : db $42 ; Overworld $5C persistent: UNKNOWN
dl $7FE110 : db $01 : db $7A ; Overworld $C8 persistent: UNKNOWN
dl $7FE124 : db $01 : db $AD ; Overworld $D2 persistent: UNKNOWN
dl $7FE160 : db $01 : db $42 ; Overworld $F0 persistent: UNKNOWN
dl $7FEF97 : db $01 : db $80 ; 
.after

sram_pod_entrance:
dl $7FEFBC : db $01 : db $00 ; 
dl $7EF360 : db $02 : dw $0009 ; Rupees (goal)
dl $7FEFB2 : db $01 : db $00 ; 
dl $7EF2DE : db $01 : db $20 ; Overworld $5E: Unknown (...?....)
dl $7EF362 : db $02 : dw $0009 ; Rupees (actual)
dl $7FEF91 : db $01 : db $00 ; 
dl $7FF041 : db $01 : db $01 ; 
dl $7FE00C : db $01 : db $00 ; Overworld $46 persistent: UNKNOWN
dl $7FE038 : db $01 : db $00 ; Overworld $5C persistent: UNKNOWN
dl $7FE110 : db $01 : db $00 ; Overworld $C8 persistent: UNKNOWN
dl $7FE124 : db $01 : db $00 ; Overworld $D2 persistent: UNKNOWN
dl $7FE160 : db $01 : db $00 ; Overworld $F0 persistent: UNKNOWN
dl $7FDFCD : db $01 : db $23 ; Overworld $26 persistent: UNKNOWN
dl $7FF022 : db $01 : db $04 ; 
dl $7FEF97 : db $01 : db $00 ; 
.after

sram_pod_main_hub:
dl $7EF343 : db $01 : db $03 ; Bombs
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF012 : db $02 : dw $0018 ; Room $0009: Palace of Darkness (............qq..)
dl $7EF382 : db $01 : db $01 ; Key for dungeon $06
dl $7FF041 : db $01 : db $00 ; 
dl $7FDFCD : db $01 : db $00 ; Room $26 persistent: Swamp Palace (Statue Room)
dl $7EF094 : db $02 : dw $000F ; Room $004A: Palace of Darkness (Entrance Room) (.............qqq)
dl $7FF022 : db $01 : db $00 ; 
.after

sram_pod_hammeryump:
dl $7EF343 : db $01 : db $04 ; Bombs
dl $7EF014 : db $02 : dw $801F ; Room $000A: Palace of Darkness (Stalfos Trap Room) (.d..........qqqq)
dl $7EF366 : db $02 : dw $7220 ; BigKey1
dl $7EF382 : db $01 : db $00 ; Key for dungeon $06
dl $7EF054 : db $02 : dw $002F ; Room $002A: Palace of Darkness (Big Hub Room) (...........c.qqq)
dl $7EF074 : db $02 : dw $801F ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d..........qqqq)
dl $7EF094 : db $02 : dw $200F ; Room $004A: Palace of Darkness (Entrance Room) (...d.........qqq)
.after

sram_pod_before_sexy_statue:
dl $7EF34B : db $01 : db $01 ; Hammer
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF034 : db $02 : dw $301A ; Room $001A: Palace of Darkness (Big Chest Room) (...db.......qq.q)
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7EF032 : db $02 : dw $802F ; Room $0019: Palace of Darkness (Dark Maze) (.d.........c.qqq)
dl $7EF382 : db $01 : db $01 ; Key for dungeon $06
dl $7EF054 : db $02 : dw $402F ; Room $002A: Palace of Darkness (Big Hub Room) (..d........c.qqq)
.after

sram_pod_mimics:
dl $7EF343 : db $01 : db $06 ; Bombs
dl $7EF377 : db $01 : db $06 ; Arrows
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7EF056 : db $02 : dw $000A ; Room $002B: Palace of Darkness (Map Chest / Fairy Room) (.............q.q)
.after

sram_pod_turtle_room:
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF016 : db $02 : dw $200C ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qq.)
dl $7EF036 : db $02 : dw $008E ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (.........c...qqq)
dl $7FDFB6 : db $02 : dw $0038 ; Room $1B persistent: Palace of Darkness (Mimics / Moving Wall Room)
.after

sram_pod_helma:
dl $7EF016 : db $02 : dw $200F ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qqq)
dl $7FE054 : db $02 : dw $0010 ; Room $6A persistent: Palace of Darkness (Rupee Room)
dl $7EF0D4 : db $02 : dw $0005 ; Room $006A: Palace of Darkness (Rupee Room) (..............q.)
dl $7FDF96 : db $02 : dw $03F0 ; Room $B persistent: Palace of Darkness (Turtle Room)
.after

sram_thieves_outside_pod:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF36C : db $01 : db $38 ; Health (goal)
dl $7EF3EF : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7EF3C7 : db $01 : db $07 ; Map Phase
dl $7EF37A : db $01 : db $02 ; Crystals
dl $7EF382 : db $01 : db $00 ; Key for dungeon $06
dl $7FF041 : db $01 : db $01 ; 
dl $7FE054 : db $01 : db $00 ; Overworld $6A persistent: Haunted Grove
dl $7FDFCD : db $01 : db $23 ; Overworld $26 persistent: UNKNOWN
dl $7EF0B4 : db $02 : dw $0801 ; Room $005A: Palace of Darkness (Helmasaur King[Boss]) (.....k..........)
dl $7EF0D4 : db $02 : dw $8005 ; Room $006A: Palace of Darkness (Rupee Room) (.d............q.)
dl $7FDF96 : db $01 : db $00 ; Overworld $B persistent: UNKNOWN
dl $7FDFB6 : db $01 : db $00 ; Overworld $1B persistent: Hyrule Castle
.after

sram_thieves_ow_hammerdash:
dl $7FEFBC : db $01 : db $80 ; 
dl $7FEFB2 : db $01 : db $80 ; 
dl $7FEF91 : db $01 : db $08 ; 
dl $7FF041 : db $01 : db $00 ; 
dl $7FE00C : db $01 : db $DB ; Overworld $46 persistent: UNKNOWN
dl $7FE038 : db $01 : db $42 ; Overworld $5C persistent: UNKNOWN
dl $7FE110 : db $01 : db $7A ; Overworld $C8 persistent: UNKNOWN
dl $7FE124 : db $01 : db $AD ; Overworld $D2 persistent: UNKNOWN
dl $7FE160 : db $01 : db $42 ; Overworld $F0 persistent: UNKNOWN
dl $7FDFCD : db $01 : db $00 ; Overworld $26 persistent: UNKNOWN
dl $7FEF97 : db $01 : db $80 ; 
.after

sram_thieves_getting_flute:
dl $7FEFBC : db $01 : db $10 ; 
dl $7FEFB2 : db $01 : db $00 ; 
dl $7FEFBA : db $01 : db $80 ; 
dl $7FE13B : db $01 : db $26 ; Overworld $DD persistent: UNKNOWN
dl $7FE163 : db $01 : db $42 ; Overworld $F1 persistent: UNKNOWN
dl $7FEF91 : db $01 : db $00 ; 
dl $7FE00C : db $01 : db $00 ; Overworld $46 persistent: UNKNOWN
dl $7FE038 : db $01 : db $00 ; Overworld $5C persistent: UNKNOWN
dl $7FE110 : db $01 : db $00 ; Overworld $C8 persistent: UNKNOWN
dl $7FE124 : db $01 : db $00 ; Overworld $D2 persistent: UNKNOWN
dl $7FE150 : db $01 : db $42 ; Overworld $E8 persistent: UNKNOWN
dl $7FE160 : db $01 : db $00 ; Overworld $F0 persistent: UNKNOWN
dl $7FEF97 : db $01 : db $00 ; 
dl $7FEFB7 : db $01 : db $10 ; 
.after

sram_thieves_usain_bolt:
dl $7FEFBC : db $01 : db $00 ; 
dl $7EF34C : db $01 : db $02 ; Flute
dl $7FEFBA : db $01 : db $00 ; 
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FE13B : db $01 : db $00 ; Overworld $DD persistent: UNKNOWN
dl $7FE163 : db $01 : db $00 ; Overworld $F1 persistent: UNKNOWN
dl $7FF011 : db $01 : db $01 ; 
dl $7FE07C : db $01 : db $A0 ; Overworld $7E persistent: UNKNOWN
dl $7FE150 : db $01 : db $00 ; Overworld $E8 persistent: UNKNOWN
dl $7FE019 : db $01 : db $1E ; Overworld $4C persistent: UNKNOWN
dl $7FE06D : db $01 : db $A1 ; Overworld $76 persistent: UNKNOWN
dl $7FE161 : db $01 : db $A1 ; Overworld $F0 persistent: UNKNOWN
dl $7FE04E : db $01 : db $9F ; Overworld $67 persistent: UNKNOWN
dl $7FE06E : db $01 : db $2F ; Overworld $77 persistent: Black Ice Cave
dl $7FF020 : db $01 : db $40 ; 
dl $7FEFB7 : db $01 : db $00 ; 
.after

sram_thieves_after_activating_flute:
dl $7FF050 : db $01 : db $80 ; 
dl $7EF298 : db $01 : db $20 ; Overworld $18: Unknown (...?....)
dl $7EF34C : db $01 : db $03 ; Flute
dl $7FF166 : db $01 : db $02 ; 
dl $7FF011 : db $01 : db $00 ; 
dl $7FF02D : db $01 : db $80 ; 
dl $7FE07C : db $01 : db $00 ; Overworld $7E persistent: UNKNOWN
dl $7FE128 : db $01 : db $DC ; Overworld $D4 persistent: UNKNOWN
dl $7FE019 : db $01 : db $00 ; Overworld $4C persistent: UNKNOWN
dl $7FE06D : db $01 : db $00 ; Overworld $76 persistent: UNKNOWN
dl $7FE161 : db $01 : db $00 ; Overworld $F0 persistent: UNKNOWN
dl $7FE04E : db $01 : db $00 ; Overworld $67 persistent: UNKNOWN
dl $7FE06E : db $01 : db $00 ; Overworld $77 persistent: Black Ice Cave
dl $7FE102 : db $01 : db $42 ; Overworld $C1 persistent: UNKNOWN
dl $7FF020 : db $01 : db $00 ; 
.after

sram_thieves_darkworld:
dl $7FF027 : db $01 : db $40 ; 
dl $7FF050 : db $01 : db $00 ; 
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FF166 : db $01 : db $00 ; 
dl $7FF02D : db $01 : db $00 ; 
dl $7FE068 : db $01 : db $26 ; Overworld $74 persistent: Dark Swamp North
dl $7FE128 : db $01 : db $00 ; Overworld $D4 persistent: UNKNOWN
dl $7FE045 : db $01 : db $13 ; Overworld $62 persistent: Locked Chest House
dl $7FE102 : db $01 : db $00 ; Overworld $C1 persistent: UNKNOWN
dl $7FE136 : db $01 : db $1A ; Overworld $DB persistent: UNKNOWN
.after

sram_thieves_entrance:
dl $7FF027 : db $01 : db $00 ; 
dl $7FF0AB : db $01 : db $80 ; 
dl $7FF0CF : db $01 : db $80 ; 
dl $7FF058 : db $01 : db $80 ; 
dl $7EF2D8 : db $01 : db $20 ; Overworld $58: Unknown (...?....)
dl $7EF360 : db $02 : dw $000A ; Rupees (goal)
dl $7EF362 : db $02 : dw $000A ; Rupees (actual)
dl $7FEFB9 : db $01 : db $80 ; 
dl $7FE068 : db $01 : db $00 ; Overworld $74 persistent: Dark Swamp North
dl $7FE148 : db $01 : db $26 ; Overworld $E4 persistent: UNKNOWN
dl $7FF0B1 : db $01 : db $04 ; 
dl $7FE045 : db $01 : db $00 ; Overworld $62 persistent: Locked Chest House
dl $7FE0E3 : db $01 : db $13 ; Overworld $B1 persistent: UNKNOWN
dl $7FE136 : db $01 : db $00 ; Overworld $DB persistent: UNKNOWN
.after

sram_thieves_after_big_key:
dl $7FF0AB : db $01 : db $00 ; 
dl $7FF0CF : db $01 : db $00 ; 
dl $7EF36F : db $01 : db $00 ; Keys
dl $7FF058 : db $01 : db $00 ; 
dl $7EF1B8 : db $02 : dw $000F ; Room $00DC: Thieves Town (South East Entrance Room) (.............qqq)
dl $7EF196 : db $02 : dw $000F ; Room $00CB: Thieves Town (North West Entrance Room) (.............qqq)
dl $7EF1B6 : db $02 : dw $002F ; Room $00DB: Thieves Town (Main (South West) Entrance Room) (...........c.qqq)
dl $7EF366 : db $02 : dw $7230 ; BigKey1
dl $7FEFB9 : db $01 : db $00 ; 
dl $7FE148 : db $01 : db $00 ; Room $E4 persistent: Cave (Lost Old Man Final Cave)
dl $7FF0B1 : db $01 : db $00 ; 
dl $7FE0E3 : db $01 : db $00 ; Room $B1 persistent: Misery Mire (Hourglass Room)
dl $7EF198 : db $02 : dw $000F ; Room $00CC: Thieves Town (North East Entrance Room) (.............qqq)
.after

sram_thieves_fire_room:
dl $7FE0F8 : db $02 : dw $0340 ; Room $BC persistent: Thieves Town (Conveyor Toilet)
dl $7FE138 : db $02 : dw $0080 ; Room $DC persistent: Thieves Town (South East Entrance Room)
dl $7EF178 : db $02 : dw $C407 ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K.......qq)
dl $7EF198 : db $02 : dw $800F ; Room $00CC: Thieves Town (North East Entrance Room) (.d...........qqq)
.after

sram_thieves_hellway:
dl $7EF176 : db $02 : dw $0001 ; Room $00BB: Thieves Town (Hellway) (................)
.after

sram_thieves_bombable_floor:
dl $7EF0CA : db $02 : dw $0002 ; Room $0065: Thieves Town (East Attic Room) (...............q)
dl $7EF156 : db $02 : dw $8402 ; Room $00AB: Thieves Town (Moving Spikes / Key Pot Room) (.d....K........q)
dl $7EF176 : db $02 : dw $000B ; Room $00BB: Thieves Town (Hellway) (.............q.q)
dl $7FE0F8 : db $02 : dw $0000 ; Room $BC persistent: Thieves Town (Conveyor Toilet)
dl $7FE138 : db $02 : dw $0000 ; Room $DC persistent: Thieves Town (South East Entrance Room)
dl $7EF0C8 : db $02 : dw $0003 ; Room $0064: Thieves Town (West Attic Room) (...............q)
.after

sram_thieves_prison:
dl $7EF343 : db $01 : db $05 ; Bombs
dl $7EF08A : db $02 : dw $000A ; Room $0045: Thieves Town (Jail Cells Room) (.............q.q)
dl $7EF0CA : db $02 : dw $0103 ; Room $0065: Thieves Town (East Attic Room) (........c......q)
dl $7EF176 : db $02 : dw $000F ; Room $00BB: Thieves Town (Hellway) (.............qqq)
dl $7EF178 : db $02 : dw $C40F ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K......qqq)
dl $7FE00A : db $02 : dw $0002 ; Room $45 persistent: Thieves Town (Jail Cells Room)
.after

sram_thieves_after_gloves:
dl $7EF354 : db $01 : db $02 ; Gloves
dl $7EF3CC : db $01 : db $06 ; Tagalong
dl $7EF08A : db $02 : dw $00FF ; Room $0045: Thieves Town (Jail Cells Room) (.........cccqqqq)
dl $7EF088 : db $02 : dw $4017 ; Room $0044: Thieves Town (Big Chest Room) (..d.........q.qq)
dl $7FE00A : db $02 : dw $0162 ; Room $45 persistent: Thieves Town (Jail Cells Room)
.after

sram_thieves_pot_hammerdash:
dl $7EF377 : db $01 : db $0B ; Arrows
dl $7FE008 : db $02 : dw $0080 ; Room $44 persistent: Thieves Town (Big Chest Room)
.after

sram_thieves_blind:
dl $7FE0F8 : db $02 : dw $0002 ; Room $BC persistent: Thieves Town (Conveyor Toilet)
.after

sram_sw_outside_thieves:
dl $7EF343 : db $01 : db $04 ; Bombs
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF387 : db $01 : db $00 ; Key for dungeon $0B
dl $7FF128 : db $01 : db $02 ; 
dl $7EF20C : db $02 : dw $F012 ; Room $0106: Unknown (.dddb.......q..q)
dl $7EF2D8 : db $01 : db $22 ; Overworld $58: Unknown (...?...?)
dl $7EF360 : db $02 : dw $0136 ; Rupees (goal)
dl $7EF36C : db $01 : db $40 ; Health (goal)
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7FF149 : db $01 : db $08 ; 
dl $7EF3F9 : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF362 : db $02 : dw $0136 ; Rupees (actual)
dl $7EF37A : db $01 : db $22 ; Crystals
dl $7FE008 : db $01 : db $00 ; Overworld $44 persistent: UNKNOWN
dl $7FE0F8 : db $01 : db $00 ; Overworld $BC persistent: UNKNOWN
dl $7FE148 : db $01 : db $26 ; Overworld $E4 persistent: UNKNOWN
dl $7FE0E3 : db $01 : db $13 ; Overworld $B1 persistent: UNKNOWN
dl $7EF158 : db $02 : dw $0A01 ; Room $00AC: Thieves Town (Blind The Thief[Boss]) (.....k.R........)
dl $7FE00A : db $01 : db $00 ; Overworld $45 persistent: Death Mountain East
.after

sram_sw_cursed_dwarf:
dl $7FF128 : db $01 : db $00 ; 
.after

sram_sw_got_tempered:
dl $7EF360 : db $02 : dw $012C ; Rupees (goal)
dl $7FF149 : db $01 : db $00 ; 
dl $7EF359 : db $01 : db $03 ; Sword
dl $7EF3C9 : db $01 : db $20 ; Game Phase 3
dl $7EF242 : db $02 : dw $0002 ; Room $0121: Unknown (...............q)
dl $7EF362 : db $02 : dw $012C ; Rupees (actual)
dl $7FE148 : db $01 : db $00 ; Overworld $E4 persistent: UNKNOWN
dl $7FDFDD : db $01 : db $B5 ; Overworld $2E persistent: South of Eastern Palace
dl $7FE0E3 : db $01 : db $00 ; Overworld $B1 persistent: UNKNOWN
dl $7FF022 : db $01 : db $10 ; 
dl $7FF026 : db $01 : db $40 ; 
dl $7FEF8B : db $01 : db $04 ; 
.after

sram_sw_dash_to_sw:
dl $7EF238 : db $02 : dw $0011 ; Room $011C: Unknown (............q...)
dl $7EF360 : db $02 : dw $0258 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0258 ; Rupees (actual)
dl $7FEFD9 : db $01 : db $10 ; 
dl $7FE148 : db $01 : db $26 ; Overworld $E4 persistent: UNKNOWN
dl $7FDFDD : db $01 : db $00 ; Overworld $2E persistent: South of Eastern Palace
dl $7FE0E3 : db $01 : db $13 ; Overworld $B1 persistent: UNKNOWN
dl $7FEFF4 : db $01 : db $04 ; 
dl $7FF022 : db $01 : db $00 ; 
dl $7FF026 : db $01 : db $00 ; 
dl $7FEF8B : db $01 : db $00 ; 
.after

sram_sw_mummy_room:
dl $7FF0C3 : db $01 : db $04 ; 
dl $7FF0F0 : db $01 : db $20 ; 
dl $7FF164 : db $01 : db $01 ; 
dl $7FEFD9 : db $01 : db $00 ; 
dl $7FF049 : db $01 : db $40 ; 
dl $7FE148 : db $01 : db $00 ; Overworld $E4 persistent: UNKNOWN
dl $7FE0E3 : db $01 : db $00 ; Overworld $B1 persistent: UNKNOWN
dl $7FE0FA : db $01 : db $23 ; Overworld $BD persistent: UNKNOWN
dl $7FEFF4 : db $01 : db $00 ; 
.after

sram_sw_bomb_jump:
dl $7EF377 : db $01 : db $10 ; Arrows
dl $7FF164 : db $01 : db $00 ; 
dl $7EF0AE : db $02 : dw $001A ; Room $0057: Skull Woods (Big Key Room) (............qq.q)
dl $7EF366 : db $02 : dw $72B0 ; BigKey1
.after

sram_sw_key_pot:
dl $7FF0C3 : db $01 : db $00 ; 
dl $7EF343 : db $01 : db $03 ; Bombs
dl $7EF36F : db $01 : db $00 ; Keys
dl $7FF0F0 : db $01 : db $00 ; 
dl $7EF345 : db $01 : db $01 ; Fire Rod
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7FF049 : db $01 : db $00 ; 
dl $7EF0AC : db $02 : dw $0005 ; Room $0056: Skull Woods (Key Pot / Trap Room) (..............q.)
dl $7EF0B0 : db $02 : dw $0012 ; Room $0058: Skull Woods (Big Chest Room) (............q..q)
dl $7FE0FA : db $01 : db $00 ; Room $BD persistent: Empty Clone Room
.after

sram_sw_skull_entrance:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF2C0 : db $01 : db $20 ; Overworld $40: Unknown (...?....)
dl $7EF384 : db $01 : db $01 ; Key for dungeon $08
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7EF0AC : db $02 : dw $0407 ; Room $0056: Skull Woods (Key Pot / Trap Room) (......K.......qq)
dl $7FE0FA : db $01 : db $23 ; Overworld $BD persistent: UNKNOWN
dl $7FF022 : db $01 : db $20 ; 
.after

sram_sw_mummy_hellway:
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF092 : db $02 : dw $0002 ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (...............q)
dl $7EF0B2 : db $02 : dw $800A ; Room $0059: Skull Woods (Final Section Entrance Room) (.d...........q.q)
dl $7FE032 : db $02 : dw $0003 ; Room $59 persistent: Skull Woods (Final Section Entrance Room)
dl $7FE0FA : db $01 : db $00 ; Room $BD persistent: Empty Clone Room
dl $7FF022 : db $01 : db $00 ; 
.after

sram_sw_mummy_key:
dl $7EF092 : db $02 : dw $200F ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (...d.........qqq)
dl $7EF36E : db $01 : db $30 ; Magic Power
dl $7FE012 : db $02 : dw $0801 ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
.after

sram_sw_mothula:
dl $7EF072 : db $02 : dw $0002 ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (...............q)
dl $7EF092 : db $02 : dw $A00F ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (.d.d.........qqq)
dl $7FDFF2 : db $02 : dw $0002 ; Room $39 persistent: Skull Woods (Gibdo Key / Mothula Hole Room)
.after

sram_ice_outside_skull:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF36C : db $01 : db $48 ; Health (goal)
dl $7EF384 : db $01 : db $00 ; Key for dungeon $08
dl $7EF3F3 : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF052 : db $02 : dw $0801 ; Room $0029: Skull Woods (Mothula[Boss]) (.....k..........)
dl $7EF072 : db $02 : dw $4403 ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF37A : db $01 : db $62 ; Crystals
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FDFF2 : db $01 : db $00 ; Overworld $39 persistent: UNKNOWN
dl $7FE012 : db $01 : db $00 ; Overworld $49 persistent: UNKNOWN
dl $7FE032 : db $01 : db $00 ; Overworld $59 persistent: UNKNOWN
dl $7FE0FA : db $01 : db $23 ; Overworld $BD persistent: UNKNOWN
dl $7FF022 : db $01 : db $20 ; 
.after

sram_ice_bridge_warp:
dl $7FE0FA : db $01 : db $00 ; Overworld $BD persistent: UNKNOWN
dl $7FF022 : db $01 : db $00 ; 
.after

sram_ice_lottery:
dl $7FF037 : db $01 : db $20 ; 
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FE17B : db $01 : db $DB ; Overworld $FD persistent: UNKNOWN
dl $7FE168 : db $01 : db $D4 ; Overworld $F4 persistent: UNKNOWN
dl $7FE111 : db $01 : db $BB ; Overworld $C8 persistent: UNKNOWN
dl $7FE166 : db $01 : db $12 ; Overworld $F3 persistent: UNKNOWN
.after

sram_ice_medallion:
dl $7FF037 : db $01 : db $00 ; 
dl $7FEFB0 : db $01 : db $02 ; 
dl $7FE17B : db $01 : db $00 ; Overworld $FD persistent: UNKNOWN
dl $7FEF89 : db $01 : db $08 ; 
dl $7FEF9D : db $01 : db $02 ; 
dl $7FEFB5 : db $01 : db $80 ; 
dl $7FF001 : db $01 : db $02 ; 
dl $7FDFCC : db $01 : db $56 ; Overworld $26 persistent: UNKNOWN
dl $7FE128 : db $01 : db $09 ; Overworld $D4 persistent: UNKNOWN
dl $7FE168 : db $01 : db $00 ; Overworld $F4 persistent: UNKNOWN
dl $7FE111 : db $01 : db $00 ; Overworld $C8 persistent: UNKNOWN
dl $7FE06E : db $01 : db $09 ; Overworld $77 persistent: Black Ice Cave
dl $7FE106 : db $01 : db $09 ; Overworld $C3 persistent: UNKNOWN
dl $7FE166 : db $01 : db $00 ; Overworld $F3 persistent: UNKNOWN
.after

sram_ice_zoras_domain:
dl $7FF003 : db $01 : db $20 ; 
dl $7FF007 : db $01 : db $80 ; 
dl $7FEF84 : db $01 : db $02 ; 
dl $7FEFB0 : db $01 : db $00 ; 
dl $7FF024 : db $01 : db $40 ; 
dl $7EF349 : db $01 : db $01 ; Quake Medallion
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FEF89 : db $01 : db $00 ; 
dl $7FEF9D : db $01 : db $00 ; 
dl $7FEFB5 : db $01 : db $00 ; 
dl $7FF001 : db $01 : db $00 ; 
dl $7FDFCC : db $01 : db $00 ; Overworld $26 persistent: UNKNOWN
dl $7FE128 : db $01 : db $00 ; Overworld $D4 persistent: UNKNOWN
dl $7FE05D : db $01 : db $59 ; Overworld $6E persistent: Outside Hedge Maze
dl $7FDFA6 : db $01 : db $38 ; Overworld $13 persistent: Sanctuary
dl $7FE06E : db $01 : db $00 ; Overworld $77 persistent: Black Ice Cave
dl $7FE106 : db $01 : db $00 ; Overworld $C3 persistent: UNKNOWN
dl $7FEF9B : db $01 : db $04 ; 
.after

sram_ice_tiny_warp:
dl $7FF003 : db $01 : db $00 ; 
dl $7FF007 : db $01 : db $00 ; 
dl $7FEF84 : db $01 : db $00 ; 
dl $7EF360 : db $02 : dw $0064 ; Rupees (goal)
dl $7EF379 : db $01 : db $FE ; Ability Flags
dl $7EF356 : db $01 : db $01 ; Flippers
dl $7EF362 : db $02 : dw $0064 ; Rupees (actual)
.after

sram_ice_ice_entrance:
dl $7FF024 : db $01 : db $00 ; 
dl $7FF0F0 : db $01 : db $20 ; 
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FF0CD : db $01 : db $20 ; 
dl $7FE01B : db $01 : db $42 ; Overworld $4D persistent: UNKNOWN
dl $7FDFF9 : db $01 : db $42 ; Overworld $3C persistent: Great Swamp SE
dl $7FE05D : db $01 : db $00 ; Overworld $6E persistent: Outside Hedge Maze
dl $7FDFA6 : db $01 : db $00 ; Overworld $13 persistent: Sanctuary
dl $7FDFDA : db $01 : db $D4 ; Overworld $2D persistent: Bridge to Hyrule Castle
dl $7FF07E : db $01 : db $40 ; 
dl $7FEF9B : db $01 : db $00 ; 
.after

sram_ice_ice2:
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF01C : db $02 : dw $0001 ; Room $000E: Ice Palace (Entrance Room) (................)
dl $7FF0F0 : db $01 : db $00 ; 
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7FDF9C : db $02 : dw $0001 ; Room $E persistent: Ice Palace (Entrance Room)
dl $7FF0CD : db $01 : db $00 ; 
dl $7FE01B : db $01 : db $00 ; Room $4D persistent: Ganon's Tower (Moldorm Room)
dl $7FDFF9 : db $01 : db $00 ; Room $3C persistent: Cave
dl $7FDFDA : db $01 : db $00 ; Room $2D persistent: Empty Clone Room
dl $7FF07E : db $01 : db $00 ; 
.after

sram_ice_penguin_switch_room:
dl $7EF01C : db $02 : dw $8403 ; Room $000E: Ice Palace (Entrance Room) (.d....K........q)
dl $7EF03C : db $02 : dw $0003 ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (...............q)
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7FDF9C : db $02 : dw $000B ; Room $E persistent: Ice Palace (Entrance Room)
dl $7EF05C : db $02 : dw $0004 ; Room $002E: Ice Palace (Compass Room) (..............q.)
.after

sram_ice_bombable_floor:
dl $7EF03E : db $02 : dw $0002 ; Room $001F: Ice Palace (Pengator / Big Key Room) (...............q)
dl $7FDFBE : db $02 : dw $0071 ; Room $1F persistent: Ice Palace (Pengator / Big Key Room)
.after

sram_ice_conveyor_room:
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF03C : db $02 : dw $0007 ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (..............qq)
dl $7FDF9C : db $02 : dw $0000 ; Room $E persistent: Ice Palace (Entrance Room)
dl $7FDFFC : db $02 : dw $0006 ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
dl $7EF07C : db $02 : dw $0004 ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..............q.)
.after

sram_ice_ipbj:
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7FDFFC : db $02 : dw $0306 ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
dl $7EF07C : db $02 : dw $0007 ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..............qq)
.after

sram_ice_penguin_room:
dl $7EF343 : db $01 : db $00 ; Bombs
dl $7EF07C : db $02 : dw $4407 ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..d...K.......qq)
dl $7EF09C : db $02 : dw $400C ; Room $004E: Ice Palace (Bomb-Jump Room) (..d..........qq.)
.after

sram_ice_lonely_fireball:
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7FE05C : db $02 : dw $001F ; Room $6E persistent: Ice Palace (Pengators Room)
dl $7EF0BC : db $02 : dw $0001 ; Room $005E: Ice Palace (Lonely Firebar) (................)
dl $7EF0DC : db $02 : dw $0004 ; Room $006E: Ice Palace (Pengators Room) (..............q.)
dl $7FDFBE : db $02 : dw $0000 ; Room $1F persistent: Ice Palace (Pengator / Big Key Room)
.after

sram_ice_fall_in_hole:
dl $7FDFFC : db $02 : dw $0000 ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
dl $7EF0BC : db $02 : dw $0003 ; Room $005E: Ice Palace (Lonely Firebar) (...............q)
dl $7EF0FC : db $02 : dw $0002 ; Room $007E: Ice Palace (Hidden Chest / Bombable Floor Room) (...............q)
dl $7EF13C : db $02 : dw $0003 ; Room $009E: Ice Palace (Big Chest Room) (...............q)
.after

sram_ice_kholdstare:
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7FE05C : db $02 : dw $0000 ; Room $6E persistent: Ice Palace (Pengators Room)
dl $7EF17C : db $02 : dw $0001 ; Room $00BE: Ice Palace (Block Puzzle Room) (................)
dl $7EF19C : db $02 : dw $0004 ; Room $00CE: Ice Palace (Hole to Kholdstare Room) (..............q.)
.after

sram_swamp_outside_ice:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7FF0F0 : db $01 : db $20 ; 
dl $7EF1BC : db $02 : dw $0804 ; Room $00DE: Ice Palace (Kholdstare[Boss]) (.....k........q.)
dl $7EF36C : db $01 : db $50 ; Health (goal)
dl $7EF3F5 : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $50 ; Health (actual)
dl $7EF385 : db $01 : db $00 ; Key for dungeon $09
dl $7EF37A : db $01 : db $66 ; Crystals
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FF0CD : db $01 : db $20 ; 
dl $7FE01B : db $01 : db $42 ; Overworld $4D persistent: UNKNOWN
dl $7FDFF9 : db $01 : db $42 ; Overworld $3C persistent: Great Swamp SE
dl $7FDFDA : db $01 : db $D4 ; Overworld $2D persistent: Bridge to Hyrule Castle
dl $7FF06A : db $01 : db $02 ; 
dl $7FF07E : db $01 : db $40 ; 
.after

sram_swamp_links_house:
dl $7FF013 : db $01 : db $40 ; 
dl $7FF0F0 : db $01 : db $00 ; 
dl $7FF0CD : db $01 : db $00 ; 
dl $7FE01B : db $01 : db $00 ; Overworld $4D persistent: UNKNOWN
dl $7FDFF9 : db $01 : db $00 ; Overworld $3C persistent: Great Swamp SE
dl $7FDFDA : db $01 : db $00 ; Overworld $2D persistent: Bridge to Hyrule Castle
dl $7FF06A : db $01 : db $00 ; 
dl $7FF07E : db $01 : db $00 ; 
.after

sram_swamp_swamp_overworld:
dl $7FF013 : db $01 : db $00 ; 
dl $7FF037 : db $01 : db $10 ; 
dl $7FEFBC : db $01 : db $08 ; 
dl $7FF034 : db $01 : db $04 ; 
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FE147 : db $01 : db $AB ; Overworld $E3 persistent: UNKNOWN
dl $7FE164 : db $01 : db $A9 ; Overworld $F2 persistent: UNKNOWN
dl $7FE059 : db $01 : db $13 ; Overworld $6C persistent: Dark Link's House
.after

sram_swamp_antifairy_room:
dl $7FF037 : db $01 : db $00 ; 
dl $7FEFBC : db $01 : db $00 ; 
dl $7FF034 : db $01 : db $00 ; 
dl $7EF216 : db $02 : dw $0003 ; Room $010B: Unknown (...............q)
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FE147 : db $01 : db $00 ; Room $E3 persistent: Cave (1/2 Magic)
dl $7FE164 : db $01 : db $00 ; Room $F2 persistent: House
dl $7FE059 : db $01 : db $00 ; Room $6C persistent: Ganon's Tower (Lanmolas Room)
.after

sram_swamp_entrance:
dl $7EF2BB : db $01 : db $20 ; Overworld $3B: Unknown (...?....)
dl $7EF2FB : db $01 : db $20 ; Overworld $7B: Unknown (...?....)
dl $7FEFB4 : db $01 : db $02 ; 
dl $7FF028 : db $01 : db $10 ; 
dl $7FF030 : db $01 : db $02 ; 
dl $7EF051 : db $01 : db $01 ; Room $0028: Swamp Palace (Entrance Room) (................)
dl $7EF216 : db $02 : dw $008F ; Room $010B: Unknown (.........c...qqq)
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FE07D : db $01 : db $13 ; Overworld $7E persistent: UNKNOWN
dl $7FE0E2 : db $01 : db $AA ; Overworld $B1 persistent: UNKNOWN
dl $7FE126 : db $01 : db $AB ; Overworld $D3 persistent: UNKNOWN
.after

sram_swamp_first_key:
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7FEFB4 : db $01 : db $00 ; 
dl $7FF028 : db $01 : db $00 ; 
dl $7FF030 : db $01 : db $00 ; 
dl $7EF06E : db $02 : dw $0003 ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...............q)
dl $7FDFD0 : db $02 : dw $000E ; Room $28 persistent: Swamp Palace (Entrance Room)
dl $7FE07D : db $01 : db $00 ; Room $7E persistent: Ice Palace (Hidden Chest / Bombable Floor Room)
dl $7EF050 : db $02 : dw $811F ; Room $0028: Swamp Palace (Entrance Room) (.d......c...qqqq)
dl $7EF070 : db $02 : dw $440A ; Room $0038: Swamp Palace (Key Pot Room) (..d...K......q.q)
dl $7FE0E2 : db $01 : db $00 ; Room $B1 persistent: Misery Mire (Hourglass Room)
dl $7FE126 : db $01 : db $00 ; Room $D3 persistent: Empty Clone Room
.after

sram_swamp_main_hub:
dl $7EF06E : db $02 : dw $348F ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...db.K..c...qqq)
.after

sram_swamp_switch_room:
dl $7EF06A : db $02 : dw $040F ; Room $0035: Swamp Palace (Big Key / BS Room) (......K......qqq)
dl $7FDFD0 : db $02 : dw $0000 ; Room $28 persistent: Swamp Palace (Entrance Room)
dl $7FDFEC : db $02 : dw $0031 ; Room $36 persistent: Swamp Palace (Big Chest Room)
dl $7EF06C : db $02 : dw $000F ; Room $0036: Swamp Palace (Big Chest Room) (.............qqq)
.after

sram_swamp_sociable_firebar:
dl $7EF06A : db $02 : dw $848F ; Room $0035: Swamp Palace (Big Key / BS Room) (.d....K..c...qqq)
dl $7EF068 : db $02 : dw $000F ; Room $0034: Swamp Palace (Push Block Puzzle / Pre-Big Key Room) (.............qqq)
dl $7EF06C : db $02 : dw $200F ; Room $0036: Swamp Palace (Big Chest Room) (...d.........qqq)
.after

sram_swamp_backtracking:
dl $7EF06A : db $02 : dw $849F ; Room $0035: Swamp Palace (Big Key / BS Room) (.d....K..c..qqqq)
dl $7EF366 : db $02 : dw $76B0 ; BigKey1
dl $7EF0A8 : db $02 : dw $000F ; Room $0054: Swamp Palace (Upstairs Pits Room) (.............qqq)
.after

sram_swamp_hook_shot:
dl $7FDFE8 : db $02 : dw $0001 ; Room $34 persistent: Swamp Palace (Push Block Puzzle / Pre-Big Key Room)
.after

sram_swamp_hookdash:
dl $7EF342 : db $01 : db $01 ; Hookshot
dl $7EF06C : db $02 : dw $201F ; Room $0036: Swamp Palace (Big Chest Room) (...d........qqqq)
.after

sram_swamp_restock:
dl $7EF377 : db $01 : db $15 ; Arrows
dl $7FDFCC : db $02 : dw $0400 ; Room $26 persistent: Swamp Palace (Statue Room)
dl $7FDFE8 : db $02 : dw $0000 ; Room $34 persistent: Swamp Palace (Push Block Puzzle / Pre-Big Key Room)
dl $7FDFEC : db $02 : dw $0000 ; Room $36 persistent: Swamp Palace (Big Chest Room)
dl $7FE04C : db $02 : dw $0080 ; Room $66 persistent: Swamp Palace (Hidden Chest / Hidden Door Room)
dl $7FE06C : db $02 : dw $0002 ; Room $76 persistent: Swamp Palace (Water Drain Room)
dl $7EF04C : db $02 : dw $8007 ; Room $0026: Swamp Palace (Statue Room) (.d............qq)
dl $7EF06C : db $02 : dw $641F ; Room $0036: Swamp Palace (Big Chest Room) (..dd..K.....qqqq)
dl $7EF0CC : db $02 : dw $0003 ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (...............q)
dl $7EF0EC : db $02 : dw $008E ; Room $0076: Swamp Palace (Water Drain Room) (.........c...qqq)
.after

sram_swamp_arrghus:
dl $7EF343 : db $01 : db $02 ; Bombs
dl $7EF02C : db $02 : dw $440F ; Room $0016: Swamp Palace (Swimming Treadmill) (..d...K......qqq)
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7FDFAC : db $02 : dw $0004 ; Room $16 persistent: Swamp Palace (Swimming Treadmill)
dl $7EF0CC : db $02 : dw $000F ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (.............qqq)
.after

sram_mire_outside_swamp:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7FEFAC : db $01 : db $20 ; 
dl $7FEFB4 : db $01 : db $02 ; 
dl $7EF00C : db $02 : dw $0802 ; Room $0006: Swamp Palace (Arrghus[Boss]) (.....k.........q)
dl $7FF028 : db $01 : db $10 ; 
dl $7FF030 : db $01 : db $02 ; 
dl $7EF36C : db $01 : db $58 ; Health (goal)
dl $7EF3ED : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $58 ; Health (actual)
dl $7EF381 : db $01 : db $00 ; Key for dungeon $05
dl $7EF37A : db $01 : db $76 ; Crystals
dl $7FDFAC : db $01 : db $00 ; Overworld $16 persistent: Witch's Hut
dl $7FDFCC : db $01 : db $00 ; Overworld $26 persistent: UNKNOWN
dl $7FE04C : db $01 : db $00 ; Overworld $66 persistent: UNKNOWN
dl $7FE06C : db $01 : db $00 ; Overworld $76 persistent: UNKNOWN
dl $7FE07D : db $01 : db $13 ; Overworld $7E persistent: UNKNOWN
dl $7FE0E2 : db $01 : db $AA ; Overworld $B1 persistent: UNKNOWN
dl $7FE126 : db $01 : db $AB ; Overworld $D3 persistent: UNKNOWN
.after

sram_mire_dm:
dl $7FF10B : db $01 : db $20 ; 
dl $7FF117 : db $01 : db $04 ; 
dl $7EF2BB : db $01 : db $00 ; Overworld $3B: Unknown (........)
dl $7EF2FB : db $01 : db $00 ; Overworld $7B: Unknown (........)
dl $7FEFAC : db $01 : db $00 ; 
dl $7FEFB4 : db $01 : db $00 ; 
dl $7FF028 : db $01 : db $00 ; 
dl $7FF030 : db $01 : db $00 ; 
dl $7FF10C : db $01 : db $02 ; 
dl $7EF051 : db $01 : db $80 ; Room $0028: Swamp Palace (Entrance Room) (.........c......)
dl $7EF216 : db $01 : db $0F ; Room $010B: Unknown (.............qqq)
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FF136 : db $01 : db $20 ; 
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
dl $7FE07D : db $01 : db $00 ; Overworld $7E persistent: UNKNOWN
dl $7FE0E2 : db $01 : db $00 ; Overworld $B1 persistent: UNKNOWN
dl $7FE126 : db $01 : db $00 ; Overworld $D3 persistent: UNKNOWN
.after

sram_mire_mire_darkworld_warp:
dl $7FF10B : db $01 : db $00 ; 
dl $7FF117 : db $01 : db $00 ; 
dl $7FF10C : db $01 : db $00 ; 
dl $7EF348 : db $01 : db $01 ; Ether Medallion
dl $7FF101 : db $01 : db $20 ; 
dl $7FF136 : db $01 : db $00 ; 
dl $7FDFCB : db $01 : db $00 ; Overworld $25 persistent: Octorok Area
.after

sram_mire_mire_entrance:
dl $7FF090 : db $01 : db $01 ; 
dl $7EF2F0 : db $01 : db $20 ; Overworld $70: Unknown (...?....)
dl $7FF101 : db $01 : db $00 ; 
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FF0A9 : db $01 : db $10 ; 
dl $7FF0AE : db $01 : db $80 ; 
.after

sram_mire_mire2:
dl $7EF36F : db $01 : db $00 ; Keys
dl $7FF090 : db $01 : db $00 ; 
dl $7FF0A9 : db $01 : db $00 ; 
dl $7EF130 : db $02 : dw $0003 ; Room $0098: Misery Mire (Entrance Room) (...............q)
dl $7FF0AE : db $01 : db $00 ; 
.after

sram_mire_left_dash:
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF1A4 : db $02 : dw $000F ; Room $00D2: Misery Mire (Mire02 / Wizzrobes Room) (.............qqq)
dl $7EF166 : db $02 : dw $0402 ; Room $00B3: Misery Mire (Spike Key Chest Room) (......K........q)
dl $7EF36E : db $01 : db $50 ; Magic Power
dl $7FE124 : db $02 : dw $03EF ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
dl $7EF164 : db $02 : dw $0001 ; Room $00B2: Misery Mire (Slug Room) (................)
dl $7EF184 : db $02 : dw $000F ; Room $00C2: Misery Mire (Big Hub Room) (.............qqq)
.after

sram_mire_dodongos:
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF182 : db $02 : dw $C403 ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K........q)
dl $7FE124 : db $02 : dw $0000 ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
dl $7EF184 : db $02 : dw $400F ; Room $00C2: Misery Mire (Big Hub Room) (..d..........qqq)
dl $7FE102 : db $02 : dw $0200 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
.after

sram_mire_spark_gamble:
dl $7EF12E : db $02 : dw $010F ; Room $0097: Misery Mire (Torch Puzzle / Moving Wall Room) (........c....qqq)
dl $7EF162 : db $02 : dw $0007 ; Room $00B1: Misery Mire (Hourglass Room) (..............qq)
dl $7EF182 : db $02 : dw $C407 ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K.......qq)
dl $7EF1A2 : db $02 : dw $001B ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (............qq.q)
dl $7EF366 : db $02 : dw $77B0 ; BigKey1
dl $7EF36E : db $01 : db $40 ; Magic Power
dl $7FE122 : db $02 : dw $0040 ; Room $D1 persistent: Misery Mire (Conveyor Slug / Big Key Room)
.after

sram_mire_spike_key:
dl $7EF350 : db $01 : db $01 ; Cane of Somaria
dl $7EF36D : db $01 : db $50 ; Health (actual)
dl $7EF186 : db $02 : dw $001F ; Room $00C3: Misery Mire (Big Chest Room) (............qqqq)
dl $7FE102 : db $02 : dw $0000 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
dl $7FE122 : db $02 : dw $0000 ; Room $D1 persistent: Misery Mire (Conveyor Slug / Big Key Room)
.after

sram_mire_basement:
dl $7EF360 : db $02 : dw $0065 ; Rupees (goal)
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7EF166 : db $02 : dw $841A ; Room $00B3: Misery Mire (Spike Key Chest Room) (.d....K.....qq.q)
dl $7EF362 : db $02 : dw $0065 ; Rupees (actual)
dl $7FE0E4 : db $02 : dw $0001 ; Room $B2 persistent: Misery Mire (Slug Room)
dl $7EF164 : db $02 : dw $800D ; Room $00B2: Misery Mire (Slug Room) (.d...........qq.)
dl $7EF144 : db $02 : dw $000F ; Room $00A2: Misery Mire (Bridge Key Chest Room) (.............qqq)
.after

sram_mire_cane_dash:
dl $7EF126 : db $02 : dw $000E ; Room $0093: Misery Mire (Dark Cane Floor Switch Puzzle Room) (.............qqq)
dl $7EF36E : db $01 : db $38 ; Magic Power
dl $7EF144 : db $02 : dw $800F ; Room $00A2: Misery Mire (Bridge Key Chest Room) (.d...........qqq)
.after

sram_mire_bombable_wall:
dl $7EF36E : db $01 : db $30 ; Magic Power
dl $7EF124 : db $02 : dw $0005 ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............q.)
.after

sram_mire_vitty:
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF377 : db $01 : db $14 ; Arrows
dl $7EF122 : db $02 : dw $0005 ; Room $0091: Misery Mire (Final Switch Room) (..............q.)
dl $7EF36E : db $01 : db $40 ; Magic Power
dl $7FE0A4 : db $02 : dw $0200 ; Room $92 persistent: Misery Mire (Dark Bomb Wall / Switches Room)
dl $7FE0E4 : db $02 : dw $0000 ; Room $B2 persistent: Misery Mire (Slug Room)
dl $7EF124 : db $02 : dw $400F ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..d..........qqq)
dl $7EF140 : db $02 : dw $000F ; Room $00A0: Misery Mire (Pre-Vitreous Room) (.............qqq)
.after

sram_trock_ouside_mire:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF377 : db $01 : db $0C ; Arrows
dl $7EF383 : db $01 : db $00 ; Key for dungeon $07
dl $7EF36C : db $01 : db $60 ; Health (goal)
dl $7EF3F1 : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $60 ; Health (actual)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF37A : db $01 : db $77 ; Crystals
dl $7FE0A4 : db $01 : db $00 ; Overworld $92 persistent: UNKNOWN
dl $7EF120 : db $02 : dw $0802 ; Room $0090: Misery Mire (Vitreous[Boss]) (.....k.........q)
dl $7EF140 : db $02 : dw $800F ; Room $00A0: Misery Mire (Pre-Vitreous Room) (.d...........qqq)
.after

sram_trock_icerod_overworld:
dl $7FEFAA : db $01 : db $02 ; 
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7FE047 : db $01 : db $BB ; Overworld $63 persistent: UNKNOWN
dl $7FE0D6 : db $01 : db $0B ; Overworld $AB persistent: UNKNOWN
.after

sram_trock_dm:
dl $7FF10B : db $01 : db $20 ; 
dl $7FF117 : db $01 : db $04 ; 
dl $7EF2B7 : db $01 : db $02 ; Overworld $37: Unknown (.......?)
dl $7EF343 : db $01 : db $00 ; Bombs
dl $7FF10C : db $01 : db $02 ; 
dl $7EF240 : db $02 : dw $001A ; Room $0120: Unknown (............qq.q)
dl $7FEFAA : db $01 : db $00 ; 
dl $7EF346 : db $01 : db $01 ; Ice Rod
dl $7FF136 : db $01 : db $20 ; 
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
dl $7FE047 : db $01 : db $00 ; Overworld $63 persistent: UNKNOWN
dl $7FE0D6 : db $01 : db $00 ; Overworld $AB persistent: UNKNOWN
.after

sram_trock_trock_overworld:
dl $7FF10B : db $01 : db $00 ; 
dl $7FF117 : db $01 : db $00 ; 
dl $7FF060 : db $01 : db $08 ; 
dl $7FF10C : db $01 : db $00 ; 
dl $7EF1BE : db $02 : dw $0003 ; Room $00DF: Cave (...............q)
dl $7EF1DE : db $02 : dw $0003 ; Room $00EF: Cave (Crystal Switch / 5 Chests Room) (...............q)
dl $7FE17F : db $01 : db $CA ; Overworld $FF persistent: UNKNOWN
dl $7FE1BF : db $01 : db $EC ; Overworld $11F persistent: UNKNOWN
dl $7FF136 : db $01 : db $00 ; 
dl $7FE058 : db $01 : db $CA ; Overworld $6C persistent: Dark Link's House
dl $7FE037 : db $01 : db $28 ; Overworld $5B persistent: Pyramid of Power
dl $7FDFCB : db $01 : db $00 ; Overworld $25 persistent: Octorok Area
dl $7FE16E : db $01 : db $28 ; Overworld $F7 persistent: UNKNOWN
dl $7FEFFA : db $01 : db $04 ; 
dl $7FEFFE : db $01 : db $04 ; 
dl $7FEFC7 : db $01 : db $01 ; 
.after

sram_trock_entrance:
dl $7EF287 : db $02 : dw $0020 ; Overworld $07: Unknown (...?....)
dl $7EF2C7 : db $01 : db $20 ; Overworld $47: Unknown (...?....)
dl $7FF028 : db $01 : db $02 ; 
dl $7FF060 : db $01 : db $00 ; 
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FE17F : db $01 : db $00 ; Overworld $FF persistent: UNKNOWN
dl $7FE1BF : db $01 : db $00 ; Overworld $11F persistent: UNKNOWN
dl $7FE058 : db $01 : db $00 ; Overworld $6C persistent: Dark Link's House
dl $7FE037 : db $01 : db $00 ; Overworld $5B persistent: Pyramid of Power
dl $7FE16E : db $01 : db $00 ; Overworld $F7 persistent: UNKNOWN
dl $7FEFFA : db $01 : db $00 ; 
dl $7FEFFE : db $01 : db $00 ; 
dl $7FEFC7 : db $01 : db $00 ; 
.after

sram_trock_lanterns:
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF36F : db $01 : db $00 ; Keys
dl $7FF028 : db $01 : db $00 ; 
dl $7EF1AC : db $02 : dw $8005 ; Room $00D6: Turtle Rock (Entrance Room) (.d............q.)
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7FE10C : db $02 : dw $0028 ; Room $C6 persistent: Turtle Rock
dl $7EF18C : db $02 : dw $000F ; Room $00C6: Turtle Rock (.............qqq)
.after

sram_trock_roller_room:
dl $7EF36D : db $01 : db $58 ; Health (actual)
dl $7EF18E : db $02 : dw $000F ; Room $00C7: Turtle Rock (Torch Puzzle) (.............qqq)
dl $7EF36E : db $01 : db $38 ; Magic Power
.after

sram_trock_lonely_pokey:
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF16E : db $02 : dw $002A ; Room $00B7: Turtle Rock (Map Chest / Key Chest / Roller Room) (...........c.q.q)
dl $7EF36E : db $01 : db $30 ; Magic Power
.after

sram_trock_chomps:
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF372 : db $01 : db $30 ; Hearts filler
dl $7FE0EC : db $02 : dw $0020 ; Room $B6 persistent: Turtle Rock (Chain Chomps Room)
dl $7EF16C : db $02 : dw $0002 ; Room $00B6: Turtle Rock (Chain Chomps Room) (...............q)
dl $7EF18C : db $02 : dw $800F ; Room $00C6: Turtle Rock (.d...........qqq)
.after

sram_trock_pokies_1:
dl $7EF377 : db $01 : db $11 ; Arrows
dl $7EF028 : db $02 : dw $000F ; Room $0014: Turtle Rock (Big Key Room) (.............qqq)
dl $7EF36D : db $01 : db $60 ; Health (actual)
dl $7EF02A : db $02 : dw $000F ; Room $0015: Turtle Rock (.............qqq)
dl $7EF36E : db $01 : db $28 ; Magic Power
dl $7EF372 : db $01 : db $00 ; Hearts filler
dl $7FE10C : db $02 : dw $0000 ; Room $C6 persistent: Turtle Rock
dl $7EF16C : db $02 : dw $B41A ; Room $00B6: Turtle Rock (Chain Chomps Room) (.d.db.K.....qq.q)
.after

sram_trock_pokies_2:
dl $7EF028 : db $02 : dw $401F ; Room $0014: Turtle Rock (Big Key Room) (..d.........qqqq)
dl $7EF360 : db $02 : dw $0079 ; Rupees (goal)
dl $7EF026 : db $02 : dw $8405 ; Room $0013: Turtle Rock (Hokku-Bokku Key Room 2) (.d....K.......q.)
dl $7EF362 : db $02 : dw $0079 ; Rupees (actual)
dl $7EF366 : db $02 : dw $77B8 ; BigKey1
dl $7EF36E : db $01 : db $78 ; Magic Power
dl $7FDFA6 : db $02 : dw $0040 ; Room $13 persistent: Turtle Rock (Hokku-Bokku Key Room 2)
.after

sram_trock_firebar_key:
dl $7FDFC8 : db $02 : dw $0028 ; Room $24 persistent: Turtle Rock (Double Hokku-Bokku / Big chest Room)
dl $7FE0EC : db $02 : dw $0000 ; Room $B6 persistent: Turtle Rock (Chain Chomps Room)
dl $7EF048 : db $02 : dw $800C ; Room $0024: Turtle Rock (Double Hokku-Bokku / Big chest Room) (.d...........qq.)
.after

sram_trock_lazer_skip:
dl $7EF008 : db $02 : dw $C01A ; Room $0004: Turtle Rock (Crysta-roller Room) (.dd.........qq.q)
dl $7EF028 : db $02 : dw $C01F ; Room $0014: Turtle Rock (Big Key Room) (.dd.........qqqq)
dl $7EF36D : db $01 : db $58 ; Health (actual)
dl $7EF16A : db $02 : dw $000F ; Room $00B5: Turtle Rock (Dark Maze) (.............qqq)
dl $7EF18A : db $02 : dw $000A ; Room $00C5: Turtle Rock (Laser Bridge) (.............q.q)
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7FDFA6 : db $02 : dw $0000 ; Room $13 persistent: Turtle Rock (Hokku-Bokku Key Room 2)
dl $7FE10A : db $02 : dw $0040 ; Room $C5 persistent: Turtle Rock (Laser Bridge)
.after

sram_trock_switch_room:
dl $7EF1AA : db $02 : dw $008A ; Room $00D5: Turtle Rock (Laser Key Room) (.........c...q.q)
dl $7FDFC8 : db $02 : dw $0000 ; Room $24 persistent: Turtle Rock (Double Hokku-Bokku / Big chest Room)
dl $7FE12A : db $02 : dw $0010 ; Room $D5 persistent: Turtle Rock (Laser Key Room)
.after

sram_trock_trinexx:
dl $7EF18A : db $02 : dw $800A ; Room $00C5: Turtle Rock (Laser Bridge) (.d...........q.q)
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7EF168 : db $02 : dw $000F ; Room $00B4: Turtle Rock (Pre-Trinexx Room) (.............qqq)
dl $7EF188 : db $02 : dw $800F ; Room $00C4: Turtle Rock (Final Crystal Switch Puzzle Room) (.d...........qqq)
.after

sram_gtower_outside_trock:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7FF028 : db $01 : db $02 ; 
dl $7EF36C : db $01 : db $68 ; Health (goal)
dl $7EF3FB : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $68 ; Health (actual)
dl $7EF3C7 : db $01 : db $08 ; Map Phase
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF37A : db $01 : db $7F ; Crystals
dl $7EF168 : db $02 : dw $800F ; Room $00B4: Turtle Rock (Pre-Trinexx Room) (.d...........qqq)
dl $7EF148 : db $02 : dw $0802 ; Room $00A4: Turtle Rock (Trinexx[Boss]) (.....k.........q)
dl $7FE10A : db $01 : db $00 ; Overworld $C5 persistent: UNKNOWN
dl $7FE12A : db $01 : db $00 ; Overworld $D5 persistent: UNKNOWN
.after

sram_gtower_entrance:
dl $7EF2C3 : db $01 : db $20 ; Overworld $43: Unknown (...?....)
dl $7FF028 : db $01 : db $00 ; 
dl $7FEFD9 : db $01 : db $01 ; 
.after

sram_gtower_spike_skip:
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF018 : db $02 : dw $000F ; Room $000C: Ganon's Tower (Entrance Room) (.............qqq)
dl $7EF116 : db $02 : dw $0004 ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (..............q.)
dl $7FEFD9 : db $01 : db $00 ; 
dl $7EF118 : db $02 : dw $0008 ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
.after

sram_gtower_firebar_room:
dl $7EF116 : db $02 : dw $040E ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K......qqq)
dl $7EF136 : db $02 : dw $840C ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qq.)
.after

sram_gtower_bombable_floor:
dl $7EF377 : db $01 : db $16 ; Arrows
dl $7EF36D : db $01 : db $60 ; Health (actual)
dl $7EF0FA : db $02 : dw $201E ; Room $007D: Ganon's Tower (Winder / Warp Maze Room) (...d........qqqq)
dl $7EF136 : db $02 : dw $840F ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qqq)
dl $7FE0B8 : db $02 : dw $0002 ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
dl $7EF138 : db $02 : dw $000F ; Room $009C: Ganon's Tower (Invisible Floor Maze Room) (.............qqq)
.after

sram_gtower_ice_armos:
dl $7EF038 : db $02 : dw $0001 ; Room $001C: Ganon's Tower (Ice Armos) (................)
dl $7EF118 : db $02 : dw $0009 ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
.after

sram_gtower_floor_2:
dl $7EF377 : db $01 : db $0E ; Arrows
dl $7EF038 : db $02 : dw $0035 ; Room $001C: Ganon's Tower (Ice Armos) (...........cq.q.)
dl $7EF389 : db $01 : db $01 ; Key for dungeon $0D
dl $7EF366 : db $02 : dw $77BC ; BigKey1
dl $7FE0B8 : db $01 : db $00 ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
.after

sram_gtower_mimics1:
dl $7EF377 : db $01 : db $0D ; Arrows
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF0D6 : db $02 : dw $000C ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qq.)
.after

sram_gtower_mimics2:
dl $7EF377 : db $01 : db $0E ; Arrows
dl $7EF0D6 : db $02 : dw $000E ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qqq)
dl $7FE056 : db $02 : dw $0240 ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
.after

sram_gtower_spike_room:
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF0D6 : db $02 : dw $800F ; Room $006B: Ganon's Tower (Mimics Rooms) (.d...........qqq)
dl $7FE056 : db $02 : dw $2640 ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
.after

sram_gtower_gauntlet:
dl $7EF0B6 : db $02 : dw $8005 ; Room $005B: Ganon's Tower (Spike Pit Room) (.d............q.)
dl $7EF0B8 : db $02 : dw $000C ; Room $005C: Ganon's Tower (Ganon-Ball Z) (.............qq.)
.after

sram_gtower_lanmola2:
dl $7EF377 : db $01 : db $08 ; Arrows
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF0BA : db $02 : dw $000E ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qqq)
dl $7EF0DA : db $02 : dw $000A ; Room $006D: Ganon's Tower (Gauntlet 4/5) (.............q.q)
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7EF0D8 : db $02 : dw $0001 ; Room $006C: Ganon's Tower (Lanmolas Room) (................)
dl $7FE03A : db $02 : dw $0EFD ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
dl $7FE056 : db $02 : dw $0000 ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
dl $7FE05A : db $02 : dw $00C9 ; Room $6D persistent: Ganon's Tower (Gauntlet 4/5)
.after

sram_gtower_wizz2:
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF14A : db $02 : dw $000B ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............q.q)
dl $7EF36E : db $01 : db $18 ; Magic Power
dl $7EF0D8 : db $02 : dw $000B ; Room $006C: Ganon's Tower (Lanmolas Room) (.............q.q)
dl $7FE0CA : db $02 : dw $008C ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
.after

sram_gtower_torches2:
dl $7EF373 : db $01 : db $25 ; Magic filler
dl $7EF12A : db $02 : dw $0005 ; Room $0095: Ganon's Tower (Final Collapsing Bridge Room) (..............q.)
dl $7EF14A : db $02 : dw $000F ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............qqq)
dl $7EF36E : db $01 : db $5F ; Magic Power
dl $7EF12C : db $02 : dw $000B ; Room $0096: Ganon's Tower (Torches 1 Room) (.............q.q)
dl $7FE03A : db $02 : dw $0000 ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
dl $7FE05A : db $02 : dw $0000 ; Room $6D persistent: Ganon's Tower (Gauntlet 4/5)
dl $7FE0CA : db $02 : dw $00EF ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
.after

sram_gtower_helma_key:
dl $7EF373 : db $01 : db $00 ; Magic filler
dl $7EF07A : db $02 : dw $0001 ; Room $003D: Ganon's Tower (Torch Room 2) (................)
dl $7EF36E : db $01 : db $40 ; Magic Power
.after

sram_gtower_bombable_wall:
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF07A : db $02 : dw $0005 ; Room $003D: Ganon's Tower (Torch Room 2) (..............q.)
dl $7FDFFA : db $02 : dw $000C ; Room $3D persistent: Ganon's Tower (Torch Room 2)
.after

sram_gtower_moldorm_2:
dl $7EF343 : db $01 : db $00 ; Bombs
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7EF07A : db $02 : dw $540F ; Room $003D: Ganon's Tower (Torch Room 2) (..d.b.K......qqq)
.after

sram_gtower_agahnim_2:
dl $7EF03A : db $02 : dw $000C ; Room $001D: Ganon's Tower (Final Hallway) (.............qq.)
dl $7EF07A : db $02 : dw $740F ; Room $003D: Ganon's Tower (Torch Room 2) (..ddb.K......qqq)
dl $7EF09A : db $02 : dw $800F ; Room $004D: Ganon's Tower (Moldorm Room) (.d...........qqq)
dl $7EF098 : db $02 : dw $0005 ; Room $004C: Ganon's Tower (Mini-Helmasaur Conveyor Room) (..............q.)
dl $7FE0CA : db $02 : dw $0000 ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
.after

sram_ganon_pyramid:
dl $7EF2DB : db $01 : db $20 ; Overworld $5B: Unknown (...?....)
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3FD : db $02 : dw $0000 ; Deaths
dl $7EF389 : db $01 : db $00 ; Key for dungeon $0D
dl $7EF01A : db $02 : dw $0802 ; Room $000D: Ganon's Tower (Agahnim2[Boss]) (.....k.........q)
dl $7EF03A : db $02 : dw $800C ; Room $001D: Ganon's Tower (Final Hallway) (.d...........qq.)
dl $7FDFFA : db $01 : db $00 ; Overworld $3D persistent: UNKNOWN
.after