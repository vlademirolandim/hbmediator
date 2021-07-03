#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "inkey.ch"

PROCEDURE Hbm_AddUser

    LOCAL hGet 

    MODULE FORM


    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "adduser.txt" 
    FORM ROWTOP 05 COLTOP 05
    FORM TITLE "Adicionar Usuário"

    FORM ADD MAP "A" NAME "LOGIN" VAL SPACE(30) PICT "@x"  MESSAGE "Informe o login"   
    FORM ADD MAP "B" NAME "GRUPO" VAL SPACE(30) PICT "@X"  MESSAGE "Informe o grupo"

    FORM VALID Valida
   
    FORM SHOW
    IF LASTKEY() == K_ESC
       alert("Abandonando")
    ELSEIF SN("Confirma as alterações ?")
       alert("Gravando")
    ENDIF

RETURN

/*
Validation
*/
BEGIN FORM VALID Valida( hGet )

    IF CONTROL NAME "LOGIN"
        IF EMPTY(hGet["LOGIN"])
            RETURN .F.
        ENDIF
        hGet["LOGIN"] := LOWER( hGet["LOGIN"] )
    ENDIF

END FORM
 
	
