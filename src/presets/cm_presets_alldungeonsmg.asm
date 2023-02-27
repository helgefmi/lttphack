;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_alldungeonsmg:
	dw presetSRAM_alldungeonsmg ; location of SRAM
	dw presetpersistent_alldungeonsmg ; location of persistent data

;===================================================================================================
%menu_header("All Dungeons MG", 15)
	%submenu("Escape", presetmenu_alldungeonsmg_escape)
	%submenu("Collection", presetmenu_alldungeonsmg_collection)
	%submenu("Eastern Palace", presetmenu_alldungeonsmg_eastern_palace)
	%submenu("Skull Woods", presetmenu_alldungeonsmg_skull_woods)
	%submenu("Skull Woods Helmasaur", presetmenu_alldungeonsmg_skull_woods_helmasaur)
	%submenu("Palace of Darkness Blind", presetmenu_alldungeonsmg_palace_of_darkness_blind)
	%submenu("Thieves' Town Kholdstare", presetmenu_alldungeonsmg_thieves_town_kholdstare)
	%submenu("Ice Palace Agahnim 2", presetmenu_alldungeonsmg_ice_palace_agahnim_2)
	%submenu("Hyrule Castle Lanmolas", presetmenu_alldungeonsmg_hyrule_castle_lanmolas)
	%submenu("Desert Palace Vitreous", presetmenu_alldungeonsmg_desert_palace_vitreous)
	%submenu("Misery Mire Trinexx", presetmenu_alldungeonsmg_misery_mire_trinexx)
	%submenu("Turtle Rock Arrghus", presetmenu_alldungeonsmg_turtle_rock_arrghus)
	%submenu("Tower of Hera", presetmenu_alldungeonsmg_tower_of_hera)
	%submenu("Agahnim", presetmenu_alldungeonsmg_agahnim)
	%submenu("Ganon", presetmenu_alldungeonsmg_ganon)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ESCAPE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_escape:
%menu_header("Escape", 12)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "alldungeonsmg", "escape", "links_bed")
dw $0104 ; Screen ID
dw $0000, $0000 ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lamp", "alldungeonsmg", "escape", "lamp")
dw $0104 ; Screen ID
dw $0940, $2157 ; Link Coords
dw $0900, $2110 ; Camera HV
db $00 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside", "alldungeonsmg", "escape", "outside")
dw $002C ; Screen ID
dw $08B8, $0AFB ; Link Coords
dw $0832, $0A9D ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $08BF, $0B0A ; Scroll X,Y
dw $0506 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Uncle", "alldungeonsmg", "escape", "uncle")
dw $0055 ; Screen ID
dw $0B9F, $0A96 ; Link Coords
dw $0B00, $0A10 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $7D ; Entrance
db $9F ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Courtyard", "alldungeonsmg", "escape", "courtyard")
dw $0055 ; Screen ID
dw $0A78, $0BE2 ; Link Coords
dw $0A00, $0B10 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $7D ; Entrance
db $AF ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "alldungeonsmg", "escape", "entrance")
dw $001B ; Screen ID
dw $07F8, $06FB ; Link Coords
dw $0784, $069D ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $070A ; Scroll X,Y
dw $0530 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Stair Clip", "alldungeonsmg", "escape", "stair_clip")
dw $0062 ; Screen ID
dw $0518, $0C60 ; Link Coords
dw $04A0, $0C00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $D0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Re-arm EG", "alldungeonsmg", "escape", "re_arm_eg")
dw $0062 ; Screen ID
dw $053D, $0D2F ; Link Coords
dw $04C5, $0CC3 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $F0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Zelda's Cell", "alldungeonsmg", "escape", "zeldas_cell")
dw $0070 ; Screen ID
dw $0050, $0E23 ; Link Coords
dw $004B, $0E00 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $0F ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("EG to Sanc", "alldungeonsmg", "escape", "eg_to_sanc")
dw $0080 ; Screen ID
dw $0165, $1005 ; Link Coords
dw $00ED, $1000 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $9E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0004 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Sanctuary", "alldungeonsmg", "escape", "pre_sanctuary")
dw $0010 ; Screen ID
dw $01E8, $03C0 ; Link Coords
dw $0100, $0312 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $7E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $0300) ; Camera boundaries
%write16($7E0602, $0200) ; Camera boundaries
%write16($7E0604, $0310) ; Camera boundaries
%write16($7E0606, $0310) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sanctuary", "alldungeonsmg", "escape", "sanctuary")
dw $0011 ; Screen ID
dw $03E7, $02E9 ; Link Coords
dw $02E8, $027E ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $5E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; COLLECTION
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_collection:
%menu_header("Collection", 7)

