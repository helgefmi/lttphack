; change small magic to E
org $0984DB : db $24
org $08C4F1 : LDA.l $7EF373
org $00D50D : dw $0A3A-2 ; A3A

; remove all major items for E
org $01EA17+2 : db $45
org $01E996+2 : db $45
org $01EB4C+2 : db $45
org $01EA3E+2 : db $45
org $01E987+2 : db $45
org $01E97B+2 : db $45
org $01E9E7+2 : db $45
org $01E972+2 : db $45
org $01E96F+2 : db $45
org $01E9BA+2 : db $45
org $01EB07+2 : db $45
org $01EA65+2 : db $45
org $01E9CC+2 : db $45
org $01EB0D+2 : db $45
org $01E9F0+2 : db $45
org $01EB3D+2 : db $45
org $01EA71+2 : db $45
org $01E9C3+2 : db $45
org $01EA8C+2 : db $45
org $01EA89+2 : db $45
org $01E978+2 : db $45
org $01E98D+2 : db $45
org $01EA0E+2 : db $45
org $01E9F6+2 : db $45
org $01E9A8+2 : db $45
org $01EAD4+2 : db $45
org $01E9EA+2 : db $45
org $01EA77+2 : db $45

org $01EDA8 : db $45 ; chest game
org $0589AF+1 : db $45 ; master sword
org $05DF44+1 : db $45 ; uncle
org $05EB17+1 : db $45 ; bottle vendor
org $05EE8C+1 : db $45 ; mushroom
org $05EFCC+1 : db $45 ; heart container
org $05EFE9+1 : db $45 ; heart container
org $05F09C+1 : db $45 ; heart container
org $05F1FB+1 : db $45 ; boots
org $05F65D+1 : db $45 ; powder
org $05FD3F+1 : db $45 ; book
org $06B0C6+1 : db $45 ; shovel
org $06B55B+1 : db $45 ; smithy
org $06B9CE+1 : db $45 ; sick kid
org $06BD67+1 : db $45 ; purple chest
org $06BE7C+1 : db $45 ; hobo
org $08D019+1 : db $45 ; flute
org $08CAA9 : db $45 ; ether tablet
org $098B7C : db $45 ; ether tablet
org $08CAA9 : db $45 ; ether tablet
org $098B81 : db $45 ; ether tablet
org $1DE184+1 : db $45 ; quake
org $1DE1C2+1 : db $45 ; flippers
org $1EE9F9+1 : db $45 ; mirror
org $1EE9F9+1 : db $45 ; mirror

org $05F08F+1 : db #$00 ; no heart pieces
org $0DEDF1+1 : db #$00 ; no heart pieces
org $05F095 : NOP : NOP

org $05EFC8 : db $00 ; fix grabbing hearts

;===================================================================================================

; no magic message
org $07B0C2 : CLC : RTS

;===================================================================================================

; No maidens
org $1E8B97 : dw $CF35
org $02970B : dw $9721
org $02970D : dw $97E9
org $1ECDDD : db $9C ; STZ

;===================================================================================================

; hammerable ganon
org $06F2EE : db $D8

;===================================================================================================

; no text for items
org $08C5D5 : db $80 ; BRA
org $08C5EB : db $80 ; BRA

;===================================================================================================
; Quick swap
; DISGUSTING
;===================================================================================================
org $0287FB : JSL QuickSwap
org $02A451 : JSL QuickSwap

;===================================================================================================
; Remove bottle submenu
;===================================================================================================
org $0DDF9A : JSL BottleMenuButtonPress : NOP
org $0DDE3D : db $80 ; BRA
org $0DDE9D : db $80 ; BRA
