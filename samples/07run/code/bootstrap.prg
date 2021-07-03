#include "vbase.ch"
#include "fcore.ch"
#include "inkey.ch"

PROCEDURE Hbm_BootStrap

    LOCAL cContent ,cError
    LOCAL cExec := SPACE(2000)
    LOCAL GetList := {}
    LOCAL cParam1 := SPACE(50)
    LOCAL cParam2 := SPACE(50)

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    CLS
    @ 09,10 SAY "OS : " + OS()
    @ 10,10 SAY "TYPE EXTERNAL COMMAND WITHOUT PARAMETERS : " GET cExec PICTURE "@S50"
    @ 11,10 SAY "TYPE PARAMETER 1                         : " GET cParam1
    @ 12,10 SAY "TYPE PARAMETER 2                         : " GET cParam2
    READ

    IF LASTKEY() <> K_ESC
       EXEC RUN cExec PARAMETERS cParam1, cParam2 ERROR cError TO cContent 
       @ 15,10 say "RETURN : " + cContent
       @ 16,10 say "ERROR : " + cError
    ENDIF   

RETURN

