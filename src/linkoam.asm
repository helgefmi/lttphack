org $0DFFF0 ; local makes this a lot easier
WriteLinkCoords:
	STX !ram_linkOAMpos
	;STA $0800, X
	STA $0804, X
	RTS

;org $0DA505 : JSR WriteLinkCoords
;org $0DA592 : JSR WriteLinkCoords
;org $0DA71F : JSR WriteLinkCoords
;org $0DA919 : JSR WriteLinkCoords
;org $0DA9BF : JSR WriteLinkCoords
;org $0DAE19 : JSR WriteLinkCoords
;org $0DAEA4 : JSR WriteLinkCoords
;org $0DAF87 : JSR WriteLinkCoords

org $0DAA05 : JSR WriteLinkCoords
org $0DAF90 : JSR WriteLinkCoords