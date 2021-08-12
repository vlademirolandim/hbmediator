#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 

DYNAMIC OI


#pragma BEGINDUMP

#include <hbapi.h>
#include <stdio.h>

HB_FUNC( OI )
{
   printf("Ola pessoal");
}


#pragma ENDDUMP

function Hbm_Main()

   OI()

return nil

