/**

     Insert statement

*/
#include "vdata.ch"
#include "vbase.ch"


PROCEDURE MAIN

     LOCAL lResult

     CONFIG INIT
     CONFIG LOG LEVEL INFO


     CLS
     ? 
     ? "Insert registers"
     ?
     ?

          
     ? "Insert data into table EMP"
     INSERT USING CONNECT "SQLITE" DECRYPT INTO emp  EMPNO , ENAME  VALUES  12 , 'MY TEST'  TO lResult
     ? IIF( lResult , "Success" , "Failed. See log in current directory" )


     
RETURN 
