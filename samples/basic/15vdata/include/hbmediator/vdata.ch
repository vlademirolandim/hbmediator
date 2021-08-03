
#command USE <(oDbf)> [ALIAS <(Alias)>]   [<nw: NEW>] ;
            [<ex: EXCLUSIVE>] [<sh: SHARED>]  [ STRUCT <xStruct> ] TO <lResult>  => ;
               <lResult> :=  OpenDbf( <(oDbf)> , <(Alias)> , <.nw.> , iif( <.sh.> .OR. <.ex.>, ! <.ex.>, NIL ) , [<xStruct>]  )


#command INSERT USING CONNECT <oDbf> [<decrypt: DECRYPT>] INTO <(table)> <(f1)>  [, <(fN)> ];
                VALUES  <v1>  [, <vN> ] [MESSAGE TO <cMessage>] [ROWID <nRowID>] [TO <lResult>]  => ;
                [<lResult> := ]FInsertSQL( <oDbf> , <(table)> , [@<cMessage>] , [@<nRowID>] , .not. <.decrypt.> , <(f1)> [, <(fN)> ] , <v1> [, <vN> ] ) 


#command UPDATE USING CONNECT <oDbf> [<decrypt: DECRYPT>] <(cTable)> SET <(cf1)> = <v1> [ , <(cfN)> = <vN> ];
             WHERE <(cWhereName)> = <xWhereValue>  [MESSAGE TO <cMessage>] [TO <lResult>] =>;
                [<lResult> := ] FUpdateSQL( <oDbf> , <(cTable)> , <(cWhereName)> , <xWhereValue> ,  [@<cMessage>] , .not. <.decrypt.> , { <(cf1)> => <v1> [, <(cfN)> => <vN>] } ) 

#command DELETE USING CONNECT <oDbf> [<decrypt: DECRYPT>] FROM <(cTable)> ;
        WHERE <(cWhereName)> = <xWhereValue>  [MESSAGE TO <cMessage>] [TO <lResult>] =>;
            [<lResult> := ] FDeleteSQL( <oDbf> , <(cTable)> , <(cWhereName)> , <xWhereValue> ,  [@<cMessage>] , .not. <.decrypt.>)

/*
#command USE <(cFile)> USING CONNECT <oDbf> [<decrypt: DECRYPT>] QUERY <cQuery> [TO <lResult> ] => ;
             [<lResult> := ]  FQueryToDBF( <(cFile)> , <oDbf> , <cQuery> , , , , .not. <.decrypt.>  )        
                   
*/
/*
#command USE <(cFile)> USING CONNECT <oDbf> [<decrypt: DECRYPT>] QUERY <cQuery> [PAGE <nPage>] [LIMIT <nLimit> ] [STRUCT <aStruct>] [TO <lResult> ] => ;
             [<lResult> := ]  FQueryToDBF( <(cFile)> , <oDbf> , <cQuery> , [<nLimit>] , [ <nPage>] , [ <aStruct>] )        
*/                   

#command USE <(cFile)> USING CONNECT <oDbf> [<decrypt: DECRYPT>] QUERY <cQuery> [PAGE <nPage>] [LIMIT <nLimit> ] [STRUCT <aStruct>] [ MESSAGE TO <cMessage>] [TO <lResult> ] => ;
             [<lResult> := ]  FQueryToDBF( <(cFile)> , <oDbf> , <cQuery> , [<nLimit>] , [ <nPage>] , [ <aStruct>] , [ @<cMessage>] , .not. <.decrypt.>  )        

#command USE <(cFile)> USING CONNECT <oDbf> [<decrypt: DECRYPT>]  QUERY <cQuery> VALUES <v1> [, <vN>]  [PAGE <nPage>] [LIMIT <nLimit> ] [STRUCT <aStruct>] [ MESSAGE TO <cMessage>] [TO <lResult> ] => ;
             [<lResult> := ]  FQueryToDBF( <(cFile)> , <oDbf> , <cQuery> , [<nLimit>] , [ <nPage>] , [ <aStruct>] , [ @<cMessage>] , .not. <.decrypt.> , <v1> [ , <vN> ] )        
             

#command EXEC CONNECT BY <cID>  [<decrypt: DECRYPT>] SQL <cSQL> PARAMETERS <f1>  [, <fN> ]  [ MESSAGE TO <cMessage> ] [ TO <lRet> ] => ;
                                [<lRet> := ] VLJ_ExecSQL( <cID> , <cSQL> , [ @<cMessage> ] ,  <f1> [, <fN> ] )
             
#command MODULE EXEC SQL => LOCAL __VLJ_OSQL__ 
#command SQL EXEC CONNECT BY <cStringADO> PARAMETERS <f1>  [, <fN> ] CODE => __VLJ_OSQL__ := TExecSQL():New(  <cStringADO> , <f1>  [, <fN> ] );#pragma __text|__VLJ_OSQL__:AddCode(%s)
#xcommand END SQL EXEC [MESSAGE TO <cMessage>][ TO <lRet>] => [<lRet>:=] __VLJ_OSQL__:exec([@<cMessage>]);
//#xcommand END EXEC SQL => #pragma __endtext;__VLJ_OSQL__:exec() 

#xtranslate TEXT SQL TO <v>  => #pragma __text|<v>+=%s;<v>:="" 
 
