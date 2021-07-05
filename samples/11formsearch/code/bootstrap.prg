#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
PROCEDURE Hbm_BootStrap
    MODULE FORM
    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO
    CLS
    FORM TEMPLATE FILE "bootstrap.txt" 
    FORM ROWTOP 14 COLTOP 30
    FORM TITLE "Cadastro físico do funcionário"
    FORM ADD MAP "A" NAME "Text_EmpNo" VAL 0 PICT "99999"  MESSAGE "Informe a matrícula"   
    FORM ADD MAP "B" NAME "Text_Ename" VAL SPACE(40) ISREADONLY .T.
    FORM ADD MAP "C" NAME "Text_Sal" VAL 0 PICT "@RE 999,999.99" ISREADONLY .T.

    FORM ADD MAP "D" NAME "Text_Altura" VAL 0 PICT "@re 9.99"  MESSAGE "Informe a altura"   
    FORM ADD MAP "E" NAME "Text_Peso" VAL 0 PICT "@re 999.99" MESSAGE "Informe o peso"
 
    FORM SEARCH "Text_EmpNo" KEY "EmpNo" CONNECT "TESTE"  QUERY "SELECT * FROM EMP" WHERE "WHERE EMPNO=#1" ;
         RETURN "Ename" TO "Text_Ename", "Sal" TO "Text_Sal" ;
         GRID WHERE "Where ename LIKE '%#1%'" FIELDS { 'Ename' , 'Sal' } ;
              CAPTIONS { 'Nome do funcionário' , 'Salário' } ;
              WIDTHS { "70%","30%" } ;
              ALIGNS { "LEFT" , "RIGHT" }
         

    FORM BUTTONS OFF

    FORM SHOW
    @ 30,40 SAY "Tecle algo para sair"
    INKEY(0)    

RETURN

