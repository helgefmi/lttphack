lorom

!FEATURE_HUD ?= 1
!FEATURE_SD2SNES ?= 1
!VERSION ?= "ALEPH 1"

incsrc defines.asm
incsrc hexedits.asm

org $A08000
incsrc gamemode.asm
incsrc nmi.asm
incsrc timers.asm
incsrc hudextras.asm

if !FEATURE_HUD
	incsrc hud.asm
endif

org $A28000
incsrc tiles.asm

org $A38000
incsrc init.asm
incsrc rng.asm
incsrc misc.asm
incsrc idle.asm
incsrc glitchedwindow.asm
incsrc ancillawindow.asm

org $A48000
incsrc custom_menu.asm
print "Custom menu size: ", pc

org $A68000
incsrc presets.asm

org $A78000
incsrc poverty_states.asm

org $A88000
incsrc music.asm

org $A98000
incsrc movie.asm

; ---- data ----

org $B08000
incsrc preset_data_nmg.asm

org $B18000
incsrc preset_data_hundo.asm

org $B28000
incsrc preset_data_lowleg.asm

org $B38000
incsrc preset_data_ad.asm

org $B48000
incsrc preset_data_anyrmg.asm
incsrc preset_data_ad2020.asm

org $B58000
incsrc preset_data_lownmg.asm

org !SPC_DATA_OVERWORLD
incbin ../resources/spc_overworld.bin

org !SPC_DATA_UNDERWORLD
incbin ../resources/spc_underworld.bin

org !SPC_DATA_CREDITS
incbin ../resources/spc_credits.bin

;========================================================================
; LEAVE THIS HERE
; it's needed for calculating when certain data comes from a possibly
; non-vanilla source, which requires knowing the last bank we write to
;========================================================================
EndOfPracticeROM:

; pad rom to 2mb
org $3FFFFF
db $FF