;---------------------------------------------------------------------------------------------------
%preset_UW("Sanctuary to Bat Cave", "alldungeonsmg", "collection", "sanctuary_to_bat_cave")
dw $0012 ; Screen ID
dw $0468, $0205 ; Link Coords
dw $0402, $0200 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $CE ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bat Cave Reload", "alldungeonsmg", "collection", "bat_cave_reload")
dw $0022 ; Screen ID
dw $0508, $08DB ; Link Coords
dw $048E, $087D ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0513, $08EA ; Scroll X,Y
dw $0412 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Somaria Bridge", "alldungeonsmg", "collection", "somaria_bridge")
dw $00C3 ; Screen ID
dw $06E8, $1978 ; Link Coords
dw $0600, $190D ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $11 ; Entrance
db $6F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beat the Fireball", "alldungeonsmg", "collection", "beat_the_fireball")
dw $00C3 ; Screen ID
dw $060B, $18F8 ; Link Coords
dw $0600, $188D ; Camera HV
db $09 ; Item
db $04 ; Direction
;-----------------------------
db $11 ; Entrance
db $4F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sluggulas", "alldungeonsmg", "collection", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19E2 ; Link Coords
dw $0200, $1910 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches Room STC", "alldungeonsmg", "collection", "torches_room_stc")
dw $0097 ; Screen ID
dw $0E78, $12E2 ; Link Coords
dw $0E00, $1210 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $00 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Getting Hook and Pearl", "alldungeonsmg", "collection", "getting_hook_and_pearl")
dw $0037 ; Screen ID
dw $0E0A, $DB78 ; Link Coords
dw $0E00, $DC7A ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $11 ; Entrance
db $80 ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $CE00) ; Camera boundaries
%write16($7E0602, $CE00) ; Camera boundaries
%write16($7E0604, $CE10) ; Camera boundaries
%write16($7E0606, $CF10) ; Camera boundaries
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; EASTERN PALACE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_eastern_palace:
%menu_header("Eastern Palace", 4)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "alldungeonsmg", "eastern_palace", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Eastern Screen Wrapping", "alldungeonsmg", "eastern_palace", "eastern_screen_wrapping")
dw $002E ; Screen ID
dw $0C90, $0A05 ; Link Coords
dw $0C1E, $0A00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $0C9B, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Spin Hookpush", "alldungeonsmg", "eastern_palace", "spin_hookpush")
dw $001E ; Screen ID
dw $0F50, $0A2B ; Link Coords
dw $0EDA, $091E ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $0F57, $098D ; Scroll X,Y
dw $185C ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "alldungeonsmg", "eastern_palace", "armos")
dw $00C8 ; Screen ID
dw $1206, $198A ; Link Coords
dw $1200, $1910 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $B0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0608, $1100) ; Camera boundaries
%write16($7E060A, $1000) ; Camera boundaries
%write16($7E060C, $1100) ; Camera boundaries
%write16($7E060E, $1100) ; Camera boundaries
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_skull_woods:
%menu_header("Skull Woods", 10)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Eastern", "alldungeonsmg", "skull_woods", "outside_eastern")
dw $001E ; Screen ID
dw $0F50, $062B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Sahasrahla's Hut", "alldungeonsmg", "skull_woods", "sahasrahlas_hut")
dw $001E ; Screen ID
dw $0CF0, $073B ; Link Coords
dw $0C76, $06DB ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $0CFB, $0748 ; Scroll X,Y
dw $0710 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "alldungeonsmg", "skull_woods", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Screen", "alldungeonsmg", "skull_woods", "castle_screen")
dw $002C ; Screen ID
dw $0898, $0A06 ; Link Coords
dw $0816, $0A00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $08A3, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hookpush to Skull", "alldungeonsmg", "skull_woods", "hookpush_to_skull")
dw $001B ; Screen ID
dw $08C8, $06DA ; Link Coords
dw $0846, $0676 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $08D3, $06E5 ; Scroll X,Y
dw $0348 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Dungeon Reload", "alldungeonsmg", "skull_woods", "dungeon_reload")
dw $0040 ; Screen ID
dw $00E8, $0209 ; Link Coords
dw $0062, $01A7 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $00EF, $0214 ; Scroll X,Y
dw $0C8E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fire Rod STC", "alldungeonsmg", "skull_woods", "fire_rod_stc")
dw $0057 ; Screen ID
dw $0E78, $0CE1 ; Link Coords
dw $0E00, $0B00 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $28 ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Open the Skull", "alldungeonsmg", "skull_woods", "open_the_skull")
dw $0056 ; Screen ID
dw $0C78, $0BE1 ; Link Coords
dw $0C00, $0B10 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $28 ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "alldungeonsmg", "skull_woods", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00CA ; Link Coords
dw $0016, $0068 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $00A3, $00D5 ; Scroll X,Y
dw $0284 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Getting Item from Moth", "alldungeonsmg", "skull_woods", "getting_item_from_moth")
dw $0039 ; Screen ID
dw $137A, $0605 ; Link Coords
dw $12E8, $0601 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $2B ; Entrance
db $1F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; SKULL WOODS HELMASAUR
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_skull_woods_helmasaur:
%menu_header("Skull Woods Helmasaur", 5)

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance (Mirror)", "alldungeonsmg", "skull_woods_helmasaur", "skull_entrance_mirror")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0016, $0069 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X,Y
dw $0282 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mirror Made of Crystal", "alldungeonsmg", "skull_woods_helmasaur", "mirror_made_of_crystal")
dw $0049 ; Screen ID
dw $13D8, $0806 ; Link Coords
dw $12DD, $0800 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $2B ; Entrance
db $5F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance (Helmasaur)", "alldungeonsmg", "skull_woods_helmasaur", "skull_entrance_helmasaur")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0016, $0069 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X,Y
dw $0282 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur Weirdshot", "alldungeonsmg", "skull_woods_helmasaur", "helmasaur_weirdshot")
dw $005A ; Screen ID
dw $1451, $0BD9 ; Link Coords
dw $1400, $0B10 ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $2B ; Entrance
db $2F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur", "alldungeonsmg", "skull_woods_helmasaur", "helmasaur")
dw $006A ; Screen ID
dw $1578, $0C13 ; Link Coords
dw $1488, $0C00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $2B ; Entrance
db $5E ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; PALACE OF DARKNESS BLIND
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_palace_of_darkness_blind:
%menu_header("Palace of Darkness Blind", 5)

