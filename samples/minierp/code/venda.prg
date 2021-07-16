#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"
#include "code/cliente.prg"

procedure HBM_Venda

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id, a.cliente_id, a.descricao,
                a.obs, b.nome, a.data, a.totaldavenda
        FROM Venda as a
        INNER JOIN Cliente as b ON a.cliente_id=b.id 
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Venda"

    BROWSE ADD COLUMN "DATA" CAPTION "Data" PICTURE "@x" LENGTH 10
    BROWSE ADD COLUMN "NOME" CAPTION "Cliente" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "DESCRICAO" CAPTION "Descrição" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "TOTALDAVENDA" CAPTION "Total" PICTURE "@RE 999,999.99"
   
    
    BROWSE SET TABLE "VENDA"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmVenda
    BROWSE SET INSERT FrmVenda
    BROWSE SET DELETE ON
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmVenda

    FORM TEMPLATE FILE "venda.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "Data" VAL DATE() PICT "@!" MAXLEN 10  FIELDNAME "DATA" MESSAGE "Data da venda"   
    FORM ADD MAP "B" NAME "Cliente" VAL 0 PICT "999999" FIELDNAME "CLIENTE_ID" MESSAGE "Informe o cliente"   
    FORM ADD MAP "C" NAME "Nome" VAL SPACE(40) ISREADONLY .T.
    FORM ADD MAP "D" NAME "Descricao" VAL SPACE(50) FIELDNAME "descricao" 
    FORM ADD MAP "E" NAME "TOTALDAVENDA" VAL 0 PICT "@RE 999,999,999.99" FIELDNAME "TOTALDAVENDA" MESSAGE "Valor"
    FORM ADD MAP "F" NAME "Obs" VAL "" PICT "@S50" MAXLEN 1024 FIELDNAME "OBS" MESSAGE "Observações"

    FORM SEARCH "Cliente" KEY "ID" CONNECT "MINIERP"  QUERY "SELECT * FROM CLIENTE" WHERE "WHERE ID=#1" ;
      RETURN "NOME" TO "NOMe" ;
      FORM TITLE "tITU" TABLE "cliente" BLOCK FrmCliente ;
      GRID WHERE "Where nome LIKE '%#1%'" FIELDS { 'nome' } ;
              CAPTIONS { 'Cliente' } ;
              WIDTHS { "100%" } ;
              ALIGNS { "LEFT" }

END FORM RETURN TO BROWSE



