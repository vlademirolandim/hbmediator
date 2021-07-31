#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_Faixa

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id_faixa, a.prefixo, a.inicio, a.fim
        FROM faixa as a
    ENDTEXT

    BROWSE INIT USING CONNECT "DATANET" QUERY cSQL 
    BROWSE TITLE "Faixa de IPs"

    BROWSE ADD COLUMN "prefixo" CAPTION "Prefixo" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "inicio" CAPTION "Início" PICTURE "@x" LENGTH 15
    BROWSE ADD COLUMN "fim" CAPTION "Fim" PICTURE "@x" LENGTH 15
   
    
    BROWSE SET TABLE "faixa"
    BROWSE SET PKNAME "id_faixa"
    BROWSE SET UPDATE FrmFaixa
    BROWSE SET INSERT FrmFaixa
    BROWSE SET DELETE ON

    //BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    //BROWSE SET FILTER "Filtra por Conta" WHERE  "banco_conta LIKE '%' || %s || '%'" ;
    //CAPTION  { "Conta   : "  } ;
    //VAL { SPACE(30)  } ;
    //PICT   { "@K"  }  ;
    //NEWLINE  { .F. }     

    BROWSE SHOW
 
RETURN

BEGIN FORM FrmFaixa

    FORM TEMPLATE FILE "faixa.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "prefixo" VAL SPACE(20) PICT "@x" MAXLEN 20  FIELDNAME "prefixo" MESSAGE "Faixa de endereços"   
    FORM ADD MAP "B" NAME "inicio" VAL SPACE(10) PICT "@X" FIELDNAME "inicio" MESSAGE "Início"   
    FORM ADD MAP "C" NAME "fim" VAL SPACE(10) PICT "@X" FIELDNAME "fim" MESSAGE "Fim"

    //FORM BEFORE SHOW FaixaBeforeShow
    //FORM BEFORE SUBMIT FaixaBeforeSubmit

END FORM RETURN TO BROWSE
/*
FUNCTION BlockFooter

    LOCAL nSaldoCredito := VLJ_DLookUpGetValue( "MINIERP", "Select sum(credito) as credito from banco" , "credito" , 0 )
    LOCAL nSaldoDebito := VLJ_DLookUpGetValue( "MINIERP", "Select sum(debito) as debito from banco" , "debito" , 0 )


    @ ROW()+1,2 SAY "Banco : " + PADR( FIELD->BANCO_NOME , 50 )
    @ ROW()+2,2 SAY "Conta : " + PADR( FIELD->BANCO_CONTA , 50 )
    @ ROW()  ,70 SAY "Saldo geral (todas as contas) : " + TRANSFORM( nSaldoCredito - nSaldoDebito , "@RE 999,999,999.99" )

RETURN NIL


BEGIN FORM VALID ValidFrmFaixa( hGet )

    LOCAL lRet := .t.


RETURN lRet


FUNCTION FaixaBeforeShow( hGet , hHidden )

    if hHidden["DEBITO"] > 0
        hGet["TEXT_VALOR"] := hHidden["DEBITO"]
        hGet["TEXT_TIPO"] := "DEBITO"
    else
        hGet["TEXT_VALOR"] := hHidden["CREDITO"]
        hGet["TEXT_TIPO" ] := "CREDITO"
    endif    

RETURN .T.

FUNCTION FaixaBeforeSubmit( hGet , hHidden )

    if hGet["TEXT_TIPO"] == "DEBITO"
        hHidden["DEBITO"] := hGet["TEXT_VALOR"]
        hHidden["CREDITO"] := 0
    else
        hHidden["CREDITO"] := hGet["TEXT_VALOR"]
        hHidden["DEBITO"] := 0
    endif    

RETURN .T.
*/

