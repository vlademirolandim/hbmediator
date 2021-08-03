*@Includes
*Auto=No
/**
Não modifique essa classe.

Valores das diretivas de isql.ch
(informados no seu arquivo hbp através de -d)

1. __SISTEMAS_ODBC__          , requer hbodbc.hbc
2. __SISTEMAS_ADO__           , requer hbwin.hbc
3. __SISTEMAS_SQLITE__        , requer hbsqlit3.hbc
4. __SISTEMAS_POSTGRES__      , requer hbpgsql.hbc


// Esse arquivo foi retirado do diagrama feito no DIA. 

*/
#include "hbclass.ch"
#include "isql.ch"
#include "vbase.ch"

*@@Includes
*@Functions
*Auto=Yes
**************************************************
* Functions section
**************************************************
*@@Functions

*@HeadClass
*Auto=Yes
/****c* ISQL/ISQL
* NAME
*
*  ISQL
*
* DESCRIPTION
*
* Interface to VSQL
*
* NOTES
*
*
*
* SOURCE
*/

CREATE CLASS ISQL INHERIT VObject
*@@HeadClass

*@BodyClass
*Auto=Yes
    * Attributes and methods

    EXPORTED:
    METHOD New(cIDDatabase,cDataSource,lIsConfigEncrypted,lType) 

ENDCLASS
*@@BodyClass



*@New_MethodHead
*Auto=Yes
/****m* ISQL/New
* NAME
*
*  New
*
* DESCRIPTION
*
* 
*
* INPUTS
*
*  cIDDatabase : 
*
*
*  cDataSource : 
*
*
*  lIsConfigEncrypted : 
*
*
* SOURCE
*/
METHOD New(cIDDatabase,cDataSource,lIsConfigEncrypted,lType) CLASS ISQL

*@@New_MethodHead

*@New_MethodDeclareVar
*Auto=No
    /* LOCAL variables */
    LOCAL oSQL // Objeto com o banco de dados selecionado / Object with database selected
    LOCAL xIni, hIni // Hash with connect config
    LOCAL hConfig := { => }

*@@New_MethodDeclareVar
*@New_MethodDefaultValue
*Auto=Yes
    /* Default values */
    hb_Default( @cDataSource , "database.ini" )
    hb_Default( @lIsConfigEncrypted , .t. )
    hb_Default( @lType, .f. )
*@@New_MethodDefaultValue


