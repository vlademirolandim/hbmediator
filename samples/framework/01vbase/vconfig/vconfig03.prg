#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include

#include "vbase.ch"

PROCEDURE HBM_CGI

    LOCAL oCfg := ConfigSingleton()
    LOCAL xElem


    /*
    Obtendo as configurações
    */

    CONFIG INIT hb_MemoRead("config.json")

    ? 
    ? "Imprime as configurações"
    FOR EACH xElem IN oCfg:GetConfigValues()
        ? xElem:__enumkey() + " = " + hb_ValToExp( xElem )
    NEXT    

    RETURN


