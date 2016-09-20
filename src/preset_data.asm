; Preset locations

preset_escape_links_bed:
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
dw sram_escape_links_bed_after

preset_escape_courtyard:
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
dw sram_escape_courtyard_after

preset_escape_entrance:
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
dw sram_escape_entrance_after

preset_escape_1st_keyguard:
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
dw sram_escape_1st_keyguard_after

preset_escape_big_room:
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
dw sram_escape_big_room_after

preset_escape_2nd_keyguard:
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
dw sram_escape_2nd_keyguard_after

preset_escape_balln_chains:
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
dw sram_escape_balln_chains_after

preset_escape_keyguard_revisited:
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
dw sram_escape_keyguard_revisited_after

preset_escape_secret_passage:
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
dw sram_escape_secret_passage_after

preset_escape_snake_avoidance_room:
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
dw sram_escape_snake_avoidance_room_after

preset_escape_keyrat:
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
dw sram_escape_keyrat_after

preset_escape_last_two_screens:
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
dw sram_escape_last_two_screens_after

preset_eastern_before_cutscene:
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
dw sram_eastern_before_cutscene_after

preset_eastern_after_cutscene:
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
dw sram_eastern_after_cutscene_after

preset_eastern_octoroc:
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
dw sram_eastern_octoroc_after

preset_eastern_palace_overworld:
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
dw sram_eastern_palace_overworld_after

preset_eastern_entrance:
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
dw sram_eastern_entrance_after

preset_stalfos_room:
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
dw sram_stalfos_room_after

preset_eastern_dark_key_room:
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
dw sram_eastern_dark_key_room_after

preset_eastern_bk_dmg_boost:
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
dw sram_eastern_bk_dmg_boost_after

preset_eastern_big_chest_room:
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
dw sram_eastern_big_chest_room_after

preset_eastern_gwg:
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
dw sram_eastern_gwg_after

preset_eastern_pot_room:
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
dw sram_eastern_pot_room_after

preset_eastern_zgr:
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
dw sram_eastern_zgr_after

preset_eastern_armos:
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
dw sram_eastern_armos_after

preset_desert_outside_ep:
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
dw sram_desert_outside_ep_after

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

preset_desert_entrance:
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
dw sram_desert_entrance_after

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

preset_desert_popo_genocide:
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
dw sram_desert_popo_genocide_after

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

preset_hera_outside_desert:
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
dw sram_hera_outside_desert_after

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

preset_atower_outside_hera:
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
dw sram_atower_outside_hera_after

preset_atower_first_rupee_tree:
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
dw sram_atower_first_rupee_tree_after

preset_atower_lost_woods:
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
dw sram_atower_lost_woods_after

preset_atower_after_lost_woods:
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
dw sram_atower_after_lost_woods_after

preset_atower_tower_entrance:
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
dw sram_atower_tower_entrance_after

preset_atower_dark_room_despair:
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
dw sram_atower_dark_room_despair_after

preset_atower_dark_room_melancholy:
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
dw sram_atower_dark_room_melancholy_after

preset_atower_red_spears:
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
dw sram_atower_red_spears_after

preset_atower_cop:
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
dw sram_atower_cop_after

preset_atower_agahnim:
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
dw sram_atower_agahnim_after

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


; Preset SRAM changes

