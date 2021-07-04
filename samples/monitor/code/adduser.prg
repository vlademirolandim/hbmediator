#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#include "inkey.ch"

PROCEDURE Hbm_AddUser

    LOCAL hGet 
    LOCAL aGrupos :=  { "Funcionário" , ;
                        "Estudante - Graduação" , ;
                        "Estudante - Mestrado" , ;
                        "Estudante - Doutorado" } 


    MODULE FORM


    //--------------- INIT -----------------------//
    CLS
    FORM TEMPLATE FILE "adduser.txt" 
    FORM ROWTOP 05 COLTOP 05
    FORM TITLE "Adicionar Usuário"

    FORM ADD MAP "A" NAME "NOME" VAL SPACE(40) PICT "@x"  MESSAGE "Informe o nome"   
    FORM ADD MAP "B" NAME "SOBRENOME" VAL SPACE(40) MESSAGE "Informe o sobre-nome" 
    FORM ADD MAP "C" NAME "NOMECOMPLETO" VAL SPACE(80) ISREADONLY .T.
    FORM ADD MAP "D" NAME "LOGIN" VAL SPACE(30) PICT "@X" MESSAGE "Login"
    FORM ADD MAP "E" NAME "SENHA" VAL SPACE(30) PICT "@X" MESSAGE "Senha"
    FORM ADD MAP "F" NAME "SENHA2" VAL SPACE(30) PICT "@X" MESSAGE "Confirme a senha"
    FORM ADD MAP "G" NAME "GRUPO" VAL 1 MESSAGE "Informe o grupo";
                         DROPDOWN WIDTH 30 HEIGHT 5 OPTIONS aGrupos
    FORM ADD MAP "H" NAME "DIRETORIO" VAL SPACE(40) PICT "@S30" ISREADONLY .T.
    FORM ADD MAP "I" NAME "FONE" VAL SPACE(20) 
    FORM ADD MAP "J" NAME "CELULAR" VAL SPACE(20)
    FORM ADD MAP "K" NAME "EMAIL" VAL SPACE(30)
    FORM ADD MAP "L" NAME "CONCLUSAO" VAL SPACE(6) PICT "9999.9" MESSAGE "Semestre de conclusão"
    


    FORM VALID Valida
    FORM RETURN GETS TO hGet
   
    FORM SHOW
    IF LASTKEY() == K_ESC
       alert("Abandonando")
    ELSEIF SN("Confirma as alterações ?")
       alert("Gravando")
    ENDIF
    

RETURN

/*
Validation
*/
BEGIN FORM VALID Valida( hGet )

    DO CASE
    CASE CONTROL NAME "LOGIN"
        IF EMPTY(hGet["LOGIN"])
            HB_ALERT("Informe um valor para o login")
            RETURN .F.
        ENDIF
        hGet["LOGIN"] := LOWER( hGet["LOGIN"] )
    CASE CONTROL NAME "GRUPO"
        IF EMPTY(hGet["GRUPO"])
            HB_ALERT("Informe um valor para o Grupo")
            RETURN .F.
        ENDIF
    ENDCASE



END FORM
 
	
