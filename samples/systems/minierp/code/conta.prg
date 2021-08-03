#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_Conta

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id, a.nome, a.tipoconta, a.obs
        FROM Conta as a
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Configuração de contas"

    BROWSE ADD COLUMN "NOME" CAPTION "Nome da conta" PICTURE "@x" LENGTH 50
    BROWSE ADD COLUMN "TIPOCONTA" CAPTION "Débito/Crédito" PICTURE "@x"
    
    BROWSE SET TABLE "CONTA"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmConta
    BROWSE SET INSERT FrmConta
    BROWSE SET DELETE ON

    BROWSE SET FILTER "Filtro" WHERE  "nome LIKE '%' || %s || '%'" ;
    CAPTION  { "Conta   : "  } ;
    VAL { SPACE(30)  } ;
    PICT   { "@K"  }  ;
    NEWLINE  { .F. }     

    BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmConta

    FORM TEMPLATE FILE "conta.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "NOME" VAL "" PICT "@x" MAXLEN 50  FIELDNAME "NOME" MESSAGE "Nome da conta"   
    FORM ADD MAP "B" NAME "TIPOCONTA" MESSAGE "Tipo" FIELDNAME "TIPOCONTA" RADIOGROUP WIDTH 20 HEIGHT 4 OPTIONS { "D" => "Débito" , "C" => "Crédito" }
    FORM ADD MAP "C" NAME "OBS" VAL SPACE(500) PICT "@S50" FIELDNAME "OBS" MESSAGE "Observações"

END FORM RETURN TO BROWSE

STATIC FUNCTION BlockFooter

    @ ROW()+1,2 SAY "Observações : " + PADR( FIELD->OBS , 50 )

RETURN NIL




