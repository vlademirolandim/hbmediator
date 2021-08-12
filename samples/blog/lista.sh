#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-q0

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"
#include "inkey.ch"

PROCEDURE Hbm_CGI()

    CONFIG LOG LEVEL INFO
    SET CONSOLE ON

    SET CMD DELIMITERS TO CHR(K_TAB)
    //SET CMD DELIMITERS TO ";"
    
    // ATENÇÃO !!!!!! -> SQLITE_SISTEMAS33 SAO VARIAVEIS DE AMBIENTE NO /etc/profile a pasta do banco é /home/vlademiro/sistemas/hbmediator
    USE EMP ;
       USING CONNECT "SQLITE_SISTEMAS33" MEMORY;
       QUERY "SELECT * FROM EMP"

    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME, FIELD->JOB
        SKIP
    ENDDO

RETURN

