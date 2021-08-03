/**

     Select statement with cursor in DBF

*/
#include "vdata.ch"
#include "vbase.ch"

PROCEDURE MAIN

     LOCAL lResult, cMessage := ""

     CONFIG INIT
     CONFIG LOG LEVEL INFO

     CLS
     USE DBTEST USING CONNECT "SQLITE" /*DECRYPT*/ QUERY "SELECT * FROM EMP"  TO lResult
     ? IIF( lResult , "Success" , "Failed." )
     IF lResult
         WAIT "Press any key to browse"
         BROWSE()
     ENDIF


RETURN
