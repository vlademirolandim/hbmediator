#!/home/vlademiro/sistemas/sistemas23/bin/hbmshell
-q0
-n

**********************************************
* Nome  : Hbm_teste
* Autor : Vlademiro Landim Junior
* Aviso : Copyright(c) - 2021 de
*         Vlademiro Landim 
*         Todos os direitos reservados
* Data  : 2021-08-08
* Versão: Harbour 3.2.0dev (r2104281802)
* Notas : 
/*

    Faça um teste mandando informações através do pipe
    Por exemplo: ls -l | ./pipe.prg

*/
***********************************************
#include "cmdterminal.ch"
PROCEDURE Hbm_teste( ... )

    

    IF hb_Pvalue(1) == NIL
        ? "Send information using pipe"
        ? "E.g: ls -l | ./pipe.prg"
    ELSE
        ? hb_PValue(1)
    ENDIF    

    RETURN
