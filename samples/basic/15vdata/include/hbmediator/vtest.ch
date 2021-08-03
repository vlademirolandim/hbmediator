/**
* Tests
*
*/


#command BEGIN TEST <xTitle> TITLE <cTitle> [FORMAT TEXT]   => FUNCTION <xTitle>();LOCAL oTest := VTestText():New( <cTitle>  )

#command TEST <cComment> EXPECTED <lExpected> RESULT <lValue> [COMPLEMENT <cComplement>] [TO <lResult>] => [ <lResult> := ] oTest:Test(  <cComment>, <lValue> , <lExpected> , [<cComplement>] )
#command END TEST => RETURN oTest:EndTest()
#command ENDTEST => RETURN oTest:EndTest()


#command MODULE TEST GROUP => LOCAL ___oTestGroup 
#command TEST GROUP TITLE <cTitle> => ___oTestGroup := VTestGroup():New( <cTitle> )
#command MODULE TEST GROUP TITLE <cTitle> => LOCAL ___oTestGroup ; ___oTestGroup := VTestGroup():New( <cTitle> )

#command TEST GROUP ADD  <xTest> [TITLE <cTitle>] => ___oTestGroup:AddTest( {|| <xTest>() } , [<cTitle>] )
#command TEST GROUP ADD  <xTest> PARAMETERS <x> [TITLE <cTitle>] => ___oTestGroup:AddTest( {|| <xTest>( <x> ) } , [<cTitle>] )

#command TEST GROUP EXEC [TO FILE <xfile> ]=> ___oTestGroup:Execute( [ <"xfile"> ] )
                

