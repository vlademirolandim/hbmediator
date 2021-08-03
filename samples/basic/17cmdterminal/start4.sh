#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"

PROCEDURE Hbm_CGI( ... )

    LOCAL cSQL
    LOCAL aI := hb_AParams()
    LOCAL x

    CONFIG LOG LEVEL INFO

    IF PCOUNT() == 0
        ? "Pass any parameter please"
        ? "E.g. 1: script4.sh 1 2 3 4 5 6 7"
        ? "E.g. 2: sscipt4.sh `date`"
        QUIT
    ENDIF    
    FOR x := 1 TO LEN( aI )
        ? aI[x]
    NEXT    

RETURN

