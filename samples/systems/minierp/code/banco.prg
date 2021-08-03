#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_Banco

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id, a.bancoconta_id, a.debito, a.credito, a.descricao,
                a.obs, a.data, b.banco_nome , b.nome as banco_conta
        FROM Banco as a
        INNER JOIN BancoConta as b ON a.bancoconta_id=b.id 
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Movimentação bancária"

    BROWSE ADD COLUMN "DATA" CAPTION "Data" PICTURE "@x" LENGTH 10
    BROWSE ADD COLUMN "DESCRICAO" CAPTION "Descrição" PICTURE "@x" LENGTH 50
    BROWSE ADD COLUMN "DEBITO" CAPTION "Débito" PICTURE "@RE 9999,999,999.99" LENGTH 15
    BROWSE ADD COLUMN "CREDITO" CAPTION "Crédito" PICTURE "@RE 9999,999,999.99" LENGTH 15
   
    
    BROWSE SET TABLE "BANCO"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmBanco
    BROWSE SET INSERT FrmBanco
    BROWSE SET DELETE ON

    BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    BROWSE SET FILTER "Filtra por Conta" WHERE  "banco_conta LIKE '%' || %s || '%'" ;
    CAPTION  { "Conta   : "  } ;
    VAL { SPACE(30)  } ;
    PICT   { "@K"  }  ;
    NEWLINE  { .F. }     

    
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmBanco

    FORM TEMPLATE FILE "banco.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "Text_Data" VAL DATE() PICT "@!" MAXLEN 10  FIELDNAME "DATA" MESSAGE "Data do lançamento"   
    FORM ADD MAP "B" NAME "Text_Conta" VAL 0 PICT "999999" FIELDNAME "BANCOCONTA_ID" MESSAGE "Informe a conta bancária"   
    FORM ADD MAP "C" NAME "Text_ContaNome" VAL SPACE(40) ISREADONLY .T.
    FORM ADD MAP "D" NAME "Text_Tipo" MESSAGE "Tipo" RADIOGROUP WIDTH 20 HEIGHT 4 OPTIONS { "DEBITO" => "Débito" , "CREDITO" => "Crédito" }
    FORM ADD MAP "E" NAME "Text_Valor" VAL 0 PICT "@RE 999,999,999.99" MESSAGE "Valor"
    FORM ADD MAP "F" NAME "Text_Descricao" VAL "" PICT "@!" MAXLEN 30 FIELDNAME "DESCRICAO" MESSAGE "Descrição do lançamento"
    FORM ADD MAP "G" NAME "Text_Obs" VAL "" PICT "@S50" MAXLEN 1024 FIELDNAME "OBS" MESSAGE "Observações"

    FORM SEARCH "Text_Conta" KEY "ID" CONNECT "MINIERP"  QUERY "SELECT * FROM BANCOCONTA" WHERE "WHERE ID=#1" ;
      RETURN "NOME" TO "Text_ContaNome" ;
      GRID WHERE "Where nome LIKE '%#1%'" FIELDS { 'nome' , 'banco_nome' } ;
              CAPTIONS { 'Conta' , 'Banco' } ;
              WIDTHS { "70%","30%" } ;
              ALIGNS { "LEFT" , "LEFT" }

   FORM BEFORE SHOW BancoBeforeShow
   FORM BEFORE SUBMIT BancoBeforeSubmit

   FORM ADD HIDDEN FIELD "DEBITO" VAL 0
   FORM ADD HIDDEN FIELD "CREDITO" VAL 0

   //FORM VALID ValidFrmBanco

END FORM RETURN TO BROWSE

FUNCTION BlockFooter

    LOCAL nSaldoCredito := VLJ_DLookUpGetValue( "MINIERP", "Select sum(credito) as credito from banco" , "credito" , 0 )
    LOCAL nSaldoDebito := VLJ_DLookUpGetValue( "MINIERP", "Select sum(debito) as debito from banco" , "debito" , 0 )


    @ ROW()+1,2 SAY "Banco : " + PADR( FIELD->BANCO_NOME , 50 )
    @ ROW()+2,2 SAY "Conta : " + PADR( FIELD->BANCO_CONTA , 50 )
    @ ROW()  ,70 SAY "Saldo geral (todas as contas) : " + TRANSFORM( nSaldoCredito - nSaldoDebito , "@RE 999,999,999.99" )

RETURN NIL

/*
BEGIN FORM VALID ValidFrmBanco( hGet )

    LOCAL lRet := .t.


RETURN lRet
*/

FUNCTION BancoBeforeShow( hGet , hHidden )

    if hHidden["DEBITO"] > 0
        hGet["TEXT_VALOR"] := hHidden["DEBITO"]
        hGet["TEXT_TIPO"] := "DEBITO"
    else
        hGet["TEXT_VALOR"] := hHidden["CREDITO"]
        hGet["TEXT_TIPO" ] := "CREDITO"
    endif    

RETURN .T.

FUNCTION BancoBeforeSubmit( hGet , hHidden )

    if hGet["TEXT_TIPO"] == "DEBITO"
        hHidden["DEBITO"] := hGet["TEXT_VALOR"]
        hHidden["CREDITO"] := 0
    else
        hHidden["CREDITO"] := hGet["TEXT_VALOR"]
        hHidden["DEBITO"] := 0
    endif    

RETURN .T.


