// DBF
#command USE <(oDbf)> [ALIAS <(Alias)>]   [<nw: NEW>] ;
            [<ex: EXCLUSIVE>] [<sh: SHARED>]  [ STRUCT <xStruct> ] TO <lResult>  => ;
               <lResult> :=  OpenDbf( <(oDbf)> , <(Alias)> , <.nw.> , iif( <.sh.> .OR. <.ex.>, ! <.ex.>, NIL ) , [<xStruct>]  )




// SQL
#command INSERT USING CONNECT <oDbf> [<memory:FROM MEMORY>] [<decrypt: DECRYPT>] INTO <(table)> <(f1)>  [, <(fN)> ];
                VALUES  <v1>  [, <vN> ] [MESSAGE TO <cMessage>] [ROWID <nRowID>] [TO <lResult>]  => ;
                [<lResult> := ]FInsertSQL( <oDbf> , <(table)> , [@<cMessage>] , [@<nRowID>] , .not. <.decrypt.> , <.memory.> , <(f1)> [, <(fN)> ] , <v1> [, <vN> ] ) 


#command UPDATE USING CONNECT <oDbf> [<memory:FROM MEMORY>] [<decrypt: DECRYPT>] <(cTable)> SET <(cf1)> = <v1> [ , <(cfN)> = <vN> ];
             WHERE <(cWhereName)> = <xWhereValue>  [MESSAGE TO <cMessage>] [TO <lResult>] =>;
                [<lResult> := ] FUpdateSQL( <oDbf> , <(cTable)> , <(cWhereName)> , <xWhereValue> ,  [@<cMessage>] , .not. <.decrypt.> , <.memory.> , { <(cf1)> => <v1> [, <(cfN)> => <vN>] } ) 

#command DELETE USING CONNECT <oDbf> [<memory:FROM MEMORY>] [<decrypt: DECRYPT>] FROM <(cTable)> ;
        WHERE <(cWhereName)> = <xWhereValue>  [MESSAGE TO <cMessage>] [TO <lResult>] =>;
            [<lResult> := ] FDeleteSQL( <oDbf> , <(cTable)> , <(cWhereName)> , <xWhereValue> ,  [@<cMessage>] , .not. <.decrypt.> , <.memory.> )


#command USE <(cFile)> USING CONNECT <oDbf> [<memory:MEMORY>] [<decrypt: DECRYPT>] QUERY <cQuery> [PAGE <nPage>] [LIMIT <nLimit> ] [STRUCT <aStruct>] [ MESSAGE TO <cMessage>] [TO <lResult> ] => ;
             [<lResult> := ]  FQueryToDBF( <(cFile)> , <oDbf> , <cQuery> , [<nLimit>] , [ <nPage>] , [ <aStruct>] , [ @<cMessage>] , .not. <.decrypt.> , <.memory.> )        

#command USE <(cFile)> USING CONNECT <oDbf> [<memory:MEMORY>] [<decrypt: DECRYPT>]  QUERY <cQuery> VALUES <v1> [, <vN>]  [PAGE <nPage>] [LIMIT <nLimit> ] [STRUCT <aStruct>] [ MESSAGE TO <cMessage>] [TO <lResult> ] => ;
             [<lResult> := ]  FQueryToDBF( <(cFile)> , <oDbf> , <cQuery> , [<nLimit>] , [ <nPage>] , [ <aStruct>] , [ @<cMessage>] , .not. <.decrypt.> , <.memory.> , <v1> [ , <vN> ] )        
             

#command EXEC USING CONNECT <cID> [<memory:FROM MEMORY>]  [<decrypt: DECRYPT>] SQL <cSQL> PARAMETERS <f1>  [, <fN> ]  [ MESSAGE TO <cMessage> ] [ TO <lRet> ] => ;
                                [<lRet> := ] VLJ_ExecSQL( <cID> , <cSQL> , [ @<cMessage> ] , <.memory.> , <f1> [, <fN> ] )
             
#command MODULE EXEC SQL => LOCAL __VLJ_OSQL__ 
#command SQL EXEC CONNECT BY <cStringADO> PARAMETERS <f1>  [, <fN> ] CODE => __VLJ_OSQL__ := TExecSQL():New(  <cStringADO> , <f1>  [, <fN> ] );#pragma __text|__VLJ_OSQL__:AddCode(%s)
#xcommand END SQL EXEC [MESSAGE TO <cMessage>][ TO <lRet>] => [<lRet>:=] __VLJ_OSQL__:exec([@<cMessage>])

#xtranslate TEXT SQL TO <v>  => #pragma __text|<v>+=%s;<v>:=""
 
