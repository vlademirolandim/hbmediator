#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
-b
#include "vbase.ch"
PROCEDURE HBM_CGI

    LOCAL cContent

/**
O comando DEBUG ENV vai tirar uma cópia do ambiente na qual a aplicação foi gerada, os dados da estação, 
da rede, IP, etc.
*/

    DEBUG ENV
    cContent := MemoRead( "debug.log" )
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( "debug.log" )


    RETURN


