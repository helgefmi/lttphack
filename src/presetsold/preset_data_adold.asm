; Preset locations

preset_adold_escape_links_bed:
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
dw sram_ad_escape_links_bed_after

preset_adold_escape_courtyard:
db $02 ; Dungeon
dw $0055 ; Room Index
dw $0B10 ; BG1 Vertical Scroll
dw $0B10 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $0BD9 ; Link Y
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
dw sram_ad_escape_courtyard_after

preset_adold_escape_entrance:
db $01 ; Overworld
dw $001B ; Screen Index
dw $07F8 ; Link X
dw $06F9 ; Link Y
dw $06BE ; BG1 Vertical Scroll
dw $069B ; BG2 Vertical Scroll
dw $3DEC ; BG1 Horizontal Scroll
dw $0784 ; BG2 Horizontal Scroll
dw $0803 ; Scroll X
dw $0708 ; Scroll Y
dw $0532 ; Unknown 1
dw $0005 ; Unknown 2
dw $000A ; Unknown 3
dw sram_ad_escape_entrance_after

preset_adold_escape_1st_key_guard:
db $02 ; Dungeon
dw $0001 ; Room Index
dw $0000 ; BG1 Vertical Scroll
dw $0000 ; BG2 Vertical Scroll
dw $0280 ; BG1 Horizontal Scroll
dw $0280 ; BG2 Horizontal Scroll
dw $02F8 ; Link X
dw $005A ; Link Y
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
dw sram_ad_escape_1st_key_guard_after

preset_adold_escape_stealth_room:
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
dw sram_ad_escape_stealth_room_after

preset_adold_escape_2nd_key_guard:
db $02 ; Dungeon
dw $0071 ; Room Index
dw $0F0C ; BG1 Vertical Scroll
dw $0F0C ; BG2 Vertical Scroll
dw $0200 ; BG1 Horizontal Scroll
dw $0200 ; BG2 Horizontal Scroll
dw $02AD ; Link X
dw $0F79 ; Link Y
dw $007F ; Camera X
dw $0184 ; Camera Y
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
dw sram_ad_escape_2nd_key_guard_after

preset_adold_escape_ball_n_chains:
db $02 ; Dungeon
dw $0070 ; Room Index
dw $0E00 ; BG1 Vertical Scroll
dw $0E00 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0050 ; Link X
dw $0E2B ; Link Y
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
dw sram_ad_escape_ball_n_chains_after

preset_adold_escape_backtracking:
db $02 ; Dungeon
dw $0080 ; Room Index
dw $1000 ; BG1 Vertical Scroll
dw $1000 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0050 ; Link X
dw $102D ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1000 ; Relative Coords HU
dw $1000 ; Relative Coords FU
dw $1010 ; Relative Coords HD
dw $1110 ; Relative Coords FD
dw $0000 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0000 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FD ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_escape_backtracking_after

preset_adold_escape_key_guard_revisit:
db $02 ; Dungeon
dw $0072 ; Room Index
dw $0F00 ; BG1 Vertical Scroll
dw $0F00 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $0F29 ; Link Y
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
dw sram_ad_escape_key_guard_revisit_after

preset_adold_escape_throne_room:
db $02 ; Dungeon
dw $0061 ; Room Index
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $0280 ; BG1 Horizontal Scroll
dw $0280 ; BG2 Horizontal Scroll
dw $02F8 ; Link X
dw $0C2C ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0C00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0C10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $00 ; Starting Floor
db $02 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_escape_throne_room_after

preset_adold_escape_snake_avoidance:
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
dw sram_ad_escape_snake_avoidance_after

preset_adold_escape_sewer_rooms:
db $02 ; Dungeon
dw $0032 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $062A ; Link Y
dw $00FF ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0600 ; Relative Coords HU
dw $0600 ; Relative Coords FU
dw $0610 ; Relative Coords HD
dw $0710 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $FF ; Starting Floor
db $00 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_escape_sewer_rooms_after

preset_adold_escape_keyrat:
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
dw sram_ad_escape_keyrat_after

preset_adold_escape_last_two:
db $02 ; Dungeon
dw $0011 ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0300 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $0378 ; Link X
dw $022E ; Link Y
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
dw sram_ad_escape_last_two_after

preset_adold_eastern_before_cutscene:
db $02 ; Dungeon
dw $0002 ; Room Index
dw $0110 ; BG1 Vertical Scroll
dw $0110 ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $01A8 ; Link Y
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
db $00 ; Door Orientation
db $01 ; Starting Background
dw sram_ad_eastern_before_cutscene_after

preset_adold_eastern_links_house:
db $02 ; Dungeon
dw $0104 ; Room Index
dw $2110 ; BG1 Vertical Scroll
dw $2110 ; BG2 Vertical Scroll
dw $0900 ; BG1 Horizontal Scroll
dw $0900 ; BG2 Horizontal Scroll
dw $0978 ; Link X
dw $2178 ; Link Y
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
db $07 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_eastern_links_house_after

preset_adold_eastern_ep_overworld:
db $01 ; Overworld
dw $002E ; Screen Index
dw $0C90 ; Link X
dw $0A06 ; Link Y
dw $0A4D ; BG1 Vertical Scroll
dw $0A00 ; BG2 Vertical Scroll
dw $0C0F ; BG1 Horizontal Scroll
dw $0C1E ; BG2 Horizontal Scroll
dw $0C9B ; Scroll X
dw $0A6D ; Scroll Y
dw $0002 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_ad_eastern_ep_overworld_after

preset_adold_eastern_entrance:
db $02 ; Dungeon
dw $00C9 ; Room Index
dw $1910 ; BG1 Vertical Scroll
dw $1910 ; BG2 Vertical Scroll
dw $1280 ; BG1 Horizontal Scroll
dw $1280 ; BG2 Horizontal Scroll
dw $12F8 ; Link X
dw $19D8 ; Link Y
dw $00FF ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
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
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_eastern_entrance_after

preset_adold_eastern_stalfos_room:
db $02 ; Dungeon
dw $00A8 ; Room Index
dw $150B ; BG1 Vertical Scroll
dw $150B ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1125 ; Link X
dw $1578 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
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
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_eastern_stalfos_room_after

preset_adold_eastern_big_chest_room_1:
db $02 ; Dungeon
dw $00A8 ; Room Index
dw $140B ; BG1 Vertical Scroll
dw $140B ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $11BB ; Link X
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
dw sram_ad_eastern_big_chest_room_1_after

preset_adold_eastern_dark_key_room:
db $02 ; Dungeon
dw $00BA ; Room Index
dw $001F ; BG1 Vertical Scroll
dw $160E ; BG2 Vertical Scroll
dw $FFAF ; BG1 Horizontal Scroll
dw $1400 ; BG2 Horizontal Scroll
dw $14C8 ; Link X
dw $167B ; Link Y
dw $007F ; Camera X
dw $0086 ; Camera Y
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
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_eastern_dark_key_room_after

preset_adold_eastern_big_key_dmg_boost:
db $02 ; Dungeon
dw $00B9 ; Room Index
dw $160B ; BG1 Vertical Scroll
dw $160B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1224 ; Link X
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
dw sram_ad_eastern_big_key_dmg_boost_after

preset_adold_eastern_big_chest_room_2:
db $02 ; Dungeon
dw $00A8 ; Room Index
dw $140B ; BG1 Vertical Scroll
dw $140B ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $11B9 ; Link X
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
dw sram_ad_eastern_big_chest_room_2_after

preset_adold_eastern_gifted_with_greenies:
db $02 ; Dungeon
dw $00A9 ; Room Index
dw $1400 ; BG1 Vertical Scroll
dw $1400 ; BG2 Vertical Scroll
dw $1280 ; BG1 Horizontal Scroll
dw $1280 ; BG2 Horizontal Scroll
dw $12F8 ; Link X
dw $1423 ; Link Y
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
dw sram_ad_eastern_gifted_with_greenies_after

preset_adold_eastern_pot_room:
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
dw sram_ad_eastern_pot_room_after

preset_adold_eastern_zeldagamer_room:
db $02 ; Dungeon
dw $00D9 ; Room Index
dw $1B0C ; BG1 Vertical Scroll
dw $1B0C ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1229 ; Link X
dw $1B79 ; Link Y
dw $007F ; Camera X
dw $0184 ; Camera Y
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
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_eastern_zeldagamer_room_after

preset_adold_eastern_armos:
db $02 ; Dungeon
dw $00D8 ; Room Index
dw $1A00 ; BG1 Vertical Scroll
dw $1A00 ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1177 ; Link X
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
dw sram_ad_eastern_armos_after

preset_adold_pod_outside_ep:
db $01 ; Overworld
dw $001E ; Screen Index
dw $0F50 ; Link X
dw $062C ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0ED6 ; BG1 Horizontal Scroll
dw $0ED6 ; BG2 Horizontal Scroll
dw $0F5B ; Scroll X
dw $066D ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ad_pod_outside_ep_after

preset_adold_pod_sanctuary:
db $02 ; Dungeon
dw $0012 ; Room Index
dw $022F ; BG1 Vertical Scroll
dw $022F ; BG2 Vertical Scroll
dw $0480 ; BG1 Horizontal Scroll
dw $0480 ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $029A ; Link Y
dw $00FF ; Camera X
dw $00A5 ; Camera Y
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
db $14 ; Music Track
db $00 ; Starting Floor
db $00 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_pod_sanctuary_after

preset_adold_pod_dma:
db $01 ; Overworld
dw $0012 ; Screen Index
dw $05E2 ; Link X
dw $0584 ; Link Y
dw $048F ; BG1 Vertical Scroll
dw $051E ; BG2 Vertical Scroll
dw $0500 ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $0585 ; Scroll X
dw $058B ; Scroll Y
dw $08A0 ; Unknown 1
dw $0000 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_pod_dma_after

preset_adold_pod_death_mountain:
db $02 ; Dungeon
dw $00F1 ; Room Index
dw $FFC0 ; BG1 Vertical Scroll
dw $1F10 ; BG2 Vertical Scroll
dw $00FF ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $0378 ; Link X
dw $1FBA ; Link Y
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
dw sram_ad_pod_death_mountain_after

preset_adold_pod_after_mirror:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $0718 ; Link X
dw $03C0 ; Link Y
dw $02D9 ; BG1 Vertical Scroll
dw $031E ; BG2 Vertical Scroll
dw $062C ; BG1 Horizontal Scroll
dw $06A4 ; BG2 Horizontal Scroll
dw $0723 ; Scroll X
dw $038D ; Scroll Y
dw $1816 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
dw sram_ad_pod_after_mirror_after

preset_adold_pod_kiki_skip:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $0748 ; Link X
dw $0635 ; Link Y
dw $02D9 ; BG1 Vertical Scroll
dw $031E ; BG2 Vertical Scroll
dw $0638 ; BG1 Horizontal Scroll
dw $06D4 ; BG2 Horizontal Scroll
dw $0753 ; Scroll X
dw $038D ; Scroll Y
dw $181C ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFC ; Unknown 3
dw sram_ad_pod_kiki_skip_after

preset_adold_pod_dungeon_reload:
db $02 ; Dungeon
dw $004A ; Room Index
dw $0910 ; BG1 Vertical Scroll
dw $0910 ; BG2 Vertical Scroll
dw $1480 ; BG1 Horizontal Scroll
dw $1480 ; BG2 Horizontal Scroll
dw $14F8 ; Link X
dw $09D8 ; Link Y
dw $00FF ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $0900 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0910 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $1400 ; Relative Coords HL
dw $1400 ; Relative Coords FL
dw $1400 ; Relative Coords HR
dw $1500 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0200 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_pod_dungeon_reload_after

preset_adold_pod_main_hub_bk:
db $02 ; Dungeon
dw $004A ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1480 ; BG1 Horizontal Scroll
dw $1480 ; BG2 Horizontal Scroll
dw $14F8 ; Link X
dw $081E ; Link Y
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
dw sram_ad_pod_main_hub_bk_after

preset_adold_pod_main_hub_hammerjump:
db $02 ; Dungeon
dw $004A ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1480 ; BG1 Horizontal Scroll
dw $1480 ; BG2 Horizontal Scroll
dw $14F8 ; Link X
dw $0820 ; Link Y
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
dw sram_ad_pod_main_hub_hammerjump_after

preset_adold_pod_hammerjump:
db $02 ; Dungeon
dw $002A ; Room Index
dw $0400 ; BG1 Vertical Scroll
dw $0400 ; BG2 Vertical Scroll
dw $1400 ; BG1 Horizontal Scroll
dw $1400 ; BG2 Horizontal Scroll
dw $1478 ; Link X
dw $041C ; Link Y
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
dw sram_ad_pod_hammerjump_after

preset_adold_pod_archery_contest:
db $02 ; Dungeon
dw $003A ; Room Index
dw $0688 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $14C0 ; BG1 Horizontal Scroll
dw $1500 ; BG2 Horizontal Scroll
dw $1578 ; Link X
dw $0624 ; Link Y
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
dw sram_ad_pod_archery_contest_after

preset_adold_pod_mimics:
db $02 ; Dungeon
dw $002B ; Room Index
dw $0400 ; BG1 Vertical Scroll
dw $0400 ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $041E ; Link Y
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
dw sram_ad_pod_mimics_after

preset_adold_pod_statue:
db $02 ; Dungeon
dw $001B ; Room Index
dw $0300 ; BG1 Vertical Scroll
dw $0300 ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $031C ; Link Y
dw $007F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0300 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0310 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_pod_statue_after

preset_adold_pod_basement:
db $02 ; Dungeon
dw $001B ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $1678 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1790 ; Link X
dw $0251 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0001 ; Quadrant 2
db $07 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0C ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_pod_basement_after

preset_adold_pod_turtle_room:
db $02 ; Dungeon
dw $000B ; Room Index
dw $FFC0 ; BG1 Vertical Scroll
dw $0010 ; BG2 Vertical Scroll
dw $00FF ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $00D4 ; Link Y
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
dw sram_ad_pod_turtle_room_after

preset_adold_pod_helma:
db $02 ; Dungeon
dw $006A ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $1500 ; BG2 Horizontal Scroll
dw $1578 ; Link X
dw $0C1C ; Link Y
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
dw sram_ad_pod_helma_after

preset_adold_hera_outside_pod:
db $01 ; Overworld
dw $005E ; Screen Index
dw $0F50 ; Link X
dw $063B ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0ED6 ; BG1 Horizontal Scroll
dw $0ED6 ; BG2 Horizontal Scroll
dw $0F5B ; Scroll X
dw $066D ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ad_hera_outside_pod_after

preset_adold_hera_old_man_cave:
db $02 ; Dungeon
dw $00E4 ; Room Index
dw $1D10 ; BG1 Vertical Scroll
dw $1D10 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $1D98 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1D00 ; Relative Coords HU
dw $1C00 ; Relative Coords FU
dw $1D10 ; Relative Coords HD
dw $1D10 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0200 ; Quadrant 2
db $14 ; Main Graphics
db $12 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_hera_old_man_cave_after

preset_adold_hera_entrance:
db $02 ; Dungeon
dw $0077 ; Room Index
dw $0F10 ; BG1 Vertical Scroll
dw $0F10 ; BG2 Vertical Scroll
dw $0E80 ; BG1 Horizontal Scroll
dw $0E80 ; BG2 Horizontal Scroll
dw $0EF8 ; Link X
dw $0FBF ; Link Y
dw $00FF ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $0F00 ; Relative Coords HU
dw $0E00 ; Relative Coords FU
dw $0F10 ; Relative Coords HD
dw $0F10 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $05 ; Main Graphics
db $11 ; Music Track
db $01 ; Starting Floor
db $14 ; Palace No
db $01 ; Door Orientation
db $01 ; Starting Background
dw sram_ad_hera_entrance_after

preset_adold_hera_tile_room:
db $02 ; Dungeon
dw $0077 ; Room Index
dw $0E00 ; BG1 Vertical Scroll
dw $0E00 ; BG2 Vertical Scroll
dw $0E00 ; BG1 Horizontal Scroll
dw $0E00 ; BG2 Horizontal Scroll
dw $0E78 ; Link X
dw $0E42 ; Link Y
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
dw sram_ad_hera_tile_room_after

preset_adold_hera_torches:
db $02 ; Dungeon
dw $0087 ; Room Index
dw $1010 ; BG1 Vertical Scroll
dw $1010 ; BG2 Vertical Scroll
dw $0F00 ; BG1 Horizontal Scroll
dw $0F00 ; BG2 Horizontal Scroll
dw $0F78 ; Link X
dw $10D4 ; Link Y
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
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_hera_torches_after

preset_adold_hera_beetles:
db $02 ; Dungeon
dw $0077 ; Room Index
dw $0EE9 ; BG1 Vertical Scroll
dw $0EE9 ; BG2 Vertical Scroll
dw $0EF0 ; BG1 Horizontal Scroll
dw $0EF0 ; BG2 Horizontal Scroll
dw $0F68 ; Link X
dw $0F55 ; Link Y
dw $016F ; Camera X
dw $0160 ; Camera Y
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
dw sram_ad_hera_beetles_after

preset_adold_hera_petting_zoo:
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
dw sram_ad_hera_petting_zoo_after

preset_adold_hera_moldorm:
db $02 ; Dungeon
dw $0017 ; Room Index
dw $0208 ; BG1 Vertical Scroll
dw $0210 ; BG2 Vertical Scroll
dw $0E80 ; BG1 Horizontal Scroll
dw $0F00 ; BG2 Horizontal Scroll
dw $0FA8 ; Link X
dw $027D ; Link Y
dw $017F ; Camera X
dw $0088 ; Camera Y
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
dw sram_ad_hera_moldorm_after

preset_adold_thieves_outside_hera:
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
dw sram_ad_thieves_outside_hera_after

preset_adold_thieves_dmd:
db $01 ; Overworld
dw $0043 ; Screen Index
dw $0904 ; Link X
dw $0164 ; Link Y
dw $0203 ; BG1 Vertical Scroll
dw $0103 ; BG2 Vertical Scroll
dw $0890 ; BG1 Horizontal Scroll
dw $0890 ; BG2 Horizontal Scroll
dw $090F ; Scroll X
dw $0172 ; Scroll Y
dw $0754 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_thieves_dmd_after

preset_adold_thieves_entrance:
db $02 ; Dungeon
dw $00DB ; Room Index
dw $1B10 ; BG1 Vertical Scroll
dw $1B10 ; BG2 Vertical Scroll
dw $1680 ; BG1 Horizontal Scroll
dw $1680 ; BG2 Horizontal Scroll
dw $16F8 ; Link X
dw $1BD7 ; Link Y
dw $00FF ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1B00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1B10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_thieves_entrance_after

preset_adold_thieves_after_big_key:
db $02 ; Dungeon
dw $00DB ; Room Index
dw $1AFB ; BG1 Vertical Scroll
dw $1AFB ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $17BF ; Link X
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
dw sram_ad_thieves_after_big_key_after

preset_adold_thieves_stalfos_hallway:
db $02 ; Dungeon
dw $00CC ; Room Index
dw $1800 ; BG1 Vertical Scroll
dw $1800 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $1821 ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1800 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1810 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $1900 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1900 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_thieves_stalfos_hallway_after

preset_adold_thieves_conveyor_gibos:
db $02 ; Dungeon
dw $00BC ; Room Index
dw $170B ; BG1 Vertical Scroll
dw $170B ; BG2 Vertical Scroll
dw $1800 ; BG1 Horizontal Scroll
dw $1800 ; BG2 Horizontal Scroll
dw $1818 ; Link X
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
dw sram_ad_thieves_conveyor_gibos_after

preset_adold_thieves_hellway:
db $02 ; Dungeon
dw $00BB ; Room Index
dw $170B ; BG1 Vertical Scroll
dw $170B ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1717 ; Link X
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
dw sram_ad_thieves_hellway_after

preset_adold_thieves_bomb_floor:
db $02 ; Dungeon
dw $0065 ; Room Index
dw $0D0B ; BG1 Vertical Scroll
dw $0D0B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0ADC ; Link X
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
dw sram_ad_thieves_bomb_floor_after

preset_adold_thieves_backtracking:
db $02 ; Dungeon
dw $0064 ; Room Index
dw $0D00 ; BG1 Vertical Scroll
dw $0D00 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $0D2D ; Link Y
dw $007F ; Camera X
dw $0178 ; Camera Y
dw $0000 ; Door Settings
dw $0D00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0D10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $16 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_thieves_backtracking_after

preset_adold_thieves_basement:
db $02 ; Dungeon
dw $00BC ; Room Index
dw $1600 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $1800 ; BG1 Horizontal Scroll
dw $1800 ; BG2 Horizontal Scroll
dw $1878 ; Link X
dw $162C ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $1800 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1800 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0A ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $16 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_thieves_basement_after

preset_adold_thieves_prison:
db $02 ; Dungeon
dw $0045 ; Room Index
dw $090B ; BG1 Vertical Scroll
dw $090B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0AD8 ; Link X
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
dw sram_ad_thieves_prison_after

preset_adold_thieves_backtracking_2:
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
dw sram_ad_thieves_backtracking_2_after

preset_adold_thieves_pot_hammerdash:
db $02 ; Dungeon
dw $0045 ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $082D ; Link Y
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
dw sram_ad_thieves_pot_hammerdash_after

preset_adold_thieves_blind:
db $02 ; Dungeon
dw $00BC ; Room Index
dw $1600 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $161C ; Link Y
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
dw sram_ad_thieves_blind_after

preset_adold_skull_outside_thieves:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $01F8 ; Link X
dw $07BC ; Link Y
dw $075C ; BG1 Vertical Scroll
dw $075E ; BG2 Vertical Scroll
dw $0176 ; BG1 Horizontal Scroll
dw $0176 ; BG2 Horizontal Scroll
dw $0203 ; Scroll X
dw $07CB ; Scroll Y
dw $0B2E ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ad_skull_outside_thieves_after

preset_adold_skull_cursed_dwarf:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $0350 ; Link X
dw $09E2 ; Link Y
dw $0904 ; BG1 Vertical Scroll
dw $091E ; BG2 Vertical Scroll
dw $0200 ; BG1 Horizontal Scroll
dw $02CE ; BG2 Horizontal Scroll
dw $035B ; Scroll X
dw $098B ; Scroll Y
dw $1858 ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF2 ; Unknown 3
dw sram_ad_skull_cursed_dwarf_after

preset_adold_skull_getting_tempered:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $03E6 ; Link X
dw $0918 ; Link Y
dw $08B2 ; BG1 Vertical Scroll
dw $08B4 ; BG2 Vertical Scroll
dw $0300 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $0385 ; Scroll X
dw $0923 ; Scroll Y
dw $1560 ; Unknown 1
dw $000A ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_skull_getting_tempered_after

preset_adold_skull_fencedash:
db $01 ; Overworld
dw $0062 ; Screen Index
dw $0408 ; Link X
dw $0910 ; Link Y
dw $08B0 ; BG1 Vertical Scroll
dw $08B0 ; BG2 Vertical Scroll
dw $0400 ; BG1 Horizontal Scroll
dw $0400 ; BG2 Horizontal Scroll
dw $047D ; Scroll X
dw $091F ; Scroll Y
dw $0480 ; Unknown 1
dw $FFFE ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_skull_fencedash_after

preset_adold_skull_dash_to_skull_woods:
db $01 ; Overworld
dw $0058 ; Screen Index
dw $0348 ; Link X
dw $0608 ; Link Y
dw $06A2 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $02CA ; BG1 Horizontal Scroll
dw $02CA ; BG2 Horizontal Scroll
dw $034F ; Scroll X
dw $066F ; Scroll Y
dw $005A ; Unknown 1
dw $0000 ; Unknown 2
dw $0006 ; Unknown 3
dw sram_ad_skull_dash_to_skull_woods_after

preset_adold_skull_mummy_room:
db $01 ; Overworld
dw $0040 ; Screen Index
dw $0248 ; Link X
dw $024C ; Link Y
dw $0374 ; BG1 Vertical Scroll
dw $01EC ; BG2 Vertical Scroll
dw $0339 ; BG1 Horizontal Scroll
dw $01CA ; BG2 Horizontal Scroll
dw $024F ; Scroll X
dw $025B ; Scroll Y
dw $0EBA ; Unknown 1
dw $0002 ; Unknown 2
dw $0006 ; Unknown 3
dw sram_ad_skull_mummy_room_after

preset_adold_skull_bomb_jump:
db $01 ; Overworld
dw $0040 ; Screen Index
dw $02E8 ; Link X
dw $025C ; Link Y
dw $021E ; BG1 Vertical Scroll
dw $01FE ; BG2 Vertical Scroll
dw $01FA ; BG1 Horizontal Scroll
dw $0266 ; BG2 Horizontal Scroll
dw $02F3 ; Scroll X
dw $026B ; Scroll Y
dw $0F4E ; Unknown 1
dw $0002 ; Unknown 2
dw $000A ; Unknown 3
dw sram_ad_skull_bomb_jump_after

preset_adold_skull_key_pot:
db $02 ; Dungeon
dw $0056 ; Room Index
dw $0B0C ; BG1 Vertical Scroll
dw $0B0C ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D16 ; Link X
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
dw sram_ad_skull_key_pot_after

preset_adold_skull_skull_entrance:
db $01 ; Overworld
dw $0040 ; Screen Index
dw $0098 ; Link X
dw $00C8 ; Link Y
dw $01CC ; BG1 Vertical Scroll
dw $0066 ; BG2 Vertical Scroll
dw $0088 ; BG1 Horizontal Scroll
dw $0012 ; BG2 Horizontal Scroll
dw $009F ; Scroll X
dw $00D3 ; Scroll Y
dw $0282 ; Unknown 1
dw $000A ; Unknown 2
dw $FFFE ; Unknown 3
dw sram_ad_skull_skull_entrance_after

preset_adold_skull_mummy_hellway:
db $02 ; Dungeon
dw $0049 ; Room Index
dw $090B ; BG1 Vertical Scroll
dw $090B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $12D7 ; Link X
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
dw sram_ad_skull_mummy_hellway_after

preset_adold_skull_mummy_key:
db $02 ; Dungeon
dw $0049 ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $1278 ; Link X
dw $081F ; Link Y
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
dw sram_ad_skull_mummy_key_after

