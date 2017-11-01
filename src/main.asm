lorom

!FEATURE_HUD ?= 1
!FEATURE_SS ?= 1
!VERSION = 9

print "HUD: !FEATURE_HUD SS: !FEATURE_SS"

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
