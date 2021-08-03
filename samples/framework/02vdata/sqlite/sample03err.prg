/**

     Insert statement

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

          
     ? "Insert data into table test"
     INSERT USING CONNECT "SQLITE" DECRYPT INTO emp  INEXISTENT_FIELD , ENAME  VALUES  12 , 'MY TEST' MESSAGE TO cMessage TO lResult
     ? IIF( lResult , "Success" , "Failed." ) , cMessage


     
RETURN 
