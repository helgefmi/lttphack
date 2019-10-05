lorom

!FEATURE_HUD ?= 1
!FEATURE_SD2SNES ?= 1
!VERSION = "11 ALPHA 1"

incsrc defines.asm
incsrc hexedits.asm

!ORG = $208000
incsrc gamemode.asm
warnpc $208FFF

if !FEATURE_HUD
    !ORG = $218000
    incsrc hud.asm
    warnpc $21BFFF
endif

!ORG = $21C000
incsrc nmi.asm
warnpc $21FFFF

!ORG = $228000
incsrc draw.asm
warnpc $22BFFF

!ORG = $22C000
incsrc tiles.asm
warnpc $22FFFF

!ORG = $238000
incsrc init.asm
warnpc $23CFFF

!ORG = $23C000
incsrc rng.asm
warnpc $23DFFF

!ORG = $23E000
incsrc idle.asm
warnpc $23FFFF

!ORG = $248000
incsrc custom_menu.asm
warnpc $24FFFF

!ORG = $258000
incsrc presets.asm
warnpc $25FFFF

!ORG = $268000
incsrc poverty_states.asm
warnpc $26FFFF

!ORG = $278000
incsrc music.asm
warnpc $27FFFF

!ORG = $288000
incsrc movie.asm
warnpc $28FFFF

; ---- data ----

!ORG = $308000
incsrc preset_data_nmg.asm
warnpc $30FFFF

!ORG = $318000
incsrc preset_data_hundo.asm
warnpc $31FFFF

!ORG = $328000
incsrc preset_data_low.asm
warnpc $32FFFF

!ORG = $338000
incsrc preset_data_ad.asm
warnpc $33FFFF

org !SPC_DATA_OVERWORLD
incbin ../resources/spc_overworld.bin

org !SPC_DATA_UNDERWORLD
incbin ../resources/spc_underworld.bin

org !SPC_DATA_CREDITS
incbin ../resources/spc_credits.bin

; pad rom to 2mb
org $3FFFFF
db $FF
