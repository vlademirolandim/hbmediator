#include "vbase.ch"
#include "vdata.ch"
#define TAMANHO_CLASSE_IMC 20

#xcommand MODULE FORM => LOCAL oForm
#xcommand FORM CMD INI SCREEN <cScreen> ROWTOP <nRowTop> COLTOP <nColTop> => oForm := VGetCMD():New( "", <cScreen> , <nRowTop> , <nColTop> )
#xcommand FORM TITLE <cTitle> => oForm:setTitle( <cTitle> )
#xcommand FORM ADD CONTROL <cControl> NAME <cName> VAL <xVal> [PICT <cPict>] [MAXLEN <nMaxLen>] [DATATYPE <cType>];
                                     [FIELDNAME <cField>] [<readonly:READONLY>] [MESSAGE <cMessage>]=>;
                      oForm:addMapControl( <cControl> , <cName> , <xVal> , [<cPict>] , [<nMaxLen>] , [<cType>] , [<cField>] , <.readonly.> , [<cMessage>] )    

PROCEDURE Hbm_BootStrap
    LOCAL cScreen, cJsonConfig, cConfig AS CHARACTER
    LOCAL nRowTop, nColTop AS NUMERIC 
    MODULE FORM

    #pragma __streaminclude "config.json" | cConfig := %s // Compile time
    CONFIG INIT cConfig
    CONFIG LOG LEVEL INFO
    
    SET CURSOR ON
  
    #pragma __streaminclude "bootstrap.txt" | cScreen := %s // Compile time
    #pragma __streaminclude "tui.json" | cJsonConfig := %s // Compile time   

    nRowTop := 14
    nColTop := 30
    ConfigTUISingleton( cJsonConfig )  
    CLS
    FORM CMD INI SCREEN cScreen ROWTOP nRowTop COLTOP nColTop
    FORM TITLE "IMC"
    FORM ADD CONTROL "A" NAME "Text_Peso" VAL 0 PICT "@re 9999.99"  MESSAGE "Informe o peso"   
    FORM ADD CONTROL "B" NAME "Text_Altura" VAL 0 PICT "@re 9999.99"  MESSAGE "Informe a altura"   
    FORM ADD CONTROL "C" NAME "Text_IMC" VAL 0 PICT "@re 9999.99"  READONLY   
    FORM ADD CONTROL "D" NAME "Text_cLASSE_IMC" VAL SPACE(TAMANHO_CLASSE_IMC) READONLY

    
    //oForm:addMapControl( "A" , "Text_Peso" , 0 , "@re 9999.99" )
    //oForm:addMapControl( "B" , "Text_Altura"  , 0 , "@re 9999.99" )
    //oForm:addMapControl( "C" , "Text_IMC"  , 0 , "@re 9999.99" , , , , .t. )    
    //oForm:addMapControl( "D" , "Text_CLASSE_IMC"  , SPACE(TAMANHO_CLASSE_IMC) , "@!", 20,"C" , , .t. )    
    
    oForm:setValid( {|a,b,c|Valid(a,b,c)} )
    oForm:Show()

    @ 30,40 SAY "Tecle algo para sair"
    INKEY(0)    

RETURN

/*
Validation
*/
STATIC FUNCTION Valid( cControl , hGet )

    LOCAL lRet := .t.,x

    IF UPPER( cControl ) == "TEXT_ALTURA"
        IF hGet["Text_Altura"] > 0
            hGet["Text_IMC"] := hGet["Text_Peso"] / ( hGet["Text_Altura"] ^ 2 )
            hGet["Text_CLASSE_IMC"] := TabelaIMC( hGet["Text_IMC"] )
        ENDIF    
    ENDIF

    RETURN lRet
    
	
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