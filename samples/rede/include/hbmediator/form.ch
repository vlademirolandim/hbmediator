#include "button.ch"   // Menu definitions
#include "inkey.ch"    // Key definitions

/*** MENU ***/
#command MODULE MENU => LOCAL __oTopBar, __oPopUp, __oItem, ____oPopUp1, __oCfg , __oScreen 


#command MENU INIT => __oCfg := ConfigTUISingleton();__oScreen := Vcmd():New();__oTopBar := TopBar( __oCfg:getRowBottomHead()+1, __oCfg:getColLeft()+2, __oCfg:getMaxCol()-3  ); __oTopBar:ColorSpec := __oCfg:getColorMenu();____oPopUp1 := PopUp();____oPopUp1:cargo := ""
#command MENU ADD ITEM <cTitle> => __oPopUp := PopUp();__oPopUp:ColorSpec := __oCfg:getColorMenu();__oTopBar:AddItem( MenuItem( <cTitle> , __oPopUp ) )
#command MENU ADD SUBITEM <cTitle> [BLOCK <bBlock>] [KEY <nKey>] [MESSAGE <cMessage>] [<disabled:DISABLED>] [<checked:CHECKED>] [RETURN <nVal>] =>;
        __oItem :=MenuItem( <cTitle> ,<bBlock> , [<nKey>] , [<cMessage>] , [<nVal>] ) [; __oItem:Enabled := .not. <.disabled.>] [; __oItem:Checked := <.checked.>] ;__oPopUp:AddItem( __oItem ) 

#command MENU ADD POPUP <cTitle> => ____oPopUp1 := PopUp();____oPopUp1:ColorSpec := __oCfg:getColorMenu();__oItem := MenuItem( <cTitle> , ____oPopUp1 );__oPopUp:AddItem( __oItem )

#command MENU ADD POPUP ITEM  <cTitle> BLOCK <bBlock> [KEY <nKey>] [MESSAGE <cMessage>] [<disabled:DISABLED>]  [<checked:CHECKED>] =>;
        __oItem :=MenuItem( <cTitle> ,[<bBlock>] , [<nKey>] , [<cMessage>] ) ;
        [; __oItem:Enabled := .not. <.disabled.>] [; __oItem:Checked := <.checked.>] ;____oPopUp1:AddItem( __oItem ) 

#command MENU ADD SUBITEM <cTitle> EXIT  => MENU ADD SUBITEM <cTitle> BLOCK {||nil} RETURN 999

#command MENU SEPARATOR =>  __oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )
#command MENU SHOW => __oScreen:StandardScreen();DO WHILE MenuModal( __oTopBar , 1 , __oCfg:getMaxRow()-1 , __oCfg:getColLeft()+1 , __oCfg:getColRight()-1 , __oCfg:getColorTextAttention() ) <> 999;ENDDO

/*** BROWSE ***/
#command MODULE BROWSE => LOCAL __oBrw__
#command BROWSE INIT USING CONNECT <cConn> QUERY <cQuery> [LIMIT <nLimit>] => __oBrw__ := VBrowseCMD():New( <cConn> , <cQuery>  );__oBrw__:setStandardScreen(.t.)[;__oBrw__:setLimit(<nLimit>)]
#command BROWSE TITLE <cTitle> => __oBrw__:setTitle( <cTitle> )
#command BROWSE ADD COLUMN <cField> CAPTION <cCaption> PICTURE <cPicture> [LENGTH <nLen>] => __oBrw__:addColumn( <cField> , <cCaption>  , <cPicture> , [<nLen>] )
#command BROWSE SET TABLE <cTable> => __oBrw__:setTable( <cTable> )
#command BROWSE SET PKNAME <cPkName> => __oBrw__:setPKName( <cPkName> )
#command BROWSE SET UPDATE <Frm> => __oBrw__:setUpdate( {|oForm|<Frm>( oForm )} )  
#command BROWSE SET INSERT <Frm> => __oBrw__:setInsert( {|oForm|<Frm>( oForm )} )
#command BROWSE SET DELETE ON => __oBrw__:setDelete( .t. )
#command BROWSE SET DELETE OFF => __oBrw__:setDelete( .F. )
#command BROWSE ADD ROUTINE <cTitle> BLOCK <bBlock> [KEY <nKey>] => __oBrw__:addRoutine( <cTitle>  , <bBlock> , [<nKey>] )

#xcommand BROWSE SET BLOCKFOOTER <bBlock> HEIGHT <nHeight> => __oBrw__:setBlockFooter( <bBlock> , <nHeight> )
#xcommand BROWSE SET FOOTER MESSAGE <cMessage> =>  __oBrw__:setFooterMessage( "Mensagem de rodapé" )
#command BROWSE SET FILTER <cTitle> WHERE <cExp> CAPTION <aCaption> VAL <aVal> PICT <aPict> NEWLINE <aNewLine> =>;
                 __oBrw__:setFilter( <cTitle> , <cExp>, <aCaption> , <aVal>  , <aPict> , <aNewLine> )



#command BROWSE SHOW =>   __oBrw__:Show()  // IF __oBrw__:Open();__oBrw__:Show();ENDIF    


/*** FORM ***/
#command BEGIN FORM <FrmName> => FUNCTION <FrmName>( __oForm__ )
#xcommand MODULE FORM => LOCAL __oForm__ := VGetCMD():New()