;---------------------------------------------------------------------------------------------------
%preset_OW("PoD Entrance", "alldungeonsmg", "palace_of_darkness_blind", "pod_entrance")
dw $005E ; Screen ID
dw $0F50, $063B ; Link Coords
dw $0ED6, $0600 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0F5B, $066D ; Scroll X,Y
dw $005A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("PoD Hookpush", "alldungeonsmg", "palace_of_darkness_blind", "pod_hookpush")
dw $004A ; Screen ID
dw $14F8, $0912 ; Link Coords
dw $1480, $0900 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $26 ; Entrance
db $A0 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison Misslottings", "alldungeonsmg", "palace_of_darkness_blind", "prison_misslottings")
dw $0046 ; Screen ID
dw $0C0A, $085B ; Link Coords
dw $0C00, $0800 ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $26 ; Entrance
db $8F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Attic Falling", "alldungeonsmg", "palace_of_darkness_blind", "attic_falling")
dw $0066 ; Screen ID
dw $0C0B, $0C30 ; Link Coords
dw $0C00, $0C00 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $26 ; Entrance
db $8D ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "alldungeonsmg", "palace_of_darkness_blind", "blind")
dw $0065 ; Screen ID
dw $0B63, $0D60 ; Link Coords
dw $0AEB, $0CF3 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $26 ; Entrance
db $BC ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; THIEVES' TOWN KHOLDSTARE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_thieves_town_kholdstare:
%menu_header("Thieves' Town Kholdstare", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves'", "alldungeonsmg", "thieves_town_kholdstare", "outside_thieves")
dw $0058 ; Screen ID
dw $01F8, $07BB ; Link Coords
dw $0176, $075D ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0203, $07CA ; Scroll X,Y
dw $0B2E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hookpush to Ice Rod", "alldungeonsmg", "thieves_town_kholdstare", "hookpush_to_ice_rod")
dw $0018 ; Screen ID
dw $01B8, $094A ; Link Coords
dw $0136, $08EC ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $01C3, $0959 ; Scroll X,Y
dw $17A8 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Rod Room", "alldungeonsmg", "thieves_town_kholdstare", "ice_rod_room")
dw $0120 ; Screen ID
dw $2078, $2314 ; Link Coords
dw $2000, $2300 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $46 ; Entrance
db $20 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0608, $2000) ; Camera boundaries
%write16($7E060A, $2100) ; Camera boundaries
%write16($7E060C, $2000) ; Camera boundaries
%write16($7E060E, $2200) ; Camera boundaries
%write16($7EC140, $0018) ; Entrance caching
%write16($7EC142, $0016) ; Entrance caching
%write16($7EC144, $08EA) ; Entrance caching
%write16($7EC146, $0136) ; Entrance caching
%write16($7EC148, $0947) ; Entrance caching
%write16($7EC14A, $01B8) ; Entrance caching
%write16($7EC14C, $0018) ; Entrance caching
%write16($7EC14E, $17A8) ; Entrance caching
%write16($7EC150, $0957) ; Entrance caching
%write16($7EC152, $01C3) ; Entrance caching
%write16($7EC154, $0600) ; Entrance caching
%write16($7EC156, $091E) ; Entrance caching
%write16($7EC158, $0000) ; Entrance caching
%write16($7EC15A, $0300) ; Entrance caching
%write16($7EC15C, $0520) ; Entrance caching
%write16($7EC15E, $0A00) ; Entrance caching
%write16($7EC160, $FF00) ; Entrance caching
%write16($7EC162, $0400) ; Entrance caching
%write16($7EC164, $2000) ; Entrance caching
%write16($7EC166, $0623) ; Entrance caching
%write16($7EC16A, $0006) ; Entrance caching
%write16($7EC16C, $FFFA) ; Entrance caching
%write16($7EC16E, $000A) ; Entrance caching
%write16($7EC170, $FFF6) ; Entrance caching
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Thieves' Entrance", "alldungeonsmg", "thieves_town_kholdstare", "thieves_entrance")
dw $0058 ; Screen ID
dw $01F8, $07B9 ; Link Coords
dw $0176, $0757 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $0203, $07C4 ; Scroll X,Y
dw $0B2E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Thieves' Ambush", "alldungeonsmg", "thieves_town_kholdstare", "thieves_ambush")
dw $00DB ; Screen ID
dw $1630, $1A06 ; Link Coords
dw $1600, $1A00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $CF ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare Weirdshot", "alldungeonsmg", "thieves_town_kholdstare", "kholdstare_weirdshot")
dw $00CD ; Screen ID
dw $1BE7, $1848 ; Link Coords
dw $1B00, $1800 ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
db $34 ; Entrance
db $1F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare Hookpushes", "alldungeonsmg", "thieves_town_kholdstare", "kholdstare_hookpushes")
dw $00CE ; Screen ID
dw $1DA1, $1846 ; Link Coords
dw $1D00, $1800 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $34 ; Entrance
db $1E ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Kholdstare", "alldungeonsmg", "thieves_town_kholdstare", "kholdstare")
dw $00CE ; Screen ID
dw $1DB0, $19D8 ; Link Coords
dw $1D00, $18EC ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $3E ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ICE PALACE AGAHNIM 2
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_ice_palace_agahnim_2:
%menu_header("Ice Palace Agahnim 2", 5)

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Entrance (Crystal)", "alldungeonsmg", "ice_palace_agahnim_2", "ice_entrance_crystal")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0C3E, $0D6D ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X,Y
dw $0BC6 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ice Palace Fanfare Skip", "alldungeonsmg", "ice_palace_agahnim_2", "ice_palace_fanfare_skip")
dw $00EF ; Screen ID
dw $1E0A, $FDD4 ; Link Coords
dw $1E00, $FD10 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $2D ; Entrance
db $AF ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Entrance (Agahnim 2)", "alldungeonsmg", "ice_palace_agahnim_2", "ice_entrance_agahnim_2")
dw $0075 ; Screen ID
dw $0CB8, $0DCB ; Link Coords
dw $0C3E, $0D6D ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $0CC3, $0DDA ; Scroll X,Y
dw $0BC6 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2 Misslottings", "alldungeonsmg", "ice_palace_agahnim_2", "agahnim_2_misslottings")
dw $000E ; Screen ID
dw $1D74, $01D9 ; Link Coords
dw $1D00, $0110 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $2D ; Entrance
db $3F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "alldungeonsmg", "ice_palace_agahnim_2", "agahnim_2")
dw $001D ; Screen ID
dw $1AB8, $0206 ; Link Coords
dw $1A40, $0200 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $2D ; Entrance
db $8E ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; HYRULE CASTLE LANMOLAS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_hyrule_castle_lanmolas:
%menu_header("Hyrule Castle Lanmolas", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "alldungeonsmg", "hyrule_castle_lanmolas", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Somaria Stair Clip", "alldungeonsmg", "hyrule_castle_lanmolas", "somaria_stair_clip")
dw $001B ; Screen ID
dw $08C8, $062A ; Link Coords
dw $0854, $0600 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $08D3, $066D ; Scroll X,Y
dw $004A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room Bonk", "alldungeonsmg", "hyrule_castle_lanmolas", "dark_room_bonk")
dw $0052 ; Screen ID
dw $04BB, $0A05 ; Link Coords
dw $0443, $0A00 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $05 ; Entrance
db $C0 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "alldungeonsmg", "hyrule_castle_lanmolas", "lanmolas")
dw $0043 ; Screen ID
dw $0628, $0805 ; Link Coords
dw $0600, $0800 ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $05 ; Entrance
db $80 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; DESERT PALACE VITREOUS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_desert_palace_vitreous:
%menu_header("Desert Palace Vitreous", 5)

