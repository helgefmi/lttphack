;===================================================================================================
; PRESET DATA HEADER
;===================================================================================================
presetheader_reversebossorder:
	dw presetSRAM_reversebossorder ; location of SRAM
	dw presetpersistent_reversebossorder ; location of persistent data

;===================================================================================================
%menu_header("Reverse Boss Order", 15)
	%submenu("Escape", presetmenu_reversebossorder_escape)
	%submenu("Collection", presetmenu_reversebossorder_collection)
	%submenu("Ganon", presetmenu_reversebossorder_ganon)
	%submenu("Agahnim 2", presetmenu_reversebossorder_agahnim_2)
	%submenu("Trinexx", presetmenu_reversebossorder_trinexx)
	%submenu("Vitreous", presetmenu_reversebossorder_vitreous)
	%submenu("Knoldstare", presetmenu_reversebossorder_knoldstare)
	%submenu("Blind", presetmenu_reversebossorder_blind)
	%submenu("Mothula", presetmenu_reversebossorder_mothula)
	%submenu("Arrghus", presetmenu_reversebossorder_arrghus)
	%submenu("Helmasaur", presetmenu_reversebossorder_helmasaur)
	%submenu("Agahnim", presetmenu_reversebossorder_agahnim)
	%submenu("Moldorm", presetmenu_reversebossorder_moldorm)
	%submenu("Lanmolas", presetmenu_reversebossorder_lanmolas)
	%submenu("Triforce", presetmenu_reversebossorder_triforce)

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; ESCAPE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_escape:
%menu_header("Escape", 12)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's Bed", "reversebossorder", "escape", "links_bed")
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
%preset_UW("Lamp", "reversebossorder", "escape", "lamp")
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
%preset_OW("Outside", "reversebossorder", "escape", "outside")
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
%preset_UW("Uncle", "reversebossorder", "escape", "uncle")
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
%preset_UW("Courtyard", "reversebossorder", "escape", "courtyard")
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
%preset_OW("Entrance", "reversebossorder", "escape", "entrance")
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
%preset_UW("Stair Clip", "reversebossorder", "escape", "stair_clip")
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
%preset_UW("Re-arm EG", "reversebossorder", "escape", "re_arm_eg")
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
%preset_UW("Zelda's Cell", "reversebossorder", "escape", "zeldas_cell")
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
%preset_UW("EG to Sanc", "reversebossorder", "escape", "eg_to_sanc")
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
%preset_UW("Dark Room Crossing", "reversebossorder", "escape", "dark_room_crossing")
dw $0030 ; Screen ID
dw $01E6, $07C0 ; Link Coords
dw $0100, $0712 ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $3E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $0700) ; Camera boundaries
%write16($7E0602, $0600) ; Camera boundaries
%write16($7E0604, $0710) ; Camera boundaries
%write16($7E0606, $0710) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Before Cutscene", "reversebossorder", "escape", "before_cutscene")
dw $0011 ; Screen ID
dw $03E6, $03C0 ; Link Coords
dw $0300, $0312 ; Camera HV
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

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; COLLECTION
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_collection:
%menu_header("Collection", 20)

;---------------------------------------------------------------------------------------------------
%preset_UW("After Cutscene", "reversebossorder", "collection", "after_cutscene")
dw $0012 ; Screen ID
dw $0475, $02EA ; Link Coords
dw $0400, $027E ; Camera HV
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
%preset_OW("Bootless DMA", "reversebossorder", "collection", "bootless_dma")
dw $0013 ; Screen ID
dw $0607, $0538 ; Link Coords
dw $0600, $04DA ; Camera HV
db $09 ; Item
db $04 ; Direction
;-----------------------------
dw $0685, $0547 ; Scroll X,Y
dw $0700 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Camera Fixing", "reversebossorder", "collection", "camera_fixing")
dw $0012 ; Screen ID
dw $05E6, $0338 ; Link Coords
dw $0500, $0400 ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
dw $0585, $046D ; Scroll X,Y
dw $0020 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Death Mountain", "reversebossorder", "collection", "death_mountain")
dw $00F1 ; Screen ID
dw $0378, $1FE2 ; Link Coords
dw $0300, $1F10 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $07 ; Entrance
db $F0 ; Room layout
db $09 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sanctuary", "reversebossorder", "collection", "sanctuary")
dw $0012 ; Screen ID
dw $04F8, $029C ; Link Coords
dw $0480, $0231 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $02 ; Entrance
db $C0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Bat Cave Teleport", "reversebossorder", "collection", "bat_cave_teleport")
dw $0022 ; Screen ID
dw $0508, $08D9 ; Link Coords
dw $0496, $087B ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
dw $0513, $08E8 ; Scroll X,Y
dw $0412 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Somaria Bridge", "reversebossorder", "collection", "somaria_bridge")
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
%preset_UW("Beat the Fireball", "reversebossorder", "collection", "beat_the_fireball")
dw $00C3 ; Screen ID
dw $060A, $18F8 ; Link Coords
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
%preset_UW("Sluggulas", "reversebossorder", "collection", "sluggulas")
dw $00C1 ; Screen ID
dw $0278, $19E1 ; Link Coords
dw $0200, $1910 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $2F ; Room layout
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Torches Room STC", "reversebossorder", "collection", "torches_room_stc")
dw $0097 ; Screen ID
dw $0E78, $12E1 ; Link Coords
dw $0E00, $1210 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $00 ; Room layout
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Getting Hook and Pearl", "reversebossorder", "collection", "getting_hook_and_pearl")
dw $0037 ; Screen ID
dw $0E0A, $DB78 ; Link Coords
dw $0E00, $DC77 ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $11 ; Entrance
db $80 ; Room layout
db $42 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $CE00) ; Camera boundaries
%write16($7E0602, $CE00) ; Camera boundaries
%write16($7E0604, $CE10) ; Camera boundaries
%write16($7E0606, $CF10) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("After Moonpearl", "reversebossorder", "collection", "after_moonpearl")
dw $0027 ; Screen ID
dw $0EE4, $DA5F ; Link Coords
dw $0E6C, $DA21 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $E0 ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $CD00) ; Camera boundaries
%write16($7E0602, $CC00) ; Camera boundaries
%write16($7E0604, $CD10) ; Camera boundaries
%write16($7E0606, $CD10) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Back in the Right Screen", "reversebossorder", "collection", "back_in_the_right_screen")
dw $0031 ; Screen ID
dw $03C8, $DCB8 ; Link Coords
dw $02C9, $DC4D ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $11 ; Entrance
db $3F ; Room layout
db $40 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $CF00) ; Camera boundaries
%write16($7E0602, $CE00) ; Camera boundaries
%write16($7E0604, $CF10) ; Camera boundaries
%write16($7E0606, $CF10) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Fire Rod Weirldshot", "reversebossorder", "collection", "fire_rod_weirldshot")
dw $0058 ; Screen ID
dw $11C8, $E261 ; Link Coords
dw $1100, $E2B0 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $11 ; Entrance
db $7E ; Room layout
db $4C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $D500) ; Camera boundaries
%write16($7E0602, $D200) ; Camera boundaries
%write16($7E0604, $D510) ; Camera boundaries
%write16($7E0606, $D310) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Skull Quickwarp", "reversebossorder", "collection", "skull_quickwarp")
dw $0058 ; Screen ID
dw $1078, $E3E1 ; Link Coords
dw $103E, $E35F ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $11 ; Entrance
db $6D ; Room layout
db $41 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $D500) ; Camera boundaries
%write16($7E0602, $D200) ; Camera boundaries
%write16($7E0604, $D510) ; Camera boundaries
%write16($7E0606, $D310) ; Camera boundaries
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Leaving Skull", "reversebossorder", "collection", "leaving_skull")
dw $0040 ; Screen ID
dw $0388, $03E2 ; Link Coords
dw $0300, $031E ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $038D, $038B ; Scroll X,Y
dw $17E0 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Frog Rescue", "reversebossorder", "collection", "frog_rescue")
dw $0058 ; Screen ID
dw $0350, $09E1 ; Link Coords
dw $02CA, $091E ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $0357, $098B ; Scroll X,Y
dw $185A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Getting Tempered", "reversebossorder", "collection", "getting_tempered")
dw $0058 ; Screen ID
dw $03E6, $0921 ; Link Coords
dw $0300, $08BD ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
dw $038D, $092C ; Scroll X,Y
dw $1560 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Kak Town Hooks", "reversebossorder", "collection", "kak_town_hooks")
dw $0022 ; Screen ID
dw $0407, $0908 ; Link Coords
dw $0400, $08A5 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
dw $047D, $0914 ; Scroll X,Y
dw $0400 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hookshop to Ice Rod", "reversebossorder", "collection", "hookshop_to_ice_rod")
dw $0018 ; Screen ID
dw $01B8, $094B ; Link Coords
dw $013A, $08E8 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $01BF, $0957 ; Scroll X,Y
dw $16A8 ; Tilemap position
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; GANON
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_ganon:
%menu_header("Ganon", 4)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "reversebossorder", "ganon", "links_house")
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
%preset_OW("Wish Enemy Prize", "reversebossorder", "ganon", "wish_enemy_prize")
dw $002C ; Screen ID
dw $0898, $0A05 ; Link Coords
dw $0816, $0A00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $08A3, $0A6D ; Scroll X,Y
dw $0002 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ganon Pot", "reversebossorder", "ganon", "ganon_pot")
dw $001B ; Screen ID
dw $07F8, $06F9 ; Link Coords
dw $0776, $0695 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
dw $0803, $0704 ; Scroll X,Y
dw $0430 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Ganon", "reversebossorder", "ganon", "ganon")
dw $0061 ; Screen ID
dw $0318, $0C7A ; Link Coords
dw $02A0, $0C0E ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $04 ; Entrance
db $D0 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM 2
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_agahnim_2:
%menu_header("Agahnim 2", 7)

