#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
DYNAMIC TESTE

PROCEDURE hbm_Main

    LOCAL oCore := VCompile():New()
    LOCAL pHrb

    pHrb := oCore:CompileAndLoad( "teste.prg" )
    IF EMPTY( pHrb )
        ? "nOT LOAD"
    ELSE    
        &("Teste()")
    ENDIF    

RETURN
