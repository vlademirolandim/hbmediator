#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_Cpagar

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id, a.fornecedor_id, a.conta_id, a.dataVencimento, 
                a.dataConta, a.valor, a.descricao, a.obs,
                b.nome as nome_fornecedor , c.nome as nome_conta
        FROM cpagar as a
        INNER JOIN fornecedor as b ON a.fornecedor_id=b.id 
        INNER JOIN conta as c ON a.conta_id = c.id
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Contas a pagar"

    BROWSE ADD COLUMN "DATACONTA" CAPTION "Data" PICTURE "@x" LENGTH 10
    BROWSE ADD COLUMN "DESCRICAO" CAPTION "Descrição" PICTURE "@x" LENGTH 50
    BROWSE ADD COLUMN "VALOR" CAPTION "Valor a pagar" PICTURE "@RE 9999,999,999.99" LENGTH 15
   
    
    BROWSE SET TABLE "CPAGAR"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmCPagar
    BROWSE SET INSERT FrmCPagar
    BROWSE SET DELETE ON

    BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    BROWSE SET FILTER "Filtro" WHERE  "nome_fornecedor LIKE '%' || %s || '%'" ;
    CAPTION  { "Fornecedor   : "  } ;
    VAL { SPACE(30)  } ;
    PICT   { "@K"  }  ;
    NEWLINE  { .F. }     
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmCPagar

    LOCAL cSQL 

    FORM TEMPLATE FILE "cpagar.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "DataConta" VAL DATE() PICT "@X"      FIELDNAME "DATACONTA" MESSAGE "Data do lançamento"   
    FORM ADD MAP "B" NAME "DataVencimento" VAL DATE() PICT "@X" FIELDNAME "DATAVENCIMENTO" MESSAGE "Informe a conta bancária"   
    FORM ADD MAP "C" NAME "Fornecedor_ID" VAL 0 PICT "9999" FIELDNAME "FORNECEDOR_ID"
    FORM ADD MAP "D" NAME "Conta_ID" VAL 0 PICT "9999" FIELDNAME "CONTA_ID"
    FORM ADD MAP "E" NAME "Valor" VAL 0 PICT "@RE 999,999,999.99" FIELDNAME "VALOR" MESSAGE "Valor"
    FORM ADD MAP "F" NAME "Descricao" VAL "" PICT "@!" MAXLEN 30 FIELDNAME "DESCRICAO" MESSAGE "Descrição do lançamento"
    FORM ADD MAP "G" NAME "Obs" VAL "" PICT "@S50" MAXLEN 1024 FIELDNAME "OBS" MESSAGE "Observações"

    FORM ADD MAP "H" NAME "NomeFornecedor" VAL SPACE(40) PICT "@x" ISREADONLY .T. 
    FORM ADD MAP "I" NAME "NomeConta" VAL SPACE(40) PICT "@x" ISREADONLY .T. 

    FORM SEARCH "Fornecedor_ID" KEY "ID" CONNECT "MINIERP"  QUERY "SELECT * FROM FORNECEDOR" WHERE "WHERE ID=#1" ;
      RETURN "NOME" TO "NomeFornecedor" ;
      GRID WHERE "Where nome LIKE '%#1%'" FIELDS { 'nome' } ;
              CAPTIONS { 'Fornecedor' } ;
              WIDTHS { "100%" } ;
              ALIGNS { "LEFT" }

    TEXT SQL TO cSQL
        SELECT  distinct nome as nome_conta  
        FROM conta 
    ENDTEXT

    FORM SEARCH "Conta_ID" KEY "ID" CONNECT "MINIERP"  QUERY cSQL WHERE "WHERE CONTA_ID=#1" ;
      RETURN "NOME_CONTA" TO "NomeConta" ;
      GRID WHERE "Where tipoconta='D' and nome_conta LIKE '%#1%'" FIELDS { 'nome_conta' } ;
              CAPTIONS { 'Conta' } ;
              WIDTHS { "100%" } ;
              ALIGNS { "LEFT" }



END FORM RETURN TO BROWSE

FUNCTION BlockFooter

    //@ ROW()+1,2 SAY "Banco : " + PADR( FIELD->BANCO_NOME , 50 )

RETURN NIL