;---------------------------------------------------------------------------------------------------
%preset_UW("Hookpush to Desert", "alldungeonsmg", "desert_palace_vitreous", "hookpush_to_desert")
dw $0033 ; Screen ID
dw $067B, $076B ; Link Coords
dw $0600, $0700 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
db $05 ; Entrance
db $20 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Desert Hookpush", "alldungeonsmg", "desert_palace_vitreous", "desert_hookpush")
dw $0030 ; Screen ID
dw $0128, $0C3B ; Link Coords
dw $00A2, $0C00 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $012F, $0C6D ; Scroll X,Y
dw $0016 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Slime Room Weirdshot", "alldungeonsmg", "desert_palace_vitreous", "slime_room_weirdshot")
dw $0081 ; Screen ID
dw $03E4, $11DA ; Link Coords
dw $0300, $10F2 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $0C ; Entrance
db $FF ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous Hookpush", "alldungeonsmg", "desert_palace_vitreous", "vitreous_hookpush")
dw $0091 ; Screen ID
dw $0378, $12A1 ; Link Coords
dw $0300, $1234 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $0C ; Entrance
db $5E ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "alldungeonsmg", "desert_palace_vitreous", "vitreous")
dw $00A0 ; Screen ID
dw $00A0, $1406 ; Link Coords
dw $0028, $1400 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $0C ; Entrance
db $CF ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MISERY MIRE TRINEXX
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_misery_mire_trinexx:
%menu_header("Misery Mire Trinexx", 5)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "alldungeonsmg", "misery_mire_trinexx", "outside_mire")
dw $0070 ; Screen ID
dw $0128, $0CDA ; Link Coords
dw $00A6, $0C7C ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $0133, $0CE9 ; Scroll X,Y
dw $0414 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire 2", "alldungeonsmg", "misery_mire_trinexx", "mire_2")
dw $0098 ; Screen ID
dw $1188, $1320 ; Link Coords
dw $1100, $1300 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $B0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Main Hub", "alldungeonsmg", "misery_mire_trinexx", "main_hub")
dw $00D2 ; Screen ID
dw $0578, $1A13 ; Link Coords
dw $0500, $1A00 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $DF ; Room layout
db $81 ; Door / Peg state / Layer
dw $03EF ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx STC Hookpush", "alldungeonsmg", "misery_mire_trinexx", "trinexx_stc_hookpush")
dw $00B2 ; Screen ID
dw $05E6, $1778 ; Link Coords
dw $0500, $170B ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $27 ; Entrance
db $3F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "alldungeonsmg", "misery_mire_trinexx", "trinexx")
dw $00A3 ; Screen ID
dw $07E8, $1767 ; Link Coords
dw $06EC, $16F4 ; Camera HV
db $06 ; Item
db $00 ; Direction
;-----------------------------
db $27 ; Entrance
db $3F ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $1500) ; Camera boundaries
%write16($7E0602, $1400) ; Camera boundaries
%write16($7E0604, $1510) ; Camera boundaries
%write16($7E0606, $1510) ; Camera boundaries
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TURTLE ROCK ARRGHUS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_turtle_rock_arrghus:
%menu_header("Turtle Rock Arrghus", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Turtle Rock Entrance", "alldungeonsmg", "turtle_rock_arrghus", "turtle_rock_entrance")
dw $0047 ; Screen ID
dw $0F08, $013B ; Link Coords
dw $0E96, $00DD ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0F13, $014A ; Scroll X,Y
dw $0712 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Pre Armos Room Weirdshot", "alldungeonsmg", "turtle_rock_arrghus", "pre_armos_room_weirdshot")
dw $00D7 ; Screen ID
dw $0FE7, $1BA6 ; Link Coords
dw $0F00, $1B10 ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
db $35 ; Entrance
db $3F ; Room layout
db $8C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus Death Hole", "alldungeonsmg", "turtle_rock_arrghus", "arrghus_death_hole")
dw $00D8 ; Screen ID
dw $11B7, $1AA9 ; Link Coords
dw $1100, $1A3D ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $35 ; Entrance
db $5E ; Room layout
db $80 ; Door / Peg state / Layer
dw $0600 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "alldungeonsmg", "turtle_rock_arrghus", "arrghus")
dw $0005 ; Screen ID
dw $11E6, $1B78 ; Link Coords
dw $1100, $1B0D ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $35 ; Entrance
db $7E ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $1D00) ; Camera boundaries
%write16($7E0602, $1C00) ; Camera boundaries
%write16($7E0604, $1D10) ; Camera boundaries
%write16($7E0606, $1D10) ; Camera boundaries
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TOWER OF HERA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_tower_of_hera:
%menu_header("Tower of Hera", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp Crystal Hookpush", "alldungeonsmg", "tower_of_hera", "swamp_crystal_hookpush")
dw $007B ; Screen ID
dw $0778, $0EEB ; Link Coords
dw $06F2, $0E8D ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $077F, $0EFA ; Scroll X,Y
dw $049E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "alldungeonsmg", "tower_of_hera", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $30 ; Entrance
db $60 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "alldungeonsmg", "tower_of_hera", "entrance")
dw $0003 ; Screen ID
dw $0900, $0477 ; Link Coords
dw $088C, $031E ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
dw $090B, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "alldungeonsmg", "tower_of_hera", "moldorm")
dw $0017 ; Screen ID
dw $0FA8, $0270 ; Link Coords
dw $0F00, $0204 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $D4 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_agahnim:
%menu_header("Agahnim", 5)

;---------------------------------------------------------------------------------------------------
%preset_OW("Hera Entrance", "alldungeonsmg", "agahnim", "hera_entrance")
dw $0003 ; Screen ID
dw $08F0, $007B ; Link Coords
dw $087C, $0017 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $08FB, $0086 ; Scroll X,Y
dw $0050 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "alldungeonsmg", "agahnim", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F48 ; Link Coords
dw $0EF0, $0EDC ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $F1 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Yuzuhera", "alldungeonsmg", "agahnim", "yuzuhera")
dw $0031 ; Screen ID
dw $030A, $0778 ; Link Coords
dw $0300, $070C ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $33 ; Entrance
db $32 ; Room layout
db $82 ; Door / Peg state / Layer
dw $0580 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arena Dash", "alldungeonsmg", "agahnim", "arena_dash")
dw $0030 ; Screen ID
dw $0278, $0614 ; Link Coords
dw $0100, $0600 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $12 ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim", "alldungeonsmg", "agahnim", "agahnim")
dw $0020 ; Screen ID
dw $020A, $053E ; Link Coords
dw $0100, $0500 ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $33 ; Entrance
db $32 ; Room layout
db $80 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_alldungeonsmg_ganon:
%menu_header("Ganon", 1)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "alldungeonsmg", "ganon", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_alldungeonsmg:

