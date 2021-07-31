PROCEDURE HBM_17when

    LOCAL nAge := 0
    LOCAL cName := SPACE(30)

    
    @ 10,10 SAY "Client age           : " GET nAge 
    @ 12,10 SAY "Parent/Guardian name : " GET cName WHEN nAge < 18
    READ  

    MyPause( hb_utf8SubStr( Procname() , 5 ) ) 
    
RETURN

