#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"

PROCEDURE Hbm_BootStrap

   LOCAL hGets 

    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "bootstrap.txt" 
    FORM ROWTOP 14 COLTOP 30
    FORM TITLE "Checkbox"

    FORM ADD MAP "A" NAME "Text_Name" VAL SPACE(10)  MESSAGE "Name"   
    FORM ADD MAP "B" NAME "Text_Surname" VAL SPACE(10) MESSAGE "Surname"   
    FORM ADD MAP "C" NAME "Text_Check01" VAL .t.   
    FORM ADD MAP "D" NAME "Text_Check02" VAL .f. 
    
    FORM RETURN GETS TO hGets  

    FORM BUTTONS OFF
    FORM SHOW


    @ 28,03 SAY "Values : " + hb_ValToExp( hGets )
    @ 30,40 SAY "Type any key to exit"
    INKEY(0)    

RETURN

