#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include


#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"

PROCEDURE Hbm_CGI

    CONFIG LOG LEVEL INFO

    SET CONSOLE ON

    USE EMP ;
       USING CONNECT "TESTE" ;
       QUERY "SELECT * FROM EMP"

    ? "DBF simulation (but database is sqlite)"
    ? "Tip: use in grep command. E.g: ./start3.sh | grep -i BLAKE"
    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME
        SKIP
    ENDDO

RETURN

