#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
-b

#include "vbase.ch"
PROCEDURE HBM_CGI

    LOCAL cContent

/**
Você pode querer colocar um título informativo juntamente com as informações de depuração.
Para fazer isso informe usando a palavra-chave TITLE.

Isso fará que o log coloque o valor definido em TITLE no lugar da string  "No name"
*/

    DEBUG DUMP { "Test02" , { "Test03" => "ok" } } TITLE "Information title"
    DEBUG DUMP 1+1 TITLE "1 PLUS 1 EQUAL 2 ;)"

    cContent := MemoRead( "debug.log" )
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( "debug.log" )


    RETURN


