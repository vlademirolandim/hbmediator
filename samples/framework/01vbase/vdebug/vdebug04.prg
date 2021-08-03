#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
-b
#include "vbase.ch"
PROCEDURE HBM_CGI

    LOCAL cContent

/**
O comando DEBUG MINI DUMP vai exibir variáveis compostas (arrays e hashs) em apenas uma linha, sem
entrar nos ítens da árvore para exibir de um por um.
*/

    DEBUG MINI DUMP { "Test02" , { "Test03" => "ok" } } 
    cContent := MemoRead( "debug.log" )
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( "debug.log" )


    RETURN


