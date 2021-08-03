#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_Cliente

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id, a.nome, a.endereco, a.bairro, a.telefones,
                a.cidade, a.uf, a.cep , a.email, a.dataNascimento,
                a.cpf, a.rg, a.nomedopai, a.nomedamae, a.obs, a.sexo
        FROM cliente as a
    ENDTEXT

    BROWSE INIT USING CONNECT "MINIERP" QUERY cSQL 
    BROWSE TITLE "Cliente"

    BROWSE ADD COLUMN "NOME" CAPTION "Nome" PICTURE "@x" LENGTH 40
    BROWSE ADD COLUMN "EMAIL" CAPTION "E-mail" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "TELEFONES" CAPTION "Telefones" PICTURE "@x" LENGTH 20
    
    BROWSE SET TABLE "CLIENTE"
    BROWSE SET PKNAME "ID"
    BROWSE SET UPDATE FrmCliente
    BROWSE SET INSERT FrmCliente
    BROWSE SET DELETE ON

    BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    BROWSE SET FILTER "Filtra por nome" WHERE  "nome LIKE '%' || %s || '%'" ;
    CAPTION  { "Nome   : "  } ;
    VAL { SPACE(30)  } ;
    PICT   { "@K"  }  ;
    NEWLINE  { .F. }     

    
        
    BROWSE SHOW
 
RETURN

BEGIN FORM FrmCliente

    LOCAL hEstados := { "AC" => "Acre" , "AM" => "Amazonas" , "CE" => "Ceará" , "MG" => "Minas Gerais" , "PR" => "Paraná" }

    FORM TEMPLATE FILE "cliente.txt" 
    FORM ROWTOP 5 COLTOP 10

    FORM ADD MAP "A" NAME "NOME" VAL "" PICT "@!S40" MAXLEN 50  FIELDNAME "NOME" MESSAGE "Nome"   
    FORM ADD MAP "O" NAME "NASCIMENTO" VAL DATE() FIELDNAME "DATANASCIMENTO" MESSAGE "Data de nascimento"   
    FORM ADD MAP "B" NAME "ENDERECO" VAL SPACE(40) FIELDNAME "ENDERECO" MESSAGE "Informe a rua/avenida, o complemento e o número"
    FORM ADD MAP "C" NAME "BAIRRO" VAL SPACE(40) FIELDNAME "BAIRRO" 
    FORM ADD MAP "D" NAME "CIDADE" VAL SPACE(40) FIELDNAME "CIDADE" 
    FORM ADD MAP "E" NAME "UF" FIELDNAME "UF" MESSAGE "Unidade da federação" DROPDOWN  WIDTH 20 HEIGHT 20 OPTIONS hEstados
    FORM ADD MAP "F" NAME "CEP" VAL "       " PICT "@R 99.999-999" MAXLEN 8 FIELDNAME "CEP" 
    FORM ADD MAP "G" NAME "EMAIL" VAL SPACE(20) FIELDNAME "EMAIL"
    FORM ADD MAP "H" NAME "TELEFONES" VAL SPACE(20) FIELDNAME "TELEFONES"
    FORM ADD MAP "I" NAME "CPF" VAL SPACE(20) FIELDNAME "CPF"
    FORM ADD MAP "J" NAME "RG" VAL SPACE(20) FIELDNAME "RG"
    FORM ADD MAP "K" NAME "NOMEDAMAE" VAL SPACE(20) FIELDNAME "NOMEDAMAE"
    FORM ADD MAP "L" NAME "NOMEDOPAI" VAL SPACE(20) FIELDNAME "NOMEDOPAI"
    FORM ADD MAP "M" NAME "OBS" VAL SPACE(50)  FIELDNAME "OBS"

  // FORM BEFORE SHOW FornecedorBeforeShow
    FORM BEFORE SUBMIT ClienteBeforeSubmit

//   FORM ADD HIDDEN FIELD "DEBITO" VAL 0

   //FORM VALID ValidFrmBanco

END FORM RETURN TO BROWSE

static FUNCTION BlockFooter

    @ ROW()+1,2 SAY "Obs         : " + PADR( FIELD->OBS , 50 )
    @ ROW()+2,2 SAY "Nome da mãe : " + PADR( FIELD->NOMEDAMAE , 50 )

RETURN NIL

/*
BEGIN FORM VALID ValidFrmBanco( hGet )

    LOCAL lRet := .t.


RETURN lRet
*/

/*
FUNCTION FornecedorBeforeShow( hGet , hHidden )

    if hHidden["DEBITO"] > 0
        hGet["TEXT_VALOR"] := hHidden["DEBITO"]
        hGet["TEXT_TIPO"] := "DEBITO"
    else
        hGet["TEXT_VALOR"] := hHidden["CREDITO"]
        hGet["TEXT_TIPO" ] := "CREDITO"
    endif    

RETURN .T.
*/

FUNCTION ClienteBeforeSubmit( hGet ) //, hHidden )

    if empty( hGet["UF"] )
        hGet["UF"] := "CE"
    endif    


RETURN .T.


