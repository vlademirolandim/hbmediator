#include "vbase.ch"
#include "fcore.ch"
#include "inkey.ch"

PROCEDURE Hbm_BootStrap

    LOCAL aContent ,cError
    LOCAL cExec := SPACE(2000)
    LOCAL GetList := {}
    LOCAL x

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    CLS
    @ 09,10 SAY "OS : " + OS()
    @ 10,10 SAY "TYPE EXTERNAL COMMAND (E.g: ls,cat file.txt, ping localhost) : " GET cExec PICTURE "@S50"
    READ

    IF LASTKEY() <> K_ESC
       EXEC RUN cExec ERROR cError TO aContent AS ARRAY
       @ 11,10 say "RETURN : " + HB_VALTOEXP( aContent )
       @ 12,10 say "ERROR : " + cError

       FOR x := 1 TO LEN( aContent )
          @ 13+x,10 say aContent[x]
       NEXT   
       INKEY(0)

    ENDIF   

RETURN

