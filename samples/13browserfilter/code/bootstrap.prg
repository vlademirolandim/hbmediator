#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "inkey.ch"
procedure HBM_Bootstrap

    MODULE BROWSE

    CONFIG INIT FILE "code/config.json" RUNTIME
    CONFIG INIT TUI FILE "code/tui.json" RUNTIME
    CONFIG LOG LEVEL INFO
 
    BROWSE INIT USING CONNECT "TESTE" QUERY "SELECT * FROM EMP" LIMIT 5
    BROWSE TITLE "Employee"

    BROWSE ADD COLUMN "EMPNO" CAPTION "Code" PICTURE "999999"
    BROWSE ADD COLUMN "ENAME" CAPTION "Employee's name" PICTURE "@x" LENGTH 40
    BROWSE ADD COLUMN "SAL" CAPTION "Salary" PICTURE "@RE 999,999.99" 

    BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5
   // BROWSE SET FOOTER MESSAGE "Mensagem de rodapé"

    __oBrw__:setFilter( "Titulo" , "ENAME LIKE '%' || %s || '%' AND SAL > %s AND SAL < %s" , { "Name   : " , "Salary > " , "Salary < " } , { "var1" , "var2" , "var3" } , { SPACE(30) , 0 , 100000 } , { "@K" , "@RE 999,999.99" , "@RE 999,999.99" } , { .t. , .F. , .F. } )

    BROWSE SHOW
 
RETURN

PROCEDURE BlockFooter

    @ ROW()+1,2 SAY "Salary : " + TRANSFORM( FIELD->SAL , "@RE 999,999.99" )

    RETURN
