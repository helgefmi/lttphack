; --------------
; Indices
; --------------

table header.tbl

cm_mainmenu_indices:
    dw #cm_main_goto_items
    dw #cm_main_goto_equipment
    dw #cm_main_goto_teleport
    dw #cm_main_goto_gamestate
    dw #cm_main_goto_features
    dw #$0000
    db "MAIN MENU", $FF

cm_submenu_items:
;    dw cm_equipment_bow
;    dw cm_equipment_boom
;    dw cm_equipment_hook
;    dw cm_equipment_bombs
;    dw cm_equipment_powder
;    dw cm_equipment_fire_rod
;    dw cm_equipment_ice_rod
;    dw cm_equipment_bombos
;    dw cm_equipment_ether
;    dw cm_equipment_quake
;    dw cm_equipment_lantern
;    dw cm_equipment_hammer
;    dw cm_equipment_flute
;    dw cm_equipment_net
;    dw cm_equipment_book
;    dw cm_equipment_bottle
;    dw cm_equipment_somaria
;    dw cm_equipment_byrna
;    dw cm_equipment_cape
;    dw cm_equipment_mirror
    dw #$0000
    db "ITEMS", $FF

cm_submenu_equipment:
;    dw cm_resource_boots
;    dw cm_resource_gloves
;    dw cm_resource_flippers
;    dw cm_resource_moon_pearl
;    dw cm_resource_sword
;    dw cm_resource_shield
;    dw cm_resource_armor
;    dw cm_resource_rupees
;    dw cm_resource_containers
;    dw cm_resource_hearts
;    dw cm_resource_bombs
;    dw cm_resource_arrows
;    dw cm_resource_keys
    dw #$0000
    db "EQUIPMENT", $FF

cm_submenu_teleport:
;    dw cm_teleport_mode
;    dw cm_teleport_escape
;    dw cm_teleport_eastern
;    dw cm_teleport_desert
;    dw cm_teleport_hera
;    dw cm_teleport_aga
;    dw cm_teleport_pod
;    dw cm_teleport_theives
;    dw cm_teleport_skull
;    dw cm_teleport_ice
;    dw cm_teleport_swamp
;    dw cm_teleport_mire
;    dw cm_teleport_trock
;    dw cm_teleport_gtower
;    dw cm_teleport_ganon
    dw #$0000
    db "TELEPORT TO..", $FF

cm_submenu_gamestate:
    dw #$0000
    db "GAME STATE", $FF

cm_submenu_features:
    dw cm_feature_counters
    dw cm_feature_input_display
    dw cm_feature_enemy_hp
    dw cm_feature_xy
    dw cm_feature_qw
    dw cm_feature_lit_rooms
    dw cm_feature_oob
    dw cm_feature_los
    dw #$0000
    db "TOGGLE FEATURES", $FF

; -----------------
; MAIN MENU ITEMS
; -----------------

table normal.tbl

cm_main_goto_items:
    dw !CM_ACTION_SUBMENU
    dw #cm_submenu_items
    db "Items", #$FF

cm_main_goto_equipment:
    dw !CM_ACTION_SUBMENU
    dw #cm_submenu_equipment
    db "Equipment", #$FF

cm_main_goto_teleport:
    dw !CM_ACTION_SUBMENU
    dw #cm_submenu_teleport
    db "Teleport to", #$FF

cm_main_goto_gamestate:
    dw !CM_ACTION_SUBMENU
    dw #cm_submenu_gamestate
    db "Gamestate", #$FF

cm_main_goto_features:
    dw !CM_ACTION_SUBMENU
    dw #cm_submenu_features
    db "Features", #$FF


; -------------------
; Feature Menu Items
; -------------------

cm_feature_counters:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_counters_toggle
    db "Counters", #$FF

cm_feature_input_display:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_input_display_toggle
    db "Input Display", #$FF

cm_feature_enemy_hp:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_enemy_hp_toggle
    db "Enemy HP", #$FF

cm_feature_xy:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_xy_toggle
    db "Coordinates", #$FF

cm_feature_qw:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_qw_toggle
    db "QW Indicator", #$FF

cm_feature_lit_rooms:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_lit_rooms_toggle
    db "Lit Rooms", #$FF

cm_feature_oob:
    dw !CM_ACTION_TOGGLE_BYTE
    dl !lowram_oob_toggle
    db "OoB Mode", #$FF

cm_feature_los:
    ; \todo implement
    dw !CM_ACTION_TOGGLE_BYTE
    dl !ram_los_toggle
    db "LoS Sprites", #$FF





; TEST

cm_menuitem_sword:
    dw !CM_ACTION_CHOICE
    dl !ram_debug
    db "Sword", #$FF
    db "Fighter", #$FF
    db "Master", #$FF
    db "Tempered", #$FF
    db "Gold", #$FF
    db #$FF

cm_menuitem_back:
    dw !CM_ACTION_BACK
    db "Back", #$FF

cm_menuitem_jsr:
    dw !CM_ACTION_JSR
    dw #tezt
    db "Do something", #$FF
