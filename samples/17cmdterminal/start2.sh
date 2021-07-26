#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include

#include "cmdterminal.ch"

PROCEDURE HBM_CGI
LOCAL x := 1

dbcreate( "cliente" , { { "NOME" , "C" , 20 , 0 } } )
USE cliente

APPEND BLANK
REPLACE NOME WITH "VLADEMIRO"
browse()


