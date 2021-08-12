#!/home/vlademiro/sistemas/sistemas23/bin/hbmshell

#include "vbase.ch"
#include "cmdterminal.ch"

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


