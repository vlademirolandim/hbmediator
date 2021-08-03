#include "vbase.ch"
#include "form.ch"

PROCEDURE Hbm_BootStrap

    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    FORM ROWTOP 5 COLTOP 5
    FORM TEMPLATE FILE "bootstrap.tpl"
    
    FORM TITLE "Database configuration"

    FORM ADD MAP "A" NAME "CONNECTION" VAL SPACE(30) PICT "@!" MESSAGE "Connection name (Letters and numbers only. Not spaces or special characteres"
    FORM ADD MAP "B" NAME "TYPE" MESSAGE "Database type"  RADIOGROUP WIDTH 16 HEIGHT 3 OPTIONS { "SQLITE" => "SQLite" , "POSTGRES" => "PostgreSQL" }
    FORM ADD MAP "C" NAME "PATH" VAL "./data" + SPACE(80) PICT "@S20" MESSAGE "Path to database file"
    FORM ADD MAP "D" NAME "FILENAME" VAL SPACE(20) MESSAGE "Enter file name (without path)"

    FORM SHOW

    //HbmLoad( "yourfile" ) <-- Load yourfile.hrb (or compile and load yourfile.prg, if --prg flag informed)

RETURN
/*
yourfile.prg content:


PROCEDURE HBM_yourfile  // <--- add "HBM_" prefix before (it's mandatory)

    // Your code here

RETURN
*/

