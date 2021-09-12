math pri on

sa1rom

!VERSION ?= "ALEPH 1"

incsrc defines.asm
incsrc hexedits.asm

org $208000
incsrc init.asm
incsrc sa1hooks.asm
incsrc nmi.asm
incsrc timers.asm
incsrc gamemode.asm
incsrc misc.asm
incsrc hudextras.asm
incsrc rng.asm
incsrc presets.asm
incsrc roomload.asm

org $218000
incsrc tiles.asm

org $228000
table resources/menu.tbl
incsrc cm_macros.asm
incsrc cm_main.asm
incsrc cm_draw.asm
incsrc cm_func.asm
incsrc cm_items.asm
incsrc cm_equipment.asm
incsrc cm_gamestate.asm
incsrc cm_linkstate.asm
incsrc cm_gameplay.asm
incsrc cm_rng.asm
incsrc cm_hud.asm
incsrc cm_roomload.asm
incsrc cm_shortcuts.asm
incsrc cm_config.asm
incsrc cm_presetconfig.asm

org $268000

print ""
print "Preset data:"
print "--------------------"

;===================================================================================================
; GREP FOR "PRESET LIST" WHEN ADDING NEW PRESETS
;===================================================================================================
org $308000
incsrc cm_presets_nmg.asm
incsrc cm_presets_100nmg.asm
incsrc cm_presets_lanmorta.asm

org $318000
incsrc cm_presets_lownmg.asm
incsrc cm_presets_lowleg.asm

org $328000
incsrc cm_presets_adold.asm
incsrc cm_presets_ad2020.asm
incsrc cm_presets_anyrmg.asm

org $338000
incsrc bsod.asm

; pad rom to 2mb
org $3FFFFF
db $FF