*@New_MethodCore
*Auto=No
    /* Core section */
    IF Empty( cIDDataBase )
        LOG _t( _t( "ID for database not informed" ) ) ERROR CODE 20200622075900
        RETURN NIL
    ENDIF
   
    IF lType // MEMORY
        cDataSource := HB_BASE64DECODE( GetEnv( cIDDatabase ) )
        IF lIsConfigEncrypted
            hIni := hb_IniReadStr( VLJ_Decrypt( cDataSource ) )
        ELSE
            hIni := hb_iniReadStr( cDataSource )
        ENDIF       

    ELSE // File    
    
        /* Read INI file */
        IF Empty( cDataSource )
            LOG ::setLastMessage(  _t( "Config file not informed" )) ERROR CODE 20200712210213
            RETURN NIL
        ELSE
            IF ! File( cDataSource )
                LOG ::setLastMessage( _t( "The configuration file (filename: %s) not found", cDatasource ) ) ;
                    ERROR CODE 20200712210743
                RETURN NIL
            ENDIF
        ENDIF
        IF lIsConfigEncrypted
            hIni := VLJ_DecryptINI( cDataSource )
        ELSE
            hIni := hb_iniRead( cDataSource )
        ENDIF       
        
    ENDIF

    IF ! cIDDataBase $ hIni
        LOG ;
        ::setLastMessage( _t( "Database identify (id: %s) not found. Datasource name: %s, Type: %s", cIDDataBase, cDataSource, IIF(lType,"MEMORY","FILE") ) );
        ERROR CODE 20200710015211
        RETURN .F.
    ELSE
        FOR EACH xIni IN hIni[ cIDDataBase ]

            DO CASE
            CASE Upper( xIni:__enumKey() ) == "TYPE"
                hConfig[ "DATABASETYPE" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "NAME"
                hConfig[ "DATABASENAME" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "PATH"
                hConfig[ "DATABASEPATH" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "STRINGODBC"
                hConfig[ "STRINGODBC" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "IP"
                hConfig[ "DATABASEIP" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "PORT"
                hConfig[ "DATABASEPORT" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "USR"
                hConfig[ "DATABASEUSR" ] := xIni

            CASE Upper( xIni:__enumKey() ) == "PWD"
                hConfig[ "DATABASEPWD" ] := xIni
    
         ENDCASE
        NEXT

    ENDIF

    SWITCH ( Upper( hConfig[ "DATABASETYPE" ] ) )
    CASE "ODBC"

#ifndef __SISTEMAS_ODBC__
        LOG ::setLastMessage(;
                _t( "ODBC support doesn't include in this compilation" )) ERROR CODE 20200712213830
        RETURN NIL
#else

        IF .NOT. HB_HHASKEY( hConfig , "STRINGODBC" )
            LOG ::setLastMessage( _t( "ODBC String not informed" )) ERROR CODE 20200712214141
            RETURN NIL
        ENDIF
        // Database type (string ODBC)
        oSQL := VODBC():New()
        oSQL:setStringConnection( hConfig[ "STRINGODBC" ] )

        EXIT // NÃO ESQUEÇA DESSE COMANDO
#endif

    CASE "ADO"

#ifndef __SISTEMAS_ADO__
            LOG ::setLastMessage(;
                    _t( "ADO support doesn't include in this compilation" )) ERROR CODE 20200715162905
            RETURN NIL
#else
    
            IF .NOT. HB_HHASKEY( hConfig , "STRINGODBC" )
                LOG ::setLastMessage( _t( "ODBC String not informed" )) ERROR CODE 20200715164709
                RETURN NIL
            ENDIF
            oSQL := VSQLADO():New()
            oSQL:setStringConnection( hConfig[ "STRINGODBC" ] )
    
            EXIT // NÃO ESQUEÇA DESSE COMANDO
#endif
    
            
    CASE "SQLITE"

#ifndef __SISTEMAS_SQLITE__
        LOG ::setLastMessage( _t( "Sqlite support doesn't include in this compilation" )) ;
            ERROR CODE 20200712214520
        RETURN .F.
#else

        IF .NOT. hb_HHasKey( hConfig , "DATABASENAME" )
            LOG ::setLastMessage( _t( "SQLITE / Database name not informed" ));
                 ERROR CODE 20200712214701
            RETURN .F.
        ENDIF
        oSQL := VSQLite():New()
        oSQL:SetDatabaseName( hConfig[ "DATABASENAME" ] )
        oSQL:SetDataBasePath( hConfig[ "DATABASEPATH" ]  )

        EXIT // NÃO ESQUEÇA DESSE COMANDO
#endif
    CASE "PGSQL"

#ifndef __SISTEMAS_POSTGRES__
        LOG ::setLastMessage( _t( "PostgreSQL support doesn't include in this compilation" ) );
            ERROR CODE 20200712214946
        RETURN .F.
#else
        IF .not. HB_HHASKEY( hConfig , "DATABASENAME" ) //
            LOG ::setLastMessage(  _t( "PostgreSQL database not informed" ) );
                ERROR CODE 20200712215208
            RETURN .F.
        ENDIF
        oSQL := VPostgreSQL():New()
        oSQL:SetDatabaseName( hConfig[ "DATABASENAME" ] )
        oSQL:SetDataBasePort( hConfig[ "DATABASEPORT" ]  )
        oSQL:SetDataBaseIP( hConfig[ "DATABASEIP" ] )
        oSQL:SetDataBaseUSR( hConfig[ "DATABASEUSR" ] )
        oSQL:SetDataBasePWD( hConfig[ "DATABASEPWD" ] )
        
        EXIT // NÃO ESQUEÇA DESSE COMANDO
#endif

    OTHERWISE
        LOG ::setLastMessage( _t( "Database type not found (Type informed: %s)",;
                      hb_ValToExp( hConfig["DATABASETYPE"] ) ) ) ERROR CODE 20200712215553
    ENDSWITCH
    
    RETURN oSQL
/************/
*@@New_MethodCore
