#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
#include "vbase.ch"

PROCEDURE HBM_CGI

    LOCAL oCfg := ConfigSingleton()
    LOCAL cContent
    LOCAL cMessage

    CLS
    CONFIG LOG LEVEL INFO
    LOG "Hello World" INFO TO cMessage
    ? "cMessage = " , cMessage
    ?
    ?
    ? "Type any key to continue."
    Inkey(0)
    cContent := MemoRead( oCfg:GetLogName() )
    ? "-------------------------------------"
    ? "- Content (Log file generated : " + oCfg:GetLogName() + ")"
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( oCfg:GetLogName() )


    RETURN


