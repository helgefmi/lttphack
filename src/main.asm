lorom

!FEATURE_HUD ?= 1
!FEATURE_SD2SNES ?= 1
!VERSION = "10"

incsrc defines.asm
incsrc hexedits.asm

incsrc gamemode.asm     ; $208000
warnpc $218000

if !FEATURE_HUD
    incsrc hud.asm          ; $218000
    warnpc $228000
endif

incsrc nmi.asm          ; $228000
warnpc $238000

incsrc draw.asm         ; $238000
warnpc $248000

incsrc tiles.asm        ; $248000
warnpc $258000

incsrc custom_menu.asm  ; $258000
warnpc $268000

incsrc init.asm         ; $268000
warnpc $278000

incsrc presets.asm      ; $278000
warnpc $288000

incsrc rng.asm
warnpc $28B000

incsrc idle.asm
warnpc $298000

incsrc preset_data_nmg.asm
warnpc $2A8000

incsrc preset_data_hundo.asm
warnpc $2B8000

incsrc preset_data_low.asm
warnpc $2C8000

incsrc poverty_states.asm
warnpc $2D8000

; pad rom to 2mb
org $3FFFFF
db $FF