#xcommand FORM ROWTOP <nRowTop> COLTOP <nColTop> => __oForm__:setRowBegin(<nRowTop>);__oForm__:setColBegin(<nColTop>)
#xcommand FORM TEMPLATE FILE <cFileName> => #pragma __streaminclude <cFileName>|__oForm__:setScreenDef(%s)
#xcommand FORM TITLE <cTitle> => __oForm__:setTitle( <cTitle> )
#xcommand FORM ADD MAP <cControl> NAME <cName> VAL <xVal> [PICT <cPict>] [MAXLEN <nMaxLen>] [DATATYPE <cType>];
                                     [FIELDNAME <cField>] [ISREADONLY <lReadOnly>] [MESSAGE <cMessage>] [<password: PASSWORD>] =>;
                      __oForm__:addMapControl( <cControl> , <cName> , <xVal> , [<cPict>] , [<nMaxLen>] , [<cType>] , [<cField>] ,;
                                                     [<lReadOnly>] , [<cMessage>] , [IIF( <.password.> , "PASSWORD" , "NORMAL" )] )    

#xcommand FORM ADD MAP <cControl> NAME <cName> ;
                                     [FIELDNAME <cField>]  [MESSAGE <cMessage>] DROPDOWN WIDTH <nWidth> HEIGHT <nHeight> OPTIONS <aOptions> =>;
                      __oForm__:addMapControl( <cControl> , <cName> , "",  ,  ,  , [<cField>] , .f. , [<cMessage>] , "DROPDOWN" , <nWidth> , <nHeight> , <aOptions> )    

#xcommand FORM ADD MAP <cControl> NAME <cName> ;
                                     [FIELDNAME <cField>]  [MESSAGE <cMessage>] LISTBOX WIDTH <nWidth> HEIGHT <nHeight> OPTIONS <aOptions> =>;
                      __oForm__:addMapControl( <cControl> , <cName> , "" ,  ,  ,  , [<cField>] , .f. , [<cMessage>] , "LISTBOX" , <nWidth> , <nHeight> , <aOptions> )    

#xcommand FORM ADD MAP <cControl> NAME <cName> ;
                                     [FIELDNAME <cField>] [ISREADONLY <lReadOnly>]  [MESSAGE <cMessage>] RADIOGROUP WIDTH <nWidth> HEIGHT <nHeight> OPTIONS <aOptions> =>;
                      __oForm__:addMapControl( <cControl> , <cName> , "" ,  ,  ,  , [<cField>] , [<lReadOnly>] , [<cMessage>] , "RADIOGROUP" , <nWidth> , <nHeight> , <aOptions> )    


#xcommand FORM SEARCH <cControl> KEY <cKey> CONNECT <cConnect> QUERY <cQuery> WHERE <cWhere> RETURN <cField1> TO <cControl1> [, <cFieldN> TO <cControlN>]  [FORM TITLE <cTitle> TABLE <cTable> BLOCK <bInsert>] GRID WHERE <cGridWhere> FIELDS <aFields> CAPTIONS <aCaptions> WIDTHS <aWidths> ALIGNS <aAligns> =>;
            __oForm__:addLookUp( <cControl> , <cConnect> , <cQuery> , <cWhere> , hb_HSetCaseMatch( { <cField1> => <cControl1> [, <cFieldN> => <cControlN> ] } , .f. ) , hb_HSetCaseMatch( { "gridWhere" => <cGridWhere> , "returnField" => <cKey> , "fields" => <aFields> , "captions" => <aCaptions> , "widths" => <aWidths> , "aligns" => <aAligns> } , .f. ) , __FormInc( <cConnect> , [<cTable>] , [<cTitle>] ) , [{|a|<bInsert>(a)}] )


#xcommand FORM VALID <Valid> => __oForm__:setValid( {|a,b|<Valid>(a,b)} )
#xcommand FORM WHEN <When> => __oForm__:setWhen( {|a,b|<When>(a,b)} )

#xcommand FORM SHOW => __oForm__:Show()
#xcommand FORM RETURN GETS TO <hGet> => <hGet> := __oForm__:getAllGets()

#xcommand FORM BUTTONS OFF => __oForm__:ButtonsOff()
#xcommand FORM BUTTONS ON => __oForm__:ButtonsOn()

#command FORM BEFORE SHOW <xRoutine> =>  __oForm__:setBeforeShow( {|a,b| <xRoutine>(a,b) } )
#command FORM BEFORE SUBMIT <xRoutine> =>  __oForm__:setBeforeSubmit( {|a,b| <xRoutine>(a,b) })

#command FORM ADD HIDDEN FIELD <cField> VAL <xValue> => __oForm__:addHiddenDataField( <cField> , <xValue>  )



#translate IS_FORM_INSERT => IIF( __oForm__:getOper() == "I" , .T. , .F. )
#translate IS_FORM_UPDATE => IIF( __oForm__:getOper() == "A" , .T. , .F. )

#command END FORM RETURN TO BROWSE => RETURN  __oForm__

#command BEGIN FORM VALID <Valid>( <hGet> ) => STATIC FUNCTION <Valid>( __cControl__ , <hGet> );LOCAL __lRet__ := .t.
#command BEGIN FORM WHEN <Valid>( <hGet> ) => STATIC FUNCTION <Valid>( __cControl__ , <hGet> );LOCAL __lRet__ := .t.
#command END FORM => RETURN __lRet__

#command IF CONTROL NAME <cName> => if Upper( __cControl__ ) == Upper(Alltrim(<cName>))
#command CASE CONTROL NAME <cName> => CASE Upper( __cControl__ ) == Upper(Alltrim(<cName>))
