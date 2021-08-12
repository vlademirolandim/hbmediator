#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "vdata.ch"

procedure HBM_Cfg_Ip

    LOCAL cSQL
    MODULE BROWSE

    TEXT SQL TO cSQL
        SELECT  a.id_cfg_ip, a.descricao, a.endereco_ip, a.mac
        FROM cfg_ip as a
    ENDTEXT

    BROWSE INIT USING CONNECT "DATANET" QUERY cSQL 
    BROWSE TITLE "Endereços"

    BROWSE ADD COLUMN "descricao" CAPTION "Descrição" PICTURE "@x" LENGTH 30
    BROWSE ADD COLUMN "endereco_ip" CAPTION "Endereço" PICTURE "@x" LENGTH 15
    BROWSE ADD COLUMN "mac" CAPTION "M.A.C." PICTURE "@X" LENGTH 20
   
    
    BROWSE SET TABLE "cfg_ip"
    BROWSE SET PKNAME "id_cfg_ip" GENERATOR {||VLJ_CHAVE()}
    BROWSE SET UPDATE FrmCfgIP
    BROWSE SET INSERT FrmCfgIP
    BROWSE SET DELETE ON

    //BROWSE SET BLOCKFOOTER {|| BlockFooter() } HEIGHT 5

    BROWSE SET FILTER "Filtro" WHERE  "descricao LIKE '%' || %s || '%' AND endereco_ip LIKE '%' || %s || '%'"  ;
    CAPTION  { "Descrição   : " , "Endereço IP : " } ;
    VAL { SPACE(30) , SPACE(30) } ;
    PICT   { "@K" , "@X" }  ;
    NEWLINE  { .F. , .F. }     

    BROWSE SHOW
 
RETURN

BEGIN FORM FrmCfgIP

    FORM TEMPLATE FILE "cfg_ip.txt" 
    FORM ROWTOP 7 COLTOP 10

    FORM ADD MAP "A" NAME "descricao" VAL SPACE(20) PICT "@x" MAXLEN 20  FIELDNAME "descricao" MESSAGE "Descrição"   
    //IF IS_FORM_INSERT
        FORM ADD MAP "B" NAME "id_faixa" VAL SPACE(255) PICT "@S5" MESSAGE "Faixa"   
        FORM ADD MAP "C" NAME "faixa_descricao" VAL SPACE(30) ISREADONLY .T.
    //ENDIF
    FORM ADD MAP "D" NAME "endereco_ip" VAL SPACE(30) PICT "@X" FIELDNAME "endereco_ip" MESSAGE "Endereço IP"   
    FORM ADD MAP "E" NAME "mac" VAL SPACE(30) PICT "@X" FIELDNAME "mac" MESSAGE "Endereço físico da placa de rede"
   
    //IF IS_FORM_INSERT
        FORM SEARCH "id_faixa" KEY "id_faixa" CONNECT "DATANET"  QUERY "SELECT * FROM faixa" WHERE "WHERE id_faixa='#1'" ;
          RETURN "prefixo" TO "faixa_descricao" ;
          GRID WHERE "Where prefixo LIKE '%#1%'" FIELDS { 'prefixo' , 'inicio' , 'fim' } ;
                  CAPTIONS { 'Prefixo' , 'Início' , 'Fim' } ;
                  WIDTHS { "50%","30%","20%"  } ;
                  ALIGNS { "LEFT" , "LEFT" , "LEFT" }
    //ENDIF

    //FORM BEFORE SHOW FaixaBeforeShow
    //FORM BEFORE SUBMIT FaixaBeforeSubmit
    FORM VALID ValidCfgIP

END FORM RETURN TO BROWSE

/*
FUNCTION BlockFooter

    LOCAL nSaldoCredito := VLJ_DLookUpGetValue( "MINIERP", "Select sum(credito) as credito from banco" , "credito" , 0 )
    LOCAL nSaldoDebito := VLJ_DLookUpGetValue( "MINIERP", "Select sum(debito) as debito from banco" , "debito" , 0 )


    @ ROW()+1,2 SAY "Banco : " + PADR( FIELD->BANCO_NOME , 50 )
    @ ROW()+2,2 SAY "Conta : " + PADR( FIELD->BANCO_CONTA , 50 )
    @ ROW()  ,70 SAY "Saldo geral (todas as contas) : " + TRANSFORM( nSaldoCredito - nSaldoDebito , "@RE 999,999,999.99" )

RETURN NIL
*/

BEGIN FORM VALID ValidCfgIP( hGet )

    IF CONTROL NAME "ID_FAIXA"
        hGet["endereco_ip"] := BuscaDescricao( hGet["faixa_descricao"] , 30 )
    ENDIF


END FORM

STATIC FUNCTION BuscaDescricao( cFaixa , nLen )

    LOCAL cIp 

    cFaixa := ALLTRIM( cFaixa )
    USE PROX_IP USING CONNECT "DATANET" MEMORY QUERY "SELECT id_cfg_ip , endereco_ip FROM cfg_ip WHERE endereco_ip LIKE '" + cFaixa + "%'"
    HB_ALERT( FIELD->ENDERECO_IP ) 
    cIp := FIELD->ENDERECO_IP + "ll"


RETURN PADR( cIp , nLen )

/*
FUNCTION CfgIPBeforeShow( hGet )

        hGet["FAIXA_DESCRICAO"] := PADR( hGet["endereco_ip"] , 30 )

RETURN .T.

FUNCTION CfgIPBeforeSubmit( hGet , hHidden )

    if hGet["TEXT_TIPO"] == "DEBITO"
        hHidden["DEBITO"] := hGet["TEXT_VALOR"]
        hHidden["CREDITO"] := 0
    else
        hHidden["CREDITO"] := hGet["TEXT_VALOR"]
        hHidden["DEBITO"] := 0
    endif    

RETURN .T.
*/