sram_first_state:
print "sram_first_state: ", pc
sram_escape_links_bed:
dl $7EF000 : db $02 : dw $0000 ; Room $0000
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF004 : db $02 : dw $0000 ; Room $0002
dl $7EF002 : db $02 : dw $0000 ; Room $0001
dl $7EF006 : db $02 : dw $0000 ; Room $0003
dl $7EF00A : db $02 : dw $0000 ; Room $0005
dl $7EF00E : db $02 : dw $0000 ; Room $0007
dl $7EF012 : db $02 : dw $0000 ; Room $0009
dl $7EF016 : db $02 : dw $0000 ; Room $000B
dl $7EF01A : db $02 : dw $0000 ; Room $000D
dl $7EF01E : db $02 : dw $0000 ; Room $000F
dl $7EF022 : db $02 : dw $0000 ; Room $0011
dl $7EF026 : db $02 : dw $0000 ; Room $0013
dl $7EF02A : db $02 : dw $0000 ; Room $0015
dl $7EF02E : db $02 : dw $0000 ; Room $0017
dl $7EF032 : db $02 : dw $0000 ; Room $0019
dl $7EF036 : db $02 : dw $0000 ; Room $001B
dl $7EF040 : db $02 : dw $0000 ; Room $0020
dl $7EF044 : db $02 : dw $0000 ; Room $0022
dl $7EF048 : db $02 : dw $0000 ; Room $0024
dl $7EF04C : db $02 : dw $0000 ; Room $0026
dl $7EF050 : db $02 : dw $0000 ; Room $0028
dl $7EF054 : db $02 : dw $0000 ; Room $002A
dl $7EF052 : db $02 : dw $0000 ; Room $0029
dl $7EF05C : db $02 : dw $0000 ; Room $002E
dl $7EF060 : db $02 : dw $0000 ; Room $0030
dl $7EF064 : db $02 : dw $0000 ; Room $0032
dl $7EF068 : db $02 : dw $0000 ; Room $0034
dl $7EF06C : db $02 : dw $0000 ; Room $0036
dl $7EF070 : db $02 : dw $0000 ; Room $0038
dl $7EF074 : db $02 : dw $0000 ; Room $003A
dl $7EF078 : db $02 : dw $0000 ; Room $003C
dl $7EF07C : db $02 : dw $0000 ; Room $003E
dl $7EF080 : db $02 : dw $0000 ; Room $0040
dl $7EF084 : db $02 : dw $0000 ; Room $0042
dl $7EF088 : db $02 : dw $0000 ; Room $0044
dl $7EF08C : db $02 : dw $0000 ; Room $0046
dl $7EF090 : db $02 : dw $0000 ; Room $0048
dl $7EF094 : db $02 : dw $0000 ; Room $004A
dl $7EF098 : db $02 : dw $0000 ; Room $004C
dl $7EF09C : db $02 : dw $0000 ; Room $004E
dl $7EF0A0 : db $02 : dw $0000 ; Room $0050
dl $7EF0A4 : db $02 : dw $0000 ; Room $0052
dl $7EF0A2 : db $02 : dw $0000 ; Room $0051
dl $7EF0A6 : db $02 : dw $0000 ; Room $0053
dl $7EF0AA : db $02 : dw $0000 ; Room $0055
dl $7EF0AE : db $02 : dw $0000 ; Room $0057
dl $7EF0B2 : db $02 : dw $0000 ; Room $0059
dl $7EF0B6 : db $02 : dw $0000 ; Room $005B
dl $7EF0BA : db $02 : dw $0000 ; Room $005D
dl $7EF0BE : db $02 : dw $0000 ; Room $005F
dl $7EF0C2 : db $02 : dw $0000 ; Room $0061
dl $7EF0C6 : db $02 : dw $0000 ; Room $0063
dl $7EF0CA : db $02 : dw $0000 ; Room $0065
dl $7EF0CE : db $02 : dw $0000 ; Room $0067
dl $7EF0D2 : db $02 : dw $0000 ; Room $0069
dl $7EF0D6 : db $02 : dw $0000 ; Room $006B
dl $7EF0DA : db $02 : dw $0000 ; Room $006D
dl $7EF0DE : db $02 : dw $0000 ; Room $006F
dl $7EF0E2 : db $02 : dw $0000 ; Room $0071
dl $7EF0E6 : db $02 : dw $0000 ; Room $0073
dl $7EF0EA : db $02 : dw $0000 ; Room $0075
dl $7EF0EE : db $02 : dw $0000 ; Room $0077
dl $7EF0F2 : db $02 : dw $0000 ; Room $0079
dl $7EF0F6 : db $02 : dw $0000 ; Room $007B
dl $7EF100 : db $02 : dw $0000 ; Room $0080
dl $7EF104 : db $02 : dw $0000 ; Room $0082
dl $7EF102 : db $02 : dw $0000 ; Room $0081
dl $7EF106 : db $02 : dw $0000 ; Room $0083
dl $7EF10A : db $02 : dw $0000 ; Room $0085
dl $7EF10E : db $02 : dw $0000 ; Room $0087
dl $7EF112 : db $02 : dw $0000 ; Room $0089
dl $7EF116 : db $02 : dw $0000 ; Room $008B
dl $7EF11A : db $02 : dw $0000 ; Room $008D
dl $7EF11E : db $02 : dw $0000 ; Room $008F
dl $7EF122 : db $02 : dw $0000 ; Room $0091
dl $7EF126 : db $02 : dw $0000 ; Room $0093
dl $7EF12A : db $02 : dw $0000 ; Room $0095
dl $7EF12E : db $02 : dw $0000 ; Room $0097
dl $7EF132 : db $02 : dw $0000 ; Room $0099
dl $7EF136 : db $02 : dw $0000 ; Room $009B
dl $7EF13A : db $02 : dw $0000 ; Room $009D
dl $7EF144 : db $02 : dw $0000 ; Room $00A2
dl $7EF142 : db $02 : dw $0000 ; Room $00A1
dl $7EF146 : db $02 : dw $0000 ; Room $00A3
dl $7EF14A : db $02 : dw $0000 ; Room $00A5
dl $7EF14E : db $02 : dw $0000 ; Room $00A7
dl $7EF152 : db $02 : dw $0000 ; Room $00A9
dl $7EF15C : db $02 : dw $0000 ; Room $00AE
dl $7EF160 : db $02 : dw $0000 ; Room $00B0
dl $7EF164 : db $02 : dw $0000 ; Room $00B2
dl $7EF168 : db $02 : dw $0000 ; Room $00B4
dl $7EF16C : db $02 : dw $0000 ; Room $00B6
dl $7EF170 : db $02 : dw $0000 ; Room $00B8
dl $7EF174 : db $02 : dw $0000 ; Room $00BA
dl $7EF178 : db $02 : dw $0000 ; Room $00BC
dl $7EF17C : db $02 : dw $0000 ; Room $00BE
dl $7EF180 : db $02 : dw $0000 ; Room $00C0
dl $7EF184 : db $02 : dw $0000 ; Room $00C2
dl $7EF188 : db $02 : dw $0000 ; Room $00C4
dl $7EF18C : db $02 : dw $0000 ; Room $00C6
dl $7EF190 : db $02 : dw $0000 ; Room $00C8
dl $7EF194 : db $02 : dw $0000 ; Room $00CA
dl $7EF198 : db $02 : dw $0000 ; Room $00CC
dl $7EF19C : db $02 : dw $0000 ; Room $00CE
dl $7EF1A0 : db $02 : dw $0000 ; Room $00D0
dl $7EF1A4 : db $02 : dw $0000 ; Room $00D2
dl $7EF1A2 : db $02 : dw $0000 ; Room $00D1
dl $7EF1A6 : db $02 : dw $0000 ; Room $00D3
dl $7EF1AA : db $02 : dw $0000 ; Room $00D5
dl $7EF1AE : db $02 : dw $0000 ; Room $00D7
dl $7EF1B2 : db $02 : dw $0000 ; Room $00D9
dl $7EF1B6 : db $02 : dw $0000 ; Room $00DB
dl $7EF1BA : db $02 : dw $0000 ; Room $00DD
dl $7EF1BE : db $02 : dw $0000 ; Room $00DF
dl $7EF1C2 : db $02 : dw $0000 ; Room $00E1
dl $7EF1C6 : db $02 : dw $0000 ; Room $00E3
dl $7EF1CA : db $02 : dw $0000 ; Room $00E5
dl $7EF1CE : db $02 : dw $0000 ; Room $00E7
dl $7EF1D2 : db $02 : dw $0000 ; Room $00E9
dl $7EF1D6 : db $02 : dw $0000 ; Room $00EB
dl $7EF1DA : db $02 : dw $0000 ; Room $00ED
dl $7EF1DE : db $02 : dw $0000 ; Room $00EF
dl $7EF1E2 : db $02 : dw $0000 ; Room $00F1
dl $7EF1E6 : db $02 : dw $0000 ; Room $00F3
dl $7EF1EA : db $02 : dw $0000 ; Room $00F5
dl $7EF1EE : db $02 : dw $0000 ; Room $00F7
dl $7EF1F2 : db $02 : dw $0000 ; Room $00F9
dl $7EF1F6 : db $02 : dw $0000 ; Room $00FB
dl $7EF200 : db $02 : dw $0000 ; Room $0100
dl $7EF204 : db $02 : dw $0000 ; Room $0102
dl $7EF202 : db $02 : dw $0000 ; Room $0101
dl $7EF206 : db $02 : dw $0000 ; Room $0103
dl $7EF20A : db $02 : dw $0000 ; Room $0105
dl $7EF20E : db $02 : dw $F000 ; Room $0107
dl $7EF212 : db $02 : dw $0000 ; Room $0109
dl $7EF216 : db $02 : dw $0000 ; Room $010B
dl $7EF21A : db $02 : dw $0000 ; Room $010D
dl $7EF21E : db $02 : dw $0000 ; Room $010F
dl $7EF222 : db $02 : dw $0000 ; Room $0111
dl $7EF226 : db $02 : dw $0000 ; Room $0113
dl $7EF22A : db $02 : dw $0000 ; Room $0115
dl $7EF22E : db $02 : dw $0000 ; Room $0117
dl $7EF232 : db $02 : dw $0000 ; Room $0119
dl $7EF236 : db $02 : dw $0000 ; Room $011B
dl $7EF23A : db $02 : dw $0000 ; Room $011D
dl $7EF244 : db $02 : dw $0000 ; Room $0122
dl $7EF242 : db $02 : dw $0000 ; Room $0121
dl $7EF24C : db $02 : dw $0000 ; Room $0126
dl $7EF250 : db $02 : dw $0000 ; 
dl $7EF254 : db $02 : dw $0000 ; 
dl $7EF258 : db $02 : dw $0000 ; 
dl $7EF25C : db $02 : dw $0000 ; 
dl $7EF260 : db $02 : dw $0000 ; 
dl $7EF264 : db $02 : dw $0000 ; 
dl $7EF268 : db $02 : dw $0000 ; 
dl $7EF26C : db $02 : dw $0000 ; 
dl $7EF270 : db $02 : dw $0000 ; 
dl $7EF274 : db $02 : dw $0000 ; 
dl $7EF278 : db $02 : dw $0000 ; 
dl $7EF27C : db $02 : dw $0000 ; 
dl $7EF280 : db $02 : dw $0000 ; Overworld $00
dl $7EF284 : db $02 : dw $0000 ; Overworld $04
dl $7EF288 : db $02 : dw $0000 ; Overworld $08
dl $7EF28C : db $02 : dw $0000 ; Overworld $0C
dl $7EF290 : db $02 : dw $0000 ; Overworld $10
dl $7EF294 : db $02 : dw $0000 ; Overworld $14
dl $7EF298 : db $02 : dw $0000 ; Overworld $18
dl $7EF29C : db $02 : dw $0000 ; Overworld $1C
dl $7EF2A0 : db $02 : dw $0000 ; Overworld $20
dl $7EF29E : db $02 : dw $0000 ; Overworld $1E
dl $7EF2A2 : db $02 : dw $0000 ; Overworld $22
dl $7EF2A6 : db $02 : dw $0000 ; Overworld $26
dl $7EF2AA : db $02 : dw $0000 ; Overworld $2A
dl $7EF2AE : db $02 : dw $0000 ; Overworld $2E
dl $7EF2B2 : db $02 : dw $0000 ; Overworld $32
dl $7EF2B6 : db $02 : dw $0000 ; Overworld $36
dl $7EF2BA : db $02 : dw $0000 ; Overworld $3A
dl $7EF2BE : db $02 : dw $0000 ; Overworld $3E
dl $7EF2C2 : db $02 : dw $0000 ; Overworld $42
dl $7EF2C6 : db $02 : dw $0000 ; Overworld $46
dl $7EF2CA : db $02 : dw $0000 ; Overworld $4A
dl $7EF2CE : db $02 : dw $0000 ; Overworld $4E
dl $7EF2D2 : db $02 : dw $0000 ; Overworld $52
dl $7EF2D6 : db $02 : dw $0000 ; Overworld $56
dl $7EF2DA : db $02 : dw $0000 ; Overworld $5A
dl $7EF2DE : db $02 : dw $0000 ; Overworld $5E
dl $7EF2E2 : db $02 : dw $0000 ; Overworld $62
dl $7EF2E6 : db $02 : dw $0000 ; Overworld $66
dl $7EF2EA : db $02 : dw $0000 ; Overworld $6A
dl $7EF2EE : db $02 : dw $0000 ; Overworld $6E
dl $7EF2F2 : db $02 : dw $0000 ; Overworld $72
dl $7EF2F6 : db $02 : dw $0000 ; Overworld $76
dl $7EF300 : db $02 : dw $0000 ; Overworld $80
dl $7EF304 : db $02 : dw $0000 ; 
dl $7EF302 : db $02 : dw $0000 ; 
dl $7EF306 : db $02 : dw $0000 ; 
dl $7EF30A : db $02 : dw $0000 ; 
dl $7EF30E : db $02 : dw $0000 ; 
dl $7EF312 : db $02 : dw $0000 ; 
dl $7EF316 : db $02 : dw $0000 ; 
dl $7EF31A : db $02 : dw $0000 ; 
dl $7EF31E : db $02 : dw $0000 ; 
dl $7EF322 : db $02 : dw $0000 ; 
dl $7EF326 : db $02 : dw $0000 ; 
dl $7EF32A : db $02 : dw $0000 ; 
dl $7EF32E : db $02 : dw $0000 ; 
dl $7EF332 : db $02 : dw $0000 ; 
dl $7EF336 : db $02 : dw $0000 ; 
dl $7EF340 : db $02 : dw $0000 ; Bow
dl $7EF344 : db $02 : dw $0000 ; Mushroom
dl $7EF348 : db $02 : dw $0000 ; Ether Medallion
dl $7EF34C : db $02 : dw $0000 ; Flute
dl $7EF350 : db $02 : dw $0000 ; Cane of Somaria
dl $7EF354 : db $02 : dw $0000 ; Gloves
dl $7EF358 : db $02 : dw $0000 ; 
dl $7EF35C : db $02 : dw $0000 ; Bottle
dl $7EF360 : db $02 : dw $0000 ; Rupees (goal)
dl $7EF364 : db $02 : dw $0000 ; Compass1
dl $7EF368 : db $02 : dw $0000 ; Dungeon map1
dl $7EF36C : db $02 : dw $1818 ; Health (goal)
dl $7EF370 : db $02 : dw $0000 ; Bomb Upgrades
dl $7EF374 : db $02 : dw $0000 ; Pendants
dl $7EF378 : db $02 : dw $F800 ; ????
dl $7EF37C : db $02 : dw $0000 ; Key for dungeon $00
dl $7EF380 : db $02 : dw $0000 ; Key for dungeon $04
dl $7EF384 : db $02 : dw $0000 ; Key for dungeon $08
dl $7EF388 : db $02 : dw $0000 ; Key for dungeon $0C
dl $7EF38C : db $02 : dw $0000 ; 
dl $7EF390 : db $02 : dw $0000 ; 
dl $7EF394 : db $02 : dw $0000 ; 
dl $7EF398 : db $02 : dw $0000 ; 
dl $7EF39C : db $02 : dw $0000 ; 
dl $7EF3A0 : db $02 : dw $0000 ; 
dl $7EF39E : db $02 : dw $0000 ; 
dl $7EF3A2 : db $02 : dw $0000 ; 
dl $7EF3A6 : db $02 : dw $0000 ; 
dl $7EF3AA : db $02 : dw $0000 ; 
dl $7EF3AE : db $02 : dw $0000 ; 
dl $7EF3B2 : db $02 : dw $0000 ; 
dl $7EF3B6 : db $02 : dw $0000 ; 
dl $7EF3BA : db $02 : dw $0000 ; 
dl $7EF3BE : db $02 : dw $0000 ; 
dl $7EF3C2 : db $02 : dw $0000 ; 
dl $7EF3C6 : db $02 : dw $0000 ; Game Phase 2
dl $7EF3CA : db $02 : dw $0000 ; LW/DW
dl $7EF3CE : db $02 : dw $0000 ; 
dl $7EF3D2 : db $02 : dw $0000 ; 
dl $7EF3D6 : db $02 : dw $0000 ; 
dl $7EF3DA : db $02 : dw $8C01 ; Player name
dl $7EF3DE : db $02 : dw $8C01 ; Player name
dl $7EF3E2 : db $02 : dw $0055 ; Player name
dl $7EF3E6 : db $02 : dw $0000 ; 
dl $7EF3EA : db $02 : dw $0000 ; Deaths
dl $7EF3EE : db $02 : dw $0000 ; Deaths
dl $7EF3F2 : db $02 : dw $0000 ; Deaths
dl $7EF3F6 : db $02 : dw $0000 ; Deaths
dl $7EF400 : db $02 : dw $FF00 ; Deaths
dl $7EF404 : db $02 : dw $0000 ; 
dl $7EF402 : db $02 : dw $00FF ; Deaths
dl $7EF406 : db $02 : dw $0000 ; 
dl $7EF40A : db $02 : dw $0000 ; 
dl $7EF40E : db $02 : dw $0000 ; 
dl $7EF412 : db $02 : dw $0000 ; 
dl $7EF416 : db $02 : dw $0000 ; 
dl $7EF41A : db $02 : dw $0000 ; 
dl $7EF41E : db $02 : dw $0000 ; 
dl $7EF422 : db $02 : dw $0000 ; 
dl $7EF426 : db $02 : dw $0000 ; 
dl $7EF42A : db $02 : dw $0000 ; 
dl $7EF42E : db $02 : dw $0000 ; 
dl $7EF432 : db $02 : dw $0000 ; 
dl $7EF436 : db $02 : dw $0000 ; 
dl $7EF440 : db $02 : dw $0000 ; 
dl $7EF444 : db $02 : dw $0000 ; 
dl $7EF448 : db $02 : dw $0000 ; 
dl $7EF44C : db $02 : dw $0000 ; 
dl $7EF450 : db $02 : dw $0000 ; 
dl $7EF454 : db $02 : dw $0000 ; 
dl $7EF458 : db $02 : dw $0000 ; 
dl $7EF45C : db $02 : dw $0000 ; 
dl $7EF460 : db $02 : dw $0000 ; 
dl $7EF464 : db $02 : dw $0000 ; 
dl $7EF468 : db $02 : dw $0000 ; 
dl $7EF46C : db $02 : dw $0000 ; 
dl $7EF470 : db $02 : dw $0000 ; 
dl $7EF474 : db $02 : dw $0000 ; 
dl $7EF478 : db $02 : dw $0000 ; 
dl $7EF47C : db $02 : dw $0000 ; 
dl $7EF480 : db $02 : dw $0000 ; 
dl $7EF484 : db $02 : dw $0000 ; 
dl $7EF488 : db $02 : dw $0000 ; 
dl $7EF48C : db $02 : dw $0000 ; 
dl $7EF490 : db $02 : dw $0000 ; 
dl $7EF494 : db $02 : dw $0000 ; 
dl $7EF498 : db $02 : dw $0000 ; 
dl $7EF49C : db $02 : dw $0000 ; 
dl $7EF4A0 : db $02 : dw $0000 ; 
dl $7EF49E : db $02 : dw $0000 ; 
dl $7EF4A2 : db $02 : dw $0000 ; 
dl $7EF4A6 : db $02 : dw $0000 ; 
dl $7EF4AA : db $02 : dw $0000 ; 
dl $7EF4AE : db $02 : dw $0000 ; 
dl $7EF4B2 : db $02 : dw $0000 ; 
dl $7EF4B6 : db $02 : dw $0000 ; 
dl $7EF4BA : db $02 : dw $0000 ; 
dl $7EF4BE : db $02 : dw $0000 ; 
dl $7EF4C2 : db $02 : dw $0000 ; 
dl $7EF4C6 : db $02 : dw $0000 ; 
dl $7EF4CA : db $02 : dw $0000 ; 
dl $7EF4CE : db $02 : dw $0000 ; 
dl $7EF4D2 : db $02 : dw $0000 ; 
dl $7EF4D6 : db $02 : dw $0000 ; 
dl $7EF4DA : db $02 : dw $0000 ; 
dl $7EF4DE : db $02 : dw $0000 ; 
dl $7EF4E2 : db $02 : dw $0000 ; 
dl $7EF4E6 : db $02 : dw $0000 ; 
dl $7EF4EA : db $02 : dw $0000 ; 
dl $7EF4EE : db $02 : dw $0000 ; 
dl $7EF4F2 : db $02 : dw $0000 ; 
dl $7EF4F6 : db $02 : dw $0000 ; 
dl $7EF4FA : db $02 : dw $0000 ; 
dl $7EF4FE : db $02 : dw $D0EA ; Inverse checksum
dl $7EF3FE : db $02 : dw $0000 ; Deaths
dl $7EF2FE : db $02 : dw $0000 ; Overworld $7E
dl $7EF1FE : db $02 : dw $0000 ; Room $00FF
dl $7EF0FE : db $02 : dw $0000 ; Room $007F
dl $7EF4FC : db $02 : dw $0000 ; 
dl $7EF3FC : db $02 : dw $0000 ; Deaths
dl $7EF2FC : db $02 : dw $0000 ; Overworld $7C
dl $7EF1FC : db $02 : dw $0000 ; Room $00FE
dl $7EF0FC : db $02 : dw $0000 ; Room $007E
dl $7EF3FA : db $02 : dw $0000 ; Deaths
dl $7EF2FA : db $02 : dw $0000 ; Overworld $7A
dl $7EF1FA : db $02 : dw $0000 ; Room $00FD
dl $7EF0FA : db $02 : dw $0000 ; Room $007D
dl $7EF4F8 : db $02 : dw $0000 ; 
dl $7EF3F8 : db $02 : dw $0000 ; Deaths
dl $7EF2F8 : db $02 : dw $0000 ; Overworld $78
dl $7EF1F8 : db $02 : dw $0000 ; Room $00FC
dl $7EF0F8 : db $02 : dw $0000 ; Room $007C
dl $7EF4F4 : db $02 : dw $0000 ; 
dl $7EF3F4 : db $02 : dw $0000 ; Deaths
dl $7EF2F4 : db $02 : dw $0000 ; Overworld $74
dl $7EF1F4 : db $02 : dw $0000 ; Room $00FA
dl $7EF0F4 : db $02 : dw $0000 ; Room $007A
dl $7EF4F0 : db $02 : dw $0000 ; 
dl $7EF3F0 : db $02 : dw $0000 ; Deaths
dl $7EF2F0 : db $02 : dw $0000 ; Overworld $70
dl $7EF1F0 : db $02 : dw $0000 ; Room $00F8
dl $7EF0F0 : db $02 : dw $0000 ; Room $0078
dl $7EF4EC : db $02 : dw $0000 ; 
dl $7EF3EC : db $02 : dw $0000 ; Deaths
dl $7EF2EC : db $02 : dw $0000 ; Overworld $6C
dl $7EF1EC : db $02 : dw $0000 ; Room $00F6
dl $7EF0EC : db $02 : dw $0000 ; Room $0076
dl $7EF4E8 : db $02 : dw $0000 ; 
dl $7EF3E8 : db $02 : dw $0000 ; Deaths
dl $7EF2E8 : db $02 : dw $0000 ; Overworld $68
dl $7EF1E8 : db $02 : dw $0000 ; Room $00F4
dl $7EF0E8 : db $02 : dw $0000 ; Room $0074
dl $7EF4E4 : db $02 : dw $0000 ; 
dl $7EF3E4 : db $02 : dw $0000 ; Player name
dl $7EF2E4 : db $02 : dw $0000 ; Overworld $64
dl $7EF1E4 : db $02 : dw $0000 ; Room $00F2
dl $7EF0E4 : db $02 : dw $0000 ; Room $0072
dl $7EF4E0 : db $02 : dw $0000 ; 
dl $7EF3E0 : db $02 : dw $AA01 ; Player name
dl $7EF2E0 : db $02 : dw $0000 ; Overworld $60
dl $7EF1E0 : db $02 : dw $0000 ; Room $00F0
dl $7EF0E0 : db $02 : dw $0000 ; Room $0070
dl $7EF4DC : db $02 : dw $0000 ; 
dl $7EF3DC : db $02 : dw $8C01 ; Player name
dl $7EF2DC : db $02 : dw $0000 ; Overworld $5C
dl $7EF1DC : db $02 : dw $0000 ; Room $00EE
dl $7EF0DC : db $02 : dw $0000 ; Room $006E
dl $7EF4D8 : db $02 : dw $0000 ; 
dl $7EF3D8 : db $02 : dw $4B00 ; 
dl $7EF2D8 : db $02 : dw $0000 ; Overworld $58
dl $7EF1D8 : db $02 : dw $0000 ; Room $00EC
dl $7EF0D8 : db $02 : dw $0000 ; Room $006C
dl $7EF4D4 : db $02 : dw $0000 ; 
dl $7EF3D4 : db $02 : dw $0000 ; 
dl $7EF2D4 : db $02 : dw $0000 ; Overworld $54
dl $7EF1D4 : db $02 : dw $0000 ; Room $00EA
dl $7EF0D4 : db $02 : dw $0000 ; Room $006A
dl $7EF4D0 : db $02 : dw $0000 ; 
dl $7EF3D0 : db $02 : dw $0000 ; 
dl $7EF2D0 : db $02 : dw $0000 ; Overworld $50
dl $7EF1D0 : db $02 : dw $0000 ; Room $00E8
dl $7EF0D0 : db $02 : dw $0000 ; Room $0068
dl $7EF4CC : db $02 : dw $0000 ; 
dl $7EF3CC : db $02 : dw $0000 ; Tagalong
dl $7EF2CC : db $02 : dw $0000 ; Overworld $4C
dl $7EF1CC : db $02 : dw $0000 ; Room $00E6
dl $7EF0CC : db $02 : dw $0000 ; Room $0066
dl $7EF2A4 : db $02 : dw $0000 ; Overworld $24
dl $7EF4C8 : db $02 : dw $0000 ; 
dl $7EF3C8 : db $02 : dw $0000 ; Entrances Phase
dl $7EF2C8 : db $02 : dw $0000 ; Overworld $48
dl $7EF1C8 : db $02 : dw $0000 ; Room $00E4
dl $7EF0C8 : db $02 : dw $0000 ; Room $0064
dl $7EF3A4 : db $02 : dw $0000 ; 
dl $7EF4C4 : db $02 : dw $0000 ; 
dl $7EF3C4 : db $02 : dw $0000 ; 
dl $7EF2C4 : db $02 : dw $0000 ; Overworld $44
dl $7EF1C4 : db $02 : dw $0000 ; Room $00E2
dl $7EF0C4 : db $02 : dw $0000 ; Room $0062
dl $7EF4A4 : db $02 : dw $0000 ; 
dl $7EF4C0 : db $02 : dw $0000 ; 
dl $7EF3C0 : db $02 : dw $0000 ; 
dl $7EF2C0 : db $02 : dw $0000 ; Overworld $40
dl $7EF1C0 : db $02 : dw $0000 ; Room $00E0
dl $7EF0C0 : db $02 : dw $0000 ; Room $0060
dl $7EF0A8 : db $02 : dw $0000 ; Room $0054
dl $7EF0AC : db $02 : dw $0000 ; Room $0056
dl $7EF4AC : db $02 : dw $0000 ; 
dl $7EF2B0 : db $02 : dw $0000 ; Overworld $30
dl $7EF1B0 : db $02 : dw $0000 ; Room $00D8
dl $7EF4BC : db $02 : dw $0000 ; 
dl $7EF3BC : db $02 : dw $0000 ; 
dl $7EF2BC : db $02 : dw $0000 ; Overworld $3C
dl $7EF1BC : db $02 : dw $0000 ; Room $00DE
dl $7EF0BC : db $02 : dw $0000 ; Room $005E
dl $7EF1A8 : db $02 : dw $0000 ; Room $00D4
dl $7EF1AC : db $02 : dw $0000 ; Room $00D6
dl $7EF4A8 : db $02 : dw $0000 ; 
dl $7EF3B0 : db $02 : dw $0000 ; 
dl $7EF3AC : db $02 : dw $0000 ; 
dl $7EF4B8 : db $02 : dw $0000 ; 
dl $7EF3B8 : db $02 : dw $0000 ; 
dl $7EF2B8 : db $02 : dw $0000 ; Overworld $38
dl $7EF1B8 : db $02 : dw $0000 ; Room $00DC
dl $7EF0B8 : db $02 : dw $0000 ; Room $005C
dl $7EF2A8 : db $02 : dw $0000 ; Overworld $28
dl $7EF2AC : db $02 : dw $0000 ; Overworld $2C
dl $7EF0B0 : db $02 : dw $0000 ; Room $0058
dl $7EF4B0 : db $02 : dw $0000 ; 
dl $7EF3A8 : db $02 : dw $0000 ; 
dl $7EF4B4 : db $02 : dw $0000 ; 
dl $7EF3B4 : db $02 : dw $0000 ; 
dl $7EF2B4 : db $02 : dw $0000 ; Overworld $34
dl $7EF1B4 : db $02 : dw $0000 ; Room $00DA
dl $7EF0B4 : db $02 : dw $0000 ; Room $005A
dl $7EF008 : db $02 : dw $0000 ; Room $0004
dl $7EF00C : db $02 : dw $0000 ; Room $0006
dl $7EF010 : db $02 : dw $0000 ; Room $0008
dl $7EF014 : db $02 : dw $0000 ; Room $000A
dl $7EF018 : db $02 : dw $0000 ; Room $000C
dl $7EF01C : db $02 : dw $0000 ; Room $000E
dl $7EF020 : db $02 : dw $0000 ; Room $0010
dl $7EF024 : db $02 : dw $0000 ; Room $0012
dl $7EF028 : db $02 : dw $0000 ; Room $0014
dl $7EF02C : db $02 : dw $0000 ; Room $0016
dl $7EF030 : db $02 : dw $0000 ; Room $0018
dl $7EF034 : db $02 : dw $0000 ; Room $001A
dl $7EF038 : db $02 : dw $0000 ; Room $001C
dl $7EF03C : db $02 : dw $0000 ; Room $001E
dl $7EF058 : db $02 : dw $0000 ; Room $002C
dl $7EF03A : db $02 : dw $0000 ; Room $001D
dl $7EF03E : db $02 : dw $0000 ; Room $001F
dl $7EF042 : db $02 : dw $0000 ; Room $0021
dl $7EF046 : db $02 : dw $0000 ; Room $0023
dl $7EF04A : db $02 : dw $0000 ; Room $0025
dl $7EF04E : db $02 : dw $0000 ; Room $0027
dl $7EF056 : db $02 : dw $0000 ; Room $002B
dl $7EF05A : db $02 : dw $0000 ; Room $002D
dl $7EF05E : db $02 : dw $0000 ; Room $002F
dl $7EF062 : db $02 : dw $0000 ; Room $0031
dl $7EF066 : db $02 : dw $0000 ; Room $0033
dl $7EF06A : db $02 : dw $0000 ; Room $0035
dl $7EF06E : db $02 : dw $0000 ; Room $0037
dl $7EF072 : db $02 : dw $0000 ; Room $0039
dl $7EF076 : db $02 : dw $0000 ; Room $003B
dl $7EF07A : db $02 : dw $0000 ; Room $003D
dl $7EF07E : db $02 : dw $0000 ; Room $003F
dl $7EF082 : db $02 : dw $0000 ; Room $0041
dl $7EF086 : db $02 : dw $0000 ; Room $0043
dl $7EF08A : db $02 : dw $0000 ; Room $0045
dl $7EF08E : db $02 : dw $0000 ; Room $0047
dl $7EF092 : db $02 : dw $0000 ; Room $0049
dl $7EF096 : db $02 : dw $0000 ; Room $004B
dl $7EF09A : db $02 : dw $0000 ; Room $004D
dl $7EF09E : db $02 : dw $0000 ; Room $004F
dl $7EF108 : db $02 : dw $0000 ; Room $0084
dl $7EF10C : db $02 : dw $0000 ; Room $0086
dl $7EF110 : db $02 : dw $0000 ; Room $0088
dl $7EF114 : db $02 : dw $0000 ; Room $008A
dl $7EF118 : db $02 : dw $0000 ; Room $008C
dl $7EF11C : db $02 : dw $0000 ; Room $008E
dl $7EF120 : db $02 : dw $0000 ; Room $0090
dl $7EF124 : db $02 : dw $0000 ; Room $0092
dl $7EF128 : db $02 : dw $0000 ; Room $0094
dl $7EF12C : db $02 : dw $0000 ; Room $0096
dl $7EF130 : db $02 : dw $0000 ; Room $0098
dl $7EF134 : db $02 : dw $0000 ; Room $009A
dl $7EF138 : db $02 : dw $0000 ; Room $009C
dl $7EF13C : db $02 : dw $0000 ; Room $009E
dl $7EF140 : db $02 : dw $0000 ; Room $00A0
dl $7EF148 : db $02 : dw $0000 ; Room $00A4
dl $7EF14C : db $02 : dw $0000 ; Room $00A6
dl $7EF150 : db $02 : dw $0000 ; Room $00A8
dl $7EF154 : db $02 : dw $0000 ; Room $00AA
dl $7EF158 : db $02 : dw $0000 ; Room $00AC
dl $7EF13E : db $02 : dw $0000 ; Room $009F
dl $7EF156 : db $02 : dw $0000 ; Room $00AB
dl $7EF15A : db $02 : dw $0000 ; Room $00AD
dl $7EF15E : db $02 : dw $0000 ; Room $00AF
dl $7EF162 : db $02 : dw $0000 ; Room $00B1
dl $7EF166 : db $02 : dw $0000 ; Room $00B3
dl $7EF16A : db $02 : dw $0000 ; Room $00B5
dl $7EF16E : db $02 : dw $0000 ; Room $00B7
dl $7EF172 : db $02 : dw $0000 ; Room $00B9
dl $7EF176 : db $02 : dw $0000 ; Room $00BB
dl $7EF17A : db $02 : dw $0000 ; Room $00BD
dl $7EF17E : db $02 : dw $0000 ; Room $00BF
dl $7EF182 : db $02 : dw $0000 ; Room $00C1
dl $7EF186 : db $02 : dw $0000 ; Room $00C3
dl $7EF18A : db $02 : dw $0000 ; Room $00C5
dl $7EF18E : db $02 : dw $0000 ; Room $00C7
dl $7EF192 : db $02 : dw $0000 ; Room $00C9
dl $7EF196 : db $02 : dw $0000 ; Room $00CB
dl $7EF19A : db $02 : dw $0000 ; Room $00CD
dl $7EF19E : db $02 : dw $0000 ; Room $00CF
dl $7EF208 : db $02 : dw $0002 ; Room $0104
dl $7EF20C : db $02 : dw $F000 ; Room $0106
dl $7EF210 : db $02 : dw $0000 ; Room $0108
dl $7EF214 : db $02 : dw $0000 ; Room $010A
dl $7EF218 : db $02 : dw $0000 ; Room $010C
dl $7EF21C : db $02 : dw $0000 ; Room $010E
dl $7EF220 : db $02 : dw $0000 ; Room $0110
dl $7EF224 : db $02 : dw $0000 ; Room $0112
dl $7EF228 : db $02 : dw $0000 ; Room $0114
dl $7EF22C : db $02 : dw $0000 ; Room $0116
dl $7EF230 : db $02 : dw $0000 ; Room $0118
dl $7EF234 : db $02 : dw $0000 ; Room $011A
dl $7EF238 : db $02 : dw $0000 ; Room $011C
dl $7EF23C : db $02 : dw $0000 ; Room $011E
dl $7EF240 : db $02 : dw $0000 ; Room $0120
dl $7EF248 : db $02 : dw $0000 ; Room $0124
dl $7EF23E : db $02 : dw $0000 ; Room $011F
dl $7EF246 : db $02 : dw $0000 ; Room $0123
dl $7EF24A : db $02 : dw $0000 ; Room $0125
dl $7EF24E : db $02 : dw $0000 ; Room $0127
dl $7EF252 : db $02 : dw $0000 ; 
dl $7EF256 : db $02 : dw $0000 ; 
dl $7EF25A : db $02 : dw $0000 ; 
dl $7EF25E : db $02 : dw $0000 ; 
dl $7EF262 : db $02 : dw $0000 ; 
dl $7EF266 : db $02 : dw $0000 ; 
dl $7EF26A : db $02 : dw $0000 ; 
dl $7EF26E : db $02 : dw $0000 ; 
dl $7EF272 : db $02 : dw $0000 ; 
dl $7EF276 : db $02 : dw $0000 ; 
dl $7EF27A : db $02 : dw $0000 ; 
dl $7EF27E : db $02 : dw $0000 ; 
dl $7EF282 : db $02 : dw $0000 ; Overworld $02
dl $7EF286 : db $02 : dw $0000 ; Overworld $06
dl $7EF28A : db $02 : dw $0000 ; Overworld $0A
dl $7EF28E : db $02 : dw $0000 ; Overworld $0E
dl $7EF292 : db $02 : dw $0000 ; Overworld $12
dl $7EF296 : db $02 : dw $0000 ; Overworld $16
dl $7EF29A : db $02 : dw $0000 ; Overworld $1A
dl $7EF308 : db $02 : dw $0000 ; 
dl $7EF30C : db $02 : dw $0000 ; 
dl $7EF310 : db $02 : dw $0000 ; 
dl $7EF314 : db $02 : dw $0000 ; 
dl $7EF318 : db $02 : dw $0000 ; 
dl $7EF31C : db $02 : dw $0000 ; 
dl $7EF320 : db $02 : dw $0000 ; 
dl $7EF324 : db $02 : dw $0000 ; 
dl $7EF328 : db $02 : dw $0000 ; 
dl $7EF32C : db $02 : dw $0000 ; 
dl $7EF330 : db $02 : dw $0000 ; 
dl $7EF334 : db $02 : dw $0000 ; 
dl $7EF338 : db $02 : dw $0000 ; 
dl $7EF33C : db $02 : dw $0000 ; 
dl $7EF33A : db $02 : dw $0000 ; 
dl $7EF33E : db $02 : dw $0000 ; 
dl $7EF342 : db $02 : dw $0000 ; Hookshot
dl $7EF346 : db $02 : dw $0000 ; Ice Rod
dl $7EF34A : db $02 : dw $0000 ; Torch
dl $7EF34E : db $02 : dw $0000 ; Book of Mudora
dl $7EF352 : db $02 : dw $0000 ; Magic Cape
dl $7EF356 : db $02 : dw $0000 ; Flippers
dl $7EF35A : db $02 : dw $0000 ; Shield
dl $7EF35E : db $02 : dw $0000 ; 
dl $7EF362 : db $02 : dw $0000 ; Rupees (actual)
dl $7EF366 : db $02 : dw $0000 ; BigKey1
dl $7EF36A : db $02 : dw $0000 ; 
dl $7EF36E : db $02 : dw $0000 ; Magic Power
dl $7EF372 : db $02 : dw $0000 ; Hearts filler
dl $7EF376 : db $02 : dw $0000 ; Arrow filler
dl $7EF37A : db $02 : dw $0000 ; Crystals
dl $7EF37E : db $02 : dw $0000 ; Key for dungeon $02
dl $7EF382 : db $02 : dw $0000 ; Key for dungeon $06
dl $7EF386 : db $02 : dw $0000 ; Key for dungeon $0A
dl $7EF38A : db $02 : dw $0000 ; 
dl $7EF38E : db $02 : dw $0000 ; 
dl $7EF392 : db $02 : dw $0000 ; 
dl $7EF396 : db $02 : dw $0000 ; 
dl $7EF39A : db $02 : dw $0000 ; 
dl $7EF408 : db $02 : dw $0000 ; 
dl $7EF40C : db $02 : dw $0000 ; 
dl $7EF410 : db $02 : dw $0000 ; 
dl $7EF414 : db $02 : dw $0000 ; 
dl $7EF418 : db $02 : dw $0000 ; 
dl $7EF41C : db $02 : dw $0000 ; 
dl $7EF420 : db $02 : dw $0000 ; 
dl $7EF424 : db $02 : dw $0000 ; 
dl $7EF428 : db $02 : dw $0000 ; 
dl $7EF42C : db $02 : dw $0000 ; 
dl $7EF430 : db $02 : dw $0000 ; 
dl $7EF434 : db $02 : dw $0000 ; 
dl $7EF438 : db $02 : dw $0000 ; 
dl $7EF43C : db $02 : dw $0000 ; 
dl $7EF43A : db $02 : dw $0000 ; 
dl $7EF43E : db $02 : dw $0000 ; 
dl $7EF442 : db $02 : dw $0000 ; 
dl $7EF446 : db $02 : dw $0000 ; 
dl $7EF44A : db $02 : dw $0000 ; 
dl $7EF44E : db $02 : dw $0000 ; 
dl $7EF452 : db $02 : dw $0000 ; 
dl $7EF456 : db $02 : dw $0000 ; 
dl $7EF45A : db $02 : dw $0000 ; 
dl $7EF45E : db $02 : dw $0000 ; 
dl $7EF462 : db $02 : dw $0000 ; 
dl $7EF466 : db $02 : dw $0000 ; 
dl $7EF46A : db $02 : dw $0000 ; 
dl $7EF46E : db $02 : dw $0000 ; 
dl $7EF472 : db $02 : dw $0000 ; 
dl $7EF476 : db $02 : dw $0000 ; 
dl $7EF47A : db $02 : dw $0000 ; 
dl $7EF47E : db $02 : dw $0000 ; 
dl $7EF482 : db $02 : dw $0000 ; 
dl $7EF486 : db $02 : dw $0000 ; 
dl $7EF48A : db $02 : dw $0000 ; 
dl $7EF48E : db $02 : dw $0000 ; 
dl $7EF492 : db $02 : dw $0000 ; 
dl $7EF496 : db $02 : dw $0000 ; 
dl $7EF49A : db $02 : dw $0000 ; 
print ".after: ", pc
.after

