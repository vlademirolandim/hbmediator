#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-q0

#include "cmdterminal.ch"
#include "inkey.ch"
PROCEDURE HBM_CGI
LOCAL x := 123
LOCAL n

SET KEY K_CTRL_Z TO

DO WHILE .T.

    ? "Recalculando processo " , ++x

    n := INKEY(.5)
    IF n == K_ESC
        EXIT
    ENDIF

ENDDO

