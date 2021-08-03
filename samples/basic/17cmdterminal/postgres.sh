#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include

#include "vbase.ch"
#include "vdata.ch"
#include "cmdterminal.ch"

PROCEDURE Hbm_CGI()

    CONFIG INIT
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

    hb_SetEnv( "PGSQL_NAME" , "+IHQ0nM/5OUEQAx6IjEgdZXmVLRgtxi1s8RLT6wBH56NcFXwkhe27Kma6eKKJra6u47XYmhBE4E+cuOmw9tVDKihB8Ww1CItuPOhUScHRh5voSFuNYuzHi/bvqyihu3KJbsgy1+y5PVZsSrGgg2zJ6S8DpCTKKP3u5Der2lmPHe4ojRLrfbEtvnQC8L0S3bJun2VgOyFyiZDY7S1WVQgIyvMrhgThcsEe1FtWJn/AAmoGCOOVnxlngVvZDbBlSJ+749cu6mnbiFCmtdcYbM0jzBfiHWlnY4F/Y4Bg73H6SoXoHLlpD1NvHqmztnR7tmFwyt2p7kevWtrFNQav9b+9IA=" )
    ? "Conexao ao postgresql"
    USE EMP ;
       USING CONNECT "PGSQL_NAME" MEMORY;
       QUERY "SELECT * FROM EMP"

    DO WHILE .NOT. EOF()
        ? FIELD->EMPNO, FIELD->ENAME
        SKIP
    ENDDO

RETURN

