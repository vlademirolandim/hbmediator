#include "vbase.ch"

PROCEDURE Hbm_BootStrap

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    HbmLoad( "menu" ) //<-- Load yourfile.hrb (or compile and load yourfile.prg, if --prg flag informed)

RETURN
/*
yourfile.prg content:


PROCEDURE HBM_yourfile  // <--- add "HBM_" prefix before (it's mandatory)

    // Your code here

RETURN
*/