;---------------------------------------------------------------------------------------------------
%preset_UW("After Ganon", "reversebossorder", "agahnim_2", "after_ganon")
dw $0010 ; Screen ID
dw $0118, $0230 ; Link Coords
dw $0100, $0200 ; Camera HV
db $14 ; Item
db $04 ; Direction
;-----------------------------
db $04 ; Entrance
db $5E ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Somaria Stair Clip", "reversebossorder", "agahnim_2", "somaria_stair_clip")
dw $0061 ; Screen ID
dw $03E4, $0CF8 ; Link Coords
dw $0300, $0C8C ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $D0 ; Room layout
db $0A ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("EG Under Beamos", "reversebossorder", "agahnim_2", "eg_under_beamos")
dw $0063 ; Screen ID
dw $0628, $0C05 ; Link Coords
dw $0600, $0C00 ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $04 ; Entrance
db $00 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Spin STC", "reversebossorder", "agahnim_2", "spin_stc")
dw $0043 ; Screen ID
dw $0778, $09E1 ; Link Coords
dw $06BB, $0910 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $04 ; Entrance
db $30 ; Room layout
db $09 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Laser Entrance", "reversebossorder", "agahnim_2", "laser_entrance")
dw $0045 ; Screen ID
dw $0CB8, $016A ; Link Coords
dw $0C46, $0106 ; Camera HV
db $14 ; Item
db $02 ; Direction
;-----------------------------
dw $0CC3, $0175 ; Scroll X,Y
dw $07CA ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lava Dive", "reversebossorder", "agahnim_2", "lava_dive")
dw $0023 ; Screen ID
dw $07E8, $0578 ; Link Coords
dw $0700, $050C ; Camera HV
db $14 ; Item
db $06 ; Direction
;-----------------------------
db $15 ; Entrance
db $3F ; Room layout
db $02 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Agahnim 2", "reversebossorder", "agahnim_2", "agahnim_2")
dw $0004 ; Screen ID
dw $0878, $02E1 ; Link Coords
dw $0800, $0111 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
db $15 ; Entrance
db $2F ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write16_enable()
%write16($7E0600, $FF00) ; Camera boundaries
%write16($7E0602, $FE00) ; Camera boundaries
%write16($7E0604, $FF10) ; Camera boundaries
%write16($7E0606, $FF10) ; Camera boundaries
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TRINEXX
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_trinexx:
%menu_header("Trinexx", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "reversebossorder", "trinexx", "pyramid")
dw $005B ; Screen ID
dw $07F0, $065C ; Link Coords
dw $0778, $0600 ; Camera HV
db $01 ; Item
db $02 ; Direction
;-----------------------------
dw $07F7, $066D ; Scroll X,Y
dw $002E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Castle Hookpush", "reversebossorder", "trinexx", "castle_hookpush")
dw $001B ; Screen ID
dw $08C8, $0629 ; Link Coords
dw $0850, $0600 ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $08CF, $066D ; Scroll X,Y
dw $004A ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx Weirdshot", "reversebossorder", "trinexx", "trinexx_weirdshot")
dw $00A4 ; Screen ID
dw $080C, $15DA ; Link Coords
dw $0802, $14EB ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $05 ; Entrance
db $2F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Trinexx", "reversebossorder", "trinexx", "trinexx")
dw $00B4 ; Screen ID
dw $0878, $1613 ; Link Coords
dw $0802, $1600 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $05 ; Entrance
db $CE ; Room layout
db $01 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; VITREOUS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_vitreous:
%menu_header("Vitreous", 7)

