PROCEDURE HBM_12intro

    LOCAL cName := SPACE(30)  
    LOCAL dBirth := CTOD("//")

    @ 10,10 SAY "Client name  : " GET cName 
    @ 12,10 SAY "Birth's date : " GET dBirth
    READ 

    @ 16,10 SAY "Name : " + cName 
    @ 18,10 SAY "Your age : " + Str( Int( (Date()-dBirth)/365) )


    MyPause( hb_utf8SubStr( Procname() , 5 ) ) 
    
RETURN
