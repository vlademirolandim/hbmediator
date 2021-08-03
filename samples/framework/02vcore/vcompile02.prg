#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
DYNAMIC TESTE

PROCEDURE hbm_Main

    LOCAL oCore := VCompile():New()
    FERASE("teste.hrb")
    IF oCore:CompileAndSaveBinary( "teste.prg" )
        IF FILE ( "teste.hrb" )
            ? "OK"
        ELSE
            ? "ok, BUT teste.hrb not found"    
        ENDIF    
    ELSE    
        ? "FAIL"
    ENDIF    

RETURN
