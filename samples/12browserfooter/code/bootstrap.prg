#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "inkey.ch"

#xcommand BROWSE SET BLOCKFOOTER <bBlock> HEIGHT <nHeight> => __oBrw__:setBlockFooter( <bBlock> , <nHeight> )
#xcommand BROWSE SET FOOTER MESSAGE <cMessage> =>  __oBrw__:setFooterMessage( "Mensagem de rodapé" )

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
    BROWSE SET FOOTER MESSAGE "Mensagem de rodapé"

    BROWSE SHOW
 
RETURN

PROCEDURE BlockFooter

    @ ROW()+1,2 SAY "Salary : " + TRANSFORM( FIELD->SAL , "@RE 999,999.99" )

    RETURN
