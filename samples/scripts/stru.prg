#!/home/vlademiro/sistemas/sistemas23/bin/hbmshell 
-q0
-n

#include "cmdterminal.ch"

PROCEDURE hb_mail( ... )
    //Insert LOCAL variables here
    LOCAL cDbf := hb_PValue( 1 )
    LOCAL aStru
    LOCAL x
    // Type code here
    IF hb_PValue( 1 ) == NIL
        ? "Usage : stru.prg file.dbf"
        RETURN
    ENDIF    

    IF EMPTY( hb_FNameExt( cDbf ) )
        cDbf += ".dbf"
    ENDIF    

    IF .NOT. FILE( cDbf )
        ? "File " + cDbf + " not found"
        RETURN
    ENDIF

    USE ( cDbf ) SHARED
    aStru := DbStruct()
    CLOSE 
    FOR x := 1 TO LEN( aStru )
        ? PADR( aStru[x][1] , 20 ) , aStru[x][2] , aStru[x][3] , aStru[x][4]
    NEXT    

    RETURN

