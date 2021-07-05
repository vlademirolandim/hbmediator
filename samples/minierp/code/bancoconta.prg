#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_BancoConta

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  id, nome, tipoconta,
                banco_nome, obs, agencia, conta
        FROM BancoConta        
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Contas bancárias"

    BROWSE ADD COLUMN "nome" CAPTION "Nome da conta" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "TIPOCONTA" CAPTION "Tipo" PICTURE "@x" LENGTH 10
    BROWSE ADD COLUMN "BANCO_NOME" CAPTION "Nome do Banco" PICTURE "@x" LENGTH 30
    
    BROWSE SET TABLE "BANCOCONTA"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmBancoConta
    BROWSE SET INSERT FrmBancoConta
    BROWSE SET DELETE ON
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmBancoConta


    FORM TEMPLATE FILE "bancoconta.txt" 
    FORM ROWTOP 14 COLTOP 30
    FORM TITLE "Conta Corrente"

    FORM ADD MAP "A" NAME "Text_Nome" VAL "" PICT "@!" MAXLEN 30  FIELDNAME "NOME" MESSAGE "Nome da conta"   
    FORM ADD MAP "B" NAME "Text_TipoConta" VAL "" PICT "@X" MAXLEN 1 FIELDNAME "TIPOCONTA" MESSAGE "Tipo"   
    FORM ADD MAP "C" NAME "Text_BancoNome" VAL "" PICT "@!" MAXLEN 30 FIELDNAME "BANCO_NOME" MESSAGE "Banco"

END FORM RETURN TO BROWSE
