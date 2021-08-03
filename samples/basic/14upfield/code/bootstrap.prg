#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"

PROCEDURE Hbm_BootStrap

    LOCAL hRet
    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "bootstrap.txt" 
    FORM ROWTOP 14 COLTOP 30
    FORM TITLE "Update field"

    FORM ADD MAP "A" NAME "Text_1" VAL 0 PICT "@re 9999.99"     
    FORM ADD MAP "B" NAME "Text_2" VAL 0 PICT "@re 9999.99"     
    FORM ADD MAP "C" NAME "Text_3" VAL 0 PICT "@re 9999.99"   
    FORM ADD MAP "D" NAME "Text_4" VAL SPACE(16) 
    
    FORM RETURN GETS TO hRet
    FORM VALID Valida
    FORM SHOW
    @ 29,10 SAY hb_ValToExp( hRet )
    @ 30,40 SAY "Tecle algo para sair"
    INKEY(0)    

RETURN

/*
Validation
*/
BEGIN FORM VALID Valida( hGet )

    IF CONTROL NAME "TEXT_3"
       hGet["Text_1"] := 100
       hGet["Text_2"] := 200
       hGet["Text_4"] := "DEFAULT VALUE   "
    ENDIF

END FORM
    
