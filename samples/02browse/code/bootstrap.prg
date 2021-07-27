#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"

procedure HBM_Bootstrap

    MODULE BROWSE

    CONFIG INIT FILE "code/config.json" RUNTIME
    CONFIG INIT TUI FILE "code/tui.json" RUNTIME

    CONFIG LOG LEVEL INFO

    

    BROWSE INIT USING CONNECT "TESTE" QUERY "SELECT * FROM EMP" 
    BROWSE TITLE "EMP"

    BROWSE ADD COLUMN "EMPNO" CAPTION "Código" PICTURE "999999"
    BROWSE ADD COLUMN "ENAME" CAPTION "Nome do funcionário" PICTURE "@x" LENGTH 40
    
    BROWSE SHOW
    
 

return
