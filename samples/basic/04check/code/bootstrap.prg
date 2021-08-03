#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#define TAMANHO_CLASSE_IMC 20

PROCEDURE Hbm_BootStrap

    LOCAL hResult 
    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "bootstrap.txt" 
    FORM ROWTOP 14 COLTOP 30
    FORM TITLE "Cadastro de exames pré-operatórios"

    FORM ADD MAP "A" NAME "Text_Peso" VAL 0 PICT "@re 9999.99"  MESSAGE "Informe o peso"   
    FORM ADD MAP "B" NAME "Text_Sexo" VAL Space(1) PICT "!" MESSAGE "Informe o sexo"   
    FORM ADD MAP "C" NAME "Check_Espermograma" VAL .f.   
    FORM ADD MAP "D" NAME "Check_Mamografia" VAL .f.
    FORM ADD MAP "E" NAME "Check_ExameSangue" VAL .f.
    
    FORM VALID Valida
    FORM WHEN  PreValida

    FORM SHOW
    FORM RETURN GETS TO hResult

    @ 29,10 SAY HB_VALTOEXP(hResult)
    @ 30,10 SAY "Tecle algo para sair"
    INKEY(0)    

RETURN

/*
Validation
*/
BEGIN FORM VALID Valida( hGet )

    DO CASE
    CASE CONTROL NAME "TEXT_PESO"
        IF hGet["Text_Peso"] <= 10
            alert("Peso incorreto")
            RETURN .f.
        ENDIF    
    CASE CONTROL NAME "TEXT_SEXO"
        IF ( hGet["Text_Sexo"] $ "MF" )
            IF hGet["Text_Sexo"] == "F"
                hGet["Check_Espermograma"] := .f.
            ELSE
                hGet["Check_Mamografia"] := .f.    
            ENDIF    
        ELSE    
            alert("Informe o sexo corretamente. Valores válidos 'M' ou 'F'")
            RETURN .f.
        ENDIF            
    ENDCASE

END FORM
    
/*
When
*/
BEGIN FORM WHEN PreValida( hGet )
    
    DO CASE
    CASE CONTROL NAME "CHECK_ESPERMOGRAMA"
        IF hGet["Text_Sexo"] <> "M"
            RETURN .f.
        ENDIF    
    CASE CONTROL NAME "CHECK_MAMOGRAFIA"
        IF hGet["Text_Sexo"] <> "F"
            RETURN .f.
        ENDIF    
    ENDCASE

END FORM
    
	
