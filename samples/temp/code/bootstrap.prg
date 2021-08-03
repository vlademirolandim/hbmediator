*@head
*Auto=Yes
#include 'form.ch'
#include 'vbase.ch'
*@@head

*@procedure_head
*Auto=Yes
PROCEDURE Hbm_Bootstrap
    MODULE MENU
*@@procedure_head

*@local
*Auto=Yes
    //Insert LOCAL variables here
    //LOCAL
*@@local

*@config
*Auto=Yes
    CONFIG INIT FILE 'config.json' COMPILE
    CONFIG INIT TUI FILE 'tui.json' COMPILE
    CLS
*@@config

*@menu
*Auto=No
    MENU INIT
    MENU ADD ITEM '&Files'
    MENU ADD SUBITEM '&New' BLOCK {||nil} KEY K_CTRL_N MESSAGE 'Create new file' CHECKED
    MENU ADD SUBITEM 'Example' BLOCK {||NIL} KEY K_CTRL_A MESSAGE 'Example' DISABLED
    MENU ADD POPUP 'Popup Title' 
    MENU ADD POPUP ITEM '&Popup New' BLOCK {||NIL} KEY K_CTRL_B MESSAGE 'Popup item'
    MENU ADD SUBITEM '&Pos option' BLOCK {||NIL} 
    MENU ADD ITEM 'Manut'
    MENU ADD SUBITEM 'Sair' EXIT
    MENU SHOW
*@@menu