sram_escape_courtyard:
dl $7EF0AA : db $02 : dw $000F ; Room $0055
dl $7EF360 : db $02 : dw $0001 ; Rupees (goal)
dl $7EF3C6 : db $01 : db $11 ; Game Phase 2
dl $7EF3C5 : db $01 : db $01 ; Game Phase 1
dl $7EF359 : db $01 : db $01 ; Sword
dl $7EF051 : db $01 : db $00 ; Room $0028
dl $7EF2FB : db $01 : db $00 ; Overworld $7B
dl $7EF2BB : db $01 : db $00 ; Overworld $3B
dl $7EF3C8 : db $01 : db $03 ; Entrances Phase
dl $7EF35A : db $01 : db $01 ; Shield
dl $7EF362 : db $02 : dw $0001 ; Rupees (actual)
.after

sram_escape_entrance:
.after

sram_escape_1st_keyguard:
dl $7EF002 : db $02 : dw $000C ; Room $0001
dl $7EF0A0 : db $02 : dw $0005 ; Room $0050
dl $7EF0C2 : db $02 : dw $000F ; Room $0061
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF0C0 : db $02 : dw $0005 ; Room $0060
.after

sram_escape_big_room:
dl $7EF104 : db $02 : dw $000F ; Room $0082
dl $7EF0E4 : db $02 : dw $840F ; Room $0072
.after

