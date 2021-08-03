#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-q0

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"
#include "inkey.ch"

PROCEDURE Hbm_CGI()

    CONFIG LOG LEVEL INFO
    SET CONSOLE ON

    //SET CMD DELIMITERS TO CHR(K_TAB)
    SET CMD DELIMITERS TO ";"



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
    
    // ATENÇÃO !!!!!! -> SQLITE_SISTEMAS33 SAO VARIAVEIS DE AMBIENTE NO /etc/profile a pasta do banco é /home/vlademiro/sistemas/hbmediator
    USE EMP ;
       USING CONNECT "SQLITE_SISTEMAS33" MEMORY;
       QUERY "SELECT * FROM EMP"

    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME, FIELD->JOB
        SKIP
    ENDDO

RETURN

