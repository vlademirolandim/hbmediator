#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-q0

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"
#include "inkey.ch"

PROCEDURE Hbm_CGI()

    CONFIG LOG LEVEL INFO
    SET CMD DELIMITERS TO CHR(K_TAB)
    
    // ATENÇÃO !!!!!! -> _PG_SISTEMAS33 SAO VARIAVEIS DE AMBIENTE DO POSTGRES
    USE EMP ;
       USING CONNECT "PG_SISTEMAS33" MEMORY;
       QUERY "SELECT * FROM EMP"

    ? "         10        20        30        40        50"
    ? "12345678901234567890123456789012345678901234567890"
    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME, FIELD->JOB, FIELD->SAL
        SKIP
    ENDDO

RETURN