;===================================================================================================
presetpersistent_alldungeonsmg_escape:
;-----------------------------
.links_bed
%write_sq()
%write8($7E0B08, $00) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E02A2, $00) ; Slot 4 Altitude
%write8($7E044A, $00) ; EG strength
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.lamp
..end
;-----------------------------
.outside
..end
;-----------------------------
.uncle
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.courtyard
..end
;-----------------------------
.entrance
..end
;-----------------------------
.stair_clip
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.re_arm_eg
..end
;-----------------------------
.zeldas_cell
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.eg_to_sanc
%write8($7E047A, $00) ; Armed EG
%write8($7E0CFB, $01) ; Rupee pull kills
%write8($7E0CFC, $01) ; Rupee pull hits
..end
;-----------------------------
.pre_sanctuary
..end
;-----------------------------
.sanctuary
..end

;===================================================================================================
presetpersistent_alldungeonsmg_collection:
;-----------------------------
.sanctuary_to_bat_cave
..end
;-----------------------------
.bat_cave_reload
%write8($7E0B09, $B0) ; Arc variable
..end
;-----------------------------
.somaria_bridge
..end
;-----------------------------
.beat_the_fireball
..end
;-----------------------------
.sluggulas
..end
;-----------------------------
.torches_room_stc
%write8($7E0FCA, $01) ; Prize pack 4
%write8($7E0CFB, $02) ; Rupee pull kills
..end
;-----------------------------
.getting_hook_and_pearl
%write8($7E044A, $02) ; EG strength
..end

;===================================================================================================
presetpersistent_alldungeonsmg_eastern_palace:
;-----------------------------
.links_house
%write8($7E0FCA, $00) ; Prize pack 4
..end
;-----------------------------
.eastern_screen_wrapping
..end
;-----------------------------
.spin_hookpush
%write8($7E0FC8, $01) ; Prize pack 2
%write8($7E0CFB, $05) ; Rupee pull kills
..end
;-----------------------------
.armos
%write8($7E0CFC, $02) ; Rupee pull hits
..end

;===================================================================================================
presetpersistent_alldungeonsmg_skull_woods:
;-----------------------------
.outside_eastern
%write8($7E0B08, $46) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
%write8($7E0CFC, $03) ; Rupee pull hits
..end
;-----------------------------
.sahasrahlas_hut
..end
;-----------------------------
.links_house
%write8($7E0FC8, $00) ; Prize pack 2
..end
;-----------------------------
.castle_screen
..end
;-----------------------------
.hookpush_to_skull
..end
;-----------------------------
.dungeon_reload
%write8($7E0CFC, $04) ; Rupee pull hits
..end
;-----------------------------
.fire_rod_stc
..end
;-----------------------------
.open_the_skull
%write_mirror($48, $08, $09, $01)
%write8($7E0CFC, $05) ; Rupee pull hits
..end
;-----------------------------
.skull_entrance
..end
;-----------------------------
.getting_item_from_moth
%write8($7E044A, $01) ; EG strength
..end

;===================================================================================================
presetpersistent_alldungeonsmg_skull_woods_helmasaur:
;-----------------------------
.skull_entrance_mirror
%write8($7E0CFB, $0B) ; Rupee pull kills
..end
;-----------------------------
.mirror_made_of_crystal
..end
;-----------------------------
.skull_entrance_helmasaur
..end
;-----------------------------
.helmasaur_weirdshot
%write8($7E0B08, $00) ; Arc variable
%write8($7E0B09, $08) ; Arc variable
%write8($7E0CFB, $0C) ; Rupee pull kills
..end
;-----------------------------
.helmasaur
..end

;===================================================================================================
presetpersistent_alldungeonsmg_palace_of_darkness_blind:
;-----------------------------
.pod_entrance
%write8($7E02A1, $0E) ; Slot 3 Altitude
..end
;-----------------------------
.pod_hookpush
..end
;-----------------------------
.prison_misslottings
..end
;-----------------------------
.attic_falling
%write8($7E02A1, $00) ; Slot 3 Altitude
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_alldungeonsmg_thieves_town_kholdstare:
;-----------------------------
.outside_thieves
%write8($7E02A1, $17) ; Slot 3 Altitude
%write8($7E0CFB, $14) ; Rupee pull kills
%write8($7E0CFC, $07) ; Rupee pull hits
..end
;-----------------------------
.hookpush_to_ice_rod
%write_mirror($E0, $01, $1E, $09)
%write8($7E0CFB, $15) ; Rupee pull kills
..end
;-----------------------------
.ice_rod_room
%write8($7E02A1, $00) ; Slot 3 Altitude
..end
;-----------------------------
.thieves_entrance
%write8($7E0CFB, $16) ; Rupee pull kills
..end
;-----------------------------
.thieves_ambush
..end
;-----------------------------
.kholdstare_weirdshot
..end
;-----------------------------
.kholdstare_hookpushes
%write8($7E0FCC, $02) ; Prize pack 6
%write8($7E0CFB, $1A) ; Rupee pull kills
..end
;-----------------------------
.kholdstare
..end

;===================================================================================================
presetpersistent_alldungeonsmg_ice_palace_agahnim_2:
;-----------------------------
.ice_entrance_crystal
%write8($7E02A1, $02) ; Slot 3 Altitude
..end
;-----------------------------
.ice_palace_fanfare_skip
..end
;-----------------------------
.ice_entrance_agahnim_2
..end
;-----------------------------
.agahnim_2_misslottings
..end
;-----------------------------
.agahnim_2
..end