sram_escape_2nd_keyguard:
dl $7EF0E2 : db $02 : dw $0002 ; Room $0071
dl $7EF102 : db $02 : dw $000F ; Room $0081
.after

sram_escape_balln_chains:
dl $7EF0E2 : db $02 : dw $841B ; Room $0071
dl $7EF341 : db $01 : db $01 ; Boomerang
dl $7EF0E0 : db $02 : dw $0008 ; Room $0070
.after

sram_escape_keyguard_revisited:
dl $7EF100 : db $02 : dw $043C ; Room $0080
dl $7EF3D3 : db $01 : db $00 ; Super Bomb Boom
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF3E5 : db $02 : dw $0000 ; Validity (checksum)
dl $7EF3CC : db $01 : db $01 ; Tagalong
dl $7EF3C8 : db $01 : db $02 ; Entrances Phase
dl $7EF34A : db $01 : db $01 ; Torch
dl $7EF366 : db $02 : dw $4000 ; BigKey1
.after

sram_escape_secret_passage:
dl $7EF0A2 : db $02 : dw $000F ; Room $0051
.after

sram_escape_snake_avoidance_room:
dl $7EF3C8 : db $01 : db $04 ; Entrances Phase
dl $7EF082 : db $02 : dw $000F ; Room $0041
.after

