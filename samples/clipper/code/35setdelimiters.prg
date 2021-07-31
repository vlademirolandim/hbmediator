
PROCEDURE HBM_35setdelimiters

    LOCAL cField := Space(10)
    LOCAL cField2 := Space(10)

    SET DELIMITERS TO "{}"
    @ 10, 10 SAY "Name       : " GET cField 
    SET DELIMITERS OFF
    @ 12, 10 SAY "Department : " GET cField2
    READ
   
    MyPause( hb_utf8SubStr( Procname() , 5 ) ) 
    SET DELIMITERS ON
    SET DELIMITERS TO "[]"
    
RETURN


