
PROCEDURE HBM_36cleargets

    LOCAL cField := "JOSEPH READ ONLY"
    LOCAL cField2 := "MARKETING"


    @ 10, 10 SAY "Name       : " GET cField 
    @ 12, 10 SAY "Department : " GET cField2
    CLEAR GETS
    @ 14,10 SAY "PRESS. ANY KEY TO CONTINUE"
    INKEY(0)
   
    MyPause( hb_utf8SubStr( Procname() , 5 ) ) 
    SET DELIMITERS ON
    SET DELIMITERS TO "[]"
    
RETURN