preset_adold_skull_mothula:
db $02 ; Dungeon
dw $0039 ; Room Index
dw $070D ; BG1 Vertical Scroll
dw $070B ; BG2 Vertical Scroll
dw $1200 ; BG1 Horizontal Scroll
dw $1200 ; BG2 Horizontal Scroll
dw $12CC ; Link X
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
dw sram_ad_skull_mothula_after

preset_adold_desert_outside_skull:
db $01 ; Overworld
dw $0040 ; Screen Index
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
dw sram_ad_desert_outside_skull_after

preset_adold_desert_ether:
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
dw sram_ad_desert_ether_after

preset_adold_desert_bridge_hammerdash:
db $01 ; Overworld
dw $0003 ; Screen Index
dw $09E4 ; Link X
dw $0078 ; Link Y
dw $0016 ; BG1 Vertical Scroll
dw $0018 ; BG2 Vertical Scroll
dw $089D ; BG1 Horizontal Scroll
dw $0900 ; BG2 Horizontal Scroll
dw $097F ; Scroll X
dw $0087 ; Scroll Y
dw $0160 ; Unknown 1
dw $0008 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_desert_bridge_hammerdash_after

preset_adold_desert_zora_dmd:
db $01 ; Overworld
dw $0005 ; Screen Index
dw $0DE4 ; Link X
dw $0077 ; Link Y
dw $0013 ; BG1 Vertical Scroll
dw $0013 ; BG2 Vertical Scroll
dw $0AC0 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D7D ; Scroll X
dw $0082 ; Scroll Y
dw $0160 ; Unknown 1
dw $000D ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_desert_zora_dmd_after

preset_adold_desert_links_house:
db $02 ; Dungeon
dw $0104 ; Room Index
dw $2110 ; BG1 Vertical Scroll
dw $2110 ; BG2 Vertical Scroll
dw $0900 ; BG1 Horizontal Scroll
dw $0900 ; BG2 Horizontal Scroll
dw $0978 ; Link X
dw $2178 ; Link Y
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
db $07 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_desert_links_house_after

preset_adold_desert_swamp_warp:
db $01 ; Overworld
dw $0034 ; Screen Index
dw $0808 ; Link X
dw $0C78 ; Link Y
dw $0C0D ; BG1 Vertical Scroll
dw $0C1A ; BG2 Vertical Scroll
dw $0819 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $088D ; Scroll X
dw $0C87 ; Scroll Y
dw $0080 ; Unknown 1
dw $FFF6 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_desert_swamp_warp_after

preset_adold_desert_fluteless_mire:
db $01 ; Overworld
dw $0073 ; Screen Index
dw $060C ; Link X
dw $0CC1 ; Link Y
dw $0C30 ; BG1 Vertical Scroll
dw $0C61 ; BG2 Vertical Scroll
dw $065F ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0685 ; Scroll X
dw $0CCE ; Scroll Y
dw $0300 ; Unknown 1
dw $FFFF ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_desert_fluteless_mire_after

preset_adold_desert_desert_entrance:
db $02 ; Dungeon
dw $0083 ; Room Index
dw $1110 ; BG1 Vertical Scroll
dw $1110 ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $11D6 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
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
dw sram_ad_desert_desert_entrance_after

preset_adold_desert_torch_key:
db $02 ; Dungeon
dw $0073 ; Room Index
dw $0F00 ; BG1 Vertical Scroll
dw $0F00 ; BG2 Vertical Scroll
dw $0700 ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $0778 ; Link X
dw $0F1F ; Link Y
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
dw sram_ad_desert_torch_key_after

preset_adold_desert_pre_cannonballs:
db $02 ; Dungeon
dw $0085 ; Room Index
dw $100B ; BG1 Vertical Scroll
dw $100B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0AD7 ; Link X
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
dw sram_ad_desert_pre_cannonballs_after

preset_adold_desert_desert_2_spinspeed:
db $02 ; Dungeon
dw $0083 ; Room Index
dw $1110 ; BG1 Vertical Scroll
dw $1110 ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $11E2 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
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
dw sram_ad_desert_desert_2_spinspeed_after

preset_adold_desert_torches:
db $02 ; Dungeon
dw $0043 ; Room Index
dw $0900 ; BG1 Vertical Scroll
dw $0900 ; BG2 Vertical Scroll
dw $0700 ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $0778 ; Link X
dw $0920 ; Link Y
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
db $00 ; Starting Background
dw sram_ad_desert_torches_after

preset_adold_desert_lanmolas:
db $02 ; Dungeon
dw $0043 ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $064A ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0678 ; Link X
dw $0821 ; Link Y
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
dw sram_ad_desert_lanmolas_after

preset_adold_mire_outside_desert:
db $01 ; Overworld
dw $0030 ; Screen Index
dw $0128 ; Link X
dw $0C3C ; Link Y
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $00A2 ; BG1 Horizontal Scroll
dw $00A2 ; BG2 Horizontal Scroll
dw $012F ; Scroll X
dw $0C6D ; Scroll Y
dw $0016 ; Unknown 1
dw $0000 ; Unknown 2
dw $000E ; Unknown 3
dw sram_ad_mire_outside_desert_after

preset_adold_mire_entrance:
db $01 ; Overworld
dw $0070 ; Screen Index
dw $0128 ; Link X
dw $0CD8 ; Link Y
dw $143B ; BG1 Vertical Scroll
dw $0C76 ; BG2 Vertical Scroll
dw $8985 ; BG1 Horizontal Scroll
dw $00A6 ; BG2 Horizontal Scroll
dw $0133 ; Scroll X
dw $0CE3 ; Scroll Y
dw $0414 ; Unknown 1
dw $000A ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ad_mire_entrance_after

preset_adold_mire_mire_2:
db $02 ; Dungeon
dw $0098 ; Room Index
dw $1300 ; BG1 Vertical Scroll
dw $1300 ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1188 ; Link X
dw $132B ; Link Y
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
dw sram_ad_mire_mire_2_after

preset_adold_mire_main_hub:
db $02 ; Dungeon
dw $00D2 ; Room Index
dw $1A00 ; BG1 Vertical Scroll
dw $1A00 ; BG2 Vertical Scroll
dw $0500 ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $0578 ; Link X
dw $1A2F ; Link Y
dw $017F ; Camera X
dw $0077 ; Camera Y
dw $0000 ; Door Settings
dw $1A00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1A10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $0500 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0500 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_main_hub_after

preset_adold_mire_spike_key:
db $02 ; Dungeon
dw $00B2 ; Room Index
dw $170B ; BG1 Vertical Scroll
dw $170B ; BG2 Vertical Scroll
dw $0500 ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $05D7 ; Link X
dw $1778 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
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
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_spike_key_after

preset_adold_mire_beat_the_fireball:
db $02 ; Dungeon
dw $00B2 ; Room Index
dw $1710 ; BG1 Vertical Scroll
dw $1710 ; BG2 Vertical Scroll
dw $0500 ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $0578 ; Link X
dw $17D5 ; Link Y
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
dw sram_ad_mire_beat_the_fireball_after

preset_adold_mire_bari_switch:
db $02 ; Dungeon
dw $00C2 ; Room Index
dw $190B ; BG1 Vertical Scroll
dw $190B ; BG2 Vertical Scroll
dw $0400 ; BG1 Horizontal Scroll
dw $0400 ; BG2 Horizontal Scroll
dw $0418 ; Link X
dw $1978 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_bari_switch_after

preset_adold_mire_sluggulas:
db $02 ; Dungeon
dw $00C1 ; Room Index
dw $1910 ; BG1 Vertical Scroll
dw $1910 ; BG2 Vertical Scroll
dw $0200 ; BG1 Horizontal Scroll
dw $0200 ; BG2 Horizontal Scroll
dw $0278 ; Link X
dw $19D2 ; Link Y
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
dw sram_ad_mire_sluggulas_after

preset_adold_mire_torches:
db $02 ; Dungeon
dw $00D1 ; Room Index
dw $1A00 ; BG1 Vertical Scroll
dw $1A00 ; BG2 Vertical Scroll
dw $0200 ; BG1 Horizontal Scroll
dw $0200 ; BG2 Horizontal Scroll
dw $02A8 ; Link X
dw $1A2D ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1A00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1A10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
dw $0200 ; Relative Coords HL
dw $0200 ; Relative Coords FL
dw $0200 ; Relative Coords HR
dw $0300 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_torches_after

preset_adold_mire_backtracking:
db $02 ; Dungeon
dw $00C1 ; Room Index
dw $180B ; BG1 Vertical Scroll
dw $180B ; BG2 Vertical Scroll
dw $0300 ; BG1 Horizontal Scroll
dw $0300 ; BG2 Horizontal Scroll
dw $03D5 ; Link X
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
dw sram_ad_mire_backtracking_after

preset_adold_mire_mire_to_hera_clip:
db $02 ; Dungeon
dw $0097 ; Room Index
dw $1210 ; BG1 Vertical Scroll
dw $1210 ; BG2 Vertical Scroll
dw $0E00 ; BG1 Horizontal Scroll
dw $0E00 ; BG2 Horizontal Scroll
dw $0E78 ; Link X
dw $12D4 ; Link Y
dw $007F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $1200 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1210 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_mire_to_hera_clip_after

preset_adold_mire_hera_to_swamp_clip:
db $02 ; Dungeon
dw $0017 ; Room Index
dw $0212 ; BG1 Vertical Scroll
dw $0214 ; BG2 Vertical Scroll
dw $0E1A ; BG1 Horizontal Scroll
dw $0E1A ; BG2 Horizontal Scroll
dw $0E99 ; Link X
dw $02BA ; Link Y
dw $0099 ; Camera X
dw $008C ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0E00 ; Relative Coords HL
dw $0E00 ; Relative Coords FL
dw $0E00 ; Relative Coords HR
dw $0F00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $04 ; Starting Floor
db $0E ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_hera_to_swamp_clip_after

preset_adold_mire_mire_2_2:
db $02 ; Dungeon
dw $0098 ; Room Index
dw $1300 ; BG1 Vertical Scroll
dw $1300 ; BG2 Vertical Scroll
dw $1100 ; BG1 Horizontal Scroll
dw $1100 ; BG2 Horizontal Scroll
dw $1188 ; Link X
dw $132D ; Link Y
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
dw sram_ad_mire_mire_2_2_after

preset_adold_mire_big_chest_room:
db $02 ; Dungeon
dw $00C3 ; Room Index
dw $190B ; BG1 Vertical Scroll
dw $190B ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $06D4 ; Link X
dw $1978 ; Link Y
dw $007F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $1900 ; Relative Coords HU
dw $1800 ; Relative Coords FU
dw $1910 ; Relative Coords HD
dw $1910 ; Relative Coords FD
dw $0600 ; Relative Coords HL
dw $0600 ; Relative Coords FL
dw $0600 ; Relative Coords HR
dw $0700 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_big_chest_room_after

preset_adold_mire_main_hub_post_cane:
db $02 ; Dungeon
dw $00C3 ; Room Index
dw $188B ; BG1 Vertical Scroll
dw $188B ; BG2 Vertical Scroll
dw $0600 ; BG1 Horizontal Scroll
dw $0600 ; BG2 Horizontal Scroll
dw $0615 ; Link X
dw $18F8 ; Link Y
dw $007F ; Camera X
dw $0103 ; Camera Y
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
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_main_hub_post_cane_after

preset_adold_mire_bridge_room:
db $02 ; Dungeon
dw $00B2 ; Room Index
dw $1600 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $047B ; BG1 Horizontal Scroll
dw $047B ; BG2 Horizontal Scroll
dw $04F8 ; Link X
dw $1625 ; Link Y
dw $00FA ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $0400 ; Relative Coords HL
dw $0400 ; Relative Coords FL
dw $0400 ; Relative Coords HR
dw $0500 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0C ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0E ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_mire_bridge_room_after

preset_adold_mire_spooky_action:
db $02 ; Dungeon
dw $0092 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $130B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0500 ; BG2 Horizontal Scroll
dw $051C ; Link X
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
dw sram_ad_mire_spooky_action_after

preset_adold_mire_vitreous:
db $02 ; Dungeon
dw $00A0 ; Room Index
dw $1400 ; BG1 Vertical Scroll
dw $1400 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $141E ; Link Y
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
dw sram_ad_mire_vitreous_after

preset_adold_swamp_outside_mire:
db $01 ; Overworld
dw $0070 ; Screen Index
dw $0128 ; Link X
dw $0CDC ; Link Y
dw $0C80 ; BG1 Vertical Scroll
dw $0C7E ; BG2 Vertical Scroll
dw $00A6 ; BG1 Horizontal Scroll
dw $00A6 ; BG2 Horizontal Scroll
dw $0133 ; Scroll X
dw $0CEB ; Scroll Y
dw $0414 ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ad_swamp_outside_mire_after

preset_adold_swamp_antifairy_room:
db $02 ; Dungeon
dw $010B ; Room Index
dw $2100 ; BG1 Vertical Scroll
dw $2100 ; BG2 Vertical Scroll
dw $1680 ; BG1 Horizontal Scroll
dw $1680 ; BG2 Horizontal Scroll
dw $16F8 ; Link X
dw $2121 ; Link Y
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
dw sram_ad_swamp_antifairy_room_after

preset_adold_swamp_entrance:
db $01 ; Overworld
dw $007B ; Screen Index
dw $0778 ; Link X
dw $0EED ; Link Y
dw $0E96 ; BG1 Vertical Scroll
dw $0E8E ; BG2 Vertical Scroll
dw $06FF ; BG1 Horizontal Scroll
dw $0700 ; BG2 Horizontal Scroll
dw $077D ; Scroll X
dw $0EFB ; Scroll Y
dw $0420 ; Unknown 1
dw $0002 ; Unknown 2
dw $0000 ; Unknown 3
dw sram_ad_swamp_entrance_after

preset_adold_swamp_first_key_pot:
db $02 ; Dungeon
dw $0028 ; Room Index
dw $0400 ; BG1 Vertical Scroll
dw $0400 ; BG2 Vertical Scroll
dw $1000 ; BG1 Horizontal Scroll
dw $1000 ; BG2 Horizontal Scroll
dw $1078 ; Link X
dw $042B ; Link Y
dw $007F ; Camera X
dw $0077 ; Camera Y
dw $0000 ; Door Settings
dw $0400 ; Relative Coords HU
dw $0400 ; Relative Coords FU
dw $0410 ; Relative Coords HD
dw $0510 ; Relative Coords FD
dw $1000 ; Relative Coords HL
dw $1000 ; Relative Coords FL
dw $1000 ; Relative Coords HR
dw $1100 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $0A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_swamp_first_key_pot_after

preset_adold_swamp_main_hub:
db $02 ; Dungeon
dw $0037 ; Room Index
dw $070C ; BG1 Vertical Scroll
dw $070C ; BG2 Vertical Scroll
dw $0E00 ; BG1 Horizontal Scroll
dw $0E00 ; BG2 Horizontal Scroll
dw $0E19 ; Link X
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
dw sram_ad_swamp_main_hub_after

preset_adold_swamp_hookdash:
db $02 ; Dungeon
dw $0036 ; Room Index
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0C80 ; BG1 Horizontal Scroll
dw $0C80 ; BG2 Horizontal Scroll
dw $0CF8 ; Link X
dw $0624 ; Link Y
dw $00FF ; Camera X
dw $0077 ; Camera Y
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
dw sram_ad_swamp_hookdash_after

preset_adold_swamp_restock_room:
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
dw sram_ad_swamp_restock_room_after

preset_adold_swamp_phelps_way:
db $02 ; Dungeon
dw $0016 ; Room Index
dw $0210 ; BG1 Vertical Scroll
dw $0210 ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D78 ; Link X
dw $02D5 ; Link Y
dw $017F ; Camera X
dw $0088 ; Camera Y
dw $0000 ; Door Settings
dw $0200 ; Relative Coords HU
dw $0200 ; Relative Coords FU
dw $0210 ; Relative Coords HD
dw $0310 ; Relative Coords FD
dw $0D00 ; Relative Coords HL
dw $0C00 ; Relative Coords FL
dw $0D00 ; Relative Coords HR
dw $0D00 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0001 ; Quadrant 2
db $08 ; Main Graphics
db $16 ; Music Track
db $FF ; Starting Floor
db $0A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_swamp_phelps_way_after

preset_adold_swamp_arrghus:
db $02 ; Dungeon
dw $0016 ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $0C00 ; BG1 Horizontal Scroll
dw $0C00 ; BG2 Horizontal Scroll
dw $0C78 ; Link X
dw $0218 ; Link Y
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
dw sram_ad_swamp_arrghus_after

preset_adold_ice_outside_swamp:
db $01 ; Overworld
dw $007B ; Screen Index
dw $0778 ; Link X
dw $0EEC ; Link Y
dw $0E8D ; BG1 Vertical Scroll
dw $0E8E ; BG2 Vertical Scroll
dw $06F2 ; BG1 Horizontal Scroll
dw $06F2 ; BG2 Horizontal Scroll
dw $077F ; Scroll X
dw $0EFB ; Scroll Y
dw $049E ; Unknown 1
dw $0002 ; Unknown 2
dw $FFFE ; Unknown 3
dw sram_ad_ice_outside_swamp_after

preset_adold_ice_entrance:
db $02 ; Dungeon
dw $000E ; Room Index
dw $0110 ; BG1 Vertical Scroll
dw $0110 ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D78 ; Link X
dw $01D6 ; Link Y
dw $017F ; Camera X
dw $0187 ; Camera Y
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
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_ice_entrance_after

preset_adold_ice_ice_conveyor:
db $02 ; Dungeon
dw $003E ; Room Index
dw $0610 ; BG1 Vertical Scroll
dw $0610 ; BG2 Vertical Scroll
dw $1CE1 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D78 ; Link X
dw $06C4 ; Link Y
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
db $FF ; Starting Floor
db $12 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_ice_ice_conveyor_after

preset_adold_ice_ipbj:
db $02 ; Dungeon
dw $003E ; Room Index
dw $0710 ; BG1 Vertical Scroll
dw $0710 ; BG2 Vertical Scroll
dw $1B13 ; BG1 Horizontal Scroll
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
db $FF ; Starting Floor
db $12 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_ice_ipbj_after

preset_adold_ice_penguin_lineup_room:
db $02 ; Dungeon
dw $004E ; Room Index
dw $0800 ; BG1 Vertical Scroll
dw $0800 ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1DB8 ; Link X
dw $086A ; Link Y
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
db $FF ; Starting Floor
db $12 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_ice_penguin_lineup_room_after

preset_adold_ice_lonely_firebar:
db $02 ; Dungeon
dw $005E ; Room Index
dw $0B0E ; BG1 Vertical Scroll
dw $0B0B ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D1C ; Link X
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
db $FE ; Starting Floor
db $12 ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_ice_lonely_firebar_after

preset_adold_ice_last_two_screens:
db $02 ; Dungeon
dw $009E ; Room Index
dw $130E ; BG1 Vertical Scroll
dw $130B ; BG2 Vertical Scroll
dw $1D00 ; BG1 Horizontal Scroll
dw $1D00 ; BG2 Horizontal Scroll
dw $1D50 ; Link X
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
db $FC ; Starting Floor
db $12 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_ice_last_two_screens_after

preset_adold_ice_kholdstare:
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
dw sram_ad_ice_kholdstare_after

preset_adold_trock_outside_ice:
db $01 ; Overworld
dw $0075 ; Screen Index
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
dw sram_ad_trock_outside_ice_after

preset_adold_trock_old_man_cave:
db $02 ; Dungeon
dw $00E4 ; Room Index
dw $1D10 ; BG1 Vertical Scroll
dw $1D10 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $1D99 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1D00 ; Relative Coords HU
dw $1C00 ; Relative Coords FU
dw $1D10 ; Relative Coords HD
dw $1D10 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0200 ; Quadrant 2
db $14 ; Main Graphics
db $12 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_trock_old_man_cave_after

preset_adold_trock_tr_climb:
db $01 ; Overworld
dw $0043 ; Screen Index
dw $0903 ; Link X
dw $0164 ; Link Y
dw $0203 ; BG1 Vertical Scroll
dw $0103 ; BG2 Vertical Scroll
dw $088F ; BG1 Horizontal Scroll
dw $088F ; BG2 Horizontal Scroll
dw $090E ; Scroll X
dw $0172 ; Scroll Y
dw $0754 ; Unknown 1
dw $FFFB ; Unknown 2
dw $0001 ; Unknown 3
dw sram_ad_trock_tr_climb_after

preset_adold_trock_laser_entrance:
db $01 ; Overworld
dw $0045 ; Screen Index
dw $0D18 ; Link X
dw $01D5 ; Link Y
dw $825C ; BG1 Vertical Scroll
dw $0171 ; BG2 Vertical Scroll
dw $0DFE ; BG1 Horizontal Scroll
dw $0DFE ; BG2 Horizontal Scroll
dw $0D7B ; Scroll X
dw $01E0 ; Scroll Y
dw $0B60 ; Unknown 1
dw $FFFD ; Unknown 2
dw $0002 ; Unknown 3
dw sram_ad_trock_laser_entrance_after

preset_adold_trock_crystal_roller:
db $02 ; Dungeon
dw $00B5 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $162C ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $1600 ; Relative Coords HU
dw $1600 ; Relative Coords FU
dw $1610 ; Relative Coords HD
dw $1710 ; Relative Coords FD
dw $0A00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0A00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0D ; Main Graphics
db $16 ; Music Track
db $FE ; Starting Floor
db $18 ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_trock_crystal_roller_after

preset_adold_trock_pokey_1:
db $02 ; Dungeon
dw $0014 ; Room Index
dw $028D ; BG1 Vertical Scroll
dw $020B ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0818 ; Link X
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
dw sram_ad_trock_pokey_1_after

preset_adold_trock_laser_entrance_2:
db $02 ; Dungeon
dw $00D5 ; Room Index
dw $1B10 ; BG1 Vertical Scroll
dw $1B10 ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A78 ; Link X
dw $1BD6 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1B00 ; Relative Coords HU
dw $1A00 ; Relative Coords FU
dw $1B10 ; Relative Coords HD
dw $1B10 ; Relative Coords FD
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
dw sram_ad_trock_laser_entrance_2_after

preset_adold_trock_switch_maze:
db $02 ; Dungeon
dw $00C5 ; Room Index
dw $190B ; BG1 Vertical Scroll
dw $190B ; BG2 Vertical Scroll
dw $0A00 ; BG1 Horizontal Scroll
dw $0A00 ; BG2 Horizontal Scroll
dw $0A10 ; Link X
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
dw sram_ad_trock_switch_maze_after

preset_adold_trock_trinexx:
db $02 ; Dungeon
dw $00B4 ; Room Index
dw $1600 ; BG1 Vertical Scroll
dw $1600 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $1624 ; Link Y
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
dw sram_ad_trock_trinexx_after

preset_adold_gtower_outside_turtle_rock:
db $01 ; Overworld
dw $0047 ; Screen Index
dw $0F08 ; Link X
dw $013B ; Link Y
dw $00DB ; BG1 Vertical Scroll
dw $00DD ; BG2 Vertical Scroll
dw $0E96 ; BG1 Horizontal Scroll
dw $0E96 ; BG2 Horizontal Scroll
dw $0F13 ; Scroll X
dw $014A ; Scroll Y
dw $0712 ; Unknown 1
dw $0003 ; Unknown 2
dw $FFFA ; Unknown 3
dw sram_ad_gtower_outside_turtle_rock_after

preset_adold_gtower_old_man_cave:
db $02 ; Dungeon
dw $00E4 ; Room Index
dw $1D10 ; BG1 Vertical Scroll
dw $1D10 ; BG2 Vertical Scroll
dw $0800 ; BG1 Horizontal Scroll
dw $0800 ; BG2 Horizontal Scroll
dw $0878 ; Link X
dw $1D99 ; Link Y
dw $007F ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $1D00 ; Relative Coords HU
dw $1C00 ; Relative Coords FU
dw $1D10 ; Relative Coords HD
dw $1D10 ; Relative Coords FD
dw $0800 ; Relative Coords HL
dw $0800 ; Relative Coords FL
dw $0800 ; Relative Coords HR
dw $0900 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0200 ; Quadrant 2
db $14 ; Main Graphics
db $12 ; Music Track
db $00 ; Starting Floor
db $FF ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_gtower_old_man_cave_after

preset_adold_gtower_entrance:
db $02 ; Dungeon
dw $000C ; Room Index
dw $0110 ; BG1 Vertical Scroll
dw $0110 ; BG2 Vertical Scroll
dw $1880 ; BG1 Horizontal Scroll
dw $1880 ; BG2 Horizontal Scroll
dw $18F8 ; Link X
dw $01D7 ; Link Y
dw $00FF ; Camera X
dw $0187 ; Camera Y
dw $0000 ; Door Settings
dw $0100 ; Relative Coords HU
dw $0000 ; Relative Coords FU
dw $0110 ; Relative Coords HD
dw $0110 ; Relative Coords FD
dw $1800 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1800 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0202 ; Quadrant 1
dw $0200 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $01 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_gtower_entrance_after

preset_adold_gtower_spike_skip:
db $02 ; Dungeon
dw $008B ; Room Index
dw $100C ; BG1 Vertical Scroll
dw $100C ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1716 ; Link X
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
dw sram_ad_gtower_spike_skip_after

preset_adold_gtower_pre_firesnakes_room:
db $02 ; Dungeon
dw $009B ; Room Index
dw $120B ; BG1 Vertical Scroll
dw $120B ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $16D7 ; Link X
dw $1278 ; Link Y
dw $007F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1200 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1210 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $1600 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1600 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $00 ; Starting Floor
db $1A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_gtower_pre_firesnakes_room_after

preset_adold_gtower_bombable_floor:
db $02 ; Dungeon
dw $009C ; Room Index
dw $1200 ; BG1 Vertical Scroll
dw $1200 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $121E ; Link Y
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
dw sram_ad_gtower_bombable_floor_after

preset_adold_gtower_floor_2:
db $02 ; Dungeon
dw $000C ; Room Index
dw $0000 ; BG1 Vertical Scroll
dw $0000 ; BG2 Vertical Scroll
dw $1880 ; BG1 Horizontal Scroll
dw $1880 ; BG2 Horizontal Scroll
dw $18F8 ; Link X
dw $002A ; Link Y
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
dw sram_ad_gtower_floor_2_after

