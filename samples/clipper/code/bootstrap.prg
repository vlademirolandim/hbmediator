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
   // Aqui � o la�o do menu
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
            HbmLoad("11intro")
         CASE nOpc == 12
            HbmLoad("12intro")
         CASE nOpc == 13
            HbmLoad("13intro")
         CASE nOpc == 14
            HbmLoad("14range")
         CASE nOpc == 15
            HbmLoad("15valid")      
         CASE nOpc == 16
            HbmLoad("16valid")      
         CASE nOpc == 17
            HbmLoad("17when")      
         CASE nOpc == 18
            HbmLoad("18when")      
         CASE nOpc == 20
            HbmLoad("20picture")      
         CASE nOpc == 21
            HbmLoad("21picture")      
         CASE nOpc == 30
            HbmLoad("30checkbox")   
         CASE nOpc == 31
            HbmLoad("31listbox")                                            
         CASE nOpc == 32
            HbmLoad("32button")             
         CASE nOpc == 33
            HbmLoad("33radio")                         
         CASE nOpc == 34
            HbmLoad("34tbrowse")                                     
         CASE nOpc == 35
            HbmLoad("35setdelimiters")
         CASE nOpc == 36
            HbmLoad("36cleargets")
         CASE nOpc == 37
            HbmLoad("37intensity")            
         CASE nOpc == 38
            HbmLoad("38cursor")                
         CASE nOpc == 40
            HbmLoad("40checkbox")
         CASE nOpc == 41
            HbmLoad("41listbox")
            
      OTHERWISE
 
      ENDCASE
   ENDDO    

RETURN
PROCEDURE MyPause( cFile )

    LOCAL oCfg := ConfigTUISingleton()
    LOCAL nKey

    @ oCfg:getMaxRow()-1,4 SAY "Press. (1) to see code or any other key to continue" COLOR oCfg:getColorTextAttention() 
    nKey := Inkey(0)
    IF Chr( nKey ) == "1"
        cFile := "code" + hb_ps() + Lower( cFile )
        IF FILE( cFile + ".prg" )
            @ 0,0 TO oCfg:getMaxRow(),oCfg:getMaxCol()
            @ oCfg:getMaxRow(),oCfg:getMaxCol() + 10 SAY "Press. ESC key to continue                " COLOR oCfg:getColorAlert()
            MemoEdit( hb_MemoRead( cFile + ".prg") , 1 , 1 , oCfg:getMaxRow()-1,oCfg:getMaxCol()-1 , .F. )
        ENDIF        
    ENDIF    

RETURN

#include "fcmd.ch"
STATIC FUNCTION MyMenu

    LOCAL oMainMenu, hMenu
    LOCAL hElement
    LOCAL aItem, oItem, oSubMenu    
    LOCAL bMenuBlock := {|| NIL } 
    LOCAL cMenuColor := COLOR_MENU 

    hMenu := { => }
    hMenu[ "[ Basic ]" ] := { ;
       { " Form with one field ", , "", 11 }, ;
       { " Form with two fields ", , "", 12 }, ;
       { " Form with hint in each field ", , "", 13 }, ;       
       { " Range ", , "", 14 }, ;
       { " Valid I ", , "", 15 } , ;
       { " Valid II ", , "", 16 } , ;
       { " When I ", , "", 17 } , ;
       { " When II ", , "", 18 } ;
       }
 
    hMenu[ "[ Basic II ]" ] := { ;
         { " Picture I (Functions) ", , "", 20 },  ;       
         { " Picture II (Functions) ", , "", 21 }  ;           
       }
 
    hMenu[ "[ Intermediate ]" ] := { ;
       { " Checkbox  ", , "", 30 },  ;       
       { " Listbox ", , "", 31 },  ;           
       { " PushButton ", , "", 32 },  ;                  
       { " Radio ", , "", 33 } , ;                         
       { " TBrowse ", , "", 34 } , ;       
       { " Set delimiters ", , "", 35 },  ;       
       { " Gets read only (Clear gets) ", , "", 36 } , ;       
       { " Intensity off ", , "", 37 } , ;              
       { " Set Cursor ", , "", 38 }  ;           
     }

    hMenu[ "[ Intermediate II ]" ] := { ;
       { " Checkbox  ", , "", 40 },  ;       
       { " Listbox ", , "", 41 },  ;           
       { " PushButton ", , "", 42 },  ;                  
       { " Radio ", , "", 43 } , ;                         
       { " TBrowse ", , "", 44 }  ;       
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
