#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"

procedure HBM_Bootstrap

    MODULE BROWSE

    CONFIG INIT FILE "code/config.json" RUNTIME
    CONFIG INIT TUI FILE "code/tui.json" RUNTIME
    CONFIG LOG LEVEL INFO
 
    BROWSE INIT USING CONNECT "TESTE" QUERY "SELECT * FROM EMP" LIMIT 5
    BROWSE TITLE "Employee"

    BROWSE ADD COLUMN "EMPNO" CAPTION "Code" PICTURE "999999"
    BROWSE ADD COLUMN "ENAME" CAPTION "Employee's name" PICTURE "@x" LENGTH 40

    BROWSE SET TABLE "EMP"
    BROWSE SET PKNAME "EMPNO"
    BROWSE SET UPDATE FrmEmp
    BROWSE SET INSERT FrmEmp
    BROWSE SET DELETE ON

        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmEmp

    FORM TEMPLATE FILE "frmemp.txt" 
    FORM ROWTOP 14 COLTOP 30

    FORM ADD MAP "A" NAME "Text_EmpNo" VAL 0 PICT "@r 99999"  FIELDNAME "EMPNO" MESSAGE "Type code employee"  ISREADONLY IS_FORM_UPDATE
    FORM ADD MAP "B" NAME "Text_Ename" VAL "" PICT "@X" MAXLEN 30 FIELDNAME "ENAME" MESSAGE "Type name employee"   

END FORM RETURN TO BROWSE
