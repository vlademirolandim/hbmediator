#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
#include "vtest.ch"

PROCEDURE hb_CGI

    MODULE TEST GROUP
    TEST GROUP TITLE "Arithmetical operations"
    
    TEST GROUP ADD Sum_Test
    TEST GROUP ADD Subtraction_Test

    TEST GROUP EXEC

    RETURN


BEGIN TEST Sum_Test TITLE "Testing 1+1"

    LOCAL lReturn, cMessage := ""
    LOCAL oObj

    oObj := VTest():New()
    lReturn := ( 1+1 == 2 )  /* Put returned value */
    TEST "Testing 1+1 == 2 (Pass)" EXPECTED .t. RESULT lReturn COMPLEMENT cMessage

    oObj := VTest():New()
    lReturn := ( 1+1 == 3 )  /* Put returned value */
    TEST "Testing 1+1 == 3 (Fail)" EXPECTED .f. RESULT lReturn COMPLEMENT cMessage


END TEST

BEGIN TEST Subtraction_Test TITLE "Testing 1-1"

    LOCAL lReturn, cMessage := ""
    LOCAL oObj

    oObj := VTest():New()
    lReturn := ( 1-1 == 0 )  /* Put returned value */
    TEST "Testing 1-1 == 0 (Pass)" EXPECTED .t. RESULT lReturn COMPLEMENT cMessage

    oObj := VTest():New()
    lReturn := ( 1-1 == 3 )  /* Put returned value */
    TEST "Testing 1-1 == 3 (Fail)" EXPECTED .f. RESULT lReturn COMPLEMENT cMessage


END TEST




