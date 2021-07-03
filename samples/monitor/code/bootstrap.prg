#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "inkey.ch"

PROCEDURE Hbm_BootStrap

    LOCAL hGet 

    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "bootstrap.txt" 
    FORM ROWTOP 05 COLTOP 05
    FORM TITLE "Menu Principal"

    FORM ADD MAP "A" NAME "WOPC" VAL "  " PICT "99"  MESSAGE "Digite o número referente a opção selecionada (99 SAI)"   
   
    FORM VALID Valida
    FORM BUTTONS OFF

    DO WHILE .T.
        FORM SHOW
        FORM RETURN GETS TO hGet
        DO CASE
        CASE hGet["WOPC"] == "01" // Criar usuário
            HbmLoad("adduser")
        CASE hGet["WOPC"] == "02" //
        CASE LASTKEY() == K_ESC
            EXIT
        ENDCASE
    ENDDO    

RETURN

/*
Validation
*/
BEGIN FORM VALID Valida( hGet )

    IF CONTROL NAME "WOPC"
        IF EMPTY(hGet["WOPC"])
            RETURN .F.
        ENDIF
        hGet["WOPC"] := STRZERO(val(hGet["WOPC"]),2)
        DO CASE
        CASE hGet["WOPC"] == "99"
            KEYBOARD CHR(K_ESC)
        ENDCASE    
    ENDIF

END FORM
 
	
