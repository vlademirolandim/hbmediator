#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#define TAMANHO_CLASSE_IMC 20

PROCEDURE Hbm_BootStrap

    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "bootstrap.txt" 
    FORM ROWTOP 14 COLTOP 30
    FORM TITLE "IMC"

    FORM ADD MAP "A" NAME "Text_Peso" VAL 0 PICT "@re 9999.99"  MESSAGE "Informe o peso"   
    FORM ADD MAP "B" NAME "Text_Altura" VAL 0 PICT "@re 9999.99"  MESSAGE "Informe a altura"   
    FORM ADD MAP "C" NAME "Text_IMC" VAL 0 PICT "@re 9999.99"  ISREADONLY .T.  
    FORM ADD MAP "D" NAME "Text_cLASSE_IMC" VAL SPACE(TAMANHO_CLASSE_IMC) ISREADONLY .T.
    
    FORM VALID Valida
    FORM SHOW

    @ 30,40 SAY "Tecle algo para sair"
    INKEY(0)    

RETURN

/*
Validation
*/
BEGIN FORM VALID Valida( hGet )

    IF CONTROL NAME "TEXT_ALTURA"
        IF hGet["Text_Altura"] > 0
            hGet["Text_IMC"] := hGet["Text_Peso"] / ( hGet["Text_Altura"] ^ 2 )
            hGet["Text_CLASSE_IMC"] := TabelaIMC( hGet["Text_IMC"] )
        ENDIF    
    ENDIF

END FORM
    
	
STATIC FUNCTION TabelaIMC( nVal )

    LOCAL cClass

    do case
        case nVal < 18.5
            cClass := "Abaixo do peso"
        case nVal >= 18.5 .and. nVal < 24.9999
            cClass := "Peso normal"        
        case nVal >= 25 .and. nVal < 29.9999
            cClass := "Sobrepeso"                        
        case nVal >= 30 .and. nVal < 34.9999
            cClass := "Obesidade grau I"        
        case nVal >= 35 .and. nVal < 39.9999
            cClass := "Obesidade grau II"                                    
        case nVal >= 40
            cClass := "Obesidade mórbida"            
    endcase
    cClass := PADR( cClass, TAMANHO_CLASSE_IMC )

RETURN cClass