#include "vbase.ch"
#include "vdata.ch"

PROCEDURE Hbm_BootStrap

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    SET CONSOLE ON

    USE EMP ;
       USING CONNECT "TESTE" ;
       QUERY "SELECT * FROM EMP"

    ? "DBF simulation (but database is sqlite)"
    LIST FIELD->EMPNO, FIELD->ENAME
    ? "Type any key"
    INKEY(0)
    //HbmLoad( "yourfile" ) <-- Load yourfile.hrb (or compile and load yourfile.prg, if --prg flag informed)

RETURN
/*
yourfile.prg content:


PROCEDURE HBM_yourfile  // <--- add "HBM_" prefix before (it's mandatory)

    // Your code here

RETURN
*/

