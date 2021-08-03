#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
-q0

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"

PROCEDURE Hbm_CGI()

    CONFIG LOG LEVEL INFO
    SET CONSOLE ON
    
    USE EMP ;
       USING CONNECT "DATANET" MEMORY;
       QUERY "SELECT * FROM CFG_IP"

    DO WHILE .NOT. EOF()
        ? FIELD->DESCRICAO
        SKIP
    ENDDO

RETURN