sram_escape_keyrat:
dl $7EF044 : db $02 : dw $8003 ; Room $0022
dl $7EF064 : db $02 : dw $801F ; Room $0032
dl $7EF084 : db $02 : dw $000C ; Room $0042
dl $7EF042 : db $02 : dw $0003 ; Room $0021
.after

sram_escape_last_two_screens:
dl $7EF022 : db $02 : dw $0005 ; Room $0011
dl $7EF042 : db $02 : dw $840F ; Room $0021
.after

sram_eastern_before_cutscene:
dl $7EF004 : db $02 : dw $000F ; Room $0002
dl $7EF022 : db $02 : dw $2005 ; Room $0011
.after

sram_eastern_after_cutscene:
dl $7EF3C6 : db $01 : db $15 ; Game Phase 2
dl $7EF3E3 : db $02 : dw $0000 ; Player name
dl $7EF3C7 : db $01 : db $01 ; Map Phase
dl $7EF29B : db $01 : db $20 ; Overworld $1B
dl $7EF3C5 : db $01 : db $02 ; Game Phase 1
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7EF3C8 : db $01 : db $01 ; Entrances Phase
dl $7EF024 : db $02 : dw $000F ; Room $0012
.after

sram_eastern_octoroc:
dl $7EF36F : db $01 : db $FF ; Keys
.after

