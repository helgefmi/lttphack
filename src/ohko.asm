lorom


org $00FFD7
	db 11 ; 2mb


org $0697DF
	; x speeds
	db  48,  44,  34,   18,   0,  -18, -34, -44
	db -48, -44, -34,  -18,   0,   18,  34,  44

	; y speeds
	db   0,   18,  34,  44,  48,  44,  34,   18
	db   0,  -18, -34, -44, -48, -44, -34,  -18


; 09c3bf lda ($00),y
; 09c3c1 sta $0e20,x
org $09C3BF
	JSL sprite_hook_uw : NOP


; 09c7c6 dec
; 09c7c7 sta $0e20,x
org $09C7C6
	JSL sprite_hook_ow


; 1df66c sta $0e20,y
; 1df66f lda #$09
; 1df671 sta $0dd0,y
org $1DF66C
	JSL sprite_hook_dynamic
	NOP : NOP : NOP : NOP


; Change sprite gfx
; 01b648 lda [$0d],y
; 01b64a clc
; 01b64b adc #$40
; 01b64d sta $0aa3
org $01B648
	JSL hook_dng_gfx
	NOP : NOP : NOP : NOP


; 02aa0c lda $7efcc0,x
; 02aa10 sta $0aa3
org $02AA0C
	LDA #$55 : NOP : NOP


org $06982A
	; 06982a lda $97df,y   [0697df] A:0002 X:0002 Y:0000 S:01ee D:0000 DB:06 nvMXdiZc V: 37 H:159 F:10
	; 06982d sta $0d50,x   [060d52] A:0030 X:0002 Y:0000 S:01ee D:0000 DB:06 nvMXdizc V: 37 H:159 F:10
	; 069830 lda $97ef,y   [0697ef] A:0030 X:0002 Y:0000 S:01ee D:0000 DB:06 nvMXdizc V: 37 H:168 F:10
	; 069833 sta $0d40,x   [060d42] A:0000 X:0002 Y:0000 S:01ee D:0000 DB:06 nvMXdiZc V: 37 H:176 F:10
	; JSL moldorm_speed
	; NOP : NOP
	; NOP : NOP : NOP
	; NOP : NOP : NOP


; 06f9d7 sta $0e20,x
; 06f9da cmp #$e5
; 06f9dc bne $f9e3
; 06f9de jsr $925d
; 06f9e1 bra $f9ea
; 06f9e3 cmp #$e4
; 06f9e5 bne $f9ea
; 06f9e7 jsr $926e
; 06f9ea lda #$09
org $06F9D7
	JSL sprite_hook_drops
	NOP


; 05b758 lda #$0b               A:001d X:000b Y:0001 S:01e8 D:0000 DB:05 nvMXdizc V: 52 H: 71 F:42
; 05b75a sta $0f50,x   [050f5b] A:000b X:000b Y:0001 S:01e8 D:0000 DB:05 nvMXdizc V: 52 H: 75 F:42
; 05b75d rts                    A:000b X:000b Y:0001 S:01e8 D:0000 DB:05 nvMXdizc V: 52 H: 85 F:42
org $05B758
	JSL hook_armos


; 05a050 dec $0ff8
; 05a053 lda $0ff8
org $05A050
	JSL hook_red_armos
	NOP : NOP


; 1cf640 jsl $099d04
org $1CF640
	JSL hook_beam


; 1ed6f7 lda #$01
; 1ed6f9 sta $0da0,y
; LDA.b #$20 : STA $0DF0, Y
org $1ED6F7
	JSL hook_blueball
	NOP : NOP : NOP : NOP


; 06982a lda $97df,y
; 06982d sta $0d50,x
; 069830 lda $97ef,y
; 069833 sta $0d40,x
org $06982A
	JSL hook_mimics_dorm
	NOP : NOP
	NOP : NOP : NOP
	NOP : NOP : NOP


; 1da1ed lda #$ce
; 1da1ef jsl $1df65d
; 1da1f3 bmi $a23b
org $1DA1ED
	JSL hook_blind
	RTS

; 06f068 lda #$04
; 06f06a sta $0dd0,x
org $06F068
	JSL hook_khold
	NOP


;1eb944 jsl $06f2b0
org $1EB944
	; JSL hook_arrgi


; Nerf Ether (magic needed)
; db $20, #$10, #$08
org $07B073
	db $48, #$48, #$48

