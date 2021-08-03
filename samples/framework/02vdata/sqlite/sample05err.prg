/**

     Delete statement

*/
#include "vdata.ch"
#include "vbase.ch"

PROCEDURE MAIN

     LOCAL lResult, cMessage := ""
     LOCAL nId := 100

     CONFIG INIT
     CONFIG LOG LEVEL INFO

     TestDbInit()	

    CLS
    ? 
    ? "Select registers (Cursor in DBF)" 
    ?
    INSERT USING CONNECT "SQLITE" DECRYPT INTO EMP  EMPNO , ENAME  VALUES  nId , 'MY TEST'  MESSAGE TO cMessage TO lResult 
    ?
    IF lResult

        DELETE USING CONNECT "SQLITE" DECRYPT FROM EMP WHERE INEXISTENT_FIELD = nId MESSAGE TO cMessage TO lResult 
        IF lResult

            ? "Exclusion made sucessfuly"

        ELSE

            ? "Exclusion failed with message : " , cMessage

        ENDIF 


    ELSE

        ? "Connection failed"
        ? "Message return " , cMessage

    ENDIF

     
    RETURN 