sram_eastern_palace_overworld:
.after

sram_eastern_entrance:
.after

sram_stalfos_room:
dl $7EF152 : db $02 : dw $000F ; Room $00A9
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF150 : db $02 : dw $0005 ; Room $00A8
dl $7EF172 : db $02 : dw $000F ; Room $00B9
dl $7EF192 : db $02 : dw $000F ; Room $00C9
.after

sram_eastern_dark_key_room:
dl $7EF174 : db $02 : dw $0008 ; Room $00BA
dl $7EF373 : db $01 : db $00 ; Magic filler
dl $7EF150 : db $02 : dw $000F ; Room $00A8
dl $7EF154 : db $02 : dw $000A ; Room $00AA
dl $7EF36E : db $01 : db $10 ; Magic Power
.after

sram_eastern_bk_dmg_boost:
dl $7EF174 : db $02 : dw $840C ; Room $00BA
dl $7EF360 : db $02 : dw $0015 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0015 ; Rupees (actual)
.after

sram_eastern_big_chest_room:
dl $7EF170 : db $02 : dw $8015 ; Room $00B8
dl $7EF36D : db $01 : db $0C ; Health (actual)
dl $7EF172 : db $02 : dw $800F ; Room $00B9
dl $7EF366 : db $02 : dw $6000 ; BigKey1
.after

