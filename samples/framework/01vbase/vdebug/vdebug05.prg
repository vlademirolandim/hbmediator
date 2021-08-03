#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
-b
#include "vbase.ch"
PROCEDURE HB_CGI

    LOCAL cContent

/**
O comando DEBUG ALIAS vai exibir um dump da área de trabalho ativa
*/

    dbcreate( "test.dbf" , { { "ID" , "N" , 10 , 0 } , { "NAME" , "C" , 30 , 0 }} )
    dbcreate( "test2.dbf" , { { "CODIGO" , "N" , 10 , 0 } , { "NOME_CLI" , "C" , 30 , 0 }} )
    use test
    APPEND BLANK
    REPLACE ID WITH 1
    REPLACE NAME WITH "EDWARD"
    APPEND BLANK
    REPLACE ID WITH 2
    REPLACE NAME WITH "PAUL"

    use test2 new
    APPEND BLANK
    REPLACE CODIGO WITH 1
    REPLACE NOME_CLI WITH "JOSE DA SILVA BRASIL"

    DEBUG ALIAS "TEST"
    DEBUG ALIAS // TEST2 (CURRENT ALIAS)
    cContent := MemoRead( "debug.log" )
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( "debug.log" )
    Ferase( "test.dbf" )
    Ferase( "test2.dbf" )    


    RETURN