preset_adold_gtower_mimics_1:
db $02 ; Dungeon
dw $006B ; Room Index
dw $0C10 ; BG1 Vertical Scroll
dw $0C10 ; BG2 Vertical Scroll
dw $1600 ; BG1 Horizontal Scroll
dw $1600 ; BG2 Horizontal Scroll
dw $1678 ; Link X
dw $0CCF ; Link Y
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
dw sram_ad_gtower_mimics_1_after

preset_adold_gtower_spike_pit:
db $02 ; Dungeon
dw $006B ; Room Index
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $1700 ; BG1 Horizontal Scroll
dw $1700 ; BG2 Horizontal Scroll
dw $1778 ; Link X
dw $0C1C ; Link Y
dw $017F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0C00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0C10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $1700 ; Relative Coords HL
dw $1600 ; Relative Coords FL
dw $1700 ; Relative Coords HR
dw $1700 ; Relative Coords FR
dw $0002 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $02 ; Starting Floor
db $1A ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_gtower_spike_pit_after

preset_adold_gtower_gauntlet_1:
db $02 ; Dungeon
dw $005C ; Room Index
dw $0A00 ; BG1 Vertical Scroll
dw $0A00 ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1978 ; Link X
dw $0A24 ; Link Y
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
dw sram_ad_gtower_gauntlet_1_after

preset_adold_gtower_lanmola_2:
db $02 ; Dungeon
dw $006C ; Room Index
dw $0D0B ; BG1 Vertical Scroll
dw $0D0B ; BG2 Vertical Scroll
dw $1900 ; BG1 Horizontal Scroll
dw $1900 ; BG2 Horizontal Scroll
dw $1917 ; Link X
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
dw sram_ad_gtower_lanmola_2_after

preset_adold_gtower_wizzrobes_1:
db $02 ; Dungeon
dw $006C ; Room Index
dw $0C00 ; BG1 Vertical Scroll
dw $0C00 ; BG2 Vertical Scroll
dw $1800 ; BG1 Horizontal Scroll
dw $1800 ; BG2 Horizontal Scroll
dw $1878 ; Link X
dw $0C27 ; Link Y
dw $007F ; Camera X
dw $0078 ; Camera Y
dw $0000 ; Door Settings
dw $0C00 ; Relative Coords HU
dw $0C00 ; Relative Coords FU
dw $0C10 ; Relative Coords HD
dw $0D10 ; Relative Coords FD
dw $1800 ; Relative Coords HL
dw $1800 ; Relative Coords FL
dw $1800 ; Relative Coords HR
dw $1900 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0000 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $03 ; Starting Floor
db $1A ; Palace No
db $00 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_gtower_wizzrobes_1_after

preset_adold_gtower_wizzrobes_2:
db $02 ; Dungeon
dw $00A5 ; Room Index
dw $1500 ; BG1 Vertical Scroll
dw $1500 ; BG2 Vertical Scroll
dw $0B00 ; BG1 Horizontal Scroll
dw $0B00 ; BG2 Horizontal Scroll
dw $0B78 ; Link X
dw $1527 ; Link Y
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
dw sram_ad_gtower_wizzrobes_2_after

preset_adold_gtower_torches_1:
db $02 ; Dungeon
dw $0095 ; Room Index
dw $120B ; BG1 Vertical Scroll
dw $120B ; BG2 Vertical Scroll
dw $0B00 ; BG1 Horizontal Scroll
dw $0B00 ; BG2 Horizontal Scroll
dw $0BD7 ; Link X
dw $1278 ; Link Y
dw $017F ; Camera X
dw $0083 ; Camera Y
dw $0000 ; Door Settings
dw $1200 ; Relative Coords HU
dw $1200 ; Relative Coords FU
dw $1210 ; Relative Coords HD
dw $1310 ; Relative Coords FD
dw $0B00 ; Relative Coords HL
dw $0A00 ; Relative Coords FL
dw $0B00 ; Relative Coords HR
dw $0B00 ; Relative Coords FR
dw $0200 ; Quadrant 1
dw $0001 ; Quadrant 2
db $0E ; Main Graphics
db $16 ; Music Track
db $04 ; Starting Floor
db $1A ; Palace No
db $02 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_gtower_torches_1_after

preset_adold_gtower_torches_2:
db $02 ; Dungeon
dw $0096 ; Room Index
dw $1310 ; BG1 Vertical Scroll
dw $1310 ; BG2 Vertical Scroll
dw $0D00 ; BG1 Horizontal Scroll
dw $0D00 ; BG2 Horizontal Scroll
dw $0D78 ; Link X
dw $139F ; Link Y
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
dw sram_ad_gtower_torches_2_after

preset_adold_gtower_helma_key:
db $02 ; Dungeon
dw $003D ; Room Index
dw $0708 ; BG1 Vertical Scroll
dw $0700 ; BG2 Vertical Scroll
dw $1B00 ; BG1 Horizontal Scroll
dw $1B00 ; BG2 Horizontal Scroll
dw $1B78 ; Link X
dw $0721 ; Link Y
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
dw sram_ad_gtower_helma_key_after

preset_adold_gtower_bombable_wall:
db $02 ; Dungeon
dw $003D ; Room Index
dw $060E ; BG1 Vertical Scroll
dw $060B ; BG2 Vertical Scroll
dw $1B00 ; BG1 Horizontal Scroll
dw $1B00 ; BG2 Horizontal Scroll
dw $1B17 ; Link X
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
dw sram_ad_gtower_bombable_wall_after

preset_adold_gtower_moldorm_2:
db $02 ; Dungeon
dw $003D ; Room Index
dw $0708 ; BG1 Vertical Scroll
dw $0710 ; BG2 Vertical Scroll
dw $1A00 ; BG1 Horizontal Scroll
dw $1A00 ; BG2 Horizontal Scroll
dw $1A78 ; Link X
dw $07D3 ; Link Y
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
dw sram_ad_gtower_moldorm_2_after

preset_adold_gtower_agahnim_2:
db $02 ; Dungeon
dw $001D ; Room Index
dw $0200 ; BG1 Vertical Scroll
dw $0200 ; BG2 Vertical Scroll
dw $1A00 ; BG1 Horizontal Scroll
dw $1A00 ; BG2 Horizontal Scroll
dw $1A78 ; Link X
dw $0222 ; Link Y
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
dw sram_ad_gtower_agahnim_2_after

preset_adold_aga_pyramid:
db $01 ; Overworld
dw $005B ; Screen Index
dw $07F1 ; Link X
dw $065C ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0778 ; BG1 Horizontal Scroll
dw $0779 ; BG2 Horizontal Scroll
dw $07F8 ; Scroll X
dw $066D ; Scroll Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF7 ; Unknown 3
dw sram_ad_aga_pyramid_after

preset_adold_aga_gold_knights:
db $02 ; Dungeon
dw $00E0 ; Room Index
dw $1D00 ; BG1 Vertical Scroll
dw $1D00 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $1D1E ; Link Y
dw $007F ; Camera X
dw $0177 ; Camera Y
dw $0000 ; Door Settings
dw $1D00 ; Relative Coords HU
dw $1C00 ; Relative Coords FU
dw $1D10 ; Relative Coords HD
dw $1D10 ; Relative Coords FD
dw $0000 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0000 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0200 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $01 ; Starting Floor
db $08 ; Palace No
db $01 ; Door Orientation
db $00 ; Starting Background
dw sram_ad_aga_gold_knights_after

preset_adold_aga_dark_room_of_despair:
db $02 ; Dungeon
dw $00D0 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $1A0B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $0117 ; Link X
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
dw sram_ad_aga_dark_room_of_despair_after

preset_adold_aga_dark_room_of_melancholy:
db $02 ; Dungeon
dw $00C0 ; Room Index
dw $0105 ; BG1 Vertical Scroll
dw $190B ; BG2 Vertical Scroll
dw $004E ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $011A ; Link X
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
dw sram_ad_aga_dark_room_of_melancholy_after

preset_adold_aga_spear_guards:
db $02 ; Dungeon
dw $00C0 ; Room Index
dw $0040 ; BG1 Vertical Scroll
dw $1800 ; BG2 Vertical Scroll
dw $FFFF ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $0178 ; Link X
dw $182D ; Link Y
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
dw sram_ad_aga_spear_guards_after

preset_adold_aga_circle_of_pots:
db $02 ; Dungeon
dw $00B0 ; Room Index
dw $1610 ; BG1 Vertical Scroll
dw $1610 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $16DC ; Link Y
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
dw sram_ad_aga_circle_of_pots_after

preset_adold_aga_pit_room:
db $02 ; Dungeon
dw $0040 ; Room Index
dw $090B ; BG1 Vertical Scroll
dw $090B ; BG2 Vertical Scroll
dw $0100 ; BG1 Horizontal Scroll
dw $0100 ; BG2 Horizontal Scroll
dw $012C ; Link X
dw $0978 ; Link Y
dw $017F ; Camera X
dw $0183 ; Camera Y
dw $0000 ; Door Settings
dw $0900 ; Relative Coords HU
dw $0800 ; Relative Coords FU
dw $0910 ; Relative Coords HD
dw $0910 ; Relative Coords FD
dw $0100 ; Relative Coords HL
dw $0000 ; Relative Coords FL
dw $0100 ; Relative Coords HR
dw $0100 ; Relative Coords FR
dw $0000 ; Quadrant 1
dw $0201 ; Quadrant 2
db $04 ; Main Graphics
db $10 ; Music Track
db $05 ; Starting Floor
db $08 ; Palace No
db $02 ; Door Orientation
db $01 ; Starting Background
dw sram_ad_aga_pit_room_after

preset_adold_aga_agahnim:
db $02 ; Dungeon
dw $0030 ; Room Index
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0000 ; BG1 Horizontal Scroll
dw $0000 ; BG2 Horizontal Scroll
dw $0078 ; Link X
dw $0624 ; Link Y
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
dw sram_ad_aga_agahnim_after

preset_adold_ganon_pyramid:
db $01 ; Overworld
dw $005B ; Screen Index
dw $07F0 ; Link X
dw $065C ; Link Y
dw $0600 ; BG1 Vertical Scroll
dw $0600 ; BG2 Vertical Scroll
dw $0778 ; BG1 Horizontal Scroll
dw $0778 ; BG2 Horizontal Scroll
dw $07F7 ; Scroll X
dw $066D ; Scroll Y
dw $002E ; Unknown 1
dw $0000 ; Unknown 2
dw $FFF8 ; Unknown 3
dw sram_ad_ganon_pyramid_after


; Preset SRAM changes

sram_ad_escape_links_bed:
dl $7E0542 : db $02 : dw $16CA ; Object tilemap state
dl SA1RAM.HUD+$04A : db $01 : db $7F ; Selected menu gfx, row 1
dl $7EF36F : db $01 : db $FF ; Keys
dl SA1RAM.HUD+$08A : db $01 : db $7F ; Selected menu gfx, row 2
dl $7EF208 : db $02 : dw $0002 ; Room $0104: Unknown (...............q)
dl $7EF20C : db $02 : dw $F000 ; Room $0106: Unknown (.dddb...........)
dl $7EF36C : db $02 : dw $1818 ; Health (goal)
dl $7EF378 : db $02 : dw $F800 ; ????
dl $7EF3D8 : db $02 : dw $2A00 ;
dl $7EF3DC : db $02 : dw $8C01 ; Player name
dl $7EF3E0 : db $02 : dw $AA01 ; Player name
dl $7EF400 : db $02 : dw $FF00 ; Deaths
dl $7EF20E : db $02 : dw $F000 ; Room $0107: Unknown (.dddb...........)
dl $7EF3DA : db $02 : dw $8C01 ; Player name
dl $7EF3DE : db $02 : dw $8C01 ; Player name
dl $7EF3E2 : db $02 : dw $0055 ; Player name
dl $7EF402 : db $02 : dw $00FF ; Deaths
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7EF4FE : db $02 : dw $F1EA ; Inverse checksum
dl $7EC167 : db $01 : db $7D ; Underworld exit cache
dl SA1RAM.HUD+$04B : db $01 : db $20 ; Selected menu gfx, row 1
dl SA1RAM.HUD+$08B : db $01 : db $20 ; Selected menu gfx, row 2
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0540 : db $02 : dw $15CA ; Object tilemap state
dl $7E0544 : db $02 : dw $17CA ; Object tilemap state
dl $7EC165 : db $01 : db $23 ; Underworld exit cache
dl SA1RAM.HUD+$04C : db $01 : db $7F ; Selected menu gfx, row 1
dl SA1RAM.HUD+$08C : db $01 : db $7F ; Selected menu gfx, row 2
dl $7EC142 : db $02 : dw $0015 ; Underworld exit cache
dl $7EC166 : db $01 : db $51 ; Underworld exit cache
dl SA1RAM.HUD+$04D : db $01 : db $20 ; Selected menu gfx, row 1
dl SA1RAM.HUD+$08D : db $01 : db $20 ; Selected menu gfx, row 2
.after

sram_ad_escape_courtyard:
dl $7E0542 : db $02 : dw $19E6 ; Object tilemap state
dl $7EF2BB : db $01 : db $00 ; Overworld $3B: Unknown (........)
dl $7EF2FB : db $01 : db $00 ; Overworld $7B: Unknown (........)
dl $7EF360 : db $02 : dw $0001 ; Rupees (goal)
dl $7EF3C8 : db $01 : db $03 ; Entrances Phase
dl $7EF359 : db $01 : db $01 ; Sword
dl $7EF3C5 : db $01 : db $01 ; Game Phase 1
dl $7EF0AA : db $02 : dw $000F ; Room $0055: Castle Secret Entrance / Uncle Death Room (.............qqq)
dl $7EF35A : db $01 : db $01 ; Shield
dl $7EF362 : db $02 : dw $0001 ; Rupees (actual)
dl $7EF3C6 : db $01 : db $11 ; Game Phase 2
dl $7FE0EF : db $01 : db $41 ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
dl $7E0303 : db $01 : db $00 ; Selected menu item
dl $7E0540 : db $02 : dw $18E6 ; Object tilemap state
dl $7E0544 : db $02 : dw $1850 ; Object tilemap state
dl $7E0202 : db $01 : db $00 ; Selected menu item
dl $7E0CBB : db $01 : db $00 ; Sprite drop
dl $7E010F : db $01 : db $00 ;
dl $7E0CC7 : db $01 : db $00 ; Sprite drop
dl $7EF051 : db $01 : db $00 ; Room $0028: Swamp Palace (Entrance Room) (................)
dl $7E0CC9 : db $01 : db $00 ; Sprite drop
dl $7E010E : db $01 : db $7D ; Dungeon entrance index
.after

sram_ad_escape_entrance:
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0CC1 : db $01 : db $00 ; Sprite drop
dl $7E0CC3 : db $01 : db $00 ; Sprite drop
dl $7E0CC5 : db $01 : db $00 ; Sprite drop
.after

sram_ad_escape_1st_key_guard:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF0A0 : db $02 : dw $0005 ; Room $0050: Hyrule Castle (West Corridor) (..............q.)
dl $7EF0C0 : db $02 : dw $0005 ; Room $0060: Hyrule Castle (West Entrance Room) (..............q.)
dl $7EF002 : db $02 : dw $000C ; Room $0001: Hyrule Castle (North Corridor) (.............qq.)
dl $7EF0C2 : db $02 : dw $000F ; Room $0061: Hyrule Castle (Main Entrance Room) (.............qqq)
dl $7FE0EF : db $01 : db $00 ; Room $B7 persistent: Turtle Rock (Map Chest / Key Chest / Roller Room)
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E010E : db $01 : db $04 ; Dungeon entrance index
.after