sram_eastern_gwg:
dl $7EF152 : db $02 : dw $001F ; Room $00A9
dl $7EF340 : db $01 : db $02 ; Bow
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF150 : db $02 : dw $200F ; Room $00A8
.after

sram_eastern_pot_room:
dl $7EF132 : db $02 : dw $0003 ; Room $0099
dl $7EF152 : db $02 : dw $201F ; Room $00A9
dl $7EF360 : db $02 : dw $001B ; Rupees (goal)
dl $7EF362 : db $02 : dw $001B ; Rupees (actual)
dl $7EF36E : db $01 : db $20 ; Magic Power
.after

sram_eastern_zgr:
dl $7EF132 : db $02 : dw $C403 ; Room $0099
dl $7EF1B2 : db $02 : dw $0003 ; Room $00D9
dl $7EF377 : db $01 : db $14 ; Arrows
dl $7EF1B4 : db $02 : dw $0002 ; Room $00DA
.after

sram_eastern_armos:
dl $7EF360 : db $02 : dw $001C ; Rupees (goal)
dl $7EF34F : db $01 : db $00 ; Bottles
dl $7EF377 : db $01 : db $12 ; Arrows
dl $7EF1B0 : db $02 : dw $0005 ; Room $00D8
dl $7EF362 : db $02 : dw $001C ; Rupees (actual)
.after

sram_desert_outside_ep:
dl $7EF190 : db $02 : dw $0801 ; Room $00C8
dl $7EF340 : db $01 : db $01 ; Bow
dl $7EF36C : db $01 : db $20 ; Health (goal)
dl $7EF374 : db $01 : db $04 ; Pendants
dl $7EF3E7 : db $02 : dw $0000 ; Deaths
dl $7EF377 : db $01 : db $00 ; Arrows
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF36E : db $01 : db $80 ; Magic Power
.after

