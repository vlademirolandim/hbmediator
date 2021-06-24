#include "vbase.ch"
#include "vdata.ch"

PROCEDURE Hbm_BancoConta
    LOCAL oForm, oBrw AS OBJECT
    LOCAL cScreen AS CHARACTER
 
    oBrw := VBrowseCMD():New( "MINIERP" , "SELECT id, nome, tipoconta, banco_nome FROM BancoConta"  )
    oBrw:setStandardScreen( .t. )
    oBrw:addColumn( "nome" , "Nome da conta" , "@x" , 30 )
    oBrw:addColumn( "tipoconta" , "Tipo" , "!" , 1 )
    oBrw:addColumn( "banco_nome" , "Banco" , "@x" , 30 )
    oBrw:setIDDatabase( "MINIERP" )
    oBrw:setTable( "BancoConta" )
    oBrw:setPKName( "id" )

    #pragma __binarystreaminclude "bancoconta.txt" | cScreen := %s // Compile time
    oForm := VGetCMD():New( "", cScreen , 5 , 22 )
    oForm:addMapControl( "A" , "Text_Nome" , "" , "@!" , 40 , "C" , "NOME" )
    oForm:addMapControl( "B" , "Text_TipoConta" , "" , "@!" , 40 , "C" , "tipoconta" )
    oBrw:setUpdate( oForm )
    oBrw:setInsert( oForm )

    IF oBrw:Open()
        oBrw:Show()
    ENDIF    
    

RETURN

/*
Validation
*/
STATIC FUNCTION Valid( cControl , xVal )

    LOCAL lRet := .t.

    IF UPPER( cControl ) == "TEXT_EMPNO"
        IF xVal <= 10
            hb_alert( "Valor inválido. Insira um valor maior do que 10" )
            lRet := .f.
        ENDIF
    ENDIF

    RETURN lRet
    
	
