#!/home/vlademiro/sistemas/sistemas23/bin/hbmediator --cgi 
-I/home/vlademiro/sistemas/sistemas23/include
-b

#include "vbase.ch"
PROCEDURE HBM_CGI

    LOCAL cContent


/**
A fazermos o debug dump em uma valores simples (ex: 1+1), o log sairá assim :
    
Data       Hora         Tag DEBUG   Dump de 1+1
20210610 - 11:04:01 >>  [ DEBUG ]   Dump var No Name : 2 Datatype : N
*/
    DEBUG DUMP 1+1 

/*
O comando abaixo realiza o dump em uma variável composta. Nesse caso, o log exibe os elementos da variável

20210610 - 11:08:16 >>  [ DEBUG ]     DUMP INI / ROOT LEVEL / VAR NAME :   No name
20210610 - 11:08:16 >>  [ DEBUG ]   >  1   )    TYPE: A   PARENT :   LEVEL 1 - NO PARENTS
20210610 - 11:08:16 >>  [ DEBUG ]    -->   LENGTH : 2   /   {"Test02", {"Test03"=>"ok"}}
20210610 - 11:08:16 >>  [ DEBUG ]   >  1.1   )    TYPE: C   PARENT :   1
20210610 - 11:08:16 >>  [ DEBUG ]    -->   LENGTH : 6   /   "Test02"
20210610 - 11:08:16 >>  [ DEBUG ]   >  1.2   )    TYPE: H   PARENT :   2
20210610 - 11:08:16 >>  [ DEBUG ]    -->   LENGTH : 1   /   {"Test03"=>"ok"}
20210610 - 11:08:16 >>  [ DEBUG ]    -->   KEYS=  1 ) Test03
20210610 - 11:08:16 >>  [ DEBUG ]   >  1.2.1   )    TYPE: C   PARENT :   Test03
20210610 - 11:08:16 >>  [ DEBUG ]    -->   LENGTH : 2   /   "ok"
20210610 - 11:08:16 >>  [ DEBUG ]     DUMP END :   No name
20210610 - 11:08:16 >>  [ DEBUG ]   Dump var No name : 2 Datatype : N

Note que ele irá exibir os níveis do hash ou array. Conforme o exemplo abaixo
{ "Test02" , { "Test03" => "ok" } } 

1. {"Test02", {"Test03"=>"ok"}} <-- O nível 1 sempre é o array/hash completo
1.1.  "Test02" 
1.2.  {"Test03"=>"ok"}
1.2.1. "ok"
*/    
    DEBUG DUMP { "Test02" , { "Test03" => "ok" } } 

/*
    O trecho a seguir é apenas auxiliar do nosso exemplo, sua função é exibir o conteúdo do arquivo e 
    apagá-lo depois, pois os logs de depuração são cumulativos e esse arquivo ficaria maior a cada 
    exemplo executado.
*/
    cContent := MemoRead( "debug.log" )
    ? "-------------------------------------"
    ? "- Content (Log file generated : debug.log" 
    ? "-------------------------------------"
    ? cContent
    ?
    ? "Erasing file now"
    Ferase( "debug.log" )


    RETURN