;===================================================================================================
presetpersistent_alldungeonsmg_hyrule_castle_lanmolas:
;-----------------------------
.pyramid
%write8($7E02A2, $FD) ; Slot 4 Altitude
%write8($7E0CFB, $1C) ; Rupee pull kills
..end
;-----------------------------
.somaria_stair_clip
%write_mirror($EF, $07, $6B, $06)
%write8($7E02A2, $F6) ; Slot 4 Altitude
..end
;-----------------------------
.dark_room_bonk
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetpersistent_alldungeonsmg_desert_palace_vitreous:
;-----------------------------
.hookpush_to_desert
%write8($7E02A1, $10) ; Slot 3 Altitude
..end
;-----------------------------
.desert_hookpush
%write8($7E02A1, $00) ; Slot 3 Altitude
..end
;-----------------------------
.slime_room_weirdshot
..end
;-----------------------------
.vitreous_hookpush
..end
;-----------------------------
.vitreous
%write8($7E044A, $02) ; EG strength
..end

;===================================================================================================
presetpersistent_alldungeonsmg_misery_mire_trinexx:
;-----------------------------
.outside_mire
%write8($7E0CFB, $29) ; Rupee pull kills
%write8($7E0CFC, $0F) ; Rupee pull hits
..end
;-----------------------------
.mire_2
..end
;-----------------------------
.main_hub
%write8($7E0FC7, $01) ; Prize pack 1
%write8($7E0FC8, $02) ; Prize pack 2
%write8($7E0CFB, $32) ; Rupee pull kills
..end
;-----------------------------
.trinexx_stc_hookpush
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.trinexx
%write8($7E0FCC, $05) ; Prize pack 6
%write8($7E0CFB, $35) ; Rupee pull kills
..end

;===================================================================================================
presetpersistent_alldungeonsmg_turtle_rock_arrghus:
;-----------------------------
.turtle_rock_entrance
%write8($7E0B08, $78) ; Arc variable
%write8($7E0B09, $60) ; Arc variable
%write8($7E02A1, $17) ; Slot 3 Altitude
..end
;-----------------------------
.pre_armos_room_weirdshot
..end
;-----------------------------
.arrghus_death_hole
%write8($7E0CFB, $37) ; Rupee pull kills
..end
;-----------------------------
.arrghus
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E0CFB, $3D) ; Rupee pull kills
%write8($7E0CFC, $1A) ; Rupee pull hits
..end

;===================================================================================================
presetpersistent_alldungeonsmg_tower_of_hera:
;-----------------------------
.swamp_crystal_hookpush
%write8($7E0B08, $08) ; Arc variable
%write8($7E0B09, $63) ; Arc variable
%write8($7E02A1, $17) ; Slot 3 Altitude
%write8($7E0CFB, $4A) ; Rupee pull kills
%write8($7E0CFC, $1C) ; Rupee pull hits
..end
;-----------------------------
.old_man_cave
%write_sq()
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E044A, $02) ; EG strength
%write8($7E0FC7, $00) ; Prize pack 1
%write8($7E0FC8, $00) ; Prize pack 2
%write8($7E0FCC, $00) ; Prize pack 6
..end
;-----------------------------
.entrance
..end
;-----------------------------
.moldorm
..end

;===================================================================================================
presetpersistent_alldungeonsmg_agahnim:
;-----------------------------
.hera_entrance
..end
;-----------------------------
.beetles
..end
;-----------------------------
.yuzuhera
%write8($7E0FCC, $01) ; Prize pack 6
%write8($7E0CFB, $4D) ; Rupee pull kills
..end
;-----------------------------
.arena_dash
%write8($7E02A2, $18) ; Slot 4 Altitude
%write8($7E0CFB, $4E) ; Rupee pull kills
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_alldungeonsmg_ganon:
;-----------------------------
.pyramid
%write8($7E02A2, $00) ; Slot 4 Altitude
..end

