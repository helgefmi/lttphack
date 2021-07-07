org $0DFFE4 ; local makes this a lot easier
GetLinkCoords:
	LDA #$01 : BEQ .vanilla
	LDA.b #126 : STA $01 : STA $00
	RTS
.vanilla
	LDA $20 : SEC : SBC $E8 : STA $01
	LDA $22 : SEC : SBC $E2 : STA $00
	RTS

;org $0DA505 : JSR WriteLinkCoords
;org $0DA592 : JSR WriteLinkCoords
;org $0DA71F : JSR WriteLinkCoords
;org $0DA919 : JSR WriteLinkCoords
;org $0DA9BF : JSR WriteLinkCoords
;org $0DAE19 : JSR WriteLinkCoords
;org $0DAEA4 : JSR WriteLinkCoords
;org $0DAF87 : JSR WriteLinkCoords

;org $0DAA05 : JSR WriteLinkCoords
;org $0DAF90 : JSR WriteLinkCoords
org $0DA1D1 : JSR GetLinkCoords : BRA +
org $0DA1DF : +