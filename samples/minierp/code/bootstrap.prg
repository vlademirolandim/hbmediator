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
   //nOpc := 1
   CLS
   SAVE SCREEN TO cTela
   oScreen := VCmd():New()
   DO WHILE .T.
       RESTORE SCREEN FROM cTela
       oScreen:standardScreen()
       
       KEYBOARD chr(K_ENTER)
       @ 4, 2 SAY " .: Menu >> "
       nOpc := MenuModal( oMainMenu,  1 , ;
          MaxRow()-1, 2, MaxCol()-2, ;
          oMainMenu:colorSpec )
 
       
       
      DO CASE
         CASE nOpc == -1
               IF Alert("Exit ?",{"Yes","No"})==1
                  EXIT
               ENDIF    
         CASE nOpc == 11
            HbmLoad("bancoconta")
         CASE nOpc == 12
            HbmLoad("banco")
         CASE nOpc == 13
            HbmLoad("fornecedor")
         CASE nOpc == 14
            HbmLoad("cliente")
         CASE nOpc == 21
            HbmLoad("cpagar")
         CASE nOpc == 23
            HbmLoad("venda")
         CASE nOpc == 31
            HbmLoad("conta")
         CASE nOpc == 32
            HbmLoad("formapagamento")
            


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
    LOCAL oCfgTUI := ConfigTUISingleton()
    LOCAL cMenuColor := oCfgTUI:getColorMenu()
    LOCAL nLargura := 0, xElem

set console on

    hMenu := { => }
    hMenu[ "[ Cadastros ]" ] := { ;
       { " &Conta corrente ", , "", 11 } ,;
       { " Movimentação Bancária" , , "" , 12 } ,;
       { " Fornecedor " , , "" , 13 } ,;
       { " Cliente " , , "" , 14 } ;
       }
       
     hMenu[ "[ Movimentações ]" ] := { ;
       { " Contas a pagar ", , "", 21 }, ;
       { " Vendas ", , "" , 23 } ;
       }
 
       
     hMenu[ "[ Configurações ]" ] := { ;
       { " &Contas ", , "", 31 } ,;
       { " Forma de pagamento ", , "", 32 } ;
       }
 
    FOR EACH xElem IN hMenu
        nLargura += LEN( xElem:__enumkey() ) + 2
    NEXT    

                                             // Coluna onde termina a barra horizontal
    oMainMenu  := HBTopBarMenu():new( 4, 14, 14+nLargura ) //MaxCol() -3 )
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
