function Main()

   udxAppInitialize( "Push", hb_argc(), hb_argv() )
   udxDisplayFunc()

   while .T.
      udxEvent()
   end

return nil

#pragma BEGINDUMP

#include <hbapi.h>
#include <stdio.h>

UDXAPI void udxDisplayFunc( void ( * callback )( void ) );

static udxAppContext app;

HB_FUNC( UDXAPPINITIALIZE )
{
   int argc = hb_parni( 2 );
    
   udxAppInitialize( &app, hb_parc( 1 ), NULL, 0, &argc, hb_parc( 3 ), NULL, NULL );      
   hb_ret();
}

static void display( void )
{
   printf( "Sample data to display\n" );
} 

HB_FUNC( UDXDISPLAYFUNC )
{
   udxDisplayFunc( display ); 
}

HB_FUNC( UDXEVENT )
{
   udxEvent();
}

#pragma ENDDUMP