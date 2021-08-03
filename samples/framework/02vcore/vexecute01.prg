#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
DYNAMIC TESTE

PROCEDURE hbm_Main

    LOCAL oCore := VCompile():New()
    LOCAL oExec := VExecute():New()

    IF .NOT. FILE( "teste.hrb" )
        IF oCore:CompileAndSaveBinary( "teste.prg" )
            IF FILE ( "teste.hrb" )
                ? "OK"
            ELSE
                ? "ok, BUT teste.hrb not found"    
            ENDIF    
        ELSE    
            ? "FAIL"
            QUIT
        ENDIF    
    ENDIF    

    oExec:ExecFromHrb( "teste.hrb" , "teste" )
    ? "GetResultExecute / Executing teste   : " , oExec:GetResultExecute()
    
    oExec:ExecFromHrb( "teste.hrb" , "teste()" ) // <---- Não bote Parenteses na rotina a ser chamada
    ? "GetResultExecute / Executing teste() : " , oExec:GetResultExecute()

RETURN