;---------------------------------------------------------------------------------------------------
%preset_UW("After Trinexx", "reversebossorder", "vitreous", "after_trinexx")
dw $00A4 ; Screen ID
dw $080B, $150A ; Link Coords
dw $0800, $1500 ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $05 ; Entrance
db $2E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Dark Room", "reversebossorder", "vitreous", "dark_room")
dw $00A3 ; Screen ID
dw $06C8, $1406 ; Link Coords
dw $06C8, $1400 ; Camera HV
db $01 ; Item
db $04 ; Direction
;-----------------------------
db $05 ; Entrance
db $4E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Desert Weirdshot", "reversebossorder", "vitreous", "desert_weirdshot")
dw $0093 ; Screen ID
dw $06E8, $1206 ; Link Coords
dw $069F, $1206 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
db $05 ; Entrance
db $0E ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Desert Hookpush", "reversebossorder", "vitreous", "desert_hookpush")
dw $0030 ; Screen ID
dw $0088, $0CAB ; Link Coords
dw $0003, $0C49 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $0090, $0CB6 ; Scroll X,Y
dw $0280 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Slime Room Weirdshot", "reversebossorder", "vitreous", "slime_room_weirdshot")
dw $0082 ; Screen ID
dw $0408, $11B8 ; Link Coords
dw $0400, $1110 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $0B ; Entrance
db $EE ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous Stuckhook", "reversebossorder", "vitreous", "vitreous_stuckhook")
dw $0091 ; Screen ID
dw $0378, $12A0 ; Link Coords
dw $0300, $1233 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $0B ; Entrance
db $5D ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Vitreous", "reversebossorder", "vitreous", "vitreous")
dw $00A0 ; Screen ID
dw $00A0, $1407 ; Link Coords
dw $0028, $1400 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $0B ; Entrance
db $CE ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; KNOLDSTARE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_knoldstare:
%menu_header("Knoldstare", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Mire", "reversebossorder", "knoldstare", "outside_mire")
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
%preset_UW("Link's House", "reversebossorder", "knoldstare", "links_house")
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
%preset_OW("Eastern Screen Wrapping", "reversebossorder", "knoldstare", "eastern_screen_wrapping")
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
%preset_OW("Eastern Entrance", "reversebossorder", "knoldstare", "eastern_entrance")
dw $001E ; Screen ID
dw $0F50, $0A29 ; Link Coords
dw $0EDA, $091E ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $0F57, $098D ; Scroll X,Y
dw $185C ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Cannonballs", "reversebossorder", "knoldstare", "cannonballs")
dw $00C9 ; Screen ID
dw $12F8, $1814 ; Link Coords
dw $1280, $1800 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $80 ; Room layout
db $81 ; Door / Peg state / Layer
dw $0002 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Knoldstare Weirdshot", "reversebossorder", "knoldstare", "knoldstare_weirdshot")
dw $00CD ; Screen ID
dw $1BE7, $1848 ; Link Coords
dw $1AE8, $1800 ; Camera HV
db $12 ; Item
db $06 ; Direction
;-----------------------------
db $08 ; Entrance
db $10 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Knoldstare Hookpushes", "reversebossorder", "knoldstare", "knoldstare_hookpushes")
dw $00CE ; Screen ID
dw $1D48, $1856 ; Link Coords
dw $1D00, $1800 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $08 ; Entrance
db $1F ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Knoldstare", "reversebossorder", "knoldstare", "knoldstare")
dw $00CE ; Screen ID
dw $1DC0, $19D8 ; Link Coords
dw $1D00, $18EC ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $3F ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; BLIND
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_blind:
%menu_header("Blind", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Ice", "reversebossorder", "blind", "outside_ice")
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
%preset_OW("Fountain Hookpush", "reversebossorder", "blind", "fountain_hookpush")
dw $0035 ; Screen ID
dw $0CA8, $0D99 ; Link Coords
dw $0C2E, $0D3B ; Camera HV
db $14 ; Item
db $00 ; Direction
;-----------------------------
dw $0CB3, $0DA8 ; Scroll X,Y
dw $0A46 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Ice Entrance", "reversebossorder", "blind", "ice_entrance")
dw $0075 ; Screen ID
dw $0CB9, $0DC3 ; Link Coords
dw $0C3F, $0D65 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
dw $0CC4, $0DD2 ; Scroll X,Y
dw $0B46 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("GT Hookpush", "reversebossorder", "blind", "gt_hookpush")
dw $000C ; Screen ID
dw $1978, $0038 ; Link Coords
dw $1900, $0034 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $2D ; Entrance
db $DF ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Thieves' Weirdshot", "reversebossorder", "blind", "thieves_weirdshot")
dw $00AC ; Screen ID
dw $19A1, $15D9 ; Link Coords
dw $1900, $14F0 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $2D ; Entrance
db $3D ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Prison Hookpushes", "reversebossorder", "blind", "prison_hookpushes")
dw $00BC ; Screen ID
dw $1878, $1620 ; Link Coords
dw $1832, $1600 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $2D ; Entrance
db $4C ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Attic Falling", "reversebossorder", "blind", "attic_falling")
dw $0066 ; Screen ID
dw $0C08, $0C30 ; Link Coords
dw $0C00, $0C00 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $2D ; Entrance
db $8A ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Blind", "reversebossorder", "blind", "blind")
dw $0065 ; Screen ID
dw $0B62, $0D60 ; Link Coords
dw $0AEA, $0CF3 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $2D ; Entrance
db $B9 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MOTHULA
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_mothula:
%menu_header("Mothula", 6)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves' 1", "reversebossorder", "mothula", "outside_thieves_1")
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
%preset_UW("Thieves' Fanfare Skip", "reversebossorder", "mothula", "thieves_fanfare_skip")
dw $00CB ; Screen ID
dw $17E6, $1805 ; Link Coords
dw $1700, $1800 ; Camera HV
db $09 ; Item
db $00 ; Direction
;-----------------------------
db $34 ; Entrance
db $DF ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Thieves' 2", "reversebossorder", "mothula", "outside_thieves_2")
dw $0058 ; Screen ID
dw $01F8, $07BB ; Link Coords
dw $0176, $075D ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
dw $0203, $07CA ; Scroll X,Y
dw $0B2E ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Hookpush to Skull", "reversebossorder", "mothula", "hookpush_to_skull")
dw $0050 ; Screen ID
dw $0058, $0406 ; Link Coords
dw $0000, $0400 ; Camera HV
db $12 ; Item
db $00 ; Direction
;-----------------------------
dw $008D, $046F ; Scroll X,Y
dw $0080 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Skull Entrance", "reversebossorder", "mothula", "skull_entrance")
dw $0040 ; Screen ID
dw $0098, $00CA ; Link Coords
dw $0016, $0066 ; Camera HV
db $05 ; Item
db $00 ; Direction
;-----------------------------
dw $00A3, $00D5 ; Scroll X,Y
dw $0282 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Getting Item from Moth", "reversebossorder", "mothula", "getting_item_from_moth")
dw $0039 ; Screen ID
dw $137A, $0604 ; Link Coords
dw $12E1, $0600 ; Camera HV
db $12 ; Item
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
; ARRGHUS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_arrghus:
%menu_header("Arrghus", 8)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Skull", "reversebossorder", "arrghus", "outside_skull")
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
%preset_UW("Mire Entrance Weirdshot", "reversebossorder", "arrghus", "mire_entrance_weirdshot")
dw $0088 ; Screen ID
dw $11C1, $11D9 ; Link Coords
dw $1100, $10EF ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $2B ; Entrance
db $3F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Mire Entrance Hookpush", "reversebossorder", "arrghus", "mire_entrance_hookpush")
dw $0070 ; Screen ID
dw $0128, $0CD9 ; Link Coords
dw $00A6, $0C7B ; Camera HV
db $10 ; Item
db $00 ; Direction
;-----------------------------
dw $0133, $0CE8 ; Scroll X,Y
dw $0414 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Mire Fanfare Skip", "reversebossorder", "arrghus", "mire_fanfare_skip")
dw $00A5 ; Screen ID
dw $0A09, $1471 ; Link Coords
dw $0A04, $1404 ; Camera HV
db $0E ; Item
db $04 ; Direction
;-----------------------------
db $27 ; Entrance
db $0F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Turtle Hookpush", "reversebossorder", "arrghus", "turtle_hookpush")
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
%preset_UW("Pre Armos Room Weirdshot", "reversebossorder", "arrghus", "pre_armos_room_weirdshot")
dw $00D7 ; Screen ID
dw $0FE7, $1B93 ; Link Coords
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
%preset_UW("Arrghus Death Hole", "reversebossorder", "arrghus", "arrghus_death_hole")
dw $00D8 ; Screen ID
dw $1162, $1AC0 ; Link Coords
dw $1100, $1A54 ; Camera HV
db $0E ; Item
db $06 ; Direction
;-----------------------------
db $35 ; Entrance
db $5E ; Room layout
db $80 ; Door / Peg state / Layer
dw $06FC ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arrghus", "reversebossorder", "arrghus", "arrghus")
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
; HELMASAUR
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_helmasaur:
%menu_header("Helmasaur", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Swamp Crystal Hookpush", "reversebossorder", "helmasaur", "swamp_crystal_hookpush")
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
%preset_OW("Outside Skull", "reversebossorder", "helmasaur", "outside_skull")
dw $0040 ; Screen ID
dw $0098, $00CB ; Link Coords
dw $0016, $0069 ; Camera HV
db $09 ; Item
db $02 ; Direction
;-----------------------------
dw $00A3, $00D6 ; Scroll X,Y
dw $0282 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur Misslottings", "reversebossorder", "helmasaur", "helmasaur_misslottings")
dw $005A ; Screen ID
dw $1428, $0BDA ; Link Coords
dw $1400, $0B10 ; Camera HV
db $12 ; Item
db $02 ; Direction
;-----------------------------
db $2B ; Entrance
db $2F ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Helmasaur", "reversebossorder", "helmasaur", "helmasaur")
dw $006A ; Screen ID
dw $1538, $0C04 ; Link Coords
dw $146F, $0C00 ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
db $2B ; Entrance
db $5E ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; AGAHNIM
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_agahnim:
%menu_header("Agahnim", 7)

;---------------------------------------------------------------------------------------------------
%preset_OW("PoD Crystal Hookpush", "reversebossorder", "agahnim", "pod_crystal_hookpush")
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
%preset_UW("PoD Fanfare Skip", "reversebossorder", "agahnim", "pod_fanfare_skip")
dw $004A ; Screen ID
dw $14E6, $09D9 ; Link Coords
dw $146E, $0910 ; Camera HV
db $0E ; Item
db $02 ; Direction
;-----------------------------
db $26 ; Entrance
db $AF ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Old Man Cave", "reversebossorder", "agahnim", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $30 ; Entrance
db $60 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Beetles", "reversebossorder", "agahnim", "beetles")
dw $0077 ; Screen ID
dw $0F68, $0F48 ; Link Coords
dw $0EF0, $0EDC ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $33 ; Entrance
db $F1 ; Room layout
db $0C ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Yuzuhera", "reversebossorder", "agahnim", "yuzuhera")
dw $0031 ; Screen ID
dw $030B, $0778 ; Link Coords
dw $0300, $070C ; Camera HV
db $03 ; Item
db $04 ; Direction
;-----------------------------
db $33 ; Entrance
db $32 ; Room layout
db $82 ; Door / Peg state / Layer
dw $0580 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Arena Dash", "reversebossorder", "agahnim", "arena_dash")
dw $0030 ; Screen ID
dw $0278, $0615 ; Link Coords
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
%preset_UW("Agahnim", "reversebossorder", "agahnim", "agahnim")
dw $0020 ; Screen ID
dw $0209, $053E ; Link Coords
dw $0100, $0500 ; Camera HV
db $12 ; Item
db $04 ; Direction
;-----------------------------
db $33 ; Entrance
db $32 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; MOLDORM
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_moldorm:
%menu_header("Moldorm", 4)

;---------------------------------------------------------------------------------------------------
%preset_OW("Pyramid", "reversebossorder", "moldorm", "pyramid")
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
%preset_UW("Old Man Cave", "reversebossorder", "moldorm", "old_man_cave")
dw $00E4 ; Screen ID
dw $0878, $1D98 ; Link Coords
dw $0800, $1D10 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $30 ; Entrance
db $60 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Entrance", "reversebossorder", "moldorm", "entrance")
dw $0003 ; Screen ID
dw $0900, $0478 ; Link Coords
dw $088C, $031E ; Camera HV
db $0E ; Item
db $00 ; Direction
;-----------------------------
dw $090B, $038D ; Scroll X,Y
dw $1854 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Moldorm", "reversebossorder", "moldorm", "moldorm")
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
; LANMOLAS
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_lanmolas:
%menu_header("Lanmolas", 3)

;---------------------------------------------------------------------------------------------------
%preset_OW("Outside Hera", "reversebossorder", "lanmolas", "outside_hera")
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
%preset_UW("Sanctuary EG0 Jumps", "reversebossorder", "lanmolas", "sanctuary_eg0_jumps")
dw $0012 ; Screen ID
dw $04F8, $029C ; Link Coords
dw $0480, $0231 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $02 ; Entrance
db $C0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Lanmolas", "reversebossorder", "lanmolas", "lanmolas")
dw $0043 ; Screen ID
dw $0628, $0805 ; Link Coords
dw $0600, $0800 ; Camera HV
db $09 ; Item
db $06 ; Direction
;-----------------------------
db $02 ; Entrance
db $80 ; Room layout
db $08 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
;---------------------------------------------------------------------------------------------------
; TRIFORCE
;---------------------------------------------------------------------------------------------------
;===================================================================================================
presetmenu_reversebossorder_triforce:
%menu_header("Triforce", 5)

;---------------------------------------------------------------------------------------------------
%preset_UW("Link's House", "reversebossorder", "triforce", "links_house")
dw $0104 ; Screen ID
dw $0978, $2178 ; Link Coords
dw $0900, $2110 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $00 ; Entrance
db $20 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Eastern Screen Wrapping", "reversebossorder", "triforce", "eastern_screen_wrapping")
dw $002E ; Screen ID
dw $0C70, $0A06 ; Link Coords
dw $0C00, $0A00 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0C7D, $0A6D ; Scroll X,Y
dw $0000 ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_OW("Armos Hookpush", "reversebossorder", "triforce", "armos_hookpush")
dw $001E ; Screen ID
dw $0F50, $0A2A ; Link Coords
dw $0EDA, $091E ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
dw $0F57, $098D ; Scroll X,Y
dw $185C ; Tilemap position
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Armos", "reversebossorder", "triforce", "armos")
dw $00C9 ; Screen ID
dw $1209, $198B ; Link Coords
dw $1200, $1910 ; Camera HV
db $03 ; Item
db $00 ; Direction
;-----------------------------
db $08 ; Entrance
db $A0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;---------------------------------------------------------------------------------------------------
%preset_UW("Sanctuary Stuckhook", "reversebossorder", "triforce", "sanctuary_stuckhook")
dw $0012 ; Screen ID
dw $04F8, $029C ; Link Coords
dw $0480, $0231 ; Camera HV
db $03 ; Item
db $02 ; Direction
;-----------------------------
db $02 ; Entrance
db $C0 ; Room layout
db $00 ; Door / Peg state / Layer
dw $0000 ; Dead sprites
;-----------------------------
%write_end()

;===================================================================================================
presetpersistent_reversebossorder:

;===================================================================================================
presetpersistent_reversebossorder_escape:
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
.dark_room_crossing
..end
;-----------------------------
.before_cutscene
..end

;===================================================================================================
presetpersistent_reversebossorder_collection:
;-----------------------------
.after_cutscene
..end
;-----------------------------
.bootless_dma
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.camera_fixing
..end
;-----------------------------
.death_mountain
%write8($7E044A, $02) ; EG strength
%write8($7E047A, $00) ; Armed EG
%write8($7E0CFC, $02) ; Rupee pull hits
..end
;-----------------------------
.sanctuary
..end
;-----------------------------
.bat_cave_teleport
..end
;-----------------------------
.somaria_bridge
%write8($7E044A, $01) ; EG strength
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
;-----------------------------
.after_moonpearl
..end
;-----------------------------
.back_in_the_right_screen
..end
;-----------------------------
.fire_rod_weirldshot
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.skull_quickwarp
..end
;-----------------------------
.leaving_skull
%write_mirror($EC, $02, $68, $02)
..end
;-----------------------------
.frog_rescue
..end
;-----------------------------
.getting_tempered
..end
;-----------------------------
.kak_town_hooks
%write_mirror($80, $04, $1E, $09)
..end
;-----------------------------
.hookshop_to_ice_rod
..end

;===================================================================================================
presetpersistent_reversebossorder_ganon:
;-----------------------------
.links_house
%write_sq()
%write8($7E0FCA, $00) ; Prize pack 4
..end
;-----------------------------
.wish_enemy_prize
..end
;-----------------------------
.ganon_pot
%write8($7E0FC9, $01) ; Prize pack 3
%write8($7E0CFB, $03) ; Rupee pull kills
..end
;-----------------------------
.ganon
%write8($7E044A, $02) ; EG strength
..end

;===================================================================================================
presetpersistent_reversebossorder_agahnim_2:
;-----------------------------
.after_ganon
%write8($7E0B08, $10) ; Arc variable
%write8($7E0B09, $F8) ; Arc variable
%write8($7E0CFB, $05) ; Rupee pull kills
..end
;-----------------------------
.somaria_stair_clip
..end
;-----------------------------
.eg_under_beamos
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.spin_stc
..end
;-----------------------------
.laser_entrance
..end
;-----------------------------
.lava_dive
%write_mirror($B8, $0C, $6A, $01)
..end
;-----------------------------
.agahnim_2
%write_mirror($01, $08, $4C, $0C)
..end

;===================================================================================================
presetpersistent_reversebossorder_trinexx:
;-----------------------------
.pyramid
%write8($7E02A2, $FE) ; Slot 4 Altitude
%write8($7E0CFB, $0B) ; Rupee pull kills
..end
;-----------------------------
.castle_hookpush
%write_mirror($0F, $08, $79, $06)
%write8($7E02A2, $A1) ; Slot 4 Altitude
..end
;-----------------------------
.trinexx_weirdshot
%write8($7E02A2, $00) ; Slot 4 Altitude
%write8($7E047A, $01) ; Armed EG
..end
;-----------------------------
.trinexx
..end

;===================================================================================================
presetpersistent_reversebossorder_vitreous:
;-----------------------------
.after_trinexx
%write8($7E0B08, $90) ; Arc variable
%write8($7E0B09, $80) ; Arc variable
%write8($7E02A1, $15) ; Slot 3 Altitude
%write8($7E047A, $00) ; Armed EG
..end
;-----------------------------
.dark_room
..end
;-----------------------------
.desert_weirdshot
..end
;-----------------------------
.desert_hookpush
..end
;-----------------------------
.slime_room_weirdshot
%write8($7E02A1, $00) ; Slot 3 Altitude
..end
;-----------------------------
.vitreous_stuckhook
%write8($7E0FCC, $01) ; Prize pack 6
%write8($7E0CFB, $0C) ; Rupee pull kills
..end
;-----------------------------
.vitreous
%write8($7E044A, $02) ; EG strength
..end

;===================================================================================================
presetpersistent_reversebossorder_knoldstare:
;-----------------------------
.outside_mire
%write8($7E0CFB, $19) ; Rupee pull kills
%write8($7E0CFC, $05) ; Rupee pull hits
..end
;-----------------------------
.links_house
%write_sq()
%write8($7E0FC9, $00) ; Prize pack 3
%write8($7E0FCC, $00) ; Prize pack 6
..end
;-----------------------------
.eastern_screen_wrapping
..end
;-----------------------------
.eastern_entrance
%write8($7E0FC8, $01) ; Prize pack 2
%write8($7E0CFB, $1A) ; Rupee pull kills
..end
;-----------------------------
.cannonballs
%write8($7E0CFB, $1B) ; Rupee pull kills
..end
;-----------------------------
.knoldstare_weirdshot
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.knoldstare_hookpushes
%write8($7E0FCC, $01) ; Prize pack 6
%write8($7E0CFB, $1F) ; Rupee pull kills
..end
;-----------------------------
.knoldstare
..end

;===================================================================================================
presetpersistent_reversebossorder_blind:
;-----------------------------
.outside_ice
..end
;-----------------------------
.fountain_hookpush
%write_mirror($B8, $0C, $CB, $0D)
..end
;-----------------------------
.ice_entrance
..end
;-----------------------------
.gt_hookpush
..end
;-----------------------------
.thieves_weirdshot
..end
;-----------------------------
.prison_hookpushes
..end
;-----------------------------
.attic_falling
%write8($7E0FCC, $02) ; Prize pack 6
%write8($7E0CFB, $21) ; Rupee pull kills
..end
;-----------------------------
.blind
..end

;===================================================================================================
presetpersistent_reversebossorder_mothula:
;-----------------------------
.outside_thieves_1
%write8($7E02A1, $17) ; Slot 3 Altitude
%write8($7E0CFB, $2A) ; Rupee pull kills
%write8($7E0CFC, $07) ; Rupee pull hits
..end
;-----------------------------
.thieves_fanfare_skip
..end
;-----------------------------
.outside_thieves_2
..end
;-----------------------------
.hookpush_to_skull
%write8($7E0CFB, $2B) ; Rupee pull kills
..end
;-----------------------------
.skull_entrance
%write8($7E02A1, $00) ; Slot 3 Altitude
..end
;-----------------------------
.getting_item_from_moth
..end

;===================================================================================================
presetpersistent_reversebossorder_arrghus:
;-----------------------------
.outside_skull
%write8($7E0CFB, $30) ; Rupee pull kills
%write8($7E0CFC, $0A) ; Rupee pull hits
..end
;-----------------------------
.mire_entrance_weirdshot
..end
;-----------------------------
.mire_entrance_hookpush
..end
;-----------------------------
.mire_fanfare_skip
..end
;-----------------------------
.turtle_hookpush
..end
;-----------------------------
.pre_armos_room_weirdshot
..end
;-----------------------------
.arrghus_death_hole
%write8($7E0FC8, $04) ; Prize pack 2
%write8($7E0FCC, $03) ; Prize pack 6
%write8($7E0CFB, $38) ; Rupee pull kills
%write8($7E0CFC, $14) ; Rupee pull hits
..end
;-----------------------------
.arrghus
%write8($7E0CFC, $15) ; Rupee pull hits
..end

;===================================================================================================
presetpersistent_reversebossorder_helmasaur:
;-----------------------------
.swamp_crystal_hookpush
%write8($7E0B08, $47) ; Arc variable
%write8($7E0B09, $83) ; Arc variable
%write8($7E02A1, $17) ; Slot 3 Altitude
%write8($7E0CFB, $47) ; Rupee pull kills
%write8($7E0CFC, $17) ; Rupee pull hits
..end
;-----------------------------
.outside_skull
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.helmasaur_misslottings
%write8($7E0B08, $00) ; Arc variable
%write8($7E0B09, $08) ; Arc variable
%write8($7E044A, $01) ; EG strength
..end
;-----------------------------
.helmasaur
..end

;===================================================================================================
presetpersistent_reversebossorder_agahnim:
;-----------------------------
.pod_crystal_hookpush
%write8($7E0B08, $04) ; Arc variable
%write8($7E0B09, $04) ; Arc variable
%write8($7E02A1, $11) ; Slot 3 Altitude
%write8($7E0CFB, $48) ; Rupee pull kills
..end
;-----------------------------
.pod_fanfare_skip
..end
;-----------------------------
.old_man_cave
%write_sq()
%write8($7E044A, $02) ; EG strength
%write8($7E0FC8, $00) ; Prize pack 2
%write8($7E0FCC, $00) ; Prize pack 6
..end
;-----------------------------
.beetles
..end
;-----------------------------
.yuzuhera
%write8($7E0FCC, $01) ; Prize pack 6
%write8($7E0CFB, $4B) ; Rupee pull kills
..end
;-----------------------------
.arena_dash
%write8($7E02A2, $18) ; Slot 4 Altitude
%write8($7E0FCC, $02) ; Prize pack 6
%write8($7E0CFB, $4C) ; Rupee pull kills
..end
;-----------------------------
.agahnim
..end

;===================================================================================================
presetpersistent_reversebossorder_moldorm:
;-----------------------------
.pyramid
%write8($7E0CFB, $4D) ; Rupee pull kills
..end
;-----------------------------
.old_man_cave
%write8($7E0FCC, $00) ; Prize pack 6
..end
;-----------------------------
.entrance
..end
;-----------------------------
.moldorm
..end

;===================================================================================================
presetpersistent_reversebossorder_lanmolas:
;-----------------------------
.outside_hera
%write8($7E02A2, $00) ; Slot 4 Altitude
..end
;-----------------------------
.sanctuary_eg0_jumps
%write8($7E0B08, $00) ; Arc variable
%write8($7E0B09, $00) ; Arc variable
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E044A, $00) ; EG strength
%write8($7E0CFB, $00) ; Rupee pull kills
%write8($7E0CFC, $00) ; Rupee pull hits
..end
;-----------------------------
.lanmolas
..end

;===================================================================================================
presetpersistent_reversebossorder_triforce:
;-----------------------------
.links_house
%write8($7E02A1, $60) ; Slot 3 Altitude
..end
;-----------------------------
.eastern_screen_wrapping
%write8($7E0CFB, $04) ; Rupee pull kills
..end
;-----------------------------
.armos_hookpush
%write8($7E0CFB, $05) ; Rupee pull kills
..end
;-----------------------------
.armos
%write8($7E044A, $02) ; EG strength
..end
;-----------------------------
.sanctuary_stuckhook
%write8($7E02A1, $00) ; Slot 3 Altitude
%write8($7E044A, $00) ; EG strength
%write8($7E0CFB, $00) ; Rupee pull kills
..end

;===================================================================================================
presetSRAM_reversebossorder:
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
..dark_room_crossing
%writeroom($030, $0001)
%writeroom($040, $0005)
%writeroom($050, $0005)
%writeroom($060, $0005)
%writeroom($070, $000D)
...end
;-----------------------------
..before_cutscene
%writeroom($011, $0005)
%writeroom($021, $000F)
%writeroom($031, $000A)
...end
;-----------------------------
.collection
;-----------------------------
..after_cutscene
%write8($7EF3C5, $02) ; Game state
%write8($7EF3C6, $15) ; Game flags A
%write8($7EF3C7, $01) ; Map marker
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
%write8($7EF29B, $20) ; OW screen $1B
%writeroom($012, $000F)
...end
;-----------------------------
..bootless_dma
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $FF) ; Keys
...end
;-----------------------------
..camera_fixing
...end
;-----------------------------
..death_mountain
%write8($7EF36D, $10) ; Health
%write8($7EF3C8, $05) ; Spawn point
%write8($7EF3CC, $04) ; Follower
%writeroom($0F0, $000F)
%writeroom($0F1, $000F)
...end
;-----------------------------
..sanctuary
%write8($7EF353, $02) ; Mirror
%write8($7EF36D, $18) ; Health
%write8($7EF36F, $00) ; Keys
%write8($7EF3C8, $01) ; Spawn point
%write8($7EF3CC, $00) ; Follower
...end
;-----------------------------
..bat_cave_teleport
%write8($7EF36C, $20) ; Max HP
%write8($7EF36D, $20) ; Health
%write8($7EF36F, $FF) ; Keys
%writeroom($012, $001F)
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
%write8($7EF36D, $18) ; Health
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
%write8($7EF36E, $74) ; Magic
%write16sram($7EF360, $0002) ; Rupees
%writeroom($097, $0008)
%writeroom($0D1, $0008)
...end
;-----------------------------
..getting_hook_and_pearl
%write8($7EF36E, $44) ; Magic
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
..after_moonpearl
%write8($7EF342, $01) ; Hookshot
%write8($7EF343, $02) ; Bombs
%write8($7EF357, $01) ; Pearl
%write8($7EF36F, $FC) ; Keys
%writeroom($027, $001F)
%writeroom($036, $001F)
%writeroom($037, $200E)
...end
;-----------------------------
..back_in_the_right_screen
%writeroom($031, $000B)
...end
;-----------------------------
..fire_rod_weirldshot
%writeroom($058, $0005)
%writeroom($059, $000A)
%writeroom($068, $000F)
%writeroom($077, $000F)
%writeroom($078, $000A)
...end
;-----------------------------
..skull_quickwarp
%write8($7EF343, $01) ; Bombs
%write8($7EF345, $01) ; Fire Rod
%write8($7EF36E, $38) ; Magic
%writeroom($058, $001F)
...end
;-----------------------------
..leaving_skull
%write8($7EF36F, $FF) ; Keys
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..frog_rescue
%write16sram($7EF360, $012E) ; Rupees
%writeroom($11C, $0011)
...end
;-----------------------------
..getting_tempered
%write8($7EF36E, $24) ; Magic
%write8($7EF3CC, $07) ; Follower
...end
;-----------------------------
..kak_town_hooks
%write8($7EF359, $03) ; Sword
%write8($7EF3C9, $20) ; Game flags B
%write8($7EF3CA, $00) ; LW/DW
%write8($7EF3CC, $00) ; Follower
%write16sram($7EF360, $0124) ; Rupees
%writeroom($121, $0002)
...end
;-----------------------------
..hookshop_to_ice_rod
...end
;-----------------------------
.ganon
;-----------------------------
..links_house
%write8($7EF343, $0A) ; Bombs
%write8($7EF346, $01) ; Ice Rod
%write8($7EF36E, $1C) ; Magic
%write16sram($7EF360, $00E8) ; Rupees
%writeroom($11F, $0001)
%writeroom($120, $001A)
...end
;-----------------------------
..wish_enemy_prize
...end
;-----------------------------
..ganon_pot
%write8($7EF36E, $80) ; Magic
...end
;-----------------------------
..ganon
%write8($7EF343, $09) ; Bombs
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
.agahnim_2
;-----------------------------
..after_ganon
%write8($7EF36E, $5C) ; Magic
%writeroom($000, $0004)
%writeroom($010, $0005)
...end
;-----------------------------
..somaria_stair_clip
...end
;-----------------------------
..eg_under_beamos
%write8($7EF36E, $54) ; Magic
%writeroom($063, $0008)
...end
;-----------------------------
..spin_stc
%writeroom($043, $2401)
%writeroom($053, $000E)
...end
;-----------------------------
..laser_entrance
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $4C) ; Magic
%write8($7EF36F, $FF) ; Keys
%writeroom($023, $8001)
%writeroom($033, $200F)
%writeroom($043, $200F)
%writeroom($053, $200F)
...end
;-----------------------------
..lava_dive
%write8($7EF343, $0A) ; Bombs
%write8($7EF36F, $00) ; Keys
%write8($7EF3CA, $40) ; LW/DW
...end
;-----------------------------
..agahnim_2
%write8($7EF343, $09) ; Bombs
%write8($7EF36E, $44) ; Magic
%writeroom($004, $4002)
%writeroom($014, $000A)
%writeroom($024, $0002)
...end
;-----------------------------
.trinexx
;-----------------------------
..pyramid
%write8($7EF36F, $FF) ; Keys
%write8($7EF2DB, $20) ; OW screen $5B
%writeroom($00D, $080C)
%writeroom($014, $000F)
...end
;-----------------------------
..castle_hookpush
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..trinexx_weirdshot
%write8($7EF36D, $18) ; Health
%write8($7EF36E, $34) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($063, $000A)
%writeroom($073, $000D)
%writeroom($074, $0003)
%writeroom($084, $000F)
%writeroom($094, $000A)
%writeroom($0A4, $000A)
...end
;-----------------------------
..trinexx
%write8($7EF343, $08) ; Bombs
%write8($7EF36D, $20) ; Health
%write8($7EF36E, $80) ; Magic
%writeroom($0B4, $800F)
%writeroom($0C4, $000F)
...end
;-----------------------------
.vitreous
;-----------------------------
..after_trinexx
%write8($7EF343, $07) ; Bombs
%write8($7EF348, $01) ; Ether
%write8($7EF36C, $28) ; Max HP
%write8($7EF36D, $28) ; Health
%write8($7EF36E, $48) ; Magic
...end
;-----------------------------
..dark_room
%writeroom($0A3, $000F)
%writeroom($0A4, $080A)
...end
;-----------------------------
..desert_weirdshot
%writeroom($093, $000F)
...end
;-----------------------------
..desert_hookpush
%write8($7EF343, $06) ; Bombs
%write8($7EF36E, $40) ; Magic
%write8($7EF36F, $FF) ; Keys
%writeroom($083, $0002)
...end
;-----------------------------
..slime_room_weirdshot
%write8($7EF36E, $28) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($082, $000F)
...end
;-----------------------------
..vitreous_stuckhook
%write8($7EF343, $05) ; Bombs
%write8($7EF36E, $30) ; Magic
%writeroom($081, $000F)
%writeroom($091, $0005)
...end
;-----------------------------
..vitreous
%write8($7EF36E, $1C) ; Magic
%writeroom($0A0, $000F)
...end
;-----------------------------
.knoldstare
;-----------------------------
..outside_mire
%write8($7EF36C, $30) ; Max HP
%write8($7EF36D, $30) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $02) ; Pendants
%writeroom($090, $0802)
...end
;-----------------------------
..links_house
%write8($7EF36D, $20) ; Health
...end
;-----------------------------
..eastern_screen_wrapping
%write8($7EF36D, $30) ; Health
...end
;-----------------------------
..eastern_entrance
%write16sram($7EF360, $00ED) ; Rupees
...end
;-----------------------------
..cannonballs
%write8($7EF36F, $00) ; Keys
%writeroom($0C9, $000F)
...end
;-----------------------------
..knoldstare_weirdshot
%write8($7EF36E, $78) ; Magic
%writeroom($0B9, $000F)
%writeroom($0CA, $000C)
%writeroom($0CB, $000F)
%writeroom($0CC, $000F)
%writeroom($0CD, $000C)
...end
;-----------------------------
..knoldstare_hookpushes
%write8($7EF343, $04) ; Bombs
%write8($7EF36E, $80) ; Magic
%writeroom($0CE, $000C)
...end
;-----------------------------
..knoldstare
%write8($7EF343, $05) ; Bombs
%write8($7EF36E, $70) ; Magic
%write8($7EF377, $05) ; Arrows
%writeroom($0CE, $000D)
...end
;-----------------------------
.blind
;-----------------------------
..outside_ice
%write8($7EF36C, $38) ; Max HP
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $06) ; Pendants
%writeroom($0DE, $0804)
...end
;-----------------------------
..fountain_hookpush
...end
;-----------------------------
..ice_entrance
%write8($7EF355, $01) ; Boots
%write8($7EF36E, $5C) ; Magic
%write8($7EF379, $FC) ; Ability
%write8($7EF3C7, $03) ; Map marker
%write8($7EF3CA, $40) ; LW/DW
%writeroom($105, $0002)
%writeroom($115, $000A)
...end
;-----------------------------
..gt_hookpush
%write8($7EF36E, $4C) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($00C, $000F)
%writeroom($00E, $000D)
...end
;-----------------------------
..thieves_weirdshot
%write8($7EF343, $08) ; Bombs
%write8($7EF36E, $48) ; Magic
%writeroom($08C, $0045)
%writeroom($09C, $000F)
%writeroom($0AC, $0005)
...end
;-----------------------------
..prison_hookpushes
%write8($7EF343, $07) ; Bombs
%write8($7EF36E, $40) ; Magic
%writeroom($0BC, $000F)
...end
;-----------------------------
..attic_falling
%write8($7EF36E, $24) ; Magic
%write8($7EF377, $0A) ; Arrows
%write8($7EF3CC, $06) ; Follower
%writeroom($045, $000C)
%writeroom($046, $000F)
%writeroom($056, $000A)
%writeroom($066, $000C)
...end
;-----------------------------
..blind
%write8($7EF343, $06) ; Bombs
%write8($7EF36E, $14) ; Magic
%writeroom($065, $010F)
...end
;-----------------------------
.mothula
;-----------------------------
..outside_thieves_1
%write8($7EF36C, $40) ; Max HP
%write8($7EF36D, $40) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $04) ; Crystals
%write8($7EF3CC, $00) ; Follower
%writeroom($0AC, $0A05)
...end
;-----------------------------
..thieves_fanfare_skip
%write8($7EF36F, $00) ; Keys
%write8($7EF2D8, $20) ; OW screen $58
%writeroom($0DB, $000F)
...end
;-----------------------------
..outside_thieves_2
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $24) ; Crystals
%writeroom($0AC, $0A07)
...end
;-----------------------------
..hookpush_to_skull
...end
;-----------------------------
..skull_entrance
%write8($7EF36E, $58) ; Magic
%write8($7EF2C0, $20) ; OW screen $40
...end
;-----------------------------
..getting_item_from_moth
%write8($7EF36E, $4C) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($039, $0005)
%writeroom($049, $0005)
%writeroom($059, $000F)
...end
;-----------------------------
.arrghus
;-----------------------------
..outside_skull
%write8($7EF340, $02) ; Bow
%write8($7EF36C, $48) ; Max HP
%write8($7EF36D, $48) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%writeroom($029, $0801)
...end
;-----------------------------
..mire_entrance_weirdshot
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($078, $000F)
%writeroom($088, $0005)
...end
;-----------------------------
..mire_entrance_hookpush
%write8($7EF343, $05) ; Bombs
%write8($7EF36E, $50) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF2F0, $20) ; OW screen $70
%writeroom($098, $000F)
...end
;-----------------------------
..mire_fanfare_skip
%write8($7EF36E, $38) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($0A5, $000C)
%writeroom($0A6, $000F)
%writeroom($0A7, $000C)
%writeroom($0A8, $0008)
...end
;-----------------------------
..turtle_hookpush
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $25) ; Crystals
%writeroom($0A4, $080E)
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
%write8($7EF343, $04) ; Bombs
%write8($7EF36D, $08) ; Health
%write8($7EF36E, $48) ; Magic
%write8($7EF377, $19) ; Arrows
%write16sram($7EF360, $00F2) ; Rupees
%writeroom($0D8, $000F)
...end
;-----------------------------
..arrghus
%write8($7EF343, $03) ; Bombs
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $30) ; Magic
%writeroom($005, $000F)
%writeroom($0E8, $000F)
...end
;-----------------------------
.helmasaur
;-----------------------------
..swamp_crystal_hookpush
%write8($7EF36C, $50) ; Max HP
%write8($7EF36D, $50) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $2D) ; Crystals
%writeroom($006, $0802)
...end
;-----------------------------
..outside_skull
%write8($7EF37A, $3D) ; Crystals
%writeroom($028, $000F)
%writeroom($029, $0803)
...end
;-----------------------------
..helmasaur_misslottings
%write8($7EF36E, $78) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($05A, $0002)
...end
;-----------------------------
..helmasaur
%write8($7EF343, $02) ; Bombs
%write8($7EF36E, $68) ; Magic
%write8($7EF377, $18) ; Arrows
%writeroom($06A, $000F)
...end
;-----------------------------
.agahnim
;-----------------------------
..pod_crystal_hookpush
%write8($7EF343, $01) ; Bombs
%write8($7EF36C, $58) ; Max HP
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $7D) ; Crystals
%writeroom($05A, $0803)
...end
;-----------------------------
..pod_fanfare_skip
%write8($7EF36E, $70) ; Magic
%write8($7EF36F, $00) ; Keys
%writeroom($04A, $0003)
...end
;-----------------------------
..old_man_cave
%write8($7EF36D, $38) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF37A, $7F) ; Crystals
%write8($7EF3C7, $08) ; Map marker
%write8($7EF3CA, $00) ; LW/DW
%writeroom($05A, $080B)
%writeroom($0E4, $000A)
...end
;-----------------------------
..beetles
%write8($7EF36F, $00) ; Keys
%write8($7EF377, $17) ; Arrows
...end
;-----------------------------
..yuzuhera
...end
;-----------------------------
..arena_dash
%write8($7EF36E, $78) ; Magic
%writeroom($030, $8005)
...end
;-----------------------------
..agahnim
%writeroom($020, $0001)
...end
;-----------------------------
.moldorm
;-----------------------------
..pyramid
%write8($7EF36D, $58) ; Health
%write8($7EF36E, $80) ; Magic
%write8($7EF36F, $FF) ; Keys
%write8($7EF3C5, $03) ; Game state
%write8($7EF3C7, $06) ; Map marker
%write8($7EF3CA, $40) ; LW/DW
%write8($7EF282, $20) ; OW screen $02
%writeroom($020, $0803)
...end
;-----------------------------
..old_man_cave
%write8($7EF36D, $38) ; Health
%write8($7EF3CA, $00) ; LW/DW
...end
;-----------------------------
..entrance
...end
;-----------------------------
..moldorm
%write8($7EF36F, $00) ; Keys
%writeroom($017, $000F)
...end
;-----------------------------
.lanmolas
;-----------------------------
..outside_hera
%write8($7EF36C, $60) ; Max HP
%write8($7EF36D, $60) ; Health
%write8($7EF36F, $FF) ; Keys
%write8($7EF374, $07) ; Pendants
%write8($7EF3C7, $04) ; Map marker
%writeroom($007, $080F)
...end
;-----------------------------
..sanctuary_eg0_jumps
%write8($7EF36D, $38) ; Health
%write8($7EF36F, $00) ; Keys
%write8($7EF3C6, $17) ; Game flags A
...end
;-----------------------------
..lanmolas
%write8($7EF36E, $6C) ; Magic
%write8($7EF377, $16) ; Arrows
%writeroom($022, $000F)
%writeroom($032, $000F)
%writeroom($042, $001F)
...end
;-----------------------------
.triforce
;-----------------------------
..links_house
%write8($7EF36C, $68) ; Max HP
%write8($7EF36E, $44) ; Magic
%write8($7EF36F, $FF) ; Keys
%writeroom($033, $280F)
...end
;-----------------------------
..eastern_screen_wrapping
...end
;-----------------------------
..armos_hookpush
...end
;-----------------------------
..armos
%write8($7EF36E, $1C) ; Magic
%write8($7EF36F, $00) ; Keys
...end
;-----------------------------
..sanctuary_stuckhook
%write8($7EF36C, $70) ; Max HP
%write8($7EF36D, $40) ; Health
%write8($7EF377, $04) ; Arrows
%writeroom($0C8, $0801)
...end
;===================================================================================================
presetend_reversebossorder:
print "reversebossorder size: $", hex(presetend_reversebossorder-presetheader_reversebossorder)