; 1de7e3 lda $0ed0,x
; 1de7e6 sta $04
org $1DE7E3
	JSL hook_vitty
	RTS

; ---------
org $208000
; ---------

hook_vitty:
	PHY
	LDY #$10
.loop
	DEY : BMI .no_active
	LDA $0E20, Y : CMP #$18 : BNE .loop
	LDA $0DD0, Y : BNE .done
	BRA .loop

.no_active
	LDA #$18 : STA $0E20, X
	LDA #$08 : STA $0E50, X
	LDA $0ED0 : DEC : STA $0ED0

.done
	PLY
	RTL


hook_dng_gfx:
	LDA $A0 : CMP #$90 : BEQ .normal
	LDA #$55 : STA $0AA3
	RTL
.normal
	LDA #$56 : STA $0AA3
	RTL


; 01b64b lda #$55
; 01b64d sta $0aa3

; hook_arrgi:
;     LDA #$18 : STA $0E20, X
;     RTL


hook_khold:
	LDA #$04 : STA $0DD0, X
	PHX
	LDX #$10
.loop
	DEX : BMI .done
	LDA $0E20, X : CMP #$18 : BNE .loop
	LDA #$00 : STA $0DD0, X
	BRA .loop
.done
	PLX
	RTL


hook_blind:
	LDA #$18 : JSL $1DF65D
	LDA #$20 : STA $0E50, Y
	RTL


hook_mimics_dorm:
	LDA $97DF, Y : STA $0D50, X
	LDA $97EF, Y : STA $0D40, X
	LDA $048E : CMP #$1B : BNE .done

	LDA #$00 : STA $0D50, X : STA $0D40, X
			   STA $0D60, X : STA $0D70, X

	LDA $F0 : BEQ .done
	BIT #$01 : BNE .right
	BIT #$02 : BNE .left
	BIT #$04 : BNE .down
	BIT #$08 : BNE .up
	BRA .done

.up
	LDA #$40 : STA $0D50, X : BRA .done
.down
	LDA #$C0 : STA $0D50, X : BRA .done
.left
	LDA #$40 : STA $0D40, X : BRA .done
.right
	LDA #$C0 : STA $0D40, X : BRA .done

.done
	RTL

hook_blueball:
	LDA #$18 : STA $0E20, Y
	LDA $EE : STA $0F20, Y
	LDA #$10 : STA $0E50, Y
	LDA #$00 : STA $0E60, Y

	RTL

hook_beam:
	LDA #$18 : JSL $1DF65D : BCS ++

	LDA $22 : STA $0D10, Y
	LDA $23 : STA $0D30, Y

	LDA $20 : STA $0D00, Y
	LDA $21 : STA $0D20, Y

	LDA $EE : STA $0F20, Y

	LDA $2F
	CMP #$00 : BEQ .up
	CMP #$02 : BEQ .down
	CMP #$04 : BEQ .left
	CMP #$06 : BEQ .right

.up
	LDA $0D00, Y : SEC : SBC #$20 : STA $0D00, Y
	LDA $0D20, Y : SBC #$00 : STA $0D20, Y
	BRA +
.down
	LDA $0D00, Y : CLC : ADC #$20 : STA $0D00, Y
	LDA $0D20, Y : ADC #$00 : STA $0D20, Y
	BRA +
.left
	LDA $0D10, Y : SEC : SBC #$20 : STA $0D10, Y
	LDA $0D30, Y : SBC #$00 : STA $0D30, Y
	BRA +
.right
	LDA $0D10, Y : CLC : ADC #$20 : STA $0D10, Y
	LDA $0D30, Y : ADC #$00 : STA $0D30, Y
	BRA +

+	SEP #$30


++	SEC : RTL


hook_red_armos:
	DEC $0FF8
	LDA $0FF8 : CMP #$01 : BNE +

	LDA #$18 : STA $0E20 : STA $0E21 : STA $0E22 : STA $0E23 : STA $0E24

+	RTL

hook_armos:
	LDA #$18 : STA $0E20, X
	RTL


sprite_hook_drops:
	PHY
	PHB : PHK : PLB
	TAY
	PHA : JSL $0DBA71 : AND #$07 : BNE +
	PLA : LDA le_tbl, Y : BRA ++
+	PLA
++	PLB
	PLY
	STA $0E20, X
	CMP #$E5
	RTL


sprite_hook_dynamic:
	CMP #$D8 : BEQ +
	CMP #$41 : BEQ +
	PHX : PHB : PHK : PLB
	TAX : LDA le_tbl, X
	PLB : PLX

