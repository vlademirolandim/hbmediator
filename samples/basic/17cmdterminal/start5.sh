#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"

PROCEDURE Hbm_CGI()

    CONFIG LOG LEVEL INFO
    SET CONSOLE ON
    
    /*
    String gerada a partir do arquivo database.ini 
    O arquivo pode ficar armazenado em outro local, basta declarar a variável de ambiente chamada TESTE

    Para gerar o arquivo faça 
    hbmediator --database
    Uma vez gerado, se você executar novamente o comando acima a string abaixo será gerada

    hbmediator --database
    mSnQQuuu3G9WqM4T8JpQtCXmhg3oZeplcYe6DyQAl/7N2L3yaK+2BWGiEVMqdia46eadisIxEys=

    Foi ela que eu declarei abaixo
    Você pode declarar a variável de ambiente TESTE no profile do usuário
    */
    hb_SetEnv( "TESTE" , "mSnQQuuu3G9WqM4T8JpQtCXmhg3oZeplcYe6DyQAl/7N2L3yaK+2BWGiEVMqdia46eadisIxEys=" )
    
    USE EMP ;
       USING CONNECT "TESTE" MEMORY;
       QUERY "SELECT * FROM EMP"

    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME
        SKIP
    ENDDO

RETURN

