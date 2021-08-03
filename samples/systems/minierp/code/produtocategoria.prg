#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_ProdutoCategoria

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  id, nome, obs
        FROM  produtocategoria       
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Categoria de produtos"

    BROWSE ADD COLUMN "NOME" CAPTION "Nome da categoria" PICTURE "@x" LENGTH 50
    BROWSE ADD COLUMN "OBS" CAPTION "Observações" PICTURE "@x" LENGTH 30
   
    
    BROWSE SET TABLE "PRODUTOCATEGORIA"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmProdutoCategoria
    BROWSE SET INSERT FrmProdutoCategoria
    BROWSE SET DELETE ON
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmProdutoCategoria

    FORM TEMPLATE FILE "produtocategoria.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "nome" VAL space(30) PICT "@!" MAXLEN 30  FIELDNAME "NOME" MESSAGE "Nome da categoria"   
    FORM ADD MAP "B" NAME "obs" VAL space(1000) PICT "@S30" FIELDNAME "obs" MESSAGE "Observação" 

END FORM RETURN TO BROWSE
