/**

     Update statement

*/
#include "vdata.ch"
#include "vbase.ch"


PROCEDURE MAIN



     LOCAL lResult, cMessage

     CONFIG INIT
     CONFIG LOG LEVEL INFO


     CLS
     ? 
     ? "Insert registers"
     ?
     ?

     USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP WHERE EMPNO = 12" TO lResult 
     ? IIF( lResult , "Success" , "Failed. Error : " + cMessage )
     IF lResult
         IF DBTEST->( RECCOUNT() ) <> 1
             ? "Insert data into table emp"
             INSERT USING CONNECT "SQLITE" DECRYPT INTO emp  EMPNO , ENAME  VALUES  12 , 'MY TEST'  TO lResult
             ? IIF( lResult , "Success" , "Failed. See log in current directory" )
         ELSE
             ? "Record found."
         ENDIF
     ELSE
         ? "Error on select"
         QUIT
     ENDIF

     IF lResult
          
          ACCEPT "Inform new name to register : " TO cName
          UPDATE USING CONNECT "SQLITE" emp  SET INEXISTENT_FIELD = cName  WHERE EMPNO = 12  MESSAGE TO cMessage TO lResult 
          ? IIF( lResult , "Success" , "Failed." ) , cMessage

     ELSE

          ? "Connection failed"

     ENDIF

     
RETURN 
