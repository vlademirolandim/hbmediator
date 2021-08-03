#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
#include "vbase.ch"

/*
ATENÇÃO!!!

ESSE É UM EXEMPLO DE COMO NÃO SE DEVE FAZER.

AQUI EU NÃO ESTOU CHAMANDO O COMANDO "DEBUG DUMP", 
AO INVES DISSO EU ESTOU CHAMANDO O OBJETO VDEBUG. 

ISSO É ERRADO !!!!!

CHAME O COMANDO DEBUG SEMPRE.

QUALQUER ESCLARECIMENTO ADICIONAL LEIA O ARQUIVO README.

NOTE QUE, TANTO FAZ COMPILAR COM -b OU SEM -b, O LOG DE DEBUG SEMPRE SERÁ GERADO.
ISSO É UM PERIGO PARA A SEGURANÇA DAS INFORMAÇÕES POIS PODE EXPOR DADOS SIGILOSOS EM UM LOG QUANDO
O SISTEMA FOR PARA A PRODUÇÃO. ISSO É PARTICULARMENTE VERDADEIRO EM SISTEMAS COMPILADOS. NOS SCRIPTS NÃO PORQUE O FONTE JÁ É EXPOSTO.

NO CASO DE SCRIPTS, VEJA QUE EU NAO COLOQUEI -b E MESMO ASSIM ELE GEROU O LOG

*/


PROCEDURE HBM_CGI

    LOCAL oObj
    LOCAL cContent

    oObj := VDebug():New()
    oObj:Dump( { "Test01" , { "Test02" => "ok" } } )

    cContent := MemoRead( "debug.log" )
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( "debug.log" )


    RETURN


