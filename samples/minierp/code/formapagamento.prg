#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_FormaPagamento

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id, a.descricao, a.entrada, a.parcelas, a.obs
        FROM formapagamento as a
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Forma de pagamento"

    BROWSE ADD COLUMN "DESCRICAO" CAPTION "Descrição" PICTURE "@x" LENGTH 50
    BROWSE ADD COLUMN "IIF( ENTRADA > 0 , 'SIM' , 'NÃO' )" CAPTION "Entrada" PICTURE "@x"
    BROWSE ADD COLUMN "PARCELAS" CAPTION "Parcelas" PICTURE "@R 999"
   
    
    BROWSE SET TABLE "formapagamento"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmFormaPagamento
    BROWSE SET INSERT FrmFormaPagamento
    BROWSE SET DELETE ON

    BROWSE SET FILTER "Filtro" WHERE  "descricao LIKE '%' || %s || '%'" ;
    CAPTION  { "Forma   : "  } ;
    VAL { SPACE(30)  } ;
    PICT   { "@K"  }  ;
    NEWLINE  { .F. }     

    BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmFormaPagamento

    FORM TEMPLATE FILE "formapagamento.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "DESCRICAO" VAL "" PICT "@x" MAXLEN 50  FIELDNAME "DESCRICAO" MESSAGE "Descrição"   
    FORM ADD MAP "B" NAME "ENTRADA" VAL 0 PICT "@X" FIELDNAME "ENTRADA" MESSAGE "Marque se tiver entrada"
    FORM ADD MAP "C" NAME "PARCELAS" VAL 0 PICT "999" FIELDNAME "PARCELAS" MESSAGE "Informe as parcelas"
    FORM ADD MAP "D" NAME "OBS" VAL SPACE(500) PICT "@S50" FIELDNAME "OBS" MESSAGE "Observações"

    FORM BEFORE SHOW FormaPagamentoBeforeShow
    FORM BEFORE SUBMIT FormaPagamentoBeforeSubmit

END FORM RETURN TO BROWSE

STATIC FUNCTION BlockFooter

    @ ROW()+1,2 SAY "Observações : " + PADR( FIELD->OBS , 50 )

RETURN NIL

FUNCTION FormaPagamentoBeforeShow( hGet , hHidden )

    if hGet["entrada"] == 0
        hGet["entrada"] := .f.
    else
        hGet["entrada"] := .t.
    endif    

RETURN .T.

FUNCTION FormaPagamentoBeforeSubmit( hGet , hHidden )

    if hGet["entrada"] 
        hGet["entrada"] := 1
    else
        hGet["entrada"] := 0
    endif    

RETURN .T.




