/*
*
* Constantes para usar con conexion a Adodb
*
*/
#xcommand TRY              => bError := errorBlock( {|oErr| break( oErr ) } ) ;;
                                 BEGIN SEQUENCE
#xcommand CATCH [<!oErr!>] => errorBlock( bError ) ;;
                                RECOVER [USING <oErr>] <-oErr-> ;;
                                errorBlock( bError )
#DEFINE LEFT 0
#DEFINE RIGHT 1
#DEFINE CENTER 2

/********************************************************************************
TIPOS DE CURSOR Uso : oRs:Open(SQL_COMMAND, oConexion, Tipo_Cursor, Tipo_Cerrojo)
*********************************************************************************/
#DEFINE adOpenForwardOnly 	0
#DEFINE adOpenKeySet 		1
#DEFINE adOpenDynamic 		2
#DEFINE adOpenStatic 		3

/*******************
Estado de la conexion
********************/
#DEFINE adStateClose 		0
#DEFINE adStateOpen 		1

/**************************************************** 	
TIPO DE CERROJO : Uso : oRs:LockType = adLockReadOnly
*****************************************************/

#DEFINE adLockReadOnly 		1
#DEFINE adLockPessimistic 	2
#DEFINE adLockOptimistic 	3
#DEFINE adBatchOptimistic 	4

#DEFINE adAffectCurrent 	0
#DEFINE adAffectGroup 		1

#DEFINE adUseClient 		3
#DEFINE adUseServer 		2

/*************************** 
*Definicion de tipos de datos 
****************************/

#DEFINE adEmpty 			0
#DEFINE adSmallInt 			2
#DEFINE adInteger 			3
#DEFINE adSingle 			4
#DEFINE adDouble 			5
#DEFINE adCurrency 			6
#DEFINE adDate 				7
#DEFINE adBSTR 				8
#DEFINE adlDispatch 		9
#DEFINE adError 			10
#DEFINE adBoolean 			11
#DEFINE adVariant 			12
#DEFINE adlUnknown 			13
#DEFINE adDecimal 			14
#DEFINE adTinyInt 			16
#DEFINE adUnsignedTyniInt 	17
#DEFINE adUnsignedSmallInt 	18
#DEFINE adUnsignedInt 		19
#DEFINE adBigInt 			20
#DEFINE adUnsignedBigInt 	21
#DEFINE adFileTime 			64
#DEFINE adGUID 				72
#DEFINE adBinary 			128
#DEFINE adChar 				129
#DEFINE adWChar 			130
#DEFINE adNumeric 			131
#DEFINE adUserDefined 		132
#DEFINE adDBDate 			133
#DEFINE adDBTime 			134
#DEFINE adDBTimeStamp 		135
#DEFINE adChapter 			136
#DEFINE adPropVariant 		138
#DEFINE adVarNumeric 		139
#DEFINE adVarChar 			200
#DEFINE adLongVarChar 		201
#DEFINE adVarWChar 			202
#DEFINE adLongVarWChar 		203
#DEFINE adLongVarBinary 	205
#DEFINE adVarBinary 		204
#DEFINE adArray 			8192

/*******
BookMark 
********/
#DEFINE adBookmarkCurrent 	0
#DEFINE adBookmarkFirst 	1
#DEFINE adBookmarkLast 		2

/**********
Valor error
***********/

#define adErrBoundToCommand 3707
#define adErrCannotComplete 3732
#define adErrCantChangeConnection 3748
#define adErrCantChangeProvider 3220
#define adErrCantConvertvalue 3724
#define adErrCantCreate 3725
#define adErrCatalogNotSet 3747
#define adErrColumnNotOnThisRow 3726
#define adErrConnectionStringTooLong 3754
#define adErrDataConversion 3421
#define adErrDataOverflow 3721
#define adErrDelResOutOfScope 3738
#define adErrDenyNotSupported 3750
#define adErrDenyTypeNotSupported 3751
#define adErrFeatureNotAvailable 3251
#define adErrFieldsUpdateFailed 3749
#define adErrIllegalOperation 3219
#define adErrIntegrityViolation 3719
#define adErrinTransaction 3246
#define adErrInvalidArgument 3001
#define adErrInvalidConnection 3709
#define adErrInvalidParamInfo 3708
#define adEddinvalidTransaction 3714
#define adErrinvalidURL 3729
#define adErritemNotFound 3265
#define adErrNoCurrentRecord 3021
#define adErrNotReentrat 3710
#define adErrObjectClosed 3704
#define adErrObjectInCollection 3367
#define adErrObjectNotSet 3420
#define adErrObjectOpen 3705
#define adErrOpeningFile 3002
#define adErrOperationCancelled 3712
#define adErrOutOfSpace 3734
#define adErrPermissionDenied 3720
#define adErrPropConflicting 3742
#define adErrPropInvalidColumn 3739
#define adErrPropInvalidOption 3740
#define adErrPropInvalidValue 3741
#define adErrPropNotAllSettable 3743
#define adErrPropNotSet 3744
#define adErrPropNotSettable 3745
#define adErrPropNotSupported 3746
#define adErrProviderFailed 3000
#define adErrProviderNotFound 3706
#define adErrProviderNotSpecified 3753
#define adErrReadFile 3003
#define adErrResourceExists 3731
#define adErrResourceLocked 3730
#define adErrResourceOutOfScope 3735
#define adErrSchemaViolation 3722
#define adErrSignMismatch 3723
#define adErrStillConnecting 3713
#define adErrStillExecuting 3711
#define adErrTreePermissionDenied 3728
#define adErrUnavailable 3736
#define adErrUnsafeOperation 3716
#define adErrURLDoesNotExist 3727
#define adErrURLNamedRowDoesNotExist 3737
#define adErrVolumeNotFound 3733
#define adErrWriteFile 3004
#define adwrnSecurityDialog 3717
#define adwrnSecurityDialogHeader 3718

