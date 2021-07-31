PROCEDURE HBM_16valid

    LOCAL nAge := 0
    LOCAL cName := SPACE(30)

    
    @ 08,10 SAY "Name        : " GET cName VALID CheckName( cName )
    @ 10,10 SAY "Client age  : " GET nAge VALID CheckAge( nAge )

    READ  

    MyPause( hb_utf8SubStr( Procname() , 5 ) ) 
    
RETURN

STATIC FUNCTION CheckName( xVal )

    LOCAL lRet := .t.
    IF EMPTY( xVal )
        Alert("Name is mandatory")
        lRet := .f.
    ENDIF    

RETURN lRet

STATIC FUNCTION CheckAge( xVal )

    LOCAL lRet := .t.

    IF xVal <= 18 .OR. xVal >= 99
        Alert("Age must between 18 and 99")
        lRet := .f.
    ENDIF            


RETURN lRet
