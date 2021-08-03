#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include


#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"

PROCEDURE Hbm_CGI

    CONFIG LOG LEVEL INFO

    SET CONSOLE ON

    hb_SetEnv( "TESTE" , "mSnQQuuu3G9WqM4T8JpQtCXmhg3oZeplcYe6DyQAl/7N2L3yaK+2BWGiEVMqdia46eadisIxEys=" ) 

    USE EMP ;
       USING CONNECT "TESTE" MEMORY ;
       QUERY "SELECT * FROM EMP"

    ? "DBF simulation (but database is sqlite)"
    ? "Tip: use in grep command. E.g: ./start3.sh | grep -i BLAKE"
    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME
        SKIP
    ENDDO

RETURN