sram_desert_ep_spinspeed:
dl $7EF20A : db $02 : dw $0002 ; Room $0105
dl $7EF379 : db $01 : db $FC ; Ability Flags
dl $7EF355 : db $01 : db $01 ; Boots
dl $7EF3C7 : db $01 : db $03 ; Map Phase
.after

sram_desert_unholy_spinspeed:
.after

sram_desert_water_dash:
dl $7EF20E : db $02 : dw $F002 ; Room $0107
dl $7EF34E : db $01 : db $01 ; Book of Mudora
.after

sram_desert_entrance:
.after

sram_desert_keybonk:
dl $7EF0E6 : db $02 : dw $0001 ; Room $0073
dl $7EF340 : db $01 : db $02 ; Bow
dl $7EF377 : db $01 : db $05 ; Arrows
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF0E8 : db $02 : dw $0003 ; Room $0074
dl $7EF108 : db $02 : dw $000F ; Room $0084
.after

sram_desert_pre_cannonball_room:
dl $7EF0E6 : db $02 : dw $0405 ; Room $0073
dl $7EF0EA : db $02 : dw $0002 ; Room $0075
dl $7EF10A : db $02 : dw $000A ; Room $0085
.after

sram_desert_pot_room:
dl $7EF0EA : db $02 : dw $0017 ; Room $0075
dl $7EF10A : db $02 : dw $400E ; Room $0085
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF366 : db $02 : dw $7000 ; BigKey1
.after

sram_desert_desert2_spinspeed:
dl $7EF0E6 : db $02 : dw $041F ; Room $0073
dl $7EF106 : db $02 : dw $0007 ; Room $0083
dl $7EF354 : db $01 : db $01 ; Gloves
dl $7EF377 : db $01 : db $14 ; Arrows
.after

sram_desert_popo_genocide:
dl $7EF0A6 : db $02 : dw $0008 ; Room $0053
dl $7EF0C6 : db $02 : dw $840A ; Room $0063
dl $7EF37F : db $01 : db $00 ; Key for dungeon $03
.after

sram_desert_torches:
dl $7EF0A6 : db $02 : dw $240F ; Room $0053
dl $7EF086 : db $02 : dw $0001 ; Room $0043
.after

sram_desert_lanmolas:
dl $7EF377 : db $01 : db $19 ; Arrows
dl $7EF086 : db $02 : dw $640D ; Room $0043
dl $7EF36E : db $01 : db $70 ; Magic Power
.after

sram_hera_outside_desert:
dl $7EF36C : db $01 : db $28 ; Health (goal)
dl $7EF374 : db $01 : db $06 ; Pendants
dl $7EF3E9 : db $02 : dw $0000 ; Deaths
dl $7EF377 : db $01 : db $0C ; Arrows
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF066 : db $02 : dw $0802 ; Room $0033
dl $7EF086 : db $02 : dw $E48D ; Room $0043
dl $7EF36E : db $01 : db $80 ; Magic Power
.after

sram_hera_fake_flippers:
.after

sram_hera_dm:
dl $7EF1E2 : db $02 : dw $000F ; Room $00F1
dl $7EF377 : db $01 : db $0B ; Arrows
dl $7EF1E0 : db $02 : dw $000F ; Room $00F0
dl $7EF3CC : db $01 : db $04 ; Tagalong
dl $7EF3C8 : db $01 : db $05 ; Entrances Phase
.after

sram_hera_after_mirror:
dl $7EF353 : db $01 : db $02 ; Magic Mirror
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7EF3C8 : db $01 : db $01 ; Entrances Phase
.after

sram_hera_entrance:
.after

sram_hera_tile_room:
dl $7EF0EE : db $02 : dw $000F ; Room $0077
dl $7EF10E : db $02 : dw $0402 ; Room $0087
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF386 : db $01 : db $01 ; Key for dungeon $0A
.after

sram_hera_torches:
dl $7EF0EE : db $02 : dw $800F ; Room $0077
dl $7EF10E : db $02 : dw $040E ; Room $0087
.after

sram_hera_beetles:
dl $7EF10E : db $02 : dw $041F ; Room $0087
dl $7EF366 : db $02 : dw $7020 ; BigKey1
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7EF386 : db $01 : db $00 ; Key for dungeon $0A
.after

sram_hera_petting_zoo:
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF375 : db $01 : db $00 ; Bomb filler
dl $7EF062 : db $02 : dw $800F ; Room $0031
.after

sram_hera_moldorm:
dl $7EF02E : db $02 : dw $000F ; Room $0017
dl $7EF357 : db $01 : db $01 ; Moon Pearl
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF04E : db $02 : dw $001F ; Room $0027
.after

sram_atower_outside_hera:
dl $7EF00E : db $02 : dw $080F ; Room $0007
dl $7EF36C : db $01 : db $30 ; Health (goal)
dl $7EF374 : db $01 : db $07 ; Pendants
dl $7EF3F7 : db $02 : dw $0000 ; Deaths
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7EF3C7 : db $01 : db $04 ; Map Phase
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF36E : db $01 : db $80 ; Magic Power
.after

sram_atower_first_rupee_tree:
dl $7EF1CE : db $02 : dw $000F ; Room $00E7
dl $7EF1CC : db $02 : dw $000F ; Room $00E6
.after

sram_atower_lost_woods:
dl $7EF360 : db $02 : dw $0026 ; Rupees (goal)
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF362 : db $02 : dw $0026 ; Rupees (actual)
.after

sram_atower_after_lost_woods:
dl $7EF300 : db $01 : db $40 ; Overworld $80
dl $7EF360 : db $02 : dw $0076 ; Rupees (goal)
dl $7EF3C7 : db $01 : db $05 ; Map Phase
dl $7EF359 : db $01 : db $02 ; Sword
dl $7EF362 : db $02 : dw $0076 ; Rupees (actual)
.after

sram_atower_tower_entrance:
dl $7EF29B : db $01 : db $60 ; Overworld $1B
.after

sram_atower_dark_room_despair:
dl $7EF1A0 : db $02 : dw $0004 ; Room $00D0
dl $7EF377 : db $01 : db $08 ; Arrows
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF1C0 : db $02 : dw $201E ; Room $00E0
.after

sram_atower_dark_room_melancholy:
dl $7EF180 : db $02 : dw $0001 ; Room $00C0
dl $7EF1A0 : db $02 : dw $801F ; Room $00D0
.after

sram_atower_red_spears:
dl $7EF180 : db $02 : dw $000F ; Room $00C0
.after

sram_atower_cop:
dl $7EF160 : db $02 : dw $000C ; Room $00B0
dl $7EF180 : db $02 : dw $240F ; Room $00C0
dl $7EF377 : db $01 : db $03 ; Arrows
.after

sram_atower_agahnim:
dl $7EF060 : db $02 : dw $000A ; Room $0030
dl $7EF080 : db $02 : dw $000B ; Room $0040
dl $7EF160 : db $02 : dw $240F ; Room $00B0
dl $7EF360 : db $02 : dw $0077 ; Rupees (goal)
dl $7EF377 : db $01 : db $07 ; Arrows
dl $7EF362 : db $02 : dw $0077 ; Rupees (actual)
.after

sram_pod_pyramid:
dl $7EF040 : db $02 : dw $0802 ; Room $0020
dl $7EF060 : db $02 : dw $840A ; Room $0030
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7EF3EB : db $02 : dw $0000 ; Deaths
dl $7EF3C7 : db $01 : db $06 ; Map Phase
dl $7EF3C5 : db $01 : db $03 ; Game Phase 1
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF282 : db $01 : db $20 ; Overworld $02
.after
