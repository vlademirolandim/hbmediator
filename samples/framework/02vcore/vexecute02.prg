#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
DYNAMIC TESTE

PROCEDURE hbm_Main

    LOCAL oExec := VExecute():New()

    oExec:ExecFromPrg( "teste.prg" , "teste" )
    ? "GetResultExecute / Executing teste   : " , oExec:GetResultExecute()
    
    oExec:ExecFromPrg( "teste.prg" , "teste()" ) // <---- Não bote Parenteses na rotina a ser chamada
    ? "GetResultExecute / Executing teste() : " , oExec:GetResultExecute()

RETURN
