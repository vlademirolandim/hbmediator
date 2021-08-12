ANNOUNCE HB_GT_SYS
EXTERNAL HB_GT_NUL_DEFAULT
#line 5 "{SOURCE}.prg"
PROCEDURE HBM_CGI

    LOCAL x := 1000
    LOCAL c := "Client Name"
    LOCAL z := { => }
    LOCAL y := { "1" , 2 , 4 , { 12 } }













    __MVPUT("__DEBUG_DISPLAY_" + "x" , "VarName: " + "x" + " / Type: " + VALTYPE( x ) + " / Value: " + IIF( VALTYPE( x ) == "P" , hb_ValToStr( x ) , hb_ValToExp( x ) ) )
    __MVPUT("__DEBUG_DISPLAY_" + "y" , "VarName: " + "y" + " / Type: " + VALTYPE( y ) + " / Value: " + IIF( VALTYPE( y ) == "P" , hb_ValToStr( y ) , hb_ValToExp( y ) ) )
    __MVPUT("__DEBUG_DISPLAY_" + "c" , "VarName: " + "c" + " / Type: " + VALTYPE( c ) + " / Value: " + IIF( VALTYPE( c ) == "P" , hb_ValToStr( c ) , hb_ValToExp( c ) ) )
    __MVPUT("__DEBUG_DISPLAY_" + "z" , "VarName: " + "z" + " / Type: " + VALTYPE( z ) + " / Value: " + IIF( VALTYPE( z ) == "P" , hb_ValToStr( z ) , hb_ValToExp( z ) ) ) ;IIF( .T. , ALTD() , NIL )

    vlj_outstd( "Voce está no depurador. Clique em Monitor -> Private" );outstd( hb_eol() )

    RETURN
