lorom

!FEATURE_HUD ?= 1
!FEATURE_SD2SNES ?= 1
!VERSION = "11 ALPHA 1"

incsrc defines.asm
incsrc hexedits.asm

org $208000
incsrc gamemode.asm

if !FEATURE_HUD
    org $218000
    incsrc hud.asm
    warnpc $21BFFF
endif

org $21C000
incsrc nmi.asm

org $228000
incsrc draw.asm

org $22C000
incsrc tiles.asm

org $238000
incsrc init.asm

org $23C000
incsrc rng.asm

org $23E000
incsrc idle.asm

org $248000
incsrc custom_menu.asm

org $258000
incsrc presets.asm

org $268000
incsrc poverty_states.asm

org $278000
incsrc music.asm

org $288000
incsrc movie.asm

; ---- data ----

org $308000
incsrc preset_data_nmg.asm

org $318000
incsrc preset_data_hundo.asm

org $328000
incsrc preset_data_low.asm

org $338000
incsrc misc.asm

org !SPC_DATA_OVERWORLD
incbin ../resources/spc_overworld.bin

org !SPC_DATA_UNDERWORLD
incbin ../resources/spc_underworld.bin

org !SPC_DATA_CREDITS
incbin ../resources/spc_credits.bin

; pad rom to 2mb
org $3FFFFF
db $FF
