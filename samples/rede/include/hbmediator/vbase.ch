#ifndef __VBASE__
#define __VBASE__
/**
 * Config (sistemas03)
 *
 */

//#command INIT CONFIG => InitConfig()
#command CONFIG INIT [<xConfig>] => InitConfig( [<xConfig>] )
#command CONFIG INIT FILE <cFile> RUNTIME => InitConfig( hb_MemoRead( <cFile> ) )
#command CONFIG INIT FILE <cFile> COMPILE =>  #pragma __streaminclude <cFile> | InitConfig( %s )

#command CONFIG INIT TUI FILE <cFile> RUNTIME => ConfigTUISingleton( hb_MemoRead( <cFile> ) ) 
#command CONFIG INIT tui FILE <cFile> COMPILE =>  #pragma __streaminclude <cFile> | ConfigTUISingleton( %s  )

#command CONFIG LOG LEVEL FATAL  => ConfigSetLogLevel( 1 )                                                                                           
#command CONFIG LOG LEVEL ERROR => ConfigSetLogLevel( 2 ) 
#command CONFIG LOG LEVEL WARNING => ConfigSetLogLevel( 3 ) 
#command CONFIG LOG LEVEL INFO => ConfigSetLogLevel( 4 ) 

#command CONFIG LOG DISPLAY ON => ConfigLogDisplayOn()
#command CONFIG LOG DISPLAY OFF => ConfigLogDisplayOff()

//#command CONFIG SEND ERRORS TO SCREEN ON => ConfigSendErrorsToScreenOn()
//#command CONFIG SEND ERRORS TO SCREEN OFF => ConfigSendErrorsToScreenOff()

//#command CONFIG APP TYPE CONSOLE => ConfigAppTypeConsole()
//#command CONFIG APP TYPE HMG => ConfigAppTypeHMG()

#define CONFIG_FATAL 1
#define CONFIG_ERROR 2
#define CONFIG_WARNING 3
#define CONFIG_INFO 4

//#define CONFIG_LOG_LEVEL ConfigGetLogLevel()

#command CONFIG DATABASE INI <cDatabaseINIFile> [OLD <cOldDatabaseINIFile> ] => [ <cOldDatabaseINIFile> := ] ConfigDatabaseINI( <cDatabaseINIFile> )
//#command CONFIG DEFAULT DATABASE <cDatabase> => ConfigSetDefaultDatabase( <cDatabase> ) 
//#define CONFIG_DEFAULT_DATABASE ConfigGetDefaultDatabase()



/*
*
* Debug (sistemas05)
*
*/
#if __pragma( DEBUGINFO )

#command DEBUG DISPLAY <xVar> [<stop: STOP>] => __MVPUT("__DEBUG_DISPLAY_" + <(xVar)> , "VarName: " + <(xVar)> + " / Type: " + VALTYPE( <xVar> ) + " / Value: " + IIF( VALTYPE( <xVar> ) == "P" , hb_ValToStr( <xVar> ) , hb_ValToExp( <xVar> ) ) ) [;IIF( <.stop.> , ALTD() , NIL )]
#command DEBUG BP <lCond> => IIF( <lCond> , ALTD() , NIL ) 
#command DEBUG BP => ALTD()
#command DEBUG DUMP <xStruct> [TITLE <cName>] [TO FILE <(cFile)>] [<full: FULL>] => __FDebugDump( <xStruct> , [<cName>] , [<(cFile)>] , <.full.> )
#command DEBUG MINI DUMP <xStruct> [TITLE <cName>] [TO FILE <(cFile)>] => __FDebugDump( HB_ValToExp(<xStruct>) , [<cName>] , [<(cFile)>] )
#command DEBUG ALIAS [<cAlias>] [TO FILE <(cFile)>] => __FDebugAlias( [<cAlias>] , [<(cFile)>] ) 
#command DEBUG ENV [TO FILE <(cFile)>] => __FDebugEnv( [<(cFile)>] ) 
#command DEBUG BEGIN BLOCK <cMessage> [TO FILE <(cFile)>] => __FBeginBlock( <cMessage> , [<cFile>] )
#command DEBUG END BLOCK [TO FILE <(cFile)>] => __FEndBlock( [<cFile>] )

#else

#command DEBUG DISPLAY <*nil*> => 
#command DEBUG DUMP <*nil*> =>  
#command DEBUG MINI DUMP <*nil*> => 
#command DEBUG BP <*nil*> => 
#command DEBUG BP =>
#command DEBUG ALIAS <*NIL*> =>
#command DEBUG ENV <*NIL*> =>
#command DEBUG BEGIN BLOCK <cMessage> =>
#command DEBUG END BLOCK =>

#endif

