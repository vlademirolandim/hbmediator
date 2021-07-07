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

    BROWSE ADD COLUMN "NOME" CAPTION "Nome da conta" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "BANCO_NOME" CAPTION "Nome do Banco" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "CONTA" CAPTION "Conta" PICTURE "@X" LENGTH 15
    BROWSE ADD COLUMN "TIPOCONTA" CAPTION "Tipo" PICTURE "@X" LENGTH 15
    BROWSE ADD COLUMN "AGENCIA" CAPTION "Agência" PICTURE "@x" LENGTH 30
   
    
    BROWSE SET TABLE "BANCOCONTA"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmBancoConta
    BROWSE SET INSERT FrmBancoConta
    BROWSE SET DELETE ON
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmBancoConta

    FORM TEMPLATE FILE "bancoconta.txt" 
    FORM ROWTOP 7 COLTOP 10
    FORM TITLE "Conta Corrente"

    FORM ADD MAP "A" NAME "Text_Nome" VAL "" PICT "@!" MAXLEN 30  FIELDNAME "NOME" MESSAGE "Nome da conta"   
    FORM ADD MAP "B" NAME "Text_TipoConta" VAL "" FIELDNAME "TIPOCONTA" MESSAGE "Tipo" LISTBOX WIDTH 20 HEIGHT 4 OPTIONS { "Conta Corrente" , "Poupança" }
    FORM ADD MAP "C" NAME "Text_BancoNome" VAL "" PICT "@!" MAXLEN 30 FIELDNAME "BANCO_NOME" MESSAGE "Banco"
    FORM ADD MAP "D" NAME "Text_Agencia" VAL "" PICT "@!" MAXLEN 30 FIELDNAME "AGENCIA" MESSAGE "Agência do banco"
    FORM ADD MAP "E" NAME "Text_Conta" VAL "" PICT "@R 99999-X" MAXLEN 15 FIELDNAME "CONTA" MESSAGE "Conta corrente (com o dígito)"



END FORM RETURN TO BROWSE