;===================================================================================================
presetSRAM_alldungeonsmg:
;-----------------------------
.escape
;-----------------------------
..links_bed
%write8($7EF36F, $FF) ; Keys
%writeroom($106, $F000)
%writeroom($107, $F000)
...end
;-----------------------------
..lamp
%write8($7EF3C6, $10) ; Game flags A
%write8($7EF3CC, $05) ; Follower
%writeroom($104, $0002)
...end
;-----------------------------
..outside
%write8($7EF34A, $01) ; Lamp
%writeroom($104, $0012)
...end
;-----------------------------
..uncle
%write16sram($7EF360, $0001) ; Rupees
%writeroom($055, $000C)
...end
;-----------------------------
..courtyard
%write8($7EF359, $01) ; Sword
%write8($7EF35A, $01) ; Shield
%write8($7EF3C5, $01) ; Game state
%write8($7EF3C6, $11) ; Game flags A
%write8($7EF3C8, $03) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%writeroom($055, $000F)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..stair_clip
%write8($7EF36F, $00) ; Keys
%writeroom($061, $000F)
%writeroom($062, $000F)
...end
;-----------------------------
..re_arm_eg
...end
;-----------------------------
..zeldas_cell
%write8($7EF36D, $10) ; Health
%writeroom($070, $0008)
%writeroom($071, $000C)
%writeroom($072, $000C)
...end
;-----------------------------
..eg_to_sanc
%write8($7EF36D, $0C) ; Health
%write8($7EF3C8, $02) ; Spawn point
%write8($7EF3CC, $01) ; Follower
%write16sram($7EF366, $4000) ; Big keys
%writeroom($080, $042C)
...end
;-----------------------------
..pre_sanctuary
%writeroom($010, $0005)
%writeroom($020, $0005)
%writeroom($030, $0005)
%writeroom($040, $0005)
%writeroom($050, $0005)
%writeroom($060, $0005)
%writeroom($070, $000D)
...end
;-----------------------------
..sanctuary
%writeroom($011, $000F)
...end
;-----------------------------
.collection
;-----------------------------
..sanctuary_to_bat_cave
%write8($7EF3C5, $02) ; Game state
%write8($7EF3C6, $15) ; Game flags A
%write8($7EF3C7, $01) ; Map marker
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF29B, $20) ; OW screen $1B
%writeroom($012, $000F)
...end
;-----------------------------
..bat_cave_reload
%write8($7EF36F, $FF) ; Keys
%writeroom($002, $000F)
%writeroom($0E2, $0005)
%writeroom($0E3, $0002)
%writeroom($0F2, $0007)
...end
;-----------------------------
..somaria_bridge
%writeroom($0C3, $000A)
%writeroom($0D3, $000A)
%writeroom($0E3, $000A)
...end
;-----------------------------
..beat_the_fireball
%write8($7EF350, $01) ; Somaria
%write8($7EF36D, $04) ; Health
%writeroom($0C3, $001F)
...end
;-----------------------------
..sluggulas
%write8($7EF36F, $FD) ; Keys
%writeroom($0C1, $C003)
%writeroom($0C2, $400F)
...end
;-----------------------------
..torches_room_stc
%write8($7EF343, $01) ; Bombs
%write8($7EF36E, $80) ; Magic
%write16sram($7EF360, $0002) ; Rupees
%writeroom($097, $0008)
%writeroom($0D1, $0008)
...end
;-----------------------------
..getting_hook_and_pearl
%write8($7EF36E, $50) ; Magic
%writeroom($027, $000A)
%writeroom($037, $000E)
%writeroom($047, $000A)
%writeroom($057, $000A)
%writeroom($067, $000A)
%writeroom($077, $000A)
%writeroom($087, $000A)
%writeroom($097, $000A)
...end
;-----------------------------
.eastern_palace
;-----------------------------
..links_house
%write8($7EF342, $01) ; Hookshot
%write8($7EF343, $02) ; Bombs
%write8($7EF357, $01) ; Pearl
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $FF) ; Keys
%writeroom($027, $001F)
%writeroom($036, $001F)
%writeroom($037, $200E)
...end
;-----------------------------
..eastern_screen_wrapping
...end
;-----------------------------
..spin_hookpush
...end
;-----------------------------
..armos
%write8($7EF343, $01) ; Bombs
%write8($7EF36D, $10) ; Health
%write8($7EF36E, $2C) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($0C9, $0003)
...end
;-----------------------------
.skull_woods
;-----------------------------
..outside_eastern
%write8($7EF36C, $20) ; Max HP
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $04) ; Pendants
%writeroom($0C8, $0801)
...end
;-----------------------------
..sahasrahlas_hut
...end
;-----------------------------
..links_house
%write8($7EF343, $04) ; Bombs
%write8($7EF355, $01) ; Boots
%write8($7EF36D, $18) ; Health
%write8($7EF36E, $78) ; Magic
%write8($7EF379, $FC) ; Ability
%write8($7EF3C7, $03) ; Map marker
%write16sram($7EF360, $0034) ; Rupees
%writeroom($105, $803A)
...end
;-----------------------------
..castle_screen
...end
;-----------------------------
..hookpush_to_skull
...end
;-----------------------------
..dungeon_reload
%write8($7EF36D, $10) ; Health
%write8($7EF36E, $80) ; Magic
%write16sram($7EF360, $0039) ; Rupees
%writeroom($055, $001F)
%writeroom($056, $0002)
...end
;-----------------------------
..fire_rod_stc
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($056, $840F)
...end
;-----------------------------
..open_the_skull
%write8($7EF343, $03) ; Bombs
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36D, $18) ; Health
%write8($7EF36E, $70) ; Magic
%write16sram($7EF366, $4080) ; Big keys
%writeroom($057, $001F)
%writeroom($058, $0012)
%writeroom($067, $000F)
...end
;-----------------------------
..skull_entrance
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF2C0, $20) ; OW screen $40
...end
;-----------------------------
..getting_item_from_moth
%write8($7EF36E, $74) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($039, $0005)
%writeroom($049, $0005)
%writeroom($059, $000F)
...end
;-----------------------------
.skull_woods_helmasaur
;-----------------------------
..skull_entrance_mirror
%write8($7EF359, $04) ; Sword
%write8($7EF36C, $28) ; Max HP
%write8($7EF36D, $28) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%writeroom($029, $0801)
...end
;-----------------------------
..mirror_made_of_crystal
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..skull_entrance_helmasaur
%write8($7EF353, $02) ; Mirror
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
...end
;-----------------------------
..helmasaur_weirdshot
%write8($7EF36E, $74) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($05A, $0002)
...end
;-----------------------------
..helmasaur
%write8($7EF343, $02) ; Bombs
%write8($7EF36E, $6C) ; Magic
%writeroom($06A, $800F)
...end
;-----------------------------
.palace_of_darkness_blind
;-----------------------------
..pod_entrance
%write8($7EF343, $01) ; Bombs
%write8($7EF36C, $30) ; Max HP
%write8($7EF36D, $30) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $40) ; Crystals
%writeroom($05A, $0803)
...end
;-----------------------------
..pod_hookpush
%write8($7EF36F, $00) ; Keys
%writeroom($04A, $0003)
...end
;-----------------------------
..prison_misslottings
%write8($7EF343, $03) ; Bombs
%write8($7EF36E, $70) ; Magic
%writeroom($046, $000C)
%writeroom($047, $000E)
%writeroom($048, $000C)
%writeroom($049, $000F)
%writeroom($04A, $000F)
...end
;-----------------------------
..attic_falling
%write8($7EF343, $02) ; Bombs
%write8($7EF36E, $4C) ; Magic
%write8($7EF3CC, $06) ; Follower
%writeroom($045, $0005)
%writeroom($046, $000F)
%writeroom($066, $000C)
...end
;-----------------------------
..blind
%write8($7EF343, $01) ; Bombs
%write8($7EF36E, $44) ; Magic
%writeroom($065, $010F)
...end
;-----------------------------
.thieves_town_kholdstare
;-----------------------------
..outside_thieves
%write8($7EF36C, $38) ; Max HP
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $42) ; Crystals
%write8($7EF3C7, $07) ; Map marker
%write8($7EF3CC, $00) ; Follower
%writeroom($0AC, $0A01)
...end
;-----------------------------
..hookpush_to_ice_rod
%write8($7EF2D8, $20) ; OW screen $58
...end
;-----------------------------
..ice_rod_room
%write8($7EF343, $0A) ; Bombs
%write8($7EF36E, $68) ; Magic
%write16sram($7EF360, $0007) ; Rupees
%writeroom($11F, $0001)
%writeroom($120, $0002)
...end
;-----------------------------
..thieves_entrance
%write8($7EF346, $01) ; Ice Rod
%write8($7EF3CA, $40) ; LW/DW
%writeroom($120, $001A)
...end
;-----------------------------
..thieves_ambush
%write8($7EF36F, $00) ; Keys
%writeroom($0DB, $000F)
...end
;-----------------------------
..kholdstare_weirdshot
%writeroom($0CB, $000F)
%writeroom($0CC, $000F)
%writeroom($0CD, $000C)
...end
;-----------------------------
..kholdstare_hookpushes
%write8($7EF343, $09) ; Bombs
%write8($7EF36E, $80) ; Magic
%write16sram($7EF360, $0008) ; Rupees
%writeroom($0CE, $000C)
...end
;-----------------------------
..kholdstare
%write8($7EF343, $0A) ; Bombs
%write8($7EF36E, $58) ; Magic
%writeroom($0CE, $000D)
...end
;-----------------------------
.ice_palace_agahnim_2
;-----------------------------
..ice_entrance_crystal
%write8($7EF36C, $40) ; Max HP
%write8($7EF36D, $40) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $62) ; Crystals
%writeroom($0DE, $0804)
...end
;-----------------------------
..ice_palace_fanfare_skip
%write8($7EF36E, $70) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($00E, $0001)
%writeroom($00F, $000A)
%writeroom($0EF, $0003)
%writeroom($0FF, $000F)
...end
;-----------------------------
..ice_entrance_agahnim_2
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $66) ; Crystals
%writeroom($0DE, $0806)
%writeroom($0EE, $000F)
...end
;-----------------------------
..agahnim_2_misslottings
%write8($7EF36E, $70) ; Magic
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..agahnim_2
%write8($7EF343, $09) ; Bombs
%write8($7EF36E, $60) ; Magic
%writeroom($01D, $000C)
%writeroom($01E, $000C)
...end
;-----------------------------
.hyrule_castle_lanmolas
;-----------------------------
..pyramid
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF2DB, $20) ; OW screen $5B
%writeroom($00D, $0802)
...end
;-----------------------------
..somaria_stair_clip
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..dark_room_bonk
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($052, $000F)
...end
;-----------------------------
..lanmolas
%writeroom($042, $000F)
%writeroom($043, $000C)
...end
;-----------------------------
.desert_palace_vitreous
;-----------------------------
..hookpush_to_desert
%write8($7EF348, $01) ; Ether
%write8($7EF36C, $48) ; Max HP
%write8($7EF36D, $48) ; Health
%write8($7EF36E, $74) ; Magic
%writeroom($033, $0802)
...end
;-----------------------------
..desert_hookpush
%write8($7EF36E, $58) ; Magic
%write8($7EF36F, $FF) ; Keys
%writeroom($063, $0002)
...end
;-----------------------------
..slime_room_weirdshot
%write8($7EF36E, $48) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($073, $000A)
%writeroom($081, $000F)
%writeroom($082, $000F)
%writeroom($083, $000A)
...end
;-----------------------------
..vitreous_hookpush
%write8($7EF343, $08) ; Bombs
%write8($7EF36E, $40) ; Magic
%writeroom($091, $0005)
...end
;-----------------------------
..vitreous
%write8($7EF36E, $30) ; Magic
%writeroom($0A0, $000F)
...end
;-----------------------------
.misery_mire_trinexx
;-----------------------------
..outside_mire
%write8($7EF36C, $50) ; Max HP
%write8($7EF36D, $50) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $06) ; Pendants
%writeroom($090, $0802)
...end
;-----------------------------
..mire_2
%write8($7EF36E, $5C) ; Magic
%write8($7EF36F, $00) ; Keys
%write8($7EF2F0, $20) ; OW screen $70
%writeroom($098, $0003)
...end
;-----------------------------
..main_hub
%write8($7EF36E, $54) ; Magic
%writeroom($0D2, $000F)
...end
;-----------------------------
..trinexx_stc_hookpush
%writeroom($0B2, $0001)
...end
;-----------------------------
..trinexx
%write8($7EF36E, $4C) ; Magic
%writeroom($0A3, $8403)
%writeroom($0B3, $8402)
...end
;-----------------------------
.turtle_rock_arrghus
;-----------------------------
..turtle_rock_entrance
%write8($7EF36C, $58) ; Max HP
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $67) ; Crystals
%writeroom($0A4, $0802)
...end
;-----------------------------
..pre_armos_room_weirdshot
%write8($7EF36E, $70) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($0D6, $8005)
%writeroom($0D7, $0003)
...end
;-----------------------------
..arrghus_death_hole
%write8($7EF343, $07) ; Bombs
%write8($7EF36E, $48) ; Magic
%writeroom($0D8, $000F)
...end
;-----------------------------
..arrghus
%write8($7EF343, $06) ; Bombs
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $30) ; Magic
%writeroom($005, $000F)
%writeroom($0E8, $000F)
...end
;-----------------------------
.tower_of_hera
;-----------------------------
..swamp_crystal_hookpush
%write8($7EF36C, $60) ; Max HP
%write8($7EF36D, $60) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $6F) ; Crystals
%writeroom($006, $0802)
...end
;-----------------------------
..old_man_cave
%write8($7EF36D, $38) ; Health
%write8($7EF37A, $7F) ; Crystals
%write8($7EF3C7, $08) ; Map marker
%writeroom($028, $000F)
%writeroom($029, $0803)
%writeroom($0E4, $000A)
...end
;-----------------------------
..entrance
...end
;-----------------------------
..moldorm
%write8($7EF36F, $00) ; Keys
%writeroom($017, $000F)
%writeroom($077, $000F)
%writeroom($0A7, $000C)
...end
;-----------------------------
.agahnim
;-----------------------------
..hera_entrance
%write8($7EF36C, $68) ; Max HP
%write8($7EF36D, $68) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $07) ; Pendants
%write8($7EF3C7, $04) ; Map marker
%writeroom($007, $080F)
...end
;-----------------------------
..beetles
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..yuzuhera
%writeroom($031, $0001)
...end
;-----------------------------
..arena_dash
%write8($7EF36E, $78) ; Magic
%writeroom($031, $0003)
...end
;-----------------------------
..agahnim
%writeroom($030, $8005)
...end
;-----------------------------
.ganon
;-----------------------------
..pyramid
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C5, $03) ; Game state
%write8($7EF3C7, $06) ; Map marker
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF282, $20) ; OW screen $02
%writeroom($020, $0807)
...end
;===================================================================================================
presetend_alldungeonsmg:
print "alldungeonsmg size: $", hex(presetend_alldungeonsmg-presetheader_alldungeonsmg)