sram_ad_escape_stealth_room:
dl $7E0542 : db $02 : dw $2532 ; Object tilemap state
dl $7EF0E4 : db $02 : dw $840F ; Room $0072: Hyrule Castle (Map Chest Room) (.d....K......qqq)
dl $7EF104 : db $02 : dw $000F ; Room $0082: Hyrule Castle (Basement Chasm Room) (.............qqq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FE064 : db $02 : dw $0001 ; Room $72 persistent: Hyrule Castle (Map Chest Room)
dl $7E0540 : db $02 : dw $324C ; Object tilemap state
dl $7E0544 : db $02 : dw $2A32 ; Object tilemap state
dl $7E0CBD : db $01 : db $00 ; Sprite drop
dl $7E0CBF : db $01 : db $00 ; Sprite drop
.after

sram_ad_escape_2nd_key_guard:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7EF0E2 : db $02 : dw $0002 ; Room $0071: Hyrule Castle (Boomerang Chest Room) (...............q)
dl $7EF102 : db $02 : dw $000F ; Room $0081: Hyrule Castle (.............qqq)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0CBB : db $01 : db $01 ; Sprite drop
dl $7FE062 : db $02 : dw $0001 ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
.after

sram_ad_escape_ball_n_chains:
dl $7EF0E0 : db $02 : dw $0008 ; Room $0070: Hyrule Castle (Small Corridor to Jail Cells) (.............q..)
dl $7EF341 : db $01 : db $01 ; Boomerang
dl $7EF0E2 : db $02 : dw $841B ; Room $0071: Hyrule Castle (Boomerang Chest Room) (.d....K.....qq.q)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $02 ; Selected menu item
dl $7FE064 : db $02 : dw $0000 ; Room $72 persistent: Hyrule Castle (Map Chest Room)
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0202 : db $01 : db $02 ; Selected menu item
dl $7E0CBB : db $01 : db $00 ; Sprite drop
dl $7FE062 : db $02 : dw $0003 ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
dl $7E02A2 : db $01 : db $00 ; Arc variable
.after

sram_ad_escape_backtracking:
dl $7E0542 : db $02 : dw $0434 ; Object tilemap state
dl $7EF3D3 : db $01 : db $00 ; Super Bomb Boom
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF100 : db $02 : dw $043C ; Room $0080: Hyrule Castle (Jail Cell Room) (......K....cqqq.)
dl $7EF3C8 : db $01 : db $02 ; Entrances Phase
dl $7EF3CC : db $01 : db $01 ; Tagalong
dl $7EF3E5 : db $02 : dw $0000 ; Validity (checksum)
dl $7EF34A : db $01 : db $01 ; Torch
dl $7EF366 : db $02 : dw $4000 ; BigKey1
dl $7FE080 : db $02 : dw $0004 ; Room $80 persistent: Hyrule Castle (Jail Cell Room)
dl $7E0540 : db $02 : dw $0430 ; Object tilemap state
dl $7E0544 : db $02 : dw $0438 ; Object tilemap state
.after

sram_ad_escape_key_guard_revisit:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0CBA : db $01 : db $01 ; Sprite drop
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7FE062 : db $02 : dw $0000 ; Room $71 persistent: Hyrule Castle (Boomerang Chest Room)
.after

sram_ad_escape_throne_room:
dl $7E0CBA : db $01 : db $00 ; Sprite drop
dl $7FE080 : db $02 : dw $0000 ; Room $80 persistent: Hyrule Castle (Jail Cell Room)
.after

sram_ad_escape_snake_avoidance:
dl $7E0542 : db $02 : dw $0F34 ; Object tilemap state
dl $7E0546 : db $02 : dw $1694 ; Object tilemap state
dl $7E054A : db $02 : dw $0E70 ; Object tilemap state
dl $7EF3C8 : db $01 : db $04 ; Entrances Phase
dl $7EF082 : db $02 : dw $000F ; Room $0041: Hyrule Castle (First Dark Room) (.............qqq)
dl $7EF0A2 : db $02 : dw $000F ; Room $0051: Hyrule Castle (Throne Room) (.............qqq)
dl $7E0540 : db $02 : dw $0A64 ; Object tilemap state
dl $7E0544 : db $02 : dw $1034 ; Object tilemap state
dl $7E0548 : db $02 : dw $053E ; Object tilemap state
dl $7E054C : db $02 : dw $1590 ; Object tilemap state
.after

sram_ad_escape_sewer_rooms:
dl $7E0542 : db $02 : dw $0B8A ; Object tilemap state
dl $7E0546 : db $02 : dw $0FF2 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7EF064 : db $02 : dw $801F ; Room $0032: Hyrule Castle (Sewer Key Chest Room) (.d..........qqqq)
dl $7EF084 : db $02 : dw $000C ; Room $0042: Hyrule Castle (6 Ropes Room) (.............qq.)
dl $7E0540 : db $02 : dw $0D1C ; Object tilemap state
dl $7E0544 : db $02 : dw $0BF2 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
.after

sram_ad_escape_keyrat:
dl $7E0542 : db $02 : dw $1C64 ; Object tilemap state
dl $7E0546 : db $02 : dw $18A8 ; Object tilemap state
dl $7E054A : db $02 : dw $1C30 ; Object tilemap state
dl $7E054E : db $02 : dw $0CEA ; Object tilemap state
dl $7E0552 : db $02 : dw $1C8A ; Object tilemap state
dl $7EF044 : db $02 : dw $8003 ; Room $0022: Hyrule Castle (Sewer Text Trigger Room) (.d.............q)
dl $7E0CBA : db $01 : db $01 ; Sprite drop
dl $7EF042 : db $02 : dw $0003 ; Room $0021: Hyrule Castle (Key-rat Room) (...............q)
dl $7E0540 : db $02 : dw $14A0 ; Object tilemap state
dl $7E0544 : db $02 : dw $1C68 ; Object tilemap state
dl $7E0548 : db $02 : dw $1C52 ; Object tilemap state
dl $7E054C : db $02 : dw $0C92 ; Object tilemap state
dl $7E0550 : db $02 : dw $138A ; Object tilemap state
.after

sram_ad_escape_last_two:
dl $7E0542 : db $02 : dw $0F98 ; Object tilemap state
dl $7E0546 : db $02 : dw $1390 ; Object tilemap state
dl $7E054A : db $02 : dw $13A0 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0CBA : db $01 : db $00 ; Sprite drop
dl $7EF022 : db $02 : dw $2005 ; Room $0011: Hyrule Castle (Bombable Stock Room) (...d..........q.)
dl $7EF042 : db $02 : dw $840F ; Room $0021: Hyrule Castle (Key-rat Room) (.d....K......qqq)
dl $7E0540 : db $02 : dw $0F90 ; Object tilemap state
dl $7E0544 : db $02 : dw $0FA0 ; Object tilemap state
dl $7E0548 : db $02 : dw $1398 ; Object tilemap state
dl $7E054C : db $02 : dw $455E ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7FDFA2 : db $02 : dw $0020 ; Room $11 persistent: Hyrule Castle (Bombable Stock Room)
dl $7FDFC2 : db $02 : dw $0001 ; Room $21 persistent: Hyrule Castle (Key-rat Room)
.after

sram_ad_eastern_before_cutscene:
dl $7E0542 : db $02 : dw $2850 ; Object tilemap state
dl $7E0546 : db $02 : dw $2A2C ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E0642 : db $01 : db $01 ; Room puzzle state (?)
dl $7E0B09 : db $01 : db $B0 ; Arc variable
dl $7E0B31 : db $01 : db $00 ; Arc variable
dl $7E0B35 : db $01 : db $00 ; Arc variable
dl $7E0B39 : db $01 : db $00 ; Arc variable
dl $7E0B3D : db $01 : db $00 ; Arc variable
dl $7EF004 : db $02 : dw $000F ; Room $0002: Hyrule Castle (Switch Room) (.............qqq)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $2650 ; Object tilemap state
dl $7E0544 : db $02 : dw $282C ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0B3A : db $01 : db $00 ; Arc variable
dl $7E0B32 : db $01 : db $00 ; Arc variable
dl $7E0B33 : db $01 : db $00 ; Arc variable
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0B3B : db $01 : db $00 ; Arc variable
dl $7E0B3F : db $01 : db $00 ; Arc variable
dl $7E0B3E : db $01 : db $00 ; Arc variable
dl $7E0B36 : db $01 : db $00 ; Arc variable
dl $7E0B0C : db $01 : db $A0 ; Arc variable
dl $7E0B34 : db $01 : db $00 ; Arc variable
dl $7E0B3C : db $01 : db $00 ; Arc variable
.after

sram_ad_eastern_links_house:
dl $7E0542 : db $02 : dw $16CA ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E0642 : db $01 : db $00 ; Room puzzle state (?)
dl $7EF29B : db $01 : db $20 ; Overworld $1B: Unknown (...?....)
dl $7E0ABD : db $01 : db $00 ; Palette swap
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3C7 : db $01 : db $01 ; Map Phase
dl $7EF3E3 : db $02 : dw $0000 ; Player name
dl $7EF3FF : db $02 : dw $0001 ; Deaths
dl $7EF024 : db $02 : dw $000F ; Room $0012: Sanctuary (.............qqq)
dl $7EF340 : db $02 : dw $0100 ; Bow
dl $7EF358 : db $02 : dw $0100 ;
dl $7EF3C4 : db $02 : dw $0200 ;
dl $7EF3C8 : db $01 : db $01 ; Entrances Phase
dl $7EF3CC : db $02 : dw $0000 ; Tagalong
dl $7EF36D : db $01 : db $18 ; Health (actual)
dl $7EF3C5 : db $01 : db $02 ; Game Phase 1
dl $7EF29A : db $02 : dw $2000 ; Overworld $1A: Unknown (........)
dl $7EF3C6 : db $02 : dw $0115 ; Game Phase 2
dl $7EF3FE : db $02 : dw $0100 ; Deaths
dl $7EF4FE : db $02 : dw $DA90 ; Inverse checksum
dl $7EC140 : db $02 : dw $001B ; Underworld exit cache
dl $7EC150 : db $02 : dw $0078 ; Underworld exit cache
dl $7EC154 : db $02 : dw $0200 ; Underworld exit cache
dl $7EC158 : db $02 : dw $0210 ; Underworld exit cache
dl $7EC16C : db $02 : dw $FFFA ; Underworld exit cache
dl $7EC170 : db $02 : dw $FFF6 ; Underworld exit cache
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0540 : db $02 : dw $15CA ; Object tilemap state
dl $7E0544 : db $02 : dw $17CA ; Object tilemap state
dl $7FDFA2 : db $01 : db $00 ; Room $11 persistent: Hyrule Castle (Bombable Stock Room)
dl $7FDFC2 : db $01 : db $00 ; Room $21 persistent: Hyrule Castle (Key-rat Room)
dl $7EC142 : db $02 : dw $0004 ; Underworld exit cache
dl $7EC152 : db $02 : dw $00FF ; Underworld exit cache
dl $7EC156 : db $02 : dw $0200 ; Underworld exit cache
dl $7EC15A : db $02 : dw $0310 ; Underworld exit cache
dl $7EC15E : db $02 : dw $0110 ; Underworld exit cache
dl $7EC162 : db $02 : dw $0100 ; Underworld exit cache
dl $7EC16A : db $02 : dw $0006 ; Underworld exit cache
dl $7EC16E : db $02 : dw $000A ; Underworld exit cache
dl $7E010E : db $02 : dw $0000 ; Dungeon entrance index
.after

sram_ad_eastern_ep_overworld:
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7FE167 : db $01 : db $42 ; Overworld $F3 persistent: UNKNOWN
dl $7FE04E : db $01 : db $42 ; Overworld $67 persistent: UNKNOWN
dl $7EC172 : db $02 : dw $0080 ; Crystal switch state
.after

sram_ad_eastern_entrance:
dl $7E0542 : db $02 : dw $163C ; Object tilemap state
dl $7EF36F : db $01 : db $00 ; Keys
dl $7E0FC8 : db $01 : db $01 ; Prize pack index
dl $7EF192 : db $02 : dw $0003 ; Room $00C9: Eastern Palace (Entrance Room) (...............q)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FE167 : db $01 : db $00 ; Room $F3 persistent: House (Old Woman (Sahasrahla's Wife?))
dl $7E0540 : db $02 : dw $161E ; Object tilemap state
dl $7E0544 : db $02 : dw $165E ; Object tilemap state
dl $7FE04E : db $01 : db $00 ; Room $67 persistent: Skull Woods (Compass Chest Room)
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $01 : db $08 ; Dungeon entrance index
.after

sram_ad_eastern_stalfos_room:
dl $7E0542 : db $02 : dw $13B2 ; Object tilemap state
dl $7E0546 : db $02 : dw $1CB2 ; Object tilemap state
dl $7E054A : db $02 : dw $36E0 ; Object tilemap state
dl $7EF150 : db $02 : dw $0005 ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (..............q.)
dl $7EF152 : db $02 : dw $000F ; Room $00A9: Eastern Palace (Big Chest Room) (.............qqq)
dl $7EF172 : db $02 : dw $000F ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.............qqq)
dl $7EF192 : db $02 : dw $000F ; Room $00C9: Eastern Palace (Entrance Room) (.............qqq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0540 : db $02 : dw $138A ; Object tilemap state
dl $7E0544 : db $02 : dw $1C8A ; Object tilemap state
dl $7E0548 : db $02 : dw $181E ; Object tilemap state
dl $7E0B0C : db $01 : db $20 ; Arc variable
.after

sram_ad_eastern_big_chest_room_1:
dl $7E0FCC : db $01 : db $02 ; Prize pack index
dl $7EF150 : db $02 : dw $000F ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (.............qqq)
dl $7E002F : db $01 : db $06 ; Link's direction
.after

sram_ad_eastern_dark_key_room:
dl $7E0542 : db $02 : dw $0A4C ; Object tilemap state
dl $7E0546 : db $02 : dw $045E ; Object tilemap state
dl $7E054A : db $02 : dw $0864 ; Object tilemap state
dl $7E054E : db $02 : dw $0A70 ; Object tilemap state
dl $7EF377 : db $01 : db $05 ; Arrows
dl $7EF154 : db $02 : dw $000A ; Room $00AA: Eastern Palace (Map Chest Room) (.............q.q)
dl $7EF174 : db $02 : dw $0008 ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.............q..)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0468 : db $01 : db $00 ; Trap door state
dl $7E0540 : db $02 : dw $064C ; Object tilemap state
dl $7E0544 : db $02 : dw $0858 ; Object tilemap state
dl $7E0548 : db $02 : dw $0C5E ; Object tilemap state
dl $7E054C : db $02 : dw $0670 ; Object tilemap state
.after

sram_ad_eastern_big_key_dmg_boost:
dl $7E0542 : db $02 : dw $1260 ; Object tilemap state
dl $7E0546 : db $02 : dw $126C ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0FCC : db $01 : db $03 ; Prize pack index
dl $7EF174 : db $02 : dw $840C ; Room $00BA: Eastern Palace (Dark Antifairy / Key Pot Room) (.d....K......qq.)
dl $7EF172 : db $02 : dw $800F ; Room $00B9: Eastern Palace (Lobby Cannonballs Room) (.d...........qqq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FE0F4 : db $02 : dw $0001 ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0540 : db $02 : dw $125C ; Object tilemap state
dl $7E0544 : db $02 : dw $1268 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $FF ; Arc variable
.after

sram_ad_eastern_big_chest_room_2:
dl $7E0542 : db $02 : dw $13B2 ; Object tilemap state
dl $7E0546 : db $02 : dw $1CB2 ; Object tilemap state
dl $7E054A : db $02 : dw $35E0 ; Object tilemap state
dl $7EF150 : db $02 : dw $200F ; Room $00A8: Eastern Palace (Stalfos Spawn Room) (...d.........qqq)
dl $7EF170 : db $02 : dw $8015 ; Room $00B8: Eastern Palace (Big Key Room) (.d..........q.q.)
dl $7EF36D : db $01 : db $0C ; Health (actual)
dl $7EF366 : db $02 : dw $6000 ; BigKey1
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0540 : db $02 : dw $138A ; Object tilemap state
dl $7E0544 : db $02 : dw $1C8A ; Object tilemap state
dl $7E0548 : db $02 : dw $181E ; Object tilemap state
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0641 : db $02 : dw $0001 ; Room puzzle state (?)
.after

sram_ad_eastern_gifted_with_greenies:
dl $7E0542 : db $02 : dw $1370 ; Object tilemap state
dl $7E0546 : db $02 : dw $1410 ; Object tilemap state
dl $7E054A : db $02 : dw $2C90 ; Object tilemap state
dl $7E054E : db $02 : dw $2CEC ; Object tilemap state
dl $7EF377 : db $01 : db $0F ; Arrows
dl $7EF340 : db $01 : db $02 ; Bow
dl $7EF152 : db $02 : dw $201F ; Room $00A9: Eastern Palace (Big Chest Room) (...d........qqqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FE0F4 : db $02 : dw $0000 ; Room $BA persistent: Eastern Palace (Dark Antifairy / Key Pot Room)
dl $7E0540 : db $02 : dw $146C ; Object tilemap state
dl $7E0544 : db $02 : dw $130C ; Object tilemap state
dl $7E0548 : db $02 : dw $2B90 ; Object tilemap state
dl $7E054C : db $02 : dw $2BEC ; Object tilemap state
dl $7E0641 : db $01 : db $00 ; Room puzzle state (?)
.after

sram_ad_eastern_pot_room:
dl $7E0542 : db $02 : dw $1454 ; Object tilemap state
dl $7E0546 : db $02 : dw $1CAA ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7EF34F : db $01 : db $00 ; Bottles
dl $7EF373 : db $01 : db $00 ; Magic filler
dl $7EF377 : db $01 : db $0E ; Arrows
dl $7EF132 : db $02 : dw $C403 ; Room $0099: Eastern Palace (Eyegore Key Room) (.dd...K........q)
dl $7EF36E : db $01 : db $10 ; Magic Power
dl $7E0303 : db $01 : db $03 ; Selected menu item
dl $7E0540 : db $02 : dw $1428 ; Object tilemap state
dl $7E0544 : db $02 : dw $13BE ; Object tilemap state
dl $7E0548 : db $02 : dw $1CD2 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7FE0B2 : db $02 : dw $0008 ; Room $99 persistent: Eastern Palace (Eyegore Key Room)
.after

sram_ad_eastern_zeldagamer_room:
dl $7E0542 : db $02 : dw $1C5C ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7EF377 : db $01 : db $18 ; Arrows
dl $7EF1B4 : db $02 : dw $0002 ; Room $00DA: Eastern Palace (...............q)
dl $7EF1B2 : db $02 : dw $0003 ; Room $00D9: Eastern Palace (Canonball Room) (...............q)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0468 : db $01 : db $00 ; Trap door state
dl $7E0540 : db $02 : dw $145C ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
.after

sram_ad_eastern_armos:
dl $7E0542 : db $02 : dw $0ACA ; Object tilemap state
dl $7E0546 : db $02 : dw $0AF2 ; Object tilemap state
dl $7E054A : db $02 : dw $08F2 ; Object tilemap state
dl $7E054E : db $02 : dw $1860 ; Object tilemap state
dl $7EF377 : db $01 : db $16 ; Arrows
dl $7E0FC8 : db $01 : db $03 ; Prize pack index
dl $7EF1B0 : db $02 : dw $0005 ; Room $00D8: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room) (..............q.)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $08CA ; Object tilemap state
dl $7E0544 : db $02 : dw $0CCA ; Object tilemap state
dl $7E0548 : db $02 : dw $0CF2 ; Object tilemap state
dl $7E054C : db $02 : dw $185C ; Object tilemap state
dl $7FE130 : db $02 : dw $07FF ; Room $D8 persistent: Eastern Palace (Zeldagamer Room / Pre-Armos Knights Room)
.after

sram_ad_pod_outside_ep:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0B09 : db $01 : db $00 ; Arc variable
dl $7E0B31 : db $01 : db $30 ; Arc variable
dl $7E0B35 : db $01 : db $30 ; Arc variable
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF377 : db $01 : db $04 ; Arrows
dl $7EF3E7 : db $02 : dw $0001 ; Deaths
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF190 : db $02 : dw $0801 ; Room $00C8: Eastern Palace (Armos Knights[Boss]) (.....k..........)
dl $7EF36C : db $01 : db $20 ; Health (goal)
dl $7EF374 : db $01 : db $04 ; Pendants
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FE103 : db $01 : db $52 ; Overworld $C1 persistent: UNKNOWN
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $17 ; Arc variable
dl $7E0B32 : db $01 : db $30 ; Arc variable
dl $7E0B33 : db $01 : db $30 ; Arc variable
dl $7E0B37 : db $01 : db $91 ; Arc variable
dl $7FE06E : db $01 : db $52 ; Overworld $77 persistent: Black Ice Cave
dl $7FE0B2 : db $01 : db $00 ; Overworld $99 persistent: UNKNOWN
dl $7E0B08 : db $01 : db $40 ; Arc variable
dl $7E0B30 : db $01 : db $30 ; Arc variable
dl $7E0B34 : db $01 : db $30 ; Arc variable
dl $7FE130 : db $01 : db $00 ; Overworld $D8 persistent: UNKNOWN
.after

sram_ad_pod_sanctuary:
dl $7EF343 : db $01 : db $03 ; Bombs
dl $7EF36F : db $01 : db $00 ; Keys
dl $7E0FC8 : db $02 : dw $0000 ; Prize pack index
dl $7E0FCC : db $02 : dw $0000 ; Prize pack index
dl $7EF3C7 : db $01 : db $03 ; Map Phase
dl $7EF3FF : db $02 : dw $0001 ; Deaths
dl $7EF354 : db $02 : dw $0100 ; Gloves
dl $7EF36C : db $02 : dw $1820 ; Health (goal)
dl $7EF378 : db $02 : dw $FC00 ; ????
dl $7EF355 : db $01 : db $01 ; Boots
dl $7EF36D : db $01 : db $18 ; Health (actual)
dl $7EF375 : db $01 : db $00 ; Bomb filler
dl $7EF379 : db $01 : db $FC ; Ability Flags
dl $7EF20A : db $02 : dw $802A ; Room $0105: Unknown (.d.........c.q.q)
dl $7EF342 : db $02 : dw $0300 ; Hookshot
dl $7EF36E : db $02 : dw $FF80 ; Magic Power
dl $7EF376 : db $02 : dw $0400 ; Arrow filler
dl $7EF3C6 : db $02 : dw $0315 ; Game Phase 2
dl $7EF3E6 : db $02 : dw $0100 ;
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7EF4FE : db $02 : dw $9B53 ; Inverse checksum
dl $7FE103 : db $01 : db $00 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7FE06E : db $01 : db $00 ; Room $77 persistent: Tower of Hera (Entrance Room)
dl $7E010E : db $02 : dw $0002 ; Dungeon entrance index
.after

sram_ad_pod_dma:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF024 : db $02 : dw $001F ; Room $0012: Sanctuary (............qqqq)
dl $7EF36C : db $01 : db $28 ; Health (goal)
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FE165 : db $01 : db $43 ; Overworld $F2 persistent: UNKNOWN
dl $7EC172 : db $02 : dw $08A0 ; Crystal switch state
.after

sram_ad_pod_death_mountain:
dl $7EF1E0 : db $02 : dw $000F ; Room $00F0: Cave (Lost Old Man Starting Cave) (.............qqq)
dl $7EF3C8 : db $01 : db $05 ; Entrances Phase
dl $7EF3CC : db $01 : db $04 ; Tagalong
dl $7EF1E2 : db $02 : dw $000F ; Room $00F1: Cave (Lost Old Man Starting Cave) (.............qqq)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0540 : db $02 : dw $0540 ; Object tilemap state
dl $7FE165 : db $01 : db $00 ; Room $F2 persistent: House
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7FE162 : db $02 : dw $0001 ; Room $F1 persistent: Cave (Lost Old Man Starting Cave)
dl $7E010E : db $01 : db $07 ; Dungeon entrance index
.after

sram_ad_pod_after_mirror:
dl $7EF353 : db $01 : db $02 ; Magic Mirror
dl $7EF3C8 : db $01 : db $01 ; Entrances Phase
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7FE162 : db $01 : db $00 ; Overworld $F1 persistent: UNKNOWN
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
.after

sram_ad_pod_kiki_skip:
dl $7E002F : db $01 : db $00 ; Link's direction
.after

sram_ad_pod_dungeon_reload:
dl $7E0542 : db $02 : dw $0520 ; Object tilemap state
dl $7E0546 : db $02 : dw $0B20 ; Object tilemap state
dl $7E054A : db $02 : dw $0844 ; Object tilemap state
dl $7E054E : db $02 : dw $056E ; Object tilemap state
dl $7E0552 : db $02 : dw $0B6E ; Object tilemap state
dl $7EF343 : db $01 : db $04 ; Bombs
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF094 : db $02 : dw $200F ; Room $004A: Palace of Darkness (Entrance Room) (...d.........qqq)
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF012 : db $02 : dw $0008 ; Room $0009: Palace of Darkness (.............q..)
dl $7EF1F2 : db $02 : dw $000F ; Room $00F9: Cave (.............qqq)
dl $7E029F : db $01 : db $00 ; Arc variable
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7E0540 : db $02 : dw $050E ; Object tilemap state
dl $7E0544 : db $02 : dw $0B0E ; Object tilemap state
dl $7E0548 : db $02 : dw $0838 ; Object tilemap state
dl $7E054C : db $02 : dw $055C ; Object tilemap state
dl $7E0550 : db $02 : dw $0B5C ; Object tilemap state
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7FDFCB : db $01 : db $00 ; Room $25 persistent: Empty Clone Room
dl $7E010E : db $01 : db $26 ; Dungeon entrance index
.after

sram_ad_pod_main_hub_bk:
dl $7EF343 : db $01 : db $05 ; Bombs
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF012 : db $02 : dw $0018 ; Room $0009: Palace of Darkness (............qq..)
dl $7EF382 : db $01 : db $01 ; Key for dungeon $06
.after

sram_ad_pod_main_hub_hammerjump:
dl $7E0B35 : db $01 : db $00 ; Arc variable
dl $7EF014 : db $02 : dw $801F ; Room $000A: Palace of Darkness (Stalfos Trap Room) (.d..........qqqq)
dl $7EF074 : db $02 : dw $801F ; Room $003A: Palace of Darkness (Bombable Floor Room) (.d..........qqqq)
dl $7EF366 : db $02 : dw $6200 ; BigKey1
dl $7E0B33 : db $01 : db $00 ; Arc variable
dl $7E0B0C : db $01 : db $D0 ; Arc variable
dl $7E0B34 : db $01 : db $00 ; Arc variable
.after

sram_ad_pod_hammerjump:
dl $7E0542 : db $02 : dw $1350 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF054 : db $02 : dw $400F ; Room $002A: Palace of Darkness (Big Hub Room) (..d..........qqq)
dl $7E0540 : db $02 : dw $0C50 ; Object tilemap state
dl $7E0544 : db $02 : dw $1328 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
.after

sram_ad_pod_archery_contest:
dl $7E0542 : db $02 : dw $0B20 ; Object tilemap state
dl $7E0546 : db $02 : dw $0C20 ; Object tilemap state
dl $7EF343 : db $01 : db $07 ; Bombs
dl $7EF34B : db $01 : db $01 ; Hammer
dl $7EF034 : db $02 : dw $101A ; Room $001A: Palace of Darkness (Big Chest Room) (....b.......qq.q)
dl $7EF36D : db $01 : db $18 ; Health (actual)
dl $7EF382 : db $01 : db $00 ; Key for dungeon $06
dl $7E0540 : db $02 : dw $0B1C ; Object tilemap state
dl $7E0544 : db $02 : dw $0C1C ; Object tilemap state
dl $7E0548 : db $02 : dw $4E64 ; Object tilemap state
dl $7E0FCD : db $01 : db $01 ; Prize pack index
dl $7E0B37 : db $01 : db $02 ; Arc variable
dl $7E0B3F : db $01 : db $01 ; Arc variable
.after

sram_ad_pod_mimics:
dl $7E0542 : db $02 : dw $0610 ; Object tilemap state
dl $7E0546 : db $02 : dw $052C ; Object tilemap state
dl $7E054A : db $02 : dw $072C ; Object tilemap state
dl $7E054E : db $02 : dw $1692 ; Object tilemap state
dl $7E0552 : db $02 : dw $16AA ; Object tilemap state
dl $7E0556 : db $02 : dw $151E ; Object tilemap state
dl $7E0642 : db $01 : db $01 ; Room puzzle state (?)
dl $7EF343 : db $01 : db $09 ; Bombs
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF377 : db $01 : db $03 ; Arrows
dl $7EF054 : db $02 : dw $402F ; Room $002A: Palace of Darkness (Big Hub Room) (..d........c.qqq)
dl $7EF056 : db $02 : dw $000A ; Room $002B: Palace of Darkness (Map Chest / Fairy Room) (.............q.q)
dl $7E0303 : db $01 : db $03 ; Selected menu item
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $0510 ; Object tilemap state
dl $7E0544 : db $02 : dw $0710 ; Object tilemap state
dl $7E0548 : db $02 : dw $062C ; Object tilemap state
dl $7E054C : db $02 : dw $1592 ; Object tilemap state
dl $7E0550 : db $02 : dw $15AA ; Object tilemap state
dl $7E0554 : db $02 : dw $151A ; Object tilemap state
dl $7E0558 : db $02 : dw $1522 ; Object tilemap state
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7EC172 : db $01 : db $01 ; Crystal switch state
.after

sram_ad_pod_statue:
dl $7E0542 : db $02 : dw $1728 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E0642 : db $01 : db $00 ; Room puzzle state (?)
dl $7EF377 : db $01 : db $04 ; Arrows
dl $7EF036 : db $02 : dw $0002 ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (...............q)
dl $7EF376 : db $01 : db $00 ; Arrow filler
dl $7E0540 : db $02 : dw $1714 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7FDFB6 : db $02 : dw $0038 ; Room $1B persistent: Palace of Darkness (Mimics / Moving Wall Room)
dl $7E0FCB : db $01 : db $02 ; Prize pack index
.after

sram_ad_pod_basement:
dl $7EF377 : db $01 : db $02 ; Arrows
dl $7EF036 : db $02 : dw $008E ; Room $001B: Palace of Darkness (Mimics / Moving Wall Room) (.........c...qqq)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0303 : db $01 : db $04 ; Selected menu item
dl $7E0468 : db $01 : db $01 ; Trap door state
dl $7E0202 : db $01 : db $0C ; Selected menu item
dl $7EC172 : db $01 : db $00 ; Crystal switch state
.after

sram_ad_pod_turtle_room:
dl $7E0542 : db $02 : dw $0966 ; Object tilemap state
dl $7E0546 : db $02 : dw $03CA ; Object tilemap state
dl $7E054A : db $02 : dw $076A ; Object tilemap state
dl $7E054E : db $02 : dw $095E ; Object tilemap state
dl $7E0552 : db $02 : dw $085E ; Object tilemap state
dl $7E0556 : db $02 : dw $1814 ; Object tilemap state
dl $7E055A : db $02 : dw $1854 ; Object tilemap state
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF016 : db $02 : dw $200C ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qq.)
dl $7E0540 : db $02 : dw $0962 ; Object tilemap state
dl $7E0544 : db $02 : dw $096A ; Object tilemap state
dl $7E0548 : db $02 : dw $0CCA ; Object tilemap state
dl $7E054C : db $02 : dw $086A ; Object tilemap state
dl $7E0550 : db $02 : dw $075E ; Object tilemap state
dl $7E0554 : db $02 : dw $5760 ; Object tilemap state
dl $7E0558 : db $02 : dw $1828 ; Object tilemap state
dl $7E055C : db $02 : dw $1864 ; Object tilemap state
dl $7EC172 : db $01 : db $01 ; Crystal switch state
.after

sram_ad_pod_helma:
dl $7E0542 : db $02 : dw $03F2 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7E0FC8 : db $01 : db $05 ; Prize pack index
dl $7EF0D4 : db $02 : dw $8005 ; Room $006A: Palace of Darkness (Rupee Room) (.d............q.)
dl $7EF360 : db $02 : dw $0002 ; Rupees (goal)
dl $7EF016 : db $02 : dw $200F ; Room $000B: Palace of Darkness (Turtle Room) (...d.........qqq)
dl $7EF362 : db $02 : dw $0002 ; Rupees (actual)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FE054 : db $02 : dw $0010 ; Room $6A persistent: Palace of Darkness (Rupee Room)
dl $7E0540 : db $02 : dw $03CA ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E055C : db $02 : dw $0000 ; Object tilemap state
dl $7FDF96 : db $02 : dw $03F0 ; Room $B persistent: Palace of Darkness (Turtle Room)
.after

sram_ad_hera_outside_pod:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B09 : db $01 : db $08 ; Arc variable
dl $7E0B31 : db $01 : db $00 ; Arc variable
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3C7 : db $01 : db $07 ; Map Phase
dl $7EF3EF : db $02 : dw $0001 ; Deaths
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF0B4 : db $02 : dw $0801 ; Room $005A: Palace of Darkness (Helmasaur King[Boss]) (.....k..........)
dl $7EF36C : db $01 : db $30 ; Health (goal)
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7EF37A : db $01 : db $02 ; Crystals
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FE054 : db $01 : db $00 ; Overworld $6A persistent: Haunted Grove
dl $7FDFCD : db $01 : db $23 ; Overworld $26 persistent: UNKNOWN
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $08 ; Arc variable
dl $7E0B32 : db $01 : db $00 ; Arc variable
dl $7E0B33 : db $01 : db $0F ; Arc variable
dl $7FDF96 : db $01 : db $00 ; Overworld $B persistent: UNKNOWN
dl $7FDFB6 : db $01 : db $00 ; Overworld $1B persistent: Hyrule Castle
dl $7E0B08 : db $01 : db $02 ; Arc variable
dl $7E0B0C : db $01 : db $6E ; Arc variable
dl $7E0B30 : db $01 : db $0D ; Arc variable
.after

sram_ad_hera_old_man_cave:
dl $7E0542 : db $02 : dw $0A70 ; Object tilemap state
dl $7E0FC8 : db $02 : dw $0000 ; Prize pack index
dl $7EF3FF : db $02 : dw $0001 ; Deaths
dl $7EF1C8 : db $02 : dw $000A ; Room $00E4: Cave (Lost Old Man Final Cave) (.............q.q)
dl $7EF36C : db $02 : dw $2030 ; Health (goal)
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF342 : db $02 : dw $0900 ; Hookshot
dl $7EF34A : db $02 : dw $0101 ; Torch
dl $7EF352 : db $02 : dw $0200 ; Magic Cape
dl $7EF376 : db $02 : dw $0200 ; Arrow filler
dl $7EF3C6 : db $02 : dw $0715 ; Game Phase 2
dl $7EF3EE : db $02 : dw $0100 ; Deaths
dl $7EF4FE : db $02 : dw $6BA7 ; Inverse checksum
dl $7FDFCD : db $01 : db $00 ; Room $26 persistent: Swamp Palace (Statue Room)
dl $7E0540 : db $02 : dw $0920 ; Object tilemap state
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $02 : dw $0030 ; Dungeon entrance index
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0303 : db $01 : db $03 ; Selected menu item
.after

sram_ad_hera_entrance:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF0EE : db $02 : dw $000F ; Room $0077: Tower of Hera (Entrance Room) (.............qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0B3F : db $01 : db $00 ; Arc variable
dl $7E010E : db $01 : db $33 ; Dungeon entrance index
.after

sram_ad_hera_tile_room:
dl $7EF0EE : db $02 : dw $800F ; Room $0077: Tower of Hera (Entrance Room) (.d...........qqq)
dl $7EF10E : db $02 : dw $0402 ; Room $0087: Tower of Hera (Tile Room) (......K........q)
dl $7E0303 : db $01 : db $02 ; Selected menu item
dl $7E0202 : db $01 : db $02 ; Selected menu item
.after

sram_ad_hera_torches:
dl $7E0542 : db $02 : dw $0B10 ; Object tilemap state
dl $7E0546 : db $02 : dw $0C18 ; Object tilemap state
dl $7E054A : db $02 : dw $0C28 ; Object tilemap state
dl $7E054E : db $02 : dw $1470 ; Object tilemap state
dl $7E0552 : db $02 : dw $186C ; Object tilemap state
dl $7E0556 : db $02 : dw $1B6C ; Object tilemap state
dl $7EF10E : db $02 : dw $040E ; Room $0087: Tower of Hera (Tile Room) (......K......qqq)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0303 : db $01 : db $09 ; Selected menu item
dl $7E0540 : db $02 : dw $0B0C ; Object tilemap state
dl $7E0544 : db $02 : dw $0C10 ; Object tilemap state
dl $7E0548 : db $02 : dw $0C20 ; Object tilemap state
dl $7E054C : db $02 : dw $144C ; Object tilemap state
dl $7E0550 : db $02 : dw $1850 ; Object tilemap state
dl $7E0554 : db $02 : dw $1B50 ; Object tilemap state
dl $7E0B37 : db $01 : db $80 ; Arc variable
dl $7E0202 : db $01 : db $0B ; Selected menu item
.after

sram_ad_hera_beetles:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF10E : db $02 : dw $041F ; Room $0087: Tower of Hera (Tile Room) (......K.....qqqq)
dl $7EF366 : db $02 : dw $6220 ; BigKey1
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $00 ; Arc variable
dl $7E0202 : db $01 : db $14 ; Selected menu item
.after

sram_ad_hera_petting_zoo:
dl $7E0542 : db $02 : dw $1C60 ; Object tilemap state
dl $7EF343 : db $01 : db $0A ; Bombs
dl $7E0FCC : db $01 : db $02 ; Prize pack index
dl $7EF062 : db $02 : dw $800F ; Room $0031: Tower of Hera (Hardhat Beetles Room) (.d...........qqq)
dl $7E0540 : db $02 : dw $1C5C ; Object tilemap state
dl $7FDFE2 : db $02 : dw $0580 ; Room $31 persistent: Tower of Hera (Hardhat Beetles Room)
dl $7EC172 : db $01 : db $01 ; Crystal switch state
.after

sram_ad_hera_moldorm:
dl $7E0542 : db $02 : dw $0E64 ; Object tilemap state
dl $7E0546 : db $02 : dw $1064 ; Object tilemap state
dl $7E054A : db $02 : dw $1264 ; Object tilemap state
dl $7E054E : db $02 : dw $0E68 ; Object tilemap state
dl $7E0552 : db $02 : dw $1068 ; Object tilemap state
dl $7E0556 : db $02 : dw $1268 ; Object tilemap state
dl $7EF357 : db $01 : db $01 ; Moon Pearl
dl $7EF36D : db $01 : db $18 ; Health (actual)
dl $7EF02E : db $02 : dw $000F ; Room $0017: Tower of Hera (Moldorm Fall Room) (.............qqq)
dl $7EF04E : db $02 : dw $001F ; Room $0027: Tower of Hera (Big Chest) (............qqqq)
dl $7E0303 : db $01 : db $04 ; Selected menu item
dl $7E0540 : db $02 : dw $0D64 ; Object tilemap state
dl $7E0544 : db $02 : dw $0F64 ; Object tilemap state
dl $7E0548 : db $02 : dw $1164 ; Object tilemap state
dl $7E054C : db $02 : dw $0D68 ; Object tilemap state
dl $7E0550 : db $02 : dw $0F68 ; Object tilemap state
dl $7E0554 : db $02 : dw $1168 ; Object tilemap state
dl $7E0202 : db $01 : db $0C ; Selected menu item
.after

sram_ad_thieves_outside_hera:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3F7 : db $02 : dw $0001 ; Deaths
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF36C : db $01 : db $38 ; Health (goal)
dl $7EF374 : db $01 : db $05 ; Pendants
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7EF00E : db $02 : dw $080F ; Room $0007: Tower of Hera (Moldorm[Boss]) (.....k.......qqq)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $17 ; Arc variable
dl $7FDFE2 : db $01 : db $00 ; Overworld $31 persistent: UNKNOWN
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
.after

sram_ad_thieves_dmd:
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7FDFCB : db $01 : db $00 ; Overworld $25 persistent: Octorok Area
.after

sram_ad_thieves_entrance:
dl $7E0542 : db $02 : dw $0470 ; Object tilemap state
dl $7E0546 : db $02 : dw $333E ; Object tilemap state
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF2D8 : db $01 : db $20 ; Overworld $58: Unknown (...?....)
dl $7EF1B6 : db $02 : dw $000F ; Room $00DB: Thieves Town (Main (South West) Entrance Room) (.............qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $040C ; Object tilemap state
dl $7E0544 : db $02 : dw $1058 ; Object tilemap state
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $01 : db $34 ; Dungeon entrance index
.after

sram_ad_thieves_after_big_key:
dl $7EF198 : db $02 : dw $000F ; Room $00CC: Thieves Town (North East Entrance Room) (.............qqq)
dl $7EF1B8 : db $02 : dw $000F ; Room $00DC: Thieves Town (South East Entrance Room) (.............qqq)
dl $7EF196 : db $02 : dw $000F ; Room $00CB: Thieves Town (North West Entrance Room) (.............qqq)
dl $7EF1B6 : db $02 : dw $002F ; Room $00DB: Thieves Town (Main (South West) Entrance Room) (...........c.qqq)
dl $7EF366 : db $02 : dw $6230 ; BigKey1
dl $7E002F : db $01 : db $06 ; Link's direction
.after

sram_ad_thieves_stalfos_hallway:
dl $7E0542 : db $02 : dw $0424 ; Object tilemap state
dl $7E0546 : db $02 : dw $1C70 ; Object tilemap state
dl $7EF198 : db $02 : dw $800F ; Room $00CC: Thieves Town (North East Entrance Room) (.d...........qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $0470 ; Object tilemap state
dl $7E0544 : db $02 : dw $1C24 ; Object tilemap state
.after

sram_ad_thieves_conveyor_gibos:
dl $7E0542 : db $02 : dw $03B2 ; Object tilemap state
dl $7E0546 : db $02 : dw $0CB2 ; Object tilemap state
dl $7E054A : db $02 : dw $1430 ; Object tilemap state
dl $7E054E : db $02 : dw $1C30 ; Object tilemap state
dl $7E0552 : db $02 : dw $1520 ; Object tilemap state
dl $7E0556 : db $02 : dw $1B20 ; Object tilemap state
dl $7E055A : db $02 : dw $0466 ; Object tilemap state
dl $7EF178 : db $02 : dw $C407 ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K.......qq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0540 : db $02 : dw $038A ; Object tilemap state
dl $7E0544 : db $02 : dw $0C8A ; Object tilemap state
dl $7E0548 : db $02 : dw $140C ; Object tilemap state
dl $7E054C : db $02 : dw $1C0C ; Object tilemap state
dl $7E0550 : db $02 : dw $151C ; Object tilemap state
dl $7E0554 : db $02 : dw $1B1C ; Object tilemap state
dl $7E0558 : db $02 : dw $0456 ; Object tilemap state
.after

sram_ad_thieves_hellway:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7E0ABD : db $01 : db $01 ; Palette swap
dl $7EF176 : db $02 : dw $0001 ; Room $00BB: Thieves Town (Hellway) (................)
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
.after

sram_ad_thieves_bomb_floor:
dl $7E0542 : db $02 : dw $1560 ; Object tilemap state
dl $7E0546 : db $02 : dw $1660 ; Object tilemap state
dl $7E054A : db $02 : dw $1C68 ; Object tilemap state
dl $7E0ABD : db $01 : db $00 ; Palette swap
dl $7E0FC8 : db $01 : db $01 ; Prize pack index
dl $7EF0C8 : db $02 : dw $0003 ; Room $0064: Thieves Town (West Attic Room) (...............q)
dl $7EF0CA : db $02 : dw $0002 ; Room $0065: Thieves Town (East Attic Room) (...............q)
dl $7EF156 : db $02 : dw $8402 ; Room $00AB: Thieves Town (Moving Spikes / Key Pot Room) (.d....K........q)
dl $7EF176 : db $02 : dw $000B ; Room $00BB: Thieves Town (Hellway) (.............q.q)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7FE048 : db $02 : dw $0040 ; Room $64 persistent: Thieves Town (West Attic Room)
dl $7E0540 : db $02 : dw $155C ; Object tilemap state
dl $7E0544 : db $02 : dw $165C ; Object tilemap state
dl $7E0548 : db $02 : dw $1C64 ; Object tilemap state
dl $7E0B33 : db $01 : db $00 ; Arc variable
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7EC172 : db $01 : db $01 ; Crystal switch state
dl $7E0B0C : db $01 : db $B0 ; Arc variable
.after

sram_ad_thieves_backtracking:
dl $7E0542 : db $02 : dw $1610 ; Object tilemap state
dl $7E0546 : db $02 : dw $1C24 ; Object tilemap state
dl $7E054A : db $02 : dw $1C2C ; Object tilemap state
dl $7EF343 : db $01 : db $09 ; Bombs
dl $7EF0CA : db $02 : dw $0103 ; Room $0065: Thieves Town (East Attic Room) (........c......q)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E029F : db $01 : db $01 ; Arc variable
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7E0540 : db $02 : dw $160C ; Object tilemap state
dl $7E0544 : db $02 : dw $1614 ; Object tilemap state
dl $7E0548 : db $02 : dw $1C28 ; Object tilemap state
dl $7E054C : db $02 : dw $1C30 ; Object tilemap state
dl $7E0202 : db $01 : db $04 ; Selected menu item
.after

sram_ad_thieves_basement:
dl $7E0542 : db $02 : dw $03B2 ; Object tilemap state
dl $7E0546 : db $02 : dw $0CB2 ; Object tilemap state
dl $7E054A : db $02 : dw $1430 ; Object tilemap state
dl $7E054E : db $02 : dw $1C30 ; Object tilemap state
dl $7E0552 : db $02 : dw $1520 ; Object tilemap state
dl $7E0556 : db $02 : dw $1B20 ; Object tilemap state
dl $7E055A : db $02 : dw $0466 ; Object tilemap state
dl $7EF343 : db $01 : db $0A ; Bombs
dl $7EF178 : db $02 : dw $C40F ; Room $00BC: Thieves Town (Conveyor Toilet) (.dd...K......qqq)
dl $7EF176 : db $02 : dw $000F ; Room $00BB: Thieves Town (Hellway) (.............qqq)
dl $7E0540 : db $02 : dw $038A ; Object tilemap state
dl $7E0544 : db $02 : dw $0C8A ; Object tilemap state
dl $7E0548 : db $02 : dw $140C ; Object tilemap state
dl $7E054C : db $02 : dw $1C0C ; Object tilemap state
dl $7E0550 : db $02 : dw $151C ; Object tilemap state
dl $7E0554 : db $02 : dw $1B1C ; Object tilemap state
dl $7E0558 : db $02 : dw $0456 ; Object tilemap state
.after

sram_ad_thieves_prison:
dl $7E0542 : db $02 : dw $07A0 ; Object tilemap state
dl $7E0546 : db $02 : dw $08A0 ; Object tilemap state
dl $7E054A : db $02 : dw $0C30 ; Object tilemap state
dl $7E054E : db $02 : dw $0B6C ; Object tilemap state
dl $7E0552 : db $02 : dw $10EC ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7EF343 : db $01 : db $09 ; Bombs
dl $7EF088 : db $02 : dw $0005 ; Room $0044: Thieves Town (Big Chest Room) (..............q.)
dl $7EF08A : db $02 : dw $000A ; Room $0045: Thieves Town (Jail Cells Room) (.............q.q)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E029F : db $01 : db $00 ; Arc variable
dl $7E0303 : db $01 : db $04 ; Selected menu item
dl $7FE008 : db $02 : dw $0080 ; Room $44 persistent: Thieves Town (Big Chest Room)
dl $7FE048 : db $02 : dw $0000 ; Room $64 persistent: Thieves Town (West Attic Room)
dl $7E0540 : db $02 : dw $079C ; Object tilemap state
dl $7E0544 : db $02 : dw $089C ; Object tilemap state
dl $7E0548 : db $02 : dw $040C ; Object tilemap state
dl $7E054C : db $02 : dw $0B5C ; Object tilemap state
dl $7E0550 : db $02 : dw $10DC ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $A0 ; Arc variable
dl $7E0202 : db $01 : db $0C ; Selected menu item
dl $7FE00A : db $02 : dw $000E ; Room $45 persistent: Thieves Town (Jail Cells Room)
.after

sram_ad_thieves_backtracking_2:
dl $7E0542 : db $02 : dw $07D0 ; Object tilemap state
dl $7E0546 : db $02 : dw $08D0 ; Object tilemap state
dl $7E054A : db $02 : dw $1624 ; Object tilemap state
dl $7E054E : db $02 : dw $1828 ; Object tilemap state
dl $7E0552 : db $02 : dw $1A18 ; Object tilemap state
dl $7E0556 : db $02 : dw $1A20 ; Object tilemap state
dl $7EF088 : db $02 : dw $4017 ; Room $0044: Thieves Town (Big Chest Room) (..d.........q.qq)
dl $7EF354 : db $01 : db $02 ; Gloves
dl $7EF3CC : db $01 : db $06 ; Tagalong
dl $7EF08A : db $02 : dw $00FF ; Room $0045: Thieves Town (Jail Cells Room) (.........cccqqqq)
dl $7E0540 : db $02 : dw $07CC ; Object tilemap state
dl $7E0544 : db $02 : dw $08CC ; Object tilemap state
dl $7E0548 : db $02 : dw $1618 ; Object tilemap state
dl $7E054C : db $02 : dw $1728 ; Object tilemap state
dl $7E0550 : db $02 : dw $1928 ; Object tilemap state
dl $7E0554 : db $02 : dw $1A1C ; Object tilemap state
dl $7E0558 : db $02 : dw $1A24 ; Object tilemap state
dl $7E0B37 : db $01 : db $09 ; Arc variable
dl $7E0B3F : db $01 : db $01 ; Arc variable
.after

sram_ad_thieves_pot_hammerdash:
dl $7E0542 : db $02 : dw $07A0 ; Object tilemap state
dl $7E0546 : db $02 : dw $08A0 ; Object tilemap state
dl $7E054A : db $02 : dw $0C30 ; Object tilemap state
dl $7E054E : db $02 : dw $0B6C ; Object tilemap state
dl $7E0552 : db $02 : dw $10EC ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF377 : db $01 : db $07 ; Arrows
dl $7EF376 : db $01 : db $00 ; Arrow filler
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $079C ; Object tilemap state
dl $7E0544 : db $02 : dw $089C ; Object tilemap state
dl $7E0548 : db $02 : dw $040C ; Object tilemap state
dl $7E054C : db $02 : dw $0B5C ; Object tilemap state
dl $7E0550 : db $02 : dw $10DC ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $01 ; Arc variable
.after

sram_ad_thieves_blind:
dl $7E0542 : db $02 : dw $03B2 ; Object tilemap state
dl $7E0546 : db $02 : dw $0CB2 ; Object tilemap state
dl $7E054A : db $02 : dw $1430 ; Object tilemap state
dl $7E054E : db $02 : dw $1C30 ; Object tilemap state
dl $7E0552 : db $02 : dw $1520 ; Object tilemap state
dl $7E0556 : db $02 : dw $1B20 ; Object tilemap state
dl $7E055A : db $02 : dw $0466 ; Object tilemap state
dl $7FE0F8 : db $02 : dw $0002 ; Room $BC persistent: Thieves Town (Conveyor Toilet)
dl $7E0468 : db $01 : db $01 ; Trap door state
dl $7E0540 : db $02 : dw $038A ; Object tilemap state
dl $7E0544 : db $02 : dw $0C8A ; Object tilemap state
dl $7E0548 : db $02 : dw $140C ; Object tilemap state
dl $7E054C : db $02 : dw $1C0C ; Object tilemap state
dl $7E0550 : db $02 : dw $151C ; Object tilemap state
dl $7E0554 : db $02 : dw $1B1C ; Object tilemap state
dl $7E0558 : db $02 : dw $0456 ; Object tilemap state
.after

sram_ad_skull_outside_thieves:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF158 : db $02 : dw $0A01 ; Room $00AC: Thieves Town (Blind The Thief[Boss]) (.....k.R........)
dl $7EF36C : db $01 : db $40 ; Health (goal)
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF3F9 : db $02 : dw $0000 ; Deaths
dl $7EF37A : db $01 : db $22 ; Crystals
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FE008 : db $01 : db $00 ; Overworld $44 persistent: UNKNOWN
dl $7FE0F8 : db $01 : db $00 ; Overworld $BC persistent: UNKNOWN
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $0E ; Arc variable
dl $7EF387 : db $01 : db $00 ; Key for dungeon $0B
dl $7FE00A : db $01 : db $00 ; Overworld $45 persistent: Death Mountain East
dl $7FE0E3 : db $01 : db $13 ; Overworld $B1 persistent: UNKNOWN
dl $7FE148 : db $01 : db $26 ; Overworld $E4 persistent: UNKNOWN
.after

sram_ad_skull_cursed_dwarf:
dl $7EF343 : db $01 : db $08 ; Bombs
dl $7EF20C : db $02 : dw $F012 ; Room $0106: Unknown (.dddb.......q..q)
dl $7EF2D8 : db $01 : db $22 ; Overworld $58: Unknown (...?...?)
dl $7EF360 : db $02 : dw $012E ; Rupees (goal)
dl $7EF362 : db $02 : dw $012E ; Rupees (actual)
dl $7E029F : db $01 : db $11 ; Arc variable
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7E0540 : db $02 : dw $1B6C ; Object tilemap state
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $01 : db $48 ; Dungeon entrance index
.after

sram_ad_skull_getting_tempered:
dl $7E0542 : db $02 : dw $17DE ; Object tilemap state
dl $7E0546 : db $02 : dw $19D6 ; Object tilemap state
dl $7E054A : db $02 : dw $19E6 ; Object tilemap state
dl $7E054E : db $02 : dw $1BE6 ; Object tilemap state
dl $7EF3CC : db $01 : db $07 ; Tagalong
dl $7E1ABF : db $01 : db $90 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $02 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $88 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $0A ; Warp Vortex Coordinate
dl $7EF20E : db $02 : dw $F002 ; Room $0107: Unknown (.dddb..........q)
dl $7EF34E : db $01 : db $01 ; Book of Mudora
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0540 : db $02 : dw $17D6 ; Object tilemap state
dl $7E0544 : db $02 : dw $17E6 ; Object tilemap state
dl $7E0548 : db $02 : dw $19DE ; Object tilemap state
dl $7E054C : db $02 : dw $1BD6 ; Object tilemap state
dl $7E010E : db $01 : db $49 ; Dungeon entrance index
.after

sram_ad_skull_fencedash:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7EF360 : db $02 : dw $0124 ; Rupees (goal)
dl $7EF3CC : db $01 : db $00 ; Tagalong
dl $7E1ABF : db $01 : db $10 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $04 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $18 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $09 ; Warp Vortex Coordinate
dl $7EF359 : db $01 : db $03 ; Sword
dl $7EF3C9 : db $01 : db $20 ; Game Phase 3
dl $7EF242 : db $02 : dw $0002 ; Room $0121: Unknown (...............q)
dl $7EF362 : db $02 : dw $0124 ; Rupees (actual)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FDFDD : db $01 : db $B5 ; Overworld $2E persistent: South of Eastern Palace
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7FE0E3 : db $01 : db $00 ; Overworld $B1 persistent: UNKNOWN
dl $7E010E : db $01 : db $64 ; Dungeon entrance index
dl $7FE148 : db $01 : db $00 ; Overworld $E4 persistent: UNKNOWN
.after

sram_ad_skull_dash_to_skull_woods:
dl $7EF238 : db $02 : dw $0011 ; Room $011C: Unknown (............q...)
dl $7EF360 : db $02 : dw $0250 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0250 ; Rupees (actual)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FDFDD : db $01 : db $00 ; Overworld $2E persistent: South of Eastern Palace
dl $7FE0E3 : db $01 : db $13 ; Overworld $B1 persistent: UNKNOWN
dl $7E010E : db $01 : db $54 ; Dungeon entrance index
dl $7FE148 : db $01 : db $26 ; Overworld $E4 persistent: UNKNOWN
.after

sram_ad_skull_mummy_room:
dl $7FE0FA : db $01 : db $23 ; Overworld $BD persistent: UNKNOWN
dl $7EC172 : db $02 : dw $091A ; Crystal switch state
dl $7FE0E3 : db $01 : db $00 ; Overworld $B1 persistent: UNKNOWN
dl $7FE148 : db $01 : db $00 ; Overworld $E4 persistent: UNKNOWN
.after

sram_ad_skull_bomb_jump:
dl $7E0542 : db $02 : dw $0420 ; Object tilemap state
dl $7E0546 : db $02 : dw $161E ; Object tilemap state
dl $7E054A : db $02 : dw $1B4C ; Object tilemap state
dl $7E054E : db $02 : dw $175C ; Object tilemap state
dl $7EF377 : db $01 : db $0C ; Arrows
dl $7E0FCC : db $01 : db $04 ; Prize pack index
dl $7EF0AE : db $02 : dw $001A ; Room $0057: Skull Woods (Big Key Room) (............qq.q)
dl $7EF366 : db $02 : dw $62B0 ; BigKey1
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7E0540 : db $02 : dw $075C ; Object tilemap state
dl $7E0544 : db $02 : dw $140C ; Object tilemap state
dl $7E0548 : db $02 : dw $1430 ; Object tilemap state
dl $7E054C : db $02 : dw $1954 ; Object tilemap state
dl $7E0550 : db $02 : dw $1764 ; Object tilemap state
dl $7E0B37 : db $01 : db $FB ; Arc variable
dl $7E0B3F : db $01 : db $00 ; Arc variable
dl $7E0202 : db $01 : db $04 ; Selected menu item
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $01 : db $29 ; Dungeon entrance index
.after

sram_ad_skull_key_pot:
dl $7E0542 : db $02 : dw $140C ; Object tilemap state
dl $7E0546 : db $02 : dw $0A5C ; Object tilemap state
dl $7E054A : db $02 : dw $080C ; Object tilemap state
dl $7E054E : db $02 : dw $0614 ; Object tilemap state
dl $7E0552 : db $02 : dw $0724 ; Object tilemap state
dl $7E0556 : db $02 : dw $0918 ; Object tilemap state
dl $7E055A : db $02 : dw $0924 ; Object tilemap state
dl $7EF343 : db $01 : db $07 ; Bombs
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF0AC : db $02 : dw $0005 ; Room $0056: Skull Woods (Key Pot / Trap Room) (..............q.)
dl $7EF0B0 : db $02 : dw $0012 ; Room $0058: Skull Woods (Big Chest Room) (............q..q)
dl $7EF345 : db $01 : db $01 ; Fire Rod
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E029F : db $01 : db $00 ; Arc variable
dl $7E0540 : db $02 : dw $1430 ; Object tilemap state
dl $7E0544 : db $02 : dw $0664 ; Object tilemap state
dl $7E0548 : db $02 : dw $0A60 ; Object tilemap state
dl $7E054C : db $02 : dw $0830 ; Object tilemap state
dl $7E0550 : db $02 : dw $0718 ; Object tilemap state
dl $7E0554 : db $02 : dw $0628 ; Object tilemap state
dl $7E0558 : db $02 : dw $0A14 ; Object tilemap state
dl $7E055C : db $02 : dw $0A28 ; Object tilemap state
dl $7E0B37 : db $01 : db $A0 ; Arc variable
dl $7E0B36 : db $01 : db $D6 ; Arc variable
dl $7FE0FA : db $01 : db $00 ; Room $BD persistent: Empty Clone Room
.after

sram_ad_skull_skull_entrance:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF0AC : db $02 : dw $0407 ; Room $0056: Skull Woods (Key Pot / Trap Room) (......K.......qq)
dl $7EF2C0 : db $01 : db $20 ; Overworld $40: Unknown (...?....)
dl $7EF384 : db $01 : db $01 ; Key for dungeon $08
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0B36 : db $01 : db $43 ; Arc variable
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7FE0FA : db $01 : db $23 ; Overworld $BD persistent: UNKNOWN
dl $7E010E : db $01 : db $2B ; Dungeon entrance index
.after

sram_ad_skull_mummy_hellway:
dl $7E0542 : db $02 : dw $1490 ; Object tilemap state
dl $7E0546 : db $02 : dw $1B9C ; Object tilemap state
dl $7E054A : db $02 : dw $14AC ; Object tilemap state
dl $7E054E : db $02 : dw $18AC ; Object tilemap state
dl $7E0552 : db $02 : dw $0F68 ; Object tilemap state
dl $7E0556 : db $02 : dw $055C ; Object tilemap state
dl $7E055A : db $02 : dw $0FEE ; Object tilemap state
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7E0FCC : db $01 : db $05 ; Prize pack index
dl $7EF092 : db $02 : dw $2002 ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (...d...........q)
dl $7EF0B2 : db $02 : dw $800A ; Room $0059: Skull Woods (Final Section Entrance Room) (.d...........q.q)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0540 : db $02 : dw $1390 ; Object tilemap state
dl $7E0544 : db $02 : dw $1B90 ; Object tilemap state
dl $7E0548 : db $02 : dw $1BA0 ; Object tilemap state
dl $7E054C : db $02 : dw $17AC ; Object tilemap state
dl $7E0550 : db $02 : dw $1CAC ; Object tilemap state
dl $7E0554 : db $02 : dw $1068 ; Object tilemap state
dl $7E0558 : db $02 : dw $0FCE ; Object tilemap state
dl $7E055C : db $02 : dw $1870 ; Object tilemap state
dl $7E0B37 : db $01 : db $A9 ; Arc variable
dl $7FE012 : db $02 : dw $0400 ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
dl $7FE032 : db $02 : dw $0003 ; Room $59 persistent: Skull Woods (Final Section Entrance Room)
dl $7FE0FA : db $01 : db $00 ; Room $BD persistent: Empty Clone Room
.after

sram_ad_skull_mummy_key:
dl $7E0556 : db $02 : dw $855C ; Object tilemap state
dl $7E055A : db $02 : dw $8FEE ; Object tilemap state
dl $7EF092 : db $02 : dw $A00F ; Room $0049: Skull Woods (Gibdo Torch Puzzle Room) (.d.d.........qqq)
dl $7EF36E : db $01 : db $30 ; Magic Power
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0558 : db $02 : dw $8FCE ; Object tilemap state
dl $7E055C : db $02 : dw $9870 ; Object tilemap state
dl $7E0B37 : db $01 : db $9C ; Arc variable
dl $7FE012 : db $02 : dw $0C01 ; Room $49 persistent: Skull Woods (Gibdo Torch Puzzle Room)
.after

sram_ad_skull_mothula:
dl $7E0542 : db $02 : dw $1C30 ; Object tilemap state
dl $7E0546 : db $02 : dw $1A64 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7EF072 : db $02 : dw $4402 ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0468 : db $01 : db $01 ; Trap door state
dl $7E0540 : db $02 : dw $140C ; Object tilemap state
dl $7E0544 : db $02 : dw $1664 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E055C : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $7E ; Arc variable
dl $7FDFF2 : db $02 : dw $0002 ; Room $39 persistent: Skull Woods (Gibdo Key / Mothula Hole Room)
.after

sram_ad_desert_outside_skull:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3F3 : db $02 : dw $0000 ; Deaths
dl $7EF36C : db $01 : db $48 ; Health (goal)
dl $7EF384 : db $01 : db $00 ; Key for dungeon $08
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF052 : db $02 : dw $0801 ; Room $0029: Skull Woods (Mothula[Boss]) (.....k..........)
dl $7EF072 : db $02 : dw $4403 ; Room $0039: Skull Woods (Gibdo Key / Mothula Hole Room) (..d...K........q)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF37A : db $01 : db $62 ; Crystals
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $0B ; Arc variable
dl $7E0B37 : db $01 : db $12 ; Arc variable
dl $7FE012 : db $01 : db $00 ; Overworld $49 persistent: UNKNOWN
dl $7FE032 : db $01 : db $00 ; Overworld $59 persistent: UNKNOWN
dl $7FE0FA : db $01 : db $23 ; Overworld $BD persistent: UNKNOWN
dl $7FDFF2 : db $01 : db $00 ; Overworld $39 persistent: UNKNOWN
.after

sram_ad_desert_ether:
dl $7E0FC8 : db $02 : dw $0000 ; Prize pack index
dl $7E0FCC : db $02 : dw $0000 ; Prize pack index
dl $7EF3FF : db $02 : dw $0001 ; Deaths
dl $7EF344 : db $02 : dw $0100 ; Mushroom
dl $7EF354 : db $02 : dw $0102 ; Gloves
dl $7EF358 : db $02 : dw $0300 ;
dl $7EF36C : db $02 : dw $3048 ; Health (goal)
dl $7E1ABF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7EF36D : db $01 : db $30 ; Health (actual)
dl $7EF342 : db $02 : dw $0700 ; Hookshot
dl $7EF356 : db $02 : dw $0100 ; Flippers
dl $7EF36E : db $02 : dw $FF80 ; Magic Power
dl $7EF376 : db $02 : dw $0C00 ; Arrow filler
dl $7EF3CA : db $02 : dw $0000 ; LW/DW
dl $7EF3F6 : db $02 : dw $0100 ; Deaths
dl $7EF4FE : db $02 : dw $9709 ; Inverse checksum
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7FE0FA : db $01 : db $00 ; Overworld $BD persistent: UNKNOWN
dl $7FDFCB : db $01 : db $F3 ; Overworld $25 persistent: Octorok Area
dl $7E010E : db $01 : db $33 ; Dungeon entrance index
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0303 : db $01 : db $03 ; Selected menu item
.after

sram_ad_desert_bridge_hammerdash:
dl $7EF348 : db $01 : db $01 ; Ether Medallion
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0303 : db $01 : db $04 ; Selected menu item
dl $7E0202 : db $01 : db $0C ; Selected menu item
dl $7E02A2 : db $01 : db $0F ; Arc variable
.after

sram_ad_desert_zora_dmd:
dl $7FE17F : db $01 : db $CA ; Overworld $FF persistent: UNKNOWN
dl $7FE1BF : db $01 : db $EC ; Overworld $11F persistent: UNKNOWN
dl $7FE16E : db $01 : db $28 ; Overworld $F7 persistent: UNKNOWN
dl $7FDFCB : db $01 : db $00 ; Overworld $25 persistent: Octorok Area
.after

sram_ad_desert_links_house:
dl $7E0542 : db $02 : dw $16CA ; Object tilemap state
dl $7EF3FF : db $02 : dw $0002 ; Deaths
dl $7EF360 : db $02 : dw $005C ; Rupees (goal)
dl $7EF378 : db $02 : dw $FE00 ; ????
dl $7EF379 : db $01 : db $FE ; Ability Flags
dl $7EF356 : db $02 : dw $0101 ; Flippers
dl $7EF362 : db $02 : dw $00A1 ; Rupees (actual)
dl $7EF3FE : db $02 : dw $0200 ; Deaths
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7EF4FE : db $02 : dw $9797 ; Inverse checksum
dl $7FE17F : db $01 : db $00 ; Room $FF persistent: Cave
dl $7FE1BF : db $01 : db $00 ; Room $11F persistent: UNKNOWN
dl $7EC140 : db $02 : dw $0081 ; Underworld exit cache
dl $7EC150 : db $02 : dw $007D ; Underworld exit cache
dl $7EC154 : db $02 : dw $0000 ; Underworld exit cache
dl $7EC158 : db $02 : dw $0200 ; Underworld exit cache
dl $7EC15C : db $02 : dw $FF20 ; Underworld exit cache
dl $7EC160 : db $02 : dw $0300 ; Underworld exit cache
dl $7EC16C : db $02 : dw $0000 ; Underworld exit cache
dl $7EC170 : db $02 : dw $0000 ; Underworld exit cache
dl $7E0540 : db $02 : dw $15CA ; Object tilemap state
dl $7E0544 : db $02 : dw $17CA ; Object tilemap state
dl $7EC152 : db $02 : dw $0583 ; Underworld exit cache
dl $7EC156 : db $02 : dw $0320 ; Underworld exit cache
dl $7EC15A : db $02 : dw $0500 ; Underworld exit cache
dl $7EC15E : db $02 : dw $FF20 ; Underworld exit cache
dl $7EC162 : db $02 : dw $0300 ; Underworld exit cache
dl $7EC16A : db $02 : dw $0000 ; Underworld exit cache
dl $7EC16E : db $02 : dw $0000 ; Underworld exit cache
dl $7FE16E : db $01 : db $00 ; Room $F7 persistent: Empty Clone Room
dl $7E010E : db $02 : dw $0000 ; Dungeon entrance index
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0303 : db $01 : db $03 ; Selected menu item
.after

sram_ad_desert_swamp_warp:
dl $7EF362 : db $02 : dw $005C ; Rupees (actual)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7EC172 : db $02 : dw $0008 ; Crystal switch state
dl $7FE05B : db $01 : db $47 ; Overworld $6D persistent: Peg Bridge
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0303 : db $01 : db $04 ; Selected menu item
.after

sram_ad_desert_fluteless_mire:
dl $7EF343 : db $01 : db $06 ; Bombs
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7FE147 : db $01 : db $AB ; Overworld $E3 persistent: UNKNOWN
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7FE164 : db $01 : db $A9 ; Overworld $F2 persistent: UNKNOWN
dl $7FE059 : db $01 : db $13 ; Overworld $6C persistent: Dark Link's House
dl $7E0202 : db $01 : db $04 ; Selected menu item
dl $7EC172 : db $02 : dw $00A0 ; Crystal switch state
dl $7FE05B : db $01 : db $00 ; Overworld $6D persistent: Peg Bridge
.after

sram_ad_desert_desert_entrance:
dl $7E0542 : db $02 : dw $0450 ; Object tilemap state
dl $7E0546 : db $02 : dw $1C50 ; Object tilemap state
dl $7E054A : db $02 : dw $1914 ; Object tilemap state
dl $7E054E : db $02 : dw $1928 ; Object tilemap state
dl $7EF36F : db $01 : db $00 ; Keys
dl $7E1ABF : db $01 : db $E4 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $61 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $0C ; Warp Vortex Coordinate
dl $7EF106 : db $02 : dw $0002 ; Room $0083: Desert Palace (West Entrance Room) (...............q)
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FE147 : db $01 : db $00 ; Room $E3 persistent: Cave (1/2 Magic)
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7FE164 : db $01 : db $00 ; Room $F2 persistent: House
dl $7FE059 : db $01 : db $00 ; Room $6C persistent: Ganon's Tower (Lanmolas Room)
dl $7E0540 : db $02 : dw $044C ; Object tilemap state
dl $7E0544 : db $02 : dw $1C4C ; Object tilemap state
dl $7E0548 : db $02 : dw $1514 ; Object tilemap state
dl $7E054C : db $02 : dw $191E ; Object tilemap state
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $01 : db $0B ; Dungeon entrance index
.after

sram_ad_desert_torch_key:
dl $7E0542 : db $02 : dw $159E ; Object tilemap state
dl $7E0546 : db $02 : dw $1890 ; Object tilemap state
dl $7E054A : db $02 : dw $1B9A ; Object tilemap state
dl $7E054E : db $02 : dw $1A24 ; Object tilemap state
dl $7E0552 : db $02 : dw $1724 ; Object tilemap state
dl $7E0556 : db $02 : dw $0CB2 ; Object tilemap state
dl $7EF0E6 : db $02 : dw $0001 ; Room $0073: Desert Palace (Big Chest Room) (................)
dl $7EF106 : db $02 : dw $0007 ; Room $0083: Desert Palace (West Entrance Room) (..............qq)
dl $7E0540 : db $02 : dw $159A ; Object tilemap state
dl $7E0544 : db $02 : dw $1714 ; Object tilemap state
dl $7E0548 : db $02 : dw $1A14 ; Object tilemap state
dl $7E054C : db $02 : dw $1B9E ; Object tilemap state
dl $7E0550 : db $02 : dw $18A8 ; Object tilemap state
dl $7E0554 : db $02 : dw $0C8A ; Object tilemap state
.after

sram_ad_desert_pre_cannonballs:
dl $7E0542 : db $02 : dw $1C30 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF377 : db $01 : db $11 ; Arrows
dl $7EF0E8 : db $02 : dw $0003 ; Room $0074: Desert Palace (Map Chest Room) (...............q)
dl $7EF0E6 : db $02 : dw $0405 ; Room $0073: Desert Palace (Big Chest Room) (......K.......q.)
dl $7EF0EA : db $02 : dw $0002 ; Room $0075: Desert Palace (Big Key Chest Room) (...............q)
dl $7EF10A : db $02 : dw $400A ; Room $0085: Desert Palace (East Entrance Room) (..d..........q.q)
dl $7EF376 : db $01 : db $00 ; Arrow filler
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0540 : db $02 : dw $1C2C ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
.after

sram_ad_desert_desert_2_spinspeed:
dl $7E0542 : db $02 : dw $0450 ; Object tilemap state
dl $7E0546 : db $02 : dw $1C50 ; Object tilemap state
dl $7E054A : db $02 : dw $1914 ; Object tilemap state
dl $7E054E : db $02 : dw $1928 ; Object tilemap state
dl $7EF37F : db $01 : db $00 ; Key for dungeon $03
dl $7EF0EA : db $02 : dw $0017 ; Room $0075: Desert Palace (Big Key Chest Room) (............q.qq)
dl $7EF10A : db $02 : dw $400E ; Room $0085: Desert Palace (East Entrance Room) (..d..........qqq)
dl $7EF366 : db $02 : dw $72B0 ; BigKey1
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0540 : db $02 : dw $044C ; Object tilemap state
dl $7E0544 : db $02 : dw $1C4C ; Object tilemap state
dl $7E0548 : db $02 : dw $1514 ; Object tilemap state
dl $7E054C : db $02 : dw $191E ; Object tilemap state
.after

sram_ad_desert_torches:
dl $7E0542 : db $02 : dw $044E ; Object tilemap state
dl $7E0546 : db $02 : dw $094E ; Object tilemap state
dl $7E054A : db $02 : dw $1470 ; Object tilemap state
dl $7E054E : db $02 : dw $1C70 ; Object tilemap state
dl $7E0552 : db $02 : dw $03B6 ; Object tilemap state
dl $7E0556 : db $02 : dw $09B6 ; Object tilemap state
dl $7EF086 : db $02 : dw $6401 ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (..dd..K.........)
dl $7EF0A6 : db $02 : dw $240F ; Room $0053: Desert Palace (Popos 2 / Beamos Hellway Room) (...d..K......qqq)
dl $7EF0C6 : db $02 : dw $840A ; Room $0063: Desert Palace (Final Section Entrance Room) (.d....K......q.q)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0540 : db $02 : dw $0442 ; Object tilemap state
dl $7E0544 : db $02 : dw $0942 ; Object tilemap state
dl $7E0548 : db $02 : dw $144C ; Object tilemap state
dl $7E054C : db $02 : dw $1C4C ; Object tilemap state
dl $7E0550 : db $02 : dw $03AA ; Object tilemap state
dl $7E0554 : db $02 : dw $09AA ; Object tilemap state
dl $7E0B37 : db $01 : db $8D ; Arc variable
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7FE026 : db $02 : dw $06E0 ; Room $53 persistent: Desert Palace (Popos 2 / Beamos Hellway Room)
dl $7E010E : db $01 : db $0C ; Dungeon entrance index
.after

sram_ad_desert_lanmolas:
dl $7E0552 : db $02 : dw $83B6 ; Object tilemap state
dl $7E0556 : db $02 : dw $89B6 ; Object tilemap state
dl $7EF377 : db $01 : db $16 ; Arrows
dl $7EF086 : db $02 : dw $E48D ; Room $0043: Desert Palace (Torch Puzzle / Moving Wall Room) (.ddd..K..c...qq.)
dl $7EF36E : db $01 : db $50 ; Magic Power
dl $7E0550 : db $02 : dw $83AA ; Object tilemap state
dl $7E0554 : db $02 : dw $89AA ; Object tilemap state
dl $7E0B37 : db $01 : db $84 ; Arc variable
.after

sram_ad_mire_outside_desert:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3C7 : db $01 : db $04 ; Map Phase
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF36C : db $01 : db $50 ; Health (goal)
dl $7EF374 : db $01 : db $07 ; Pendants
dl $7EF36D : db $01 : db $50 ; Health (actual)
dl $7EF3E9 : db $02 : dw $0002 ; Deaths
dl $7EF066 : db $02 : dw $0802 ; Room $0033: Desert Palace (Lanmolas[Boss]) (.....k.........q)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $17 ; Arc variable
dl $7FE026 : db $01 : db $00 ; Overworld $53 persistent: Dark Sanctuary
.after

sram_ad_mire_entrance:
dl $7EF2F0 : db $01 : db $20 ; Overworld $70: Unknown (...?....)
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $10 ; Selected menu item
dl $7E0202 : db $01 : db $09 ; Selected menu item
dl $7E010E : db $01 : db $27 ; Dungeon entrance index
.after

sram_ad_mire_mire_2:
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF130 : db $02 : dw $0003 ; Room $0098: Misery Mire (Entrance Room) (...............q)
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0202 : db $01 : db $06 ; Selected menu item
.after

sram_ad_mire_main_hub:
dl $7EF1A4 : db $02 : dw $000F ; Room $00D2: Misery Mire (Mire02 / Wizzrobes Room) (.............qqq)
dl $7EF36E : db $01 : db $50 ; Magic Power
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7FE124 : db $02 : dw $03EF ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
.after

sram_ad_mire_spike_key:
dl $7E0542 : db $02 : dw $2930 ; Object tilemap state
dl $7E0546 : db $02 : dw $284C ; Object tilemap state
dl $7E054A : db $02 : dw $2A4C ; Object tilemap state
dl $7EF164 : db $02 : dw $0001 ; Room $00B2: Misery Mire (Slug Room) (................)
dl $7EF184 : db $02 : dw $000F ; Room $00C2: Misery Mire (Big Hub Room) (.............qqq)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0540 : db $02 : dw $2830 ; Object tilemap state
dl $7E0544 : db $02 : dw $2A30 ; Object tilemap state
dl $7E0548 : db $02 : dw $294C ; Object tilemap state
dl $7E054C : db $02 : dw $175E ; Object tilemap state
.after

sram_ad_mire_beat_the_fireball:
dl $7EF36F : db $01 : db $02 ; Keys
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7EF166 : db $02 : dw $0412 ; Room $00B3: Misery Mire (Spike Key Chest Room) (......K.....q..q)
dl $7E002F : db $01 : db $02 ; Link's direction
.after

sram_ad_mire_bari_switch:
dl $7E0542 : db $02 : dw $3044 ; Object tilemap state
dl $7E0546 : db $02 : dw $07B4 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $02 : dw $0001 ; Keys
dl $7EF184 : db $02 : dw $400F ; Room $00C2: Misery Mire (Big Hub Room) (..d..........qqq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0540 : db $02 : dw $2E64 ; Object tilemap state
dl $7E0544 : db $02 : dw $3440 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
.after

sram_ad_mire_sluggulas:
dl $7E0542 : db $02 : dw $1430 ; Object tilemap state
dl $7E0546 : db $02 : dw $1C30 ; Object tilemap state
dl $7EF182 : db $02 : dw $C403 ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K........q)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0540 : db $02 : dw $140C ; Object tilemap state
dl $7E0544 : db $02 : dw $1C0C ; Object tilemap state
dl $7E0B37 : db $01 : db $9B ; Arc variable
dl $7FE102 : db $02 : dw $0200 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
dl $7FE124 : db $02 : dw $0000 ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
.after

sram_ad_mire_torches:
dl $7E0542 : db $02 : dw $0430 ; Object tilemap state
dl $7E0546 : db $02 : dw $0C70 ; Object tilemap state
dl $7E054A : db $02 : dw $0470 ; Object tilemap state
dl $7EF1A2 : db $02 : dw $0008 ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (.............q..)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $07A8 ; Object tilemap state
dl $7E0544 : db $02 : dw $0C4C ; Object tilemap state
dl $7E0548 : db $02 : dw $044C ; Object tilemap state
dl $7E0B37 : db $01 : db $90 ; Arc variable
.after

sram_ad_mire_backtracking:
dl $7E0542 : db $02 : dw $1430 ; Object tilemap state
dl $7E0546 : db $02 : dw $1C30 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7EF12E : db $02 : dw $010F ; Room $0097: Misery Mire (Torch Puzzle / Moving Wall Room) (........c....qqq)
dl $7EF162 : db $02 : dw $0007 ; Room $00B1: Misery Mire (Hourglass Room) (..............qq)
dl $7EF182 : db $02 : dw $C407 ; Room $00C1: Misery Mire (Compass Chest / Tile Room) (.dd...K.......qq)
dl $7EF1A2 : db $02 : dw $001B ; Room $00D1: Misery Mire (Conveyor Slug / Big Key Room) (............qq.q)
dl $7EF366 : db $02 : dw $73B0 ; BigKey1
dl $7EF36E : db $01 : db $10 ; Magic Power
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0540 : db $02 : dw $140C ; Object tilemap state
dl $7E0544 : db $02 : dw $1C0C ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0CC3 : db $01 : db $01 ; Sprite drop
.after

sram_ad_mire_mire_to_hera_clip:
dl $7E0542 : db $02 : dw $5424 ; Object tilemap state
dl $7E0546 : db $02 : dw $4A24 ; Object tilemap state
dl $7E054A : db $02 : dw $4B24 ; Object tilemap state
dl $7E054E : db $02 : dw $4C24 ; Object tilemap state
dl $7E0552 : db $02 : dw $5524 ; Object tilemap state
dl $7E0556 : db $02 : dw $5624 ; Object tilemap state
dl $7E055A : db $02 : dw $0C30 ; Object tilemap state
dl $7E055E : db $02 : dw $1430 ; Object tilemap state
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0540 : db $02 : dw $5418 ; Object tilemap state
dl $7E0544 : db $02 : dw $4A18 ; Object tilemap state
dl $7E0548 : db $02 : dw $4B18 ; Object tilemap state
dl $7E054C : db $02 : dw $4C18 ; Object tilemap state
dl $7E0550 : db $02 : dw $5518 ; Object tilemap state
dl $7E0554 : db $02 : dw $5618 ; Object tilemap state
dl $7E0558 : db $02 : dw $0C0C ; Object tilemap state
dl $7E055C : db $02 : dw $140C ; Object tilemap state
dl $7E0B37 : db $01 : db $CC ; Arc variable
dl $7E0CC3 : db $01 : db $00 ; Sprite drop
dl $7FE102 : db $02 : dw $0000 ; Room $C1 persistent: Misery Mire (Compass Chest / Tile Room)
.after

sram_ad_mire_hera_to_swamp_clip:
dl $7E0542 : db $02 : dw $0E64 ; Object tilemap state
dl $7E0546 : db $02 : dw $1064 ; Object tilemap state
dl $7E054A : db $02 : dw $1264 ; Object tilemap state
dl $7E054E : db $02 : dw $0E68 ; Object tilemap state
dl $7E0552 : db $02 : dw $1068 ; Object tilemap state
dl $7E0556 : db $02 : dw $1268 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7E055E : db $02 : dw $0000 ; Object tilemap state
dl $7EF343 : db $01 : db $05 ; Bombs
dl $7EF36D : db $01 : db $50 ; Health (actual)
dl $7EF14E : db $02 : dw $000C ; Room $00A7: Tower of Hera (Fairy Room) (.............qq.)
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7E0540 : db $02 : dw $0D64 ; Object tilemap state
dl $7E0544 : db $02 : dw $0F64 ; Object tilemap state
dl $7E0548 : db $02 : dw $1164 ; Object tilemap state
dl $7E054C : db $02 : dw $0D68 ; Object tilemap state
dl $7E0550 : db $02 : dw $0F68 ; Object tilemap state
dl $7E0554 : db $02 : dw $1168 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E055C : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $1E ; Arc variable
dl $7E0202 : db $01 : db $04 ; Selected menu item
.after

sram_ad_mire_mire_2_2:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B35 : db $01 : db $C3 ; Arc variable
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF383 : db $01 : db $00 ; Key for dungeon $07
dl $7E0FCC : db $01 : db $01 ; Prize pack index
dl $7EF06C : db $02 : dw $001F ; Room $0036: Swamp Palace (Big Chest Room) (............qqqq)
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF06E : db $02 : dw $208F ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...d.....c...qqq)
dl $7EF342 : db $01 : db $01 ; Hookshot
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B33 : db $01 : db $BE ; Arc variable
dl $7E0B37 : db $01 : db $BE ; Arc variable
dl $7E0B36 : db $01 : db $D6 ; Arc variable
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7E0B0C : db $01 : db $A0 ; Arc variable
dl $7E0B34 : db $01 : db $D0 ; Arc variable
.after

sram_ad_mire_big_chest_room:
dl $7E0FC8 : db $01 : db $02 ; Prize pack index
dl $7EF186 : db $02 : dw $000A ; Room $00C3: Misery Mire (Big Chest Room) (.............q.q)
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0303 : db $01 : db $0E ; Selected menu item
dl $7E0B37 : db $01 : db $A0 ; Arc variable
dl $7E0202 : db $01 : db $03 ; Selected menu item
dl $7FE124 : db $02 : dw $03EF ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
.after

sram_ad_mire_main_hub_post_cane:
dl $7EF350 : db $01 : db $01 ; Cane of Somaria
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF186 : db $02 : dw $001F ; Room $00C3: Misery Mire (Big Chest Room) (............qqqq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0B37 : db $01 : db $0A ; Arc variable
dl $7E0B3F : db $01 : db $01 ; Arc variable
.after

sram_ad_mire_bridge_room:
dl $7E0542 : db $02 : dw $2930 ; Object tilemap state
dl $7E0546 : db $02 : dw $284C ; Object tilemap state
dl $7E054A : db $02 : dw $2A4C ; Object tilemap state
dl $7EF164 : db $02 : dw $800D ; Room $00B2: Misery Mire (Slug Room) (.d...........qq.)
dl $7EF360 : db $02 : dw $005D ; Rupees (goal)
dl $7EF162 : db $02 : dw $800F ; Room $00B1: Misery Mire (Hourglass Room) (.d...........qqq)
dl $7EF362 : db $02 : dw $005D ; Rupees (actual)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $12 ; Selected menu item
dl $7E0540 : db $02 : dw $2830 ; Object tilemap state
dl $7E0544 : db $02 : dw $2A30 ; Object tilemap state
dl $7E0548 : db $02 : dw $294C ; Object tilemap state
dl $7E054C : db $02 : dw $175E ; Object tilemap state
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0B3F : db $01 : db $00 ; Arc variable
dl $7E0202 : db $01 : db $11 ; Selected menu item
dl $7FE124 : db $02 : dw $0000 ; Room $D2 persistent: Misery Mire (Mire02 / Wizzrobes Room)
.after

sram_ad_mire_spooky_action:
dl $7E0542 : db $02 : dw $175C ; Object tilemap state
dl $7E0546 : db $02 : dw $1768 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7EF124 : db $02 : dw $0005 ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............q.)
dl $7EF144 : db $02 : dw $800F ; Room $00A2: Misery Mire (Bridge Key Chest Room) (.d...........qqq)
dl $7EF126 : db $02 : dw $000E ; Room $0093: Misery Mire (Dark Cane Floor Switch Puzzle Room) (.............qqq)
dl $7EF36E : db $01 : db $50 ; Magic Power
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0540 : db $02 : dw $1756 ; Object tilemap state
dl $7E0544 : db $02 : dw $1762 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $00 ; Arc variable
dl $7E0B37 : db $01 : db $49 ; Arc variable
dl $7E02A2 : db $01 : db $FF ; Arc variable
.after

sram_ad_mire_vitreous:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7EF124 : db $02 : dw $0007 ; Room $0092: Misery Mire (Dark Bomb Wall / Switches Room) (..............qq)
dl $7EF140 : db $02 : dw $800F ; Room $00A0: Misery Mire (Pre-Vitreous Room) (.d...........qqq)
dl $7EF122 : db $02 : dw $0005 ; Room $0091: Misery Mire (Final Switch Room) (..............q.)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $03 ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $0C ; Arc variable
dl $7E0202 : db $01 : db $01 ; Selected menu item
.after

sram_ad_swamp_outside_mire:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF377 : db $01 : db $0E ; Arrows
dl $7EF120 : db $02 : dw $0802 ; Room $0090: Misery Mire (Vitreous[Boss]) (.....k.........q)
dl $7EF36C : db $01 : db $58 ; Health (goal)
dl $7EF36D : db $01 : db $58 ; Health (actual)
dl $7EF3F1 : db $02 : dw $0000 ; Deaths
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF37A : db $01 : db $63 ; Crystals
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E02A1 : db $01 : db $0E ; Arc variable
dl $7E02A2 : db $01 : db $00 ; Arc variable
.after

sram_ad_swamp_antifairy_room:
dl $7E0542 : db $02 : dw $193E ; Object tilemap state
dl $7E0B35 : db $01 : db $00 ; Arc variable
dl $7E1ABF : db $01 : db $70 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $07 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $07 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $0F ; Warp Vortex Coordinate
dl $7EF216 : db $02 : dw $0003 ; Room $010B: Unknown (...............q)
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7EC167 : db $01 : db $04 ; Underworld exit cache
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7EC140 : db $02 : dw $003B ; Underworld exit cache
dl $7EC144 : db $02 : dw $0E86 ; Underworld exit cache
dl $7EC148 : db $02 : dw $0EE7 ; Underworld exit cache
dl $7EC14C : db $02 : dw $003B ; Underworld exit cache
dl $7EC150 : db $02 : dw $0EF3 ; Underworld exit cache
dl $7EC154 : db $02 : dw $0E00 ; Underworld exit cache
dl $7EC158 : db $02 : dw $0600 ; Underworld exit cache
dl $7EC15C : db $02 : dw $0D20 ; Underworld exit cache
dl $7EC160 : db $02 : dw $0500 ; Underworld exit cache
dl $7EC16C : db $02 : dw $FFF6 ; Underworld exit cache
dl $7E0540 : db $02 : dw $193A ; Object tilemap state
dl $7E0544 : db $02 : dw $1842 ; Object tilemap state
dl $7EC165 : db $01 : db $20 ; Underworld exit cache
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0B36 : db $01 : db $00 ; Arc variable
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7EC142 : db $02 : dw $0016 ; Underworld exit cache
dl $7EC146 : db $02 : dw $0700 ; Underworld exit cache
dl $7EC14A : db $02 : dw $0778 ; Underworld exit cache
dl $7EC14E : db $02 : dw $0420 ; Underworld exit cache
dl $7EC152 : db $02 : dw $077D ; Underworld exit cache
dl $7EC156 : db $02 : dw $0F1E ; Underworld exit cache
dl $7EC15A : db $02 : dw $0700 ; Underworld exit cache
dl $7EC15E : db $02 : dw $1000 ; Underworld exit cache
dl $7EC162 : db $02 : dw $0800 ; Underworld exit cache
dl $7EC166 : db $01 : db $27 ; Underworld exit cache
dl $7EC16A : db $02 : dw $000A ; Underworld exit cache
dl $7E0B0C : db $01 : db $F0 ; Arc variable
dl $7E0B34 : db $01 : db $00 ; Arc variable
dl $7E010E : db $01 : db $4E ; Dungeon entrance index
.after

sram_ad_swamp_entrance:
dl $7EF2BB : db $01 : db $20 ; Overworld $3B: Unknown (...?....)
dl $7EF2FB : db $01 : db $20 ; Overworld $7B: Unknown (...?....)
dl $7EF216 : db $02 : dw $008F ; Room $010B: Unknown (.........c...qqq)
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7E0303 : db $01 : db $0E ; Selected menu item
dl $7FE07D : db $01 : db $13 ; Overworld $7E persistent: UNKNOWN
dl $7E0202 : db $01 : db $03 ; Selected menu item
dl $7EF051 : db $01 : db $01 ; Room $0028: Swamp Palace (Entrance Room) (................)
dl $7FE0E2 : db $01 : db $AA ; Overworld $B1 persistent: UNKNOWN
dl $7FE126 : db $01 : db $AB ; Overworld $D3 persistent: UNKNOWN
.after

sram_ad_swamp_first_key_pot:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF050 : db $02 : dw $811F ; Room $0028: Swamp Palace (Entrance Room) (.d......c...qqqq)
dl $7FDFD0 : db $02 : dw $000E ; Room $28 persistent: Swamp Palace (Entrance Room)
dl $7FE07D : db $01 : db $00 ; Room $7E persistent: Ice Palace (Hidden Chest / Bombable Floor Room)
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7FE0E2 : db $01 : db $00 ; Room $B1 persistent: Misery Mire (Hourglass Room)
dl $7E010E : db $01 : db $25 ; Dungeon entrance index
dl $7FE126 : db $01 : db $00 ; Room $D3 persistent: Empty Clone Room
.after

sram_ad_swamp_main_hub:
dl $7E0542 : db $02 : dw $0520 ; Object tilemap state
dl $7E0546 : db $02 : dw $1430 ; Object tilemap state
dl $7EF343 : db $01 : db $06 ; Bombs
dl $7EF070 : db $02 : dw $440A ; Room $0038: Swamp Palace (Key Pot Room) (..d...K......q.q)
dl $7EF06E : db $02 : dw $308F ; Room $0037: Swamp Palace (Map Chest / Water Fill Room) (...db....c...qqq)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FDFF0 : db $02 : dw $0002 ; Room $38 persistent: Swamp Palace (Key Pot Room)
dl $7E0540 : db $02 : dw $0420 ; Object tilemap state
dl $7E0544 : db $02 : dw $0620 ; Object tilemap state
dl $7E0548 : db $02 : dw $063C ; Object tilemap state
.after

sram_ad_swamp_hookdash:
dl $7E0542 : db $02 : dw $0F9A ; Object tilemap state
dl $7E0546 : db $02 : dw $05C0 ; Object tilemap state
dl $7E054A : db $02 : dw $0470 ; Object tilemap state
dl $7E054E : db $02 : dw $1072 ; Object tilemap state
dl $7E0B35 : db $01 : db $82 ; Arc variable
dl $7EF06C : db $02 : dw $441F ; Room $0036: Swamp Palace (Big Chest Room) (..d...K.....qqqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $100A ; Object tilemap state
dl $7E0544 : db $02 : dw $05BC ; Object tilemap state
dl $7E0548 : db $02 : dw $046C ; Object tilemap state
dl $7E054C : db $02 : dw $0FDE ; Object tilemap state
dl $7E0B33 : db $01 : db $8D ; Arc variable
dl $7E0B37 : db $01 : db $81 ; Arc variable
dl $7E0B36 : db $01 : db $84 ; Arc variable
dl $7E0B0C : db $01 : db $A0 ; Arc variable
dl $7E0B34 : db $01 : db $8C ; Arc variable
.after

sram_ad_swamp_restock_room:
dl $7E0542 : db $02 : dw $0654 ; Object tilemap state
dl $7E0546 : db $02 : dw $0668 ; Object tilemap state
dl $7E054A : db $02 : dw $2630 ; Object tilemap state
dl $7E054E : db $02 : dw $2634 ; Object tilemap state
dl $7E0552 : db $02 : dw $2638 ; Object tilemap state
dl $7E0B35 : db $01 : db $0F ; Arc variable
dl $7EF04C : db $02 : dw $8007 ; Room $0026: Swamp Palace (Statue Room) (.d............qq)
dl $7EF0CC : db $02 : dw $0003 ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (...............q)
dl $7EF0EC : db $02 : dw $008E ; Room $0076: Swamp Palace (Water Drain Room) (.........c...qqq)
dl $7FDFD0 : db $02 : dw $0000 ; Room $28 persistent: Swamp Palace (Entrance Room)
dl $7FDFF0 : db $02 : dw $0000 ; Room $38 persistent: Swamp Palace (Key Pot Room)
dl $7FE04C : db $02 : dw $0100 ; Room $66 persistent: Swamp Palace (Hidden Chest / Hidden Door Room)
dl $7E0540 : db $02 : dw $0554 ; Object tilemap state
dl $7E0544 : db $02 : dw $0568 ; Object tilemap state
dl $7E0548 : db $02 : dw $2530 ; Object tilemap state
dl $7E054C : db $02 : dw $2534 ; Object tilemap state
dl $7E0550 : db $02 : dw $2538 ; Object tilemap state
dl $7E0554 : db $02 : dw $383C ; Object tilemap state
dl $7E0B33 : db $01 : db $82 ; Arc variable
dl $7E0B37 : db $01 : db $2C ; Arc variable
dl $7E0B36 : db $01 : db $1E ; Arc variable
dl $7E0B34 : db $01 : db $81 ; Arc variable
.after

sram_ad_swamp_phelps_way:
dl $7E0542 : db $02 : dw $03C0 ; Object tilemap state
dl $7E0546 : db $02 : dw $04C0 ; Object tilemap state
dl $7E054A : db $02 : dw $05C0 ; Object tilemap state
dl $7E054E : db $02 : dw $06C0 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B35 : db $01 : db $B5 ; Arc variable
dl $7EF02C : db $02 : dw $000C ; Room $0016: Swamp Palace (Swimming Treadmill) (.............qq.)
dl $7EF0CC : db $02 : dw $000F ; Room $0066: Swamp Palace (Hidden Chest / Hidden Door Room) (.............qqq)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FDFAC : db $02 : dw $0004 ; Room $16 persistent: Swamp Palace (Swimming Treadmill)
dl $7E0540 : db $02 : dw $03BC ; Object tilemap state
dl $7E0544 : db $02 : dw $04BC ; Object tilemap state
dl $7E0548 : db $02 : dw $05BC ; Object tilemap state
dl $7E054C : db $02 : dw $06BC ; Object tilemap state
dl $7E0550 : db $02 : dw $13F0 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $D2 ; Arc variable
dl $7E0B36 : db $01 : db $C4 ; Arc variable
.after

sram_ad_swamp_arrghus:
dl $7EF02C : db $02 : dw $440F ; Room $0016: Swamp Palace (Swimming Treadmill) (..d...K......qqq)
dl $7EF36D : db $01 : db $50 ; Health (actual)
dl $7E002F : db $01 : db $00 ; Link's direction
.after

sram_ad_ice_outside_swamp:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0B09 : db $01 : db $0C ; Arc variable
dl $7E0B31 : db $01 : db $22 ; Arc variable
dl $7E0B35 : db $01 : db $3B ; Arc variable
dl $7E0B39 : db $01 : db $28 ; Arc variable
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF00C : db $02 : dw $0802 ; Room $0006: Swamp Palace (Arrghus[Boss]) (.....k.........q)
dl $7EF36C : db $01 : db $60 ; Health (goal)
dl $7EF36D : db $01 : db $60 ; Health (actual)
dl $7EF381 : db $01 : db $00 ; Key for dungeon $05
dl $7EF3ED : db $02 : dw $0000 ; Deaths
dl $7EF37A : db $01 : db $73 ; Crystals
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FDFAC : db $01 : db $00 ; Overworld $16 persistent: Witch's Hut
dl $7FE04C : db $01 : db $00 ; Overworld $66 persistent: UNKNOWN
dl $7FE07D : db $01 : db $13 ; Overworld $7E persistent: UNKNOWN
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B3A : db $01 : db $2B ; Arc variable
dl $7E0B32 : db $01 : db $1E ; Arc variable
dl $7E0B33 : db $01 : db $24 ; Arc variable
dl $7E0B37 : db $01 : db $3A ; Arc variable
dl $7E0B3B : db $01 : db $36 ; Arc variable
dl $7E0B36 : db $01 : db $3E ; Arc variable
dl $7FE0E2 : db $01 : db $AA ; Overworld $B1 persistent: UNKNOWN
dl $7E0B08 : db $01 : db $83 ; Arc variable
dl $7E0B0C : db $01 : db $01 ; Arc variable
dl $7E0B30 : db $01 : db $2F ; Arc variable
dl $7E0B34 : db $01 : db $31 ; Arc variable
dl $7E0B38 : db $01 : db $30 ; Arc variable
dl $7E0B3C : db $01 : db $3A ; Arc variable
dl $7FE126 : db $01 : db $AB ; Overworld $D3 persistent: UNKNOWN
.after

sram_ad_ice_entrance:
dl $7EF2BB : db $01 : db $00 ; Overworld $3B: Unknown (........)
dl $7EF2FB : db $01 : db $00 ; Overworld $7B: Unknown (........)
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF01C : db $02 : dw $0001 ; Room $000E: Ice Palace (Entrance Room) (................)
dl $7E1ABF : db $01 : db $07 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $0A ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $41 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $0E ; Warp Vortex Coordinate
dl $7EF216 : db $01 : db $0F ; Room $010B: Unknown (.............qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7FE07D : db $01 : db $00 ; Room $7E persistent: Ice Palace (Hidden Chest / Bombable Floor Room)
dl $7E0CBD : db $01 : db $01 ; Sprite drop
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7EF051 : db $01 : db $80 ; Room $0028: Swamp Palace (Entrance Room) (.........c......)
dl $7FE0E2 : db $01 : db $00 ; Room $B1 persistent: Misery Mire (Hourglass Room)
dl $7E010E : db $01 : db $2D ; Dungeon entrance index
dl $7FE126 : db $01 : db $00 ; Room $D3 persistent: Empty Clone Room
.after

sram_ad_ice_ice_conveyor:
dl $7E0542 : db $02 : dw $0664 ; Object tilemap state
dl $7E0546 : db $02 : dw $0A5C ; Object tilemap state
dl $7EF343 : db $01 : db $04 ; Bombs
dl $7EF03C : db $02 : dw $0004 ; Room $001E: Ice Palace (Bomb Floor / Bari Room) (..............q.)
dl $7EF07C : db $02 : dw $0004 ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..............q.)
dl $7E0CC2 : db $01 : db $01 ; Sprite drop
dl $7E0FCA : db $01 : db $02 ; Prize pack index
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7FDFFC : db $02 : dw $0006 ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $0660 ; Object tilemap state
dl $7E0544 : db $02 : dw $0A58 ; Object tilemap state
dl $7E0B37 : db $01 : db $49 ; Arc variable
dl $7E0CBD : db $01 : db $00 ; Sprite drop
dl $7E0202 : db $01 : db $04 ; Selected menu item
dl $7EC172 : db $01 : db $01 ; Crystal switch state
.after

sram_ad_ice_ipbj:
dl $7EF07C : db $02 : dw $4407 ; Room $003E: Ice Palace (Stalfos Knights / Conveyor Hellway) (..d...K.......qq)
dl $7E0CC2 : db $01 : db $00 ; Sprite drop
dl $7EF36D : db $01 : db $58 ; Health (actual)
dl $7FDFFC : db $02 : dw $0366 ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
dl $7E0468 : db $01 : db $01 ; Trap door state
dl $7E0B37 : db $01 : db $9B ; Arc variable
.after

sram_ad_ice_penguin_lineup_room:
dl $7E0542 : db $02 : dw $0B8C ; Object tilemap state
dl $7E0546 : db $02 : dw $0A30 ; Object tilemap state
dl $7EF343 : db $01 : db $03 ; Bombs
dl $7EF09C : db $02 : dw $400C ; Room $004E: Ice Palace (Bomb-Jump Room) (..d..........qq.)
dl $7EF36D : db $01 : db $50 ; Health (actual)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $0E ; Selected menu item
dl $7E0540 : db $02 : dw $078C ; Object tilemap state
dl $7E0544 : db $02 : dw $0C1C ; Object tilemap state
dl $7E0548 : db $02 : dw $0C70 ; Object tilemap state
dl $7E0B37 : db $01 : db $91 ; Arc variable
dl $7E0202 : db $01 : db $03 ; Selected menu item
.after

sram_ad_ice_lonely_firebar:
dl $7E0542 : db $02 : dw $0460 ; Object tilemap state
dl $7E0546 : db $02 : dw $0870 ; Object tilemap state
dl $7EF0BC : db $02 : dw $0001 ; Room $005E: Ice Palace (Lonely Firebar) (................)
dl $7EF0DC : db $02 : dw $0004 ; Room $006E: Ice Palace (Pengators Room) (..............q.)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FE05C : db $02 : dw $001F ; Room $6E persistent: Ice Palace (Pengators Room)
dl $7E0540 : db $02 : dw $045C ; Object tilemap state
dl $7E0544 : db $02 : dw $084C ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E0FC9 : db $01 : db $03 ; Prize pack index
dl $7E0B37 : db $01 : db $A0 ; Arc variable
.after

sram_ad_ice_last_two_screens:
dl $7E0542 : db $02 : dw $1858 ; Object tilemap state
dl $7E0546 : db $02 : dw $1CA4 ; Object tilemap state
dl $7EF0BC : db $02 : dw $0003 ; Room $005E: Ice Palace (Lonely Firebar) (...............q)
dl $7EF0FC : db $02 : dw $0002 ; Room $007E: Ice Palace (Hidden Chest / Bombable Floor Room) (...............q)
dl $7EF13C : db $02 : dw $0003 ; Room $009E: Ice Palace (Big Chest Room) (...............q)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7FDFFC : db $02 : dw $0000 ; Room $3E persistent: Ice Palace (Stalfos Knights / Conveyor Hellway)
dl $7E0540 : db $02 : dw $13A4 ; Object tilemap state
dl $7E0544 : db $02 : dw $179C ; Object tilemap state
dl $7E0548 : db $02 : dw $5764 ; Object tilemap state
.after

sram_ad_ice_kholdstare:
dl $7E0542 : db $02 : dw $0850 ; Object tilemap state
dl $7E0546 : db $02 : dw $0BD0 ; Object tilemap state
dl $7E054A : db $02 : dw $0CD0 ; Object tilemap state
dl $7E054E : db $02 : dw $0AD0 ; Object tilemap state
dl $7E0552 : db $02 : dw $0C70 ; Object tilemap state
dl $7E0556 : db $02 : dw $0AF0 ; Object tilemap state
dl $7E055A : db $02 : dw $0870 ; Object tilemap state
dl $7E055E : db $02 : dw $0970 ; Object tilemap state
dl $7EF17C : db $02 : dw $0001 ; Room $00BE: Ice Palace (Block Puzzle Room) (................)
dl $7EF19C : db $02 : dw $0004 ; Room $00CE: Ice Palace (Hole to Kholdstare Room) (..............q.)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0303 : db $01 : db $04 ; Selected menu item
dl $7FE05C : db $02 : dw $0000 ; Room $6E persistent: Ice Palace (Pengators Room)
dl $7E0540 : db $02 : dw $084C ; Object tilemap state
dl $7E0544 : db $02 : dw $0BCC ; Object tilemap state
dl $7E0548 : db $02 : dw $0CCC ; Object tilemap state
dl $7E054C : db $02 : dw $0ACC ; Object tilemap state
dl $7E0550 : db $02 : dw $0C6C ; Object tilemap state
dl $7E0554 : db $02 : dw $0AEC ; Object tilemap state
dl $7E0558 : db $02 : dw $086C ; Object tilemap state
dl $7E055C : db $02 : dw $096C ; Object tilemap state
dl $7E0202 : db $01 : db $0C ; Selected menu item
.after

sram_ad_trock_outside_ice:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7E055E : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF1BC : db $02 : dw $0804 ; Room $00DE: Ice Palace (Kholdstare[Boss]) (.....k........q.)
dl $7EF36C : db $01 : db $68 ; Health (goal)
dl $7EF36D : db $01 : db $68 ; Health (actual)
dl $7EF385 : db $01 : db $00 ; Key for dungeon $09
dl $7EF3F5 : db $02 : dw $0000 ; Deaths
dl $7EF37A : db $01 : db $77 ; Crystals
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7FDFF9 : db $01 : db $42 ; Overworld $3C persistent: Great Swamp SE
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7E055C : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $08 ; Arc variable
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7FDFDA : db $01 : db $D4 ; Overworld $2D persistent: Bridge to Hyrule Castle
dl $7FE01B : db $01 : db $42 ; Overworld $4D persistent: UNKNOWN
.after

sram_ad_trock_old_man_cave:
dl $7E0542 : db $02 : dw $0A70 ; Object tilemap state
dl $7EF2B7 : db $01 : db $02 ; Overworld $37: Unknown (.......?)
dl $7EF343 : db $01 : db $02 ; Bombs
dl $7E0FC8 : db $02 : dw $0000 ; Prize pack index
dl $7E0FCC : db $02 : dw $0000 ; Prize pack index
dl $7EF3FF : db $02 : dw $0001 ; Deaths
dl $7EF050 : db $02 : dw $801F ; Room $0028: Swamp Palace (Entrance Room) (.d..........qqqq)
dl $7EF240 : db $02 : dw $001A ; Room $0120: Unknown (............qq.q)
dl $7EF36C : db $02 : dw $3868 ; Health (goal)
dl $7EF3E8 : db $02 : dw $0200 ; Deaths
dl $7E1ABF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7EF36D : db $01 : db $38 ; Health (actual)
dl $7E0FCA : db $02 : dw $0000 ; Prize pack index
dl $7EF2B6 : db $02 : dw $0200 ; Overworld $36: Unknown (........)
dl $7EF342 : db $02 : dw $0201 ; Hookshot
dl $7EF346 : db $02 : dw $0001 ; Ice Rod
dl $7EF36E : db $02 : dw $FF80 ; Magic Power
dl $7EF376 : db $02 : dw $0E00 ; Arrow filler
dl $7EF3C6 : db $02 : dw $0415 ; Game Phase 2
dl $7EF3CA : db $02 : dw $0000 ; LW/DW
dl $7EF3FE : db $02 : dw $0100 ; Deaths
dl $7EF4FE : db $02 : dw $04F0 ; Inverse checksum
dl $7E029F : db $01 : db $16 ; Arc variable
dl $7FDFF9 : db $01 : db $00 ; Room $3C persistent: Cave
dl $7E0540 : db $02 : dw $0920 ; Object tilemap state
dl $7FDFDA : db $01 : db $00 ; Room $2D persistent: Empty Clone Room
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7FE01B : db $01 : db $00 ; Room $4D persistent: Ganon's Tower (Moldorm Room)
dl $7E010E : db $02 : dw $0030 ; Dungeon entrance index
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0303 : db $01 : db $03 ; Selected menu item
.after

sram_ad_trock_tr_climb:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E010E : db $01 : db $33 ; Dungeon entrance index
.after

sram_ad_trock_laser_entrance:
dl $7E1ABF : db $01 : db $07 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $0A ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $98 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $01 ; Warp Vortex Coordinate
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FE16D : db $01 : db $D1 ; Overworld $F6 persistent: UNKNOWN
dl $7FE046 : db $01 : db $D1 ; Overworld $63 persistent: UNKNOWN
.after

sram_ad_trock_crystal_roller:
dl $7E0542 : db $02 : dw $104C ; Object tilemap state
dl $7E0546 : db $02 : dw $1070 ; Object tilemap state
dl $7E054A : db $02 : dw $1C70 ; Object tilemap state
dl $7EF343 : db $01 : db $01 ; Bombs
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7EF16A : db $02 : dw $000F ; Room $00B5: Turtle Rock (Dark Maze) (.............qqq)
dl $7EF18A : db $02 : dw $000A ; Room $00C5: Turtle Rock (Laser Bridge) (.............q.q)
dl $7EF1AA : db $02 : dw $808A ; Room $00D5: Turtle Rock (Laser Key Room) (.d.......c...q.q)
dl $7EF36E : db $01 : db $78 ; Magic Power
dl $7E029F : db $01 : db $00 ; Arc variable
dl $7E0303 : db $01 : db $12 ; Selected menu item
dl $7E0540 : db $02 : dw $0470 ; Object tilemap state
dl $7E0544 : db $02 : dw $0F70 ; Object tilemap state
dl $7E0548 : db $02 : dw $1170 ; Object tilemap state
dl $7FE16D : db $01 : db $00 ; Room $F6 persistent: Empty Clone Room
dl $7E0202 : db $01 : db $11 ; Selected menu item
dl $7FE046 : db $01 : db $00 ; Room $63 persistent: Desert Palace (Final Section Entrance Room)
dl $7E010E : db $01 : db $18 ; Dungeon entrance index
dl $7FE12A : db $02 : dw $0010 ; Room $D5 persistent: Turtle Rock (Laser Key Room)
.after

sram_ad_trock_pokey_1:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E0B35 : db $01 : db $00 ; Arc variable
dl $7EF008 : db $02 : dw $401A ; Room $0004: Turtle Rock (Crysta-roller Room) (..d.........qq.q)
dl $7EF028 : db $02 : dw $800F ; Room $0014: Turtle Rock (Big Key Room) (.d...........qqq)
dl $7EF048 : db $02 : dw $800C ; Room $0024: Turtle Rock (Double Hokku-Bokku / Big chest Room) (.d...........qq.)
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0303 : db $01 : db $14 ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B33 : db $01 : db $00 ; Arc variable
dl $7E0B37 : db $01 : db $3C ; Arc variable
dl $7E0B3B : db $01 : db $00 ; Arc variable
dl $7E0B36 : db $01 : db $00 ; Arc variable
dl $7E0202 : db $01 : db $14 ; Selected menu item
dl $7E0B0C : db $01 : db $A0 ; Arc variable
dl $7E0B34 : db $01 : db $00 ; Arc variable
dl $7E0B3C : db $01 : db $00 ; Arc variable
dl $7FE12A : db $02 : dw $0000 ; Room $D5 persistent: Turtle Rock (Laser Key Room)
.after

sram_ad_trock_laser_entrance_2:
dl $7EF028 : db $02 : dw $C01F ; Room $0014: Turtle Rock (Big Key Room) (.dd.........qqqq)
dl $7EF388 : db $01 : db $01 ; Key for dungeon $0C
dl $7EF026 : db $02 : dw $8405 ; Room $0013: Turtle Rock (Hokku-Bokku Key Room 2) (.d....K.......q.)
dl $7EF366 : db $02 : dw $73B8 ; BigKey1
dl $7E002F : db $01 : db $00 ; Link's direction
.after

sram_ad_trock_switch_maze:
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF18A : db $02 : dw $800A ; Room $00C5: Turtle Rock (Laser Bridge) (.d...........q.q)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0303 : db $01 : db $12 ; Selected menu item
dl $7E0202 : db $01 : db $11 ; Selected menu item
.after

sram_ad_trock_trinexx:
dl $7E0542 : db $02 : dw $1C30 ; Object tilemap state
dl $7EF168 : db $02 : dw $800F ; Room $00B4: Turtle Rock (Pre-Trinexx Room) (.d...........qqq)
dl $7EF188 : db $02 : dw $800F ; Room $00C4: Turtle Rock (Final Crystal Switch Puzzle Room) (.d...........qqq)
dl $7EF36E : db $01 : db $60 ; Magic Power
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $1C2C ; Object tilemap state
dl $7E02A1 : db $01 : db $00 ; Arc variable
dl $7EC172 : db $01 : db $01 ; Crystal switch state
.after

sram_ad_gtower_outside_turtle_rock:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B09 : db $01 : db $60 ; Arc variable
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3C7 : db $01 : db $08 ; Map Phase
dl $7EF3FB : db $02 : dw $0001 ; Deaths
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF148 : db $02 : dw $0802 ; Room $00A4: Turtle Rock (Trinexx[Boss]) (.....k.........q)
dl $7EF36C : db $01 : db $70 ; Health (goal)
dl $7EF388 : db $01 : db $00 ; Key for dungeon $0C
dl $7EF36D : db $01 : db $70 ; Health (actual)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF37A : db $01 : db $7F ; Crystals
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E02A1 : db $01 : db $05 ; Arc variable
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7E0B08 : db $01 : db $78 ; Arc variable
dl $7E0B0C : db $01 : db $44 ; Arc variable
.after

sram_ad_gtower_old_man_cave:
dl $7E0542 : db $02 : dw $0A70 ; Object tilemap state
dl $7EF3FF : db $02 : dw $0001 ; Deaths
dl $7EF36C : db $02 : dw $4070 ; Health (goal)
dl $7E1ABF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $00 ; Warp Vortex Coordinate
dl $7EF36D : db $01 : db $40 ; Health (actual)
dl $7EF342 : db $02 : dw $0101 ; Hookshot
dl $7EF36E : db $02 : dw $FF80 ; Magic Power
dl $7EF3C6 : db $02 : dw $0815 ; Game Phase 2
dl $7EF3CA : db $02 : dw $0000 ; LW/DW
dl $7EF3FA : db $02 : dw $0100 ; Deaths
dl $7EF4FE : db $02 : dw $EBCB ; Inverse checksum
dl $7E0540 : db $02 : dw $0920 ; Object tilemap state
dl $7EC172 : db $02 : dw $0000 ; Crystal switch state
dl $7E010E : db $02 : dw $0030 ; Dungeon entrance index
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0303 : db $01 : db $03 ; Selected menu item
.after

sram_ad_gtower_entrance:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF018 : db $02 : dw $000F ; Room $000C: Ganon's Tower (Entrance Room) (.............qqq)
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $0E ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B37 : db $01 : db $00 ; Arc variable
dl $7E0202 : db $01 : db $03 ; Selected menu item
dl $7E010E : db $01 : db $37 ; Dungeon entrance index
.after

sram_ad_gtower_spike_skip:
dl $7E0542 : db $02 : dw $171C ; Object tilemap state
dl $7E0546 : db $02 : dw $0864 ; Object tilemap state
dl $7E054A : db $02 : dw $085C ; Object tilemap state
dl $7E054E : db $02 : dw $0C4C ; Object tilemap state
dl $7E0552 : db $02 : dw $144C ; Object tilemap state
dl $7E0556 : db $02 : dw $0864 ; Object tilemap state
dl $7EF36F : db $01 : db $01 ; Keys
dl $7EF118 : db $02 : dw $0008 ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
dl $7EF116 : db $02 : dw $0404 ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K.......q.)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0303 : db $01 : db $04 ; Selected menu item
dl $7E0468 : db $01 : db $00 ; Trap door state
dl $7E0540 : db $02 : dw $0920 ; Object tilemap state
dl $7E0544 : db $02 : dw $1720 ; Object tilemap state
dl $7E0548 : db $02 : dw $0760 ; Object tilemap state
dl $7E054C : db $02 : dw $0960 ; Object tilemap state
dl $7E0550 : db $02 : dw $0C70 ; Object tilemap state
dl $7E0554 : db $02 : dw $1C4C ; Object tilemap state
dl $7E0202 : db $01 : db $0C ; Selected menu item
dl $7E0641 : db $02 : dw $0001 ; Room puzzle state (?)
dl $7E0B0C : db $01 : db $50 ; Arc variable
.after

sram_ad_gtower_pre_firesnakes_room:
dl $7E0542 : db $02 : dw $0C30 ; Object tilemap state
dl $7E0546 : db $02 : dw $1820 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF116 : db $02 : dw $040E ; Room $008B: Ganon's Tower (Block Puzzle / Spike Skip / Map Chest Room) (......K......qqq)
dl $7EF136 : db $02 : dw $8408 ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......q..)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0303 : db $01 : db $0E ; Selected menu item
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0540 : db $02 : dw $0430 ; Object tilemap state
dl $7E0544 : db $02 : dw $181C ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0202 : db $01 : db $03 ; Selected menu item
dl $7EC172 : db $01 : db $01 ; Crystal switch state
dl $7E0641 : db $01 : db $00 ; Room puzzle state (?)
.after

sram_ad_gtower_bombable_floor:
dl $7E0542 : db $02 : dw $0938 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7EF377 : db $01 : db $13 ; Arrows
dl $7EF138 : db $02 : dw $000F ; Room $009C: Ganon's Tower (Invisible Floor Maze Room) (.............qqq)
dl $7EF0FA : db $02 : dw $201E ; Room $007D: Ganon's Tower (Winder / Warp Maze Room) (...d........qqqq)
dl $7EF136 : db $02 : dw $840F ; Room $009B: Ganon's Tower (Many Spikes / Warp Maze Room) (.d....K......qqq)
dl $7EF376 : db $01 : db $00 ; Arrow filler
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7FE0B8 : db $02 : dw $0012 ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
dl $7E0540 : db $02 : dw $0838 ; Object tilemap state
dl $7E0544 : db $02 : dw $0550 ; Object tilemap state
dl $7E0202 : db $01 : db $04 ; Selected menu item
dl $7EC172 : db $01 : db $00 ; Crystal switch state
.after

sram_ad_gtower_floor_2:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B09 : db $01 : db $00 ; Arc variable
dl $7E0B31 : db $01 : db $BD ; Arc variable
dl $7E0B35 : db $01 : db $70 ; Arc variable
dl $7EF377 : db $01 : db $0B ; Arrows
dl $7EF038 : db $02 : dw $0035 ; Room $001C: Ganon's Tower (Ice Armos) (...........cq.q.)
dl $7EF118 : db $02 : dw $0009 ; Room $008C: Ganon's Tower (East and West Downstairs / Big Chest Room) (.............q..)
dl $7EF389 : db $01 : db $01 ; Key for dungeon $0D
dl $7EF366 : db $02 : dw $73BC ; BigKey1
dl $7E0303 : db $01 : db $03 ; Selected menu item
dl $7FE0B8 : db $01 : db $00 ; Room $9C persistent: Ganon's Tower (Invisible Floor Maze Room)
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0B32 : db $01 : db $90 ; Arc variable
dl $7E0B33 : db $01 : db $52 ; Arc variable
dl $7E0B37 : db $01 : db $02 ; Arc variable
dl $7E0202 : db $01 : db $01 ; Selected menu item
dl $7E0B08 : db $01 : db $40 ; Arc variable
dl $7E0B30 : db $01 : db $AD ; Arc variable
dl $7E0B34 : db $01 : db $42 ; Arc variable
.after

sram_ad_gtower_mimics_1:
dl $7E0542 : db $02 : dw $052C ; Object tilemap state
dl $7E0546 : db $02 : dw $082C ; Object tilemap state
dl $7E054A : db $02 : dw $0B2C ; Object tilemap state
dl $7E054E : db $02 : dw $1962 ; Object tilemap state
dl $7EF377 : db $01 : db $0A ; Arrows
dl $7EF36D : db $01 : db $28 ; Health (actual)
dl $7EF0D6 : db $02 : dw $000C ; Room $006B: Ganon's Tower (Mimics Rooms) (.............qq.)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0468 : db $01 : db $00 ; Trap door state
dl $7E0540 : db $02 : dw $051C ; Object tilemap state
dl $7E0544 : db $02 : dw $081C ; Object tilemap state
dl $7E0548 : db $02 : dw $0B1C ; Object tilemap state
dl $7E054C : db $02 : dw $195A ; Object tilemap state
dl $7E0550 : db $02 : dw $050C ; Object tilemap state
dl $7EC172 : db $01 : db $01 ; Crystal switch state
dl $7E0641 : db $02 : dw $0001 ; Room puzzle state (?)
.after

sram_ad_gtower_spike_pit:
dl $7EF377 : db $01 : db $02 ; Arrows
dl $7EF0D6 : db $02 : dw $800F ; Room $006B: Ganon's Tower (Mimics Rooms) (.d...........qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0468 : db $01 : db $01 ; Trap door state
dl $7FE056 : db $02 : dw $2640 ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
dl $7E0641 : db $01 : db $00 ; Room puzzle state (?)
.after

sram_ad_gtower_gauntlet_1:
dl $7E0542 : db $02 : dw $16D8 ; Object tilemap state
dl $7E0546 : db $02 : dw $19D8 ; Object tilemap state
dl $7E054A : db $02 : dw $19E4 ; Object tilemap state
dl $7E054E : db $02 : dw $16E4 ; Object tilemap state
dl $7EF0B8 : db $02 : dw $000C ; Room $005C: Ganon's Tower (Ganon-Ball Z) (.............qq.)
dl $7EF0B6 : db $02 : dw $8005 ; Room $005B: Ganon's Tower (Spike Pit Room) (.d............q.)
dl $7E0540 : db $02 : dw $165E ; Object tilemap state
dl $7E0544 : db $02 : dw $1854 ; Object tilemap state
dl $7E0548 : db $02 : dw $1A5E ; Object tilemap state
dl $7E054C : db $02 : dw $1868 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7FE036 : db $02 : dw $0008 ; Room $5B persistent: Ganon's Tower (Spike Pit Room)
dl $7EC172 : db $01 : db $00 ; Crystal switch state
.after

sram_ad_gtower_lanmola_2:
dl $7E0542 : db $02 : dw $0628 ; Object tilemap state
dl $7E0546 : db $02 : dw $0A28 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7EF377 : db $01 : db $01 ; Arrows
dl $7E0FCC : db $01 : db $07 ; Prize pack index
dl $7EF0D8 : db $02 : dw $0001 ; Room $006C: Ganon's Tower (Lanmolas Room) (................)
dl $7EF36D : db $01 : db $20 ; Health (actual)
dl $7EF0BA : db $02 : dw $000E ; Room $005D: Ganon's Tower (Gauntlet 1/2/3) (.............qqq)
dl $7EF0DA : db $02 : dw $000A ; Room $006D: Ganon's Tower (Gauntlet 4/5) (.............q.q)
dl $7EF36E : db $01 : db $70 ; Magic Power
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0540 : db $02 : dw $0614 ; Object tilemap state
dl $7E0544 : db $02 : dw $0A14 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7FE036 : db $02 : dw $0000 ; Room $5B persistent: Ganon's Tower (Spike Pit Room)
dl $7FE03A : db $02 : dw $0EFD ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
dl $7FE056 : db $02 : dw $0000 ; Room $6B persistent: Ganon's Tower (Mimics Rooms)
dl $7FE05A : db $02 : dw $00C9 ; Room $6D persistent: Ganon's Tower (Gauntlet 4/5)
.after

sram_ad_gtower_wizzrobes_1:
dl $7EF0D8 : db $02 : dw $000B ; Room $006C: Ganon's Tower (Lanmolas Room) (.............q.q)
dl $7EF36E : db $01 : db $20 ; Magic Power
dl $7E002F : db $01 : db $00 ; Link's direction
.after

sram_ad_gtower_wizzrobes_2:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7EF14A : db $02 : dw $000B ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............q.q)
dl $7EF36E : db $01 : db $18 ; Magic Power
dl $7E0303 : db $01 : db $12 ; Selected menu item
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0202 : db $01 : db $11 ; Selected menu item
dl $7FE0CA : db $02 : dw $008C ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
.after

sram_ad_gtower_torches_1:
dl $7EF12A : db $02 : dw $0005 ; Room $0095: Ganon's Tower (Final Collapsing Bridge Room) (..............q.)
dl $7EF14A : db $02 : dw $000F ; Room $00A5: Ganon's Tower (Wizzrobes Rooms) (.............qqq)
dl $7EF36E : db $01 : db $10 ; Magic Power
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7E0B37 : db $01 : db $08 ; Arc variable
dl $7E0B3F : db $01 : db $01 ; Arc variable
dl $7FE03A : db $02 : dw $0000 ; Room $5D persistent: Ganon's Tower (Gauntlet 1/2/3)
dl $7FE0AA : db $02 : dw $000C ; Room $95 persistent: Ganon's Tower (Final Collapsing Bridge Room)
dl $7FE0CA : db $02 : dw $00EF ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
dl $7E0FC7 : db $01 : db $01 ; Prize pack index
.after

sram_ad_gtower_torches_2:
dl $7E0542 : db $02 : dw $1570 ; Object tilemap state
dl $7E0546 : db $02 : dw $0B2E ; Object tilemap state
dl $7E054A : db $02 : dw $120E ; Object tilemap state
dl $7E054E : db $02 : dw $1820 ; Object tilemap state
dl $7E0552 : db $02 : dw $8B0C ; Object tilemap state
dl $7E0556 : db $02 : dw $9220 ; Object tilemap state
dl $7EF373 : db $01 : db $21 ; Magic filler
dl $7EF12C : db $02 : dw $000B ; Room $0096: Ganon's Tower (Torches 1 Room) (.............q.q)
dl $7EF36E : db $01 : db $63 ; Magic Power
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0468 : db $02 : dw $0000 ; Trap door state
dl $7E0540 : db $02 : dw $154C ; Object tilemap state
dl $7E0544 : db $02 : dw $0520 ; Object tilemap state
dl $7E0548 : db $02 : dw $1120 ; Object tilemap state
dl $7E054C : db $02 : dw $180E ; Object tilemap state
dl $7E0550 : db $02 : dw $8420 ; Object tilemap state
dl $7E0554 : db $02 : dw $8B32 ; Object tilemap state
dl $7E0B37 : db $01 : db $0D ; Arc variable
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7FE05A : db $02 : dw $0000 ; Room $6D persistent: Ganon's Tower (Gauntlet 4/5)
.after

sram_ad_gtower_helma_key:
dl $7E0CBC : db $01 : db $01 ; Sprite drop
dl $7E0542 : db $02 : dw $0C70 ; Object tilemap state
dl $7E0546 : db $02 : dw $1628 ; Object tilemap state
dl $7E054A : db $02 : dw $1A14 ; Object tilemap state
dl $7E054E : db $02 : dw $954C ; Object tilemap state
dl $7E0552 : db $02 : dw $9C50 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7EF373 : db $01 : db $00 ; Magic filler
dl $7EF07A : db $02 : dw $0001 ; Room $003D: Ganon's Tower (Torch Room 2) (................)
dl $7EF36E : db $01 : db $40 ; Magic Power
dl $7E0540 : db $02 : dw $0C4C ; Object tilemap state
dl $7E0544 : db $02 : dw $1618 ; Object tilemap state
dl $7E0548 : db $02 : dw $1820 ; Object tilemap state
dl $7E054C : db $02 : dw $1A24 ; Object tilemap state
dl $7E0550 : db $02 : dw $9570 ; Object tilemap state
dl $7E0554 : db $02 : dw $9C6C ; Object tilemap state
dl $7E0B37 : db $01 : db $0F ; Arc variable
.after

sram_ad_gtower_bombable_wall:
dl $7E0CBC : db $01 : db $00 ; Sprite drop
dl $7EF36D : db $01 : db $18 ; Health (actual)
dl $7EF07A : db $02 : dw $4405 ; Room $003D: Ganon's Tower (Torch Room 2) (..d...K.......q.)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0303 : db $01 : db $01 ; Selected menu item
dl $7E0B37 : db $01 : db $02 ; Arc variable
dl $7E0202 : db $01 : db $04 ; Selected menu item
dl $7FDFFA : db $02 : dw $000C ; Room $3D persistent: Ganon's Tower (Torch Room 2)
.after

sram_ad_gtower_moldorm_2:
dl $7EF343 : db $01 : db $00 ; Bombs
dl $7EF36F : db $02 : dw $0000 ; Keys
dl $7EF36D : db $01 : db $10 ; Health (actual)
dl $7EF07A : db $02 : dw $740F ; Room $003D: Ganon's Tower (Torch Room 2) (..ddb.K......qqq)
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7E0303 : db $01 : db $0E ; Selected menu item
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0554 : db $02 : dw $1C6C ; Object tilemap state
dl $7E0B37 : db $01 : db $10 ; Arc variable
dl $7E0202 : db $01 : db $03 ; Selected menu item
.after

sram_ad_gtower_agahnim_2:
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7EF098 : db $02 : dw $0005 ; Room $004C: Ganon's Tower (Mini-Helmasaur Conveyor Room) (..............q.)
dl $7EF03A : db $02 : dw $800C ; Room $001D: Ganon's Tower (Final Hallway) (.d...........qq.)
dl $7EF09A : db $02 : dw $800F ; Room $004D: Ganon's Tower (Moldorm Room) (.d...........qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7FE0AA : db $02 : dw $0000 ; Room $95 persistent: Ganon's Tower (Final Collapsing Bridge Room)
dl $7FE0CA : db $02 : dw $0000 ; Room $A5 persistent: Ganon's Tower (Wizzrobes Rooms)
.after

sram_ad_aga_pyramid:
dl $7EF2DB : db $01 : db $20 ; Overworld $5B: Unknown (...?....)
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3FF : db $02 : dw $0000 ; Deaths
dl $7EF389 : db $01 : db $00 ; Key for dungeon $0D
dl $7EF3FD : db $02 : dw $0001 ; Deaths
dl $7EF01A : db $02 : dw $0802 ; Room $000D: Ganon's Tower (Agahnim2[Boss]) (.....k.........q)
dl $7E002F : db $01 : db $06 ; Link's direction
dl $7FDFFA : db $01 : db $00 ; Overworld $3D persistent: UNKNOWN
dl $7E02A2 : db $01 : db $FE ; Arc variable
.after

sram_ad_aga_gold_knights:
dl $7EF29B : db $01 : db $60 ; Overworld $1B: Unknown (..??....)
dl $7EF36F : db $01 : db $00 ; Keys
dl $7EF1C0 : db $02 : dw $0002 ; Room $00E0: Agahnim's Tower (Entrance Room) (...............q)
dl $7E1ABF : db $01 : db $06 ; Warp Vortex Coordinate
dl $7E1ACF : db $01 : db $08 ; Warp Vortex Coordinate
dl $7E1ADF : db $01 : db $78 ; Warp Vortex Coordinate
dl $7E1AEF : db $01 : db $06 ; Warp Vortex Coordinate
dl $7EF3CA : db $01 : db $00 ; LW/DW
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7E0303 : db $01 : db $05 ; Selected menu item
dl $7E0202 : db $01 : db $06 ; Selected menu item
dl $7E02A2 : db $01 : db $E3 ; Arc variable
dl $7E010E : db $01 : db $24 ; Dungeon entrance index
.after

sram_ad_aga_dark_room_of_despair:
dl $7E0542 : db $02 : dw $0B8C ; Object tilemap state
dl $7E0546 : db $02 : dw $1030 ; Object tilemap state
dl $7E054A : db $02 : dw $1792 ; Object tilemap state
dl $7E054E : db $02 : dw $1C16 ; Object tilemap state
dl $7E0552 : db $02 : dw $0D24 ; Object tilemap state
dl $7EF1A0 : db $02 : dw $0004 ; Room $00D0: Agahnim's Tower (Dark Maze) (..............q.)
dl $7EF1C0 : db $02 : dw $201E ; Room $00E0: Agahnim's Tower (Entrance Room) (...d........qqqq)
dl $7EF36D : db $01 : db $48 ; Health (actual)
dl $7EF36E : db $01 : db $30 ; Magic Power
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7E0540 : db $02 : dw $059E ; Object tilemap state
dl $7E0544 : db $02 : dw $0D2A ; Object tilemap state
dl $7E0548 : db $02 : dw $14B0 ; Object tilemap state
dl $7E054C : db $02 : dw $1C0C ; Object tilemap state
dl $7E0550 : db $02 : dw $0A1E ; Object tilemap state
dl $7E0554 : db $02 : dw $1012 ; Object tilemap state
dl $7E0FCD : db $01 : db $02 ; Prize pack index
dl $7FE140 : db $02 : dw $000F ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
.after

sram_ad_aga_dark_room_of_melancholy:
dl $7E0542 : db $02 : dw $0E0C ; Object tilemap state
dl $7E0546 : db $02 : dw $1B1C ; Object tilemap state
dl $7E054A : db $02 : dw $06D8 ; Object tilemap state
dl $7E054E : db $02 : dw $0D24 ; Object tilemap state
dl $7E0552 : db $02 : dw $1A10 ; Object tilemap state
dl $7EF180 : db $02 : dw $0001 ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (................)
dl $7EF1A0 : db $02 : dw $801F ; Room $00D0: Agahnim's Tower (Dark Maze) (.d..........qqqq)
dl $7E0540 : db $02 : dw $0A30 ; Object tilemap state
dl $7E0544 : db $02 : dw $1A0C ; Object tilemap state
dl $7E0548 : db $02 : dw $0710 ; Object tilemap state
dl $7E054C : db $02 : dw $06E4 ; Object tilemap state
dl $7E0550 : db $02 : dw $1518 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0CBD : db $01 : db $01 ; Sprite drop
dl $7FE120 : db $02 : dw $0020 ; Room $D0 persistent: Agahnim's Tower (Dark Maze)
.after

sram_ad_aga_spear_guards:
dl $7EF180 : db $02 : dw $240F ; Room $00C0: Agahnim's Tower (Dark Bridge Room) (...d..K......qqq)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FE100 : db $02 : dw $001C ; Room $C0 persistent: Agahnim's Tower (Dark Bridge Room)
dl $7E0CBD : db $01 : db $00 ; Sprite drop
.after

sram_ad_aga_circle_of_pots:
dl $7E0CC4 : db $01 : db $01 ; Sprite drop
dl $7E0542 : db $02 : dw $151C ; Object tilemap state
dl $7E0546 : db $02 : dw $1528 ; Object tilemap state
dl $7E054A : db $02 : dw $1910 ; Object tilemap state
dl $7E054E : db $02 : dw $1824 ; Object tilemap state
dl $7E0552 : db $02 : dw $1B1C ; Object tilemap state
dl $7E0556 : db $02 : dw $1B28 ; Object tilemap state
dl $7E055A : db $02 : dw $172C ; Object tilemap state
dl $7EF160 : db $02 : dw $000C ; Room $00B0: Agahnim's Tower (Circle of Pots) (.............qq.)
dl $7EF36E : db $01 : db $00 ; Magic Power
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FE0E0 : db $02 : dw $003D ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
dl $7E0468 : db $01 : db $00 ; Trap door state
dl $7E0540 : db $02 : dw $1514 ; Object tilemap state
dl $7E0544 : db $02 : dw $1520 ; Object tilemap state
dl $7E0548 : db $02 : dw $1710 ; Object tilemap state
dl $7E054C : db $02 : dw $1818 ; Object tilemap state
dl $7E0550 : db $02 : dw $1B14 ; Object tilemap state
dl $7E0554 : db $02 : dw $1B20 ; Object tilemap state
dl $7E0558 : db $02 : dw $192C ; Object tilemap state
dl $7E0FC7 : db $01 : db $03 ; Prize pack index
.after

sram_ad_aga_pit_room:
dl $7E0CC4 : db $01 : db $00 ; Sprite drop
dl $7E0542 : db $02 : dw $0000 ; Object tilemap state
dl $7E0546 : db $02 : dw $0000 ; Object tilemap state
dl $7E054A : db $02 : dw $0000 ; Object tilemap state
dl $7E054E : db $02 : dw $0000 ; Object tilemap state
dl $7E0552 : db $02 : dw $0000 ; Object tilemap state
dl $7E0556 : db $02 : dw $0000 ; Object tilemap state
dl $7E055A : db $02 : dw $0000 ; Object tilemap state
dl $7EF080 : db $02 : dw $0001 ; Room $0040: Agahnim's Tower (Final Bridge Room) (................)
dl $7EF160 : db $02 : dw $240F ; Room $00B0: Agahnim's Tower (Circle of Pots) (...d..K......qqq)
dl $7EF360 : db $02 : dw $0063 ; Rupees (goal)
dl $7EF362 : db $02 : dw $0063 ; Rupees (actual)
dl $7E002F : db $01 : db $04 ; Link's direction
dl $7FE0E0 : db $02 : dw $0D3D ; Room $B0 persistent: Agahnim's Tower (Circle of Pots)
dl $7E0468 : db $02 : dw $0001 ; Trap door state
dl $7E0540 : db $02 : dw $0000 ; Object tilemap state
dl $7E0544 : db $02 : dw $0000 ; Object tilemap state
dl $7E0548 : db $02 : dw $0000 ; Object tilemap state
dl $7E054C : db $02 : dw $0000 ; Object tilemap state
dl $7E0550 : db $02 : dw $0000 ; Object tilemap state
dl $7E0554 : db $02 : dw $0000 ; Object tilemap state
dl $7E0558 : db $02 : dw $0000 ; Object tilemap state
dl $7FE140 : db $02 : dw $0000 ; Room $E0 persistent: Agahnim's Tower (Entrance Room)
.after

sram_ad_aga_agahnim:
dl $7EF060 : db $02 : dw $840A ; Room $0030: Agahnim's Tower (Maiden Sacrifice Chamber) (.d....K......q.q)
dl $7EF080 : db $02 : dw $000B ; Room $0040: Agahnim's Tower (Final Bridge Room) (.............q.q)
dl $7E002F : db $01 : db $00 ; Link's direction
dl $7FDFE0 : db $02 : dw $0001 ; Room $30 persistent: Agahnim's Tower (Maiden Sacrifice Chamber)
dl $7FE000 : db $02 : dw $0002 ; Room $40 persistent: Agahnim's Tower (Final Bridge Room)
dl $7FE120 : db $02 : dw $0000 ; Room $D0 persistent: Agahnim's Tower (Dark Maze)
.after

sram_ad_ganon_pyramid:
dl $7EF36F : db $01 : db $FF ; Keys
dl $7EF3C7 : db $01 : db $06 ; Map Phase
dl $7EF3EB : db $02 : dw $0000 ; Deaths
dl $7EF040 : db $02 : dw $0802 ; Room $0020: Agahnim's Tower (Agahnim[Boss]) (.....k.........q)
dl $7EF36D : db $01 : db $70 ; Health (actual)
dl $7EF3C5 : db $01 : db $03 ; Game Phase 1
dl $7EF282 : db $01 : db $20 ; Overworld $02: Unknown (...?....)
dl $7EF36E : db $01 : db $80 ; Magic Power
dl $7EF3CA : db $01 : db $40 ; LW/DW
dl $7E002F : db $01 : db $02 ; Link's direction
dl $7FDFE0 : db $01 : db $00 ; Overworld $30 persistent: Desert of Mystery
dl $7FE000 : db $01 : db $00 ; Overworld $40 persistent: Skull Woods
dl $7FE0E0 : db $01 : db $00 ; Overworld $B0 persistent: UNKNOWN
dl $7FE100 : db $01 : db $00 ; Overworld $C0 persistent: UNKNOWN
.after


