#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/usr/local/include/harbour
-q0

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"
#include "inkey.ch"

PROCEDURE Hbm_CGI( ... )

    CONFIG INIT
    CONFIG LOG LEVEL INFO
    SET CONSOLE ON
    ? hb_Pvalue(1)
    USE FAIXA ;
       USING CONNECT "DATANET" MEMORY;
       QUERY "SELECT * FROM FAIXA"

    DO WHILE .NOT. EOF()
        ?  FIELD->PREFIXO 
        SKIP
    ENDDO

RETURN