/*********************************
OTROS FUNCIONES Y COMANDOS DE ADO.
**********************************

Objeto error del objeto Conexion
Objeto Error
	-Errors -> Coleccion del objeto error
	-Description ->descripcion del error
	-Number -> id/numero del error
	-SQLState -> codigo de error sql
	-Clear	-> elimina los datos del objeto error
	MiConn:Open()
	if MiConn.Errors.Count
		for each error in MiConn:errors
			? Error.Number+" = "+Error.Description
		next
	end
	
	

Metodos de navegacion
----------------------
Rs:Move( n | -n ) Avanza/retrocede el puntero n veces 
Rs:MoveFirst 
Rs:MoveNext
Rs:MoveLast
Rs:MovePrevious

Propiedades del recordset
-------------------------
AbsolutePosition  Setget indica/asigna la posicion del puntero del recordset
Rs:Bof
Rs:Eof
Rs:RecordCount numero de registros que contiene el Rs.

Metodos
Rs:AddNew()	
	crea un nuevo registro
	Rs:AddNew()
		rs("nombre") = "luis"
		rs("edad") = 39
	Rs:Update()
	
	-Modificar un registro
	Rs:("nombre") = "Juan"
	Rs:Update()
	
Rs:CanceUpdate() 
	Cancela el proceso de actualizacion

Rs:Clone() 
	crea una copia del recordset 
	Rs2 := Rs:Clone()

Rs:Close()
	cierra el objeto recordset
Rs:Delete()
	elimina el registro actual del recordset

Rs:GetRows()
	Crea un arreglo con el contenido del recordset

Rs:NextRecordSet()
	Se carga el recordset siguiente en el caso de paginacion

Rs:Requery()
	Se actualiza el recordset refrescando los cambios que hubo en la tabla

Rs:Supports()
	valida si el rs abierto soporta algun metodo o funcion en particular.
Rs:Update()
	actualiza la tabla a la que hace referencia el objeto recordset haciendo
	efectivos los cambios
Rs:AbsolutePage
	Cuando se haya paginado el recordset con esta propiedad se puede 
	determinar la pagina.
Rs:ActiveConnection()
	Sirve para leer el DSN o la ruta correspondiente a la conexion
	relacionada con el rs.
Rs:Bookmark
	devuelve o fija un identificador para el registro actual.
Rs:CacheSize
	Define el numero de registros o filas que el recordset va a
	pre-almacenar en la memoria cache
Rs:EditMode
	señala el estado de edicion de un registro. Existen 3 posibilidades
	- adEditNone : registro no se encuentra editado
	- adEditInProgress : registro en edicion pero no se ha grabado
	- adEditAdd : se ha llamado al metodo AddNew
Rs:Filter
	permite filtrar un recordset manteniendo solo los registros
	que  superen ese filtro
	cFiltro = "Fecha="+dtoc( date() )
	rs:Filter := cfiltro
Rs:MaxRecords
	Permite fijar el numero maximo de registros que aceptara el Rs.
	El valor por defecto es 0 e indica que no existirá limite
Rs:PageCount
	Indica cuantas paginas tenemos en funcion del tamaño de cada pagina
	que hemos definido con PageSize
Rs:PageSize
	define el numero de registros o filas que forman una pagina
	por defecto son 10.
Rs:State
	señala el estado del rs. Existen 2 posibilidades
	- adStateClose : el rs esta cerrado
	- adStateOpen : el rs esta abierto

Colecciones

Rs:Fields : 
	representa un campo del registro actual y se puede acceder por
	su indice o su nombre
	? Rs:Fields(1)  // devuelve el valor del campo 1
	? Rs:Fields('rut') // devuelve el valor del campo rut

Rs:Properties( xPropiedad )
	permite acceder a las propiedades del rs ya sea las que vienen por
	defecto o las que hayamos modificado.

*/


