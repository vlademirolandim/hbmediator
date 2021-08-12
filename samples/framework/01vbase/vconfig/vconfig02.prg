#!/home/vlademiro/sistemas/sistemas23/bin/hbmshell 

#include "vbase.ch"
#include "cmdterminal.ch"

PROCEDURE HBM_CGI

    LOCAL oCfg := ConfigSingleton()


    /*
    Exemplos de configurações com valores lidos de uma string json
    */
    CONFIG INIT
    CONFIG INIT hb_MemoRead("config.json")

    ? 
    ? "Log level : " , oCfg:getLogLevel()
    ? "Log display : " , oCfg:getLogDisplay() 
    ? "Sys name : " , oCfg:getSysName()     
    ? "Organization name : " , oCfg:getOrgName()     
    ? "Department name : " , oCfg:getDeptName()     
    ? "Complement name : " , oCfg:getComplement()     
    ? "Address 01 : " , oCfg:getAddress01()     
    ? "Address 02 : " , oCfg:getAddress02()                         
    ? "E-mail : " , oCfg:getEmail()
    ? "URL : " , oCfg:getURL() 

    RETURN