+	STA $0E20, Y
	LDA #$09 : STA $0DD0, Y
	RTL


sprite_hook_ow:
	DEC
	PHX : PHB : PHK : PLB
	TAX : LDA le_tbl, X
	PLB : PLX
	STA $0E20, X
	RTL


sprite_hook_uw:
	PHX
	LDA ($00),y : TAX
	PHB : PHK : PLB
	LDA le_tbl, X
	PLB
	PLX
	STA $0E20, X
	RTL


; Not used
moldorm_speed:
	LDA $1A : AND #$0F : STA $00
	LDA $97DF, Y : CLC : ADC $00 : STA $0D50, X
	LDA $1A : AND #$0F : STA $00
	LDA $97EF, Y : CLC : ADC $00 : STA $0D40, X
	RTL


le_tbl:
; 00
db $18 ;Raven
db $18 ;Vulture
db $18 ;Flying Stalfos Head
db $03 ;Unused (Don't use it, the sprite's ASM pointer is invalid. It will certainly crash the game.)
db $04 ;Good Switch being pulled
db $05 ;Some other sort of switch being pulled, but from above?
db $06 ;Bad Switch
db $07 ;switch again (facing up)
db $18 ;Octorock
db $09 ;Giant Moldorm (boss)
db $18 ;Four Shooter Octorock
db $18 ;Chicken / Chicken Transformed into Lady
db $18 ;Octorock
db $18 ;Normal Buzzblob / Morphed Buzzblob (tra la la... look for Sahashrala)
db $18 ;Plants with big mouths
db $18 ;Octoballoon (The thing that explodes into 10 others)
; 10
db $18 ;Octobaby (Baby Octorocks from the Otobaloon)
db $18 ;Hinox (Bomb-chucking one-eyed giant)
db $18 ;Moblin
db $18 ;Helmasaur (small variety)
db $14 ;Thieves' Town (AKA Gargoyle's Domain) Grate
db $18 ;Bubble (AKA Fire Faerie)
db $16 ;Sahashrala / Aginah, sage of the desert
db $18 ;Rupee Crab under bush / rock
db $18 ;Moldorm
db $18 ;Poe
db $1A ;Dwarf, Mallet, and the shrapnel from it hitting
db $1B ;Arrow shot by solder / stuck in wall? Spear thrown by Moblin?
db $1C ;Moveable Statue
db $1D ;Weathervane
db $1E ;Crystal Switch
db $1F ;Sick Kid with Bug Catching Net
; 20
db $18 ;Sluggula
db $21 ;Push Switch (like in Swamp Palace)
db $18 ;Darkworld Snakebasket
db $18 ;Red Bari / Small Red Bari
db $18 ;Blue Bari
db $25 ;Tree you can talk to?
db $18 ;Hardhat Beetle (Charging Octopus looking thing)
db $18 ;Dead Rock (Some might see them as Gorons, but bleh)
db $28 ;Shrub Guy who talks about Triforce / Other storytellers
db $29 ;Blind Hideout Guy / Thief Hideout Guy / Flute Boy's Father
db $2A ;Sweeping Lady
db $2B ;Bum under the bridge + smoke and other effects like the fire
db $2C ;Lumberjack Bros.
db $2D ;Telepathic stones? Looks like a prototype for a telepathic interface using sprites instead of tiles. However, this one only says one thing.
db $2E ;Flute Boy and his musical notes
db $2F ;Maze Game Lady
; 30
db $30 ;Maze Game Guy
db $31 ;Fortune Teller / Dwarf swordsmith
db $32 ;Quarreling brothers
db $33 ;Pull For Rupees
db $34 ;Young Snitch Lady
db $35 ;Innkeeper
db $36 ;Witch
db $37 ;Waterfall
db $38 ;Arrow Target (e.g. Statue with big eye in Dark Palace)
db $39 ;Middle Aged Guy in the desert
db $3A ;Magic Powder Bat /The Lightning Bolt the bat hurls at you.
db $3B ;Dash Item / such as Book of Mudora, keys
db $3C ;Kid in village near the trough
db $3D ;Older Snitch Lady (Signs?) (Chicken lady also showed up)
db $18 ;Rock Rupee Crabs
db $3F ;Tutorial Soldiers from beginning of game
; 40
db $40 ;Hyrule Castle Barrier to Agahnim's Tower
db $18 ;Soldier
db $18 ;Blue Soldier
db $18 ;Red Spear Soldier
db $18 ;Crazy Blue Killer Soldiers
db $18 ;Crazy Red Spear Soldiers (And green ones in the village)
db $18 ;Blue Archer Soldiers
db $18 ;Green Archer Soldiers (in the bushes)
db $18 ;Red Javelin Trooper
db $18 ;Red Javelin Soldiers (in the bushes)
db $18 ;Red Bomb Soldiers
db $18 ;Recruit (Weak Green Soldier) (Note: Name was invented for lack of an official name)
db $18 ;Sand Monsters
db $18 ;Flailing Bunnies on the ground
db $18 ;Snakebasket
db $18 ;Blobs?
; 50
db $50 ;Metal Balls (in Eastern Palace)
db $51 ;Armos
db $52 ;Zora King
db $53 ;Armos Knight
db $54 ;Lanmolas boss
db $55 ;Zora / Fireballs (including the blue Agahnim fireballs)
db $18 ;Walking Zora
db $57 ;Desert Palace Barriers
db $18 ;Crab
db $18 ;Lost Woods Bird
db $18 ;Lost Woods Squirrel
db $18 ;Spark (clockwise on convex)
db $18 ;Spark (counterclockwise on convex)
db $5D ;Roller (vertical moving)
db $5E ;Roller (vertical moving)
db $5F ;Roller (???)
; 60
db $60 ;Roller (horizontal moving)
db $61 ;Statue Sentry
db $62 ;Master Sword plus pendants and beams of light
db $63 ;Sand Lion Pit
db $18 ;Sand Lion
db $65 ;Shooting Gallery guy
db $66 ;Moving cannon ball shooters
db $67 ;Moving cannon ball shooters
db $68 ;Moving cannon ball shooters
db $69 ;Moving cannon ball shooters
db $18 ;Ball N' Chain Trooper
db $18 ;Cannon Ball Shooting Soldier (unused in original ;WTF?)
db $6C ;Warp Vortex created by Magic Mirror
db $18 ;Rat / Bazu
db $18 ;Rope / Skullrope (aka Sukarurope?)
db $18 ;Bats / Also one eyed bats
; 70
db $18 ;Splitting Fireballs from Helmasaur King
db $18 ;Leever
db $72 ;Activator for the ponds (where you throw in items)
db $73 ;Link's Uncle / Sage / Barrier that opens in the sanctuary
db $74 ;Red Hat Boy who runs from you
db $75 ;Bottle Vendor
db $76 ;Princess Zelda
db $18 ;Also Fire Faeries (seems like a different variety)
db $78 ;Elder's Wife (Sahasrahlah's Wife, supposedly)
db $79 ;Good bee / normal bee
db $7A ;Agahnim
db $7B ;Agahnim energy blasts (not the duds)
db $18 ;Green Stalfos
db $18 ;32*32 Pixel Yellow Spike Traps
db $18 ;Swinging Fireball Chains
db $18 ;Swinging Fireball Chains
; 80
db $18 ;Wandering Fireball Chains
db $18 ;Waterhoppers
db $18 ;Swirling Fire Faeries (Eastern Palace)
db $18 ;Greene Eyegore
db $18 ;Red Eyegore
db $18 ;Yellow Stalfos (drops to the ground, dislodges head)
db $18 ;Kodondo
db $87 ;Flames
db $88 ;Mothula
db $89 ;Mothula's beam
db $8A ;Moving Spike Block (Key holes? <-- why would I think this had anything to do with keys?)
db $18 ;Gibdo
db $8C ;Arghuss
db $8D ;Arghuss spawn
db $18 ;Chair Turtles you kill with hammers
db $18 ;Blobs / Crazy Blobs via Magic powder or Quake Medallion
; 90
db $90 ;Grabber things?
db $18 ;Stalfos Knight
db $92 ;Helmasaur King
db $93 ;Bungie / Red Orb? (according to HM)
db $18 ;Pirogusu (aka Swimmer) / Flying Tiles
db $95 ;Eye laser
db $96 ;Eye laser
db $97 ;Eye laser
db $98 ;Eye laser
db $18 ;Pengator
db $18 ;Kyameron
db $18 ;Wizzrobes
db $18 ;Black sperm looking things
db $18 ;Black sperm looking things
db $18 ;Ostrich seen with Flute Boy
db $18 ;Rabbit seen with Flute Boy
; A0
db $18 ;Birds seen with Flute Boy
db $18 ;Freezor
db $A2 ;Kholdstare
db $A3 ;Another part of Kholdstare
db $18 ;Ice balls from above
db $18 ;Blue Zazak / Fire Phlegm (Fireballs of Red Zazaks and other sprites)
db $18 ;Red Zazak
db $18 ;Red Stalfos Skeleton
db $18 ;Bomber Flying Creatures from Darkworld
db $18 ;Bomber Flying Creatures from Darkworld
db $18 ;Like Like (O_o yikes)
db $AB ;Maiden (as in, the maidens in the crystals after you beat a boss)
db $AC ;Apples
db $AD ;Old Man on the Mountain
db $AE ;Down Pipe
db $AF ;Up Pipe
; B0
db $B0 ;Right Pipe
db $B1 ;Left Pipe
db $B2 ;Good bee again? (Perhaps the good bee is different after being released.... It would make sense, actually)
db $B3 ;Hylian Inscription (near Desert Palace). Also near Master Sword
db $B4 ;Thief's chest (not the one that follows you, the one that you grab from the DW smithy house)
db $B5 ;Bomb Salesman (elephant looking guy)
db $B6 ;Kiki the monkey?
db $B7 ;Maiden that ends up following you in Thieves Town
db $B8 ;Monologue Testing Sprite (Debug Artifact)
db $B9 ;Feuding Friends on Death Mountain
db $BA ;Whirlpool
db $BB ;Salesman / chestgame guy / 300 rupee giver guy / Chest game thief
db $BC ;Drunk in the inn
db $BD ;Vitreous (the large eyeball)
db $BE ;Vitreous' smaller eyeballs
db $BF ;Aghanim / Vitreous' lightning blast
; C0
db $C0 ;Monster in Lake of Ill Omen / Quake Medallion
db $18 ;Agahnim teleporting Zelda to dark world
db $C2 ;Boulders / Rocks from Lanmolas erupting from the ground
db $18 ;Gibo (vulnerable part)
db $C4 ;Thief
db $18 ;Evil Fireball Spitters (THE FACES!!)
db $C6 ;Four Way Fireball Spitters (spit when you use your sword)
db $18 ;Hokbok (HM calls it Fuzzy Stack, I think?)
db $C8 ;Big Healing Faeries / Faerie Dust
db $C9 ;Ganon's Firebat (HM also says Tektite?)
db $18 ;Chain Chomp
db $CB ;Trinexx
db $CC ;Another Part of Trinexx
db $CD ;Another Part of Trinexx (again)
db $CE ;Blind the Thief
db $18 ;Swamola (swamp worms from Swamp of Evil)
; D0
db $18 ;Lynel (centaur like creature)
db $D1 ;Rabbit Beam aka Transform aka Yellow Hunter
db $D2 ;Flopping fish
db $18 ;Stal (Hopping Skull Creatures)
db $18 ;Landmines
db $D5 ;Digging Game Proprietor
db $D6 ;Ganon! OMG
db $D7 ;Copy of Ganon, except invincible?
db $18 ;Heart refill
db $18 ;Green Rupee
db $18 ;Blue Rupee
db $18 ;Red Rupee
db $DC ;Bomb Refill (1)
db $18 ;Bomb Refill (4)
db $18 ;Bomb Refill (8)
db $18 ;Small Magic Refill
; E0
db $E0 ;Full Magic Refill
db $E1 ;Arrow Refill (5)
db $18 ;Arrow Refill (10)
db $18 ;Faerie
db $E4 ;Key
db $E5 ;Big Key
db $E6 ;Shield Pickup (Fighter or Red Shield after being dropped by a Pikit)
db $E7 ;Mushroom
db $E8 ;Fake Master Sword
db $E9 ;Magic Shop dude / His items, including the magic powder
db $EA ;Full Heart Container
db $18 ;Quarter Heart Container
db $EC ;Bushes
db $ED ;Cane of Somaria Platform
db $EE ;Movable Mantle (in Hyrule Castle)
db $EF ;Cane of Somaria Platform (same as $ED but this index is not used)
; F0
db $F0 ;Cane of Somaria Platform (same as $ED but this index is not used)
db $F1 ;Cane of Somaria Platform (same as $ED but this index is not used)
db $F2 ;Medallion Tablet

; pad rom to 2mb
org $3FFFFF
db $FF
