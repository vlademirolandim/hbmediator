/**

     Select statement with cursor in DBF

*/
#include "vdata.ch"
#include "vbase.ch"


PROCEDURE MAIN

     LOCAL lResult, cMessage := ""

     CONFIG INIT
     CONFIG LOG LEVEL INFO

#ifdef __PLATFORM__WINDOWS     
     SetMode(50,100)
#endif     
     CLS
     USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP" PAGE 1 LIMIT 5 TO lResult 
     ? IIF( lResult , "Success" , "Failed. Error : " + cMessage )
     IF lResult
         WAIT "Press any key to browse"
         BROWSE()
         WAIT "Go to next page"
         CLOSE ALL
         USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP" PAGE 2 LIMIT 5 TO lResult 
         BROWSE()
         
     ENDIF

     
RETURN 
