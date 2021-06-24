#include "vbase.ch"
#include "button.ch"
#include "inkey.ch"

PROCEDURE Hbm_BootStrap
   LOCAL cJsonConfig, cConfig AS CHARACTER
   LOCAL oMainMenu
   LOCAL nOpc
   LOCAL oScreen
   LOCAL cTela

   #pragma __streaminclude "config.json" | cConfig := %s // Compile time
   CONFIG INIT cConfig
   CONFIG LOG LEVEL ERROR
   #pragma __streaminclude "tui.json" | cJsonConfig := %s // Compile time
   ConfigTUISingleton( cJsonConfig )  

   oMainMenu := MyMenu()
   nOpc := 1
   CLS
   SAVE SCREEN TO cTela
   oScreen := VCmd():New()
   DO WHILE .T.
       RESTORE SCREEN FROM cTela
       oScreen:standardScreen()
       
       KEYBOARD chr(K_ENTER)
       @ 4, 2 SAY " .: Menu >> "
       nOpc := MenuModal( oMainMenu, Int( nOpc / 10 ), ;
          MaxRow()-1, 2, MaxCol()-2, ;
          oMainMenu:colorSpec )
 
       
       
      DO CASE
 
         CASE nOpc == -1
               IF Alert("Exit ?",{"Yes","No"})==1
                  EXIT
               ENDIF    
         CASE nOpc == 11
            HbmLoad("bancoconta")

      OTHERWISE
 
      ENDCASE
   ENDDO    

RETURN

#include "fcmd.ch"
STATIC FUNCTION MyMenu

    LOCAL oMainMenu, hMenu
    LOCAL hElement
    LOCAL aItem, oItem, oSubMenu    
    LOCAL bMenuBlock := {|| NIL } 
    LOCAL cMenuColor := COLOR_MENU 

    hMenu := { => }
    hMenu[ "[ Cadastros ]" ] := { ;
       { " Conta corrente ", , "", 11 } ;
       }
 

    oMainMenu  := HBTopBarMenu():new( 4, 14, 80 ) //MaxCol() -3 )
    oMainMenu:colorSpec := cMenuColor
 
 
    FOR EACH hElement IN hMenu
       oSubMenu  := Popup():new()
       oSubMenu:colorSpec := oMainMenu:colorSpec
       FOR EACH aItem IN hElement
          oItem := MenuItem():new( aItem[ 1 ], ;
             bMenuBlock, ;
             aItem[ 2 ], ;
             aItem[ 3 ], ;
             aItem[ 4 ]  )
          oSubMenu:addItem ( oItem )
 
       NEXT
       oItem := MenuItem():new( hElement:__enumKEY, oSubMenu )
       oMainMenu:AddItem( oItem )
    NEXT

RETURN oMainMenu