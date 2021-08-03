#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
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
    USE CFG_IP ;
       USING CONNECT "DATANET" MEMORY;
       QUERY "SELECT * FROM CFG_IP"

    ? hb_valtoexp( dbstruct() )

    DO WHILE .NOT. EOF()
        IF .not. empty( field->id_faixa )
            ?  FIELD->ID_CFG_IP, "--->" , FIELD->ID_FAIXA
        ENDIF    
        SKIP
    ENDDO

RETURN