/**
*
* Log (sistemas06)
*
*/

#command LOG GROUP <cName> => FSetGroupLog( <cName> )
#command LOG GROUP END => FSetGroupLOG(   "__ERASE__LABEL__LOG__"    )

#command LOG <cTexto> ERROR    [ TO <cMess>] [<lm: UPDATE LAST MESSAGE>] [CODE <ncode>] => [ <cMess> := ] FLogWrite( [hb_StrFormat("(CODE:%d) ",<ncode>) + ] <cTexto> , 2  ) [; IIF( <.lm.> , ::setLastMessage( <cTexto> , <ncode> ) ,  ) ]
#command LOG <cTexto> WARNING  [ TO <cMess>] [<lm: UPDATE LAST MESSAGE>] [CODE <ncode>] => [ <cMess> := ] FLogWrite( [hb_StrFormat("(CODE:%d) ",<ncode>) + ] <cTexto> , 3  ) [; IIF( <.lm.> , ::setLastMessage( <cTexto> , <ncode> ) ,  ) ]  
#command LOG <cTexto> INFO     [ TO <cMess>] [<lm: UPDATE LAST MESSAGE>] [CODE <ncode>] => [ <cMess> := ] FLogWrite( [hb_StrFormat("(CODE:%d) ",<ncode>) + ] <cTexto> , 4  ) [; IIF( <.lm.> , ::setLastMessage( <cTexto> , <ncode> ) ,  ) ]
#command LOG TEXT <cConteudo> [TO FILE <(cFile)>] [TAG <cTag>] => FlogTxt( <cConteudo> , [<(cFile)>] , [<cTag>] )

/**
*
* Commands 
*
*/
                                                                                                                                                                                                            
#command STD OUT <cPrint> => OutStd(hb_eol());OutStd(<cPrint>);FWrite( 1, <cPrint> + hb_eol() )
#command STD ERR <cPrint> [ <qt: QUIT> ] => OutErr(hb_eol());OutErr( <cPrint> );FWrite( 2, <cPrint> + hb_eol() );ERRORLEVEL(1);IIF( <.qt.> , __Quit() , QQout("") ) 
#command STD ERR <cPrint> [ <qt: QUIT> <nErrorLevel> ] => OutErr( hb_eol() );OutErr( <cPrint> );FWrite( 2 , <cPrint> + hb_eol()  );ERRORLEVEL( <nErrorLevel> );IIF( <.qt.> , __Quit() , QQout("") )

#xtranslate TEXT INTO <v> [<rst:RESET>]   => #pragma __text|<v>+=%s;IIF(<.rst.>,<v>:="",)  
#xtranslate TEXT TO VAR <v>  => #pragma __text|<v>+=%s;<v>:=""

/**
* 
* Errorsys
*
*
*/

//#command ERRORSYS SIMPLE LOG =>  PROCEDURE ERRORSYS; ErrorBlock( { |e| __FErrorSys01( e ) } ) ;  RETURN

#command MODULE ERROR => LOCAL ___oError
#command CONTROL => begin sequence with __breakblock()
#command IFERROR <cTexto> => recover using ___oError; FLogWrite( "{"+PROCNAME()+"("+ALLTRIM(STR(PROCLINE()))+")"+ "}" + <cTexto> , 1 , ___oError )
#command ENDCONTROL => __Quit();end
/*
*
* Lang
*
*
*/
#xtranslate _t( <cStr> ) => hb_i18n_gettext( <cStr> )
#xtranslate _t( <cStr> , <explist,...> ) => hb_strFormat( hb_i18n_gettext( <cStr> ) , <explist> )


/*
*
* Object message and logs
*
* SET LAST MESSAGE must be used inside class (must be method ::SetLastMessage)
*/
#command SET LAST MESSAGE <cMessage> => ::SetLastMessage( <cMessage> )
#command CLEAR LAST MESSAGE => ::SetLastMessage("")
#command SET LAST MESSAGE <cMessage> ERROR =>  ::SetLastMessage( <cMessage> );FLogWrite( "{"+PROCNAME()+"("+ALLTRIM(STR(PROCLINE()))+")"+ "}" + <cMessage> , 2  ) 
#command SET LAST MESSAGE <cMessage> WARNING =>  ::SetLastMessage( <cMessage> );FLogWrite( "{"+PROCNAME()+"("+ALLTRIM(STR(PROCLINE()))+")"+ "}" + <cMessage> , 3  ) 
#command SET LAST MESSAGE <cMessage> INFO =>  ::SetLastMessage( <cMessage> );FLogWrite( "{"+PROCNAME()+"("+ALLTRIM(STR(PROCLINE()))+")"+ "}" + <cMessage> , 4  ) 

/********/
#endif
