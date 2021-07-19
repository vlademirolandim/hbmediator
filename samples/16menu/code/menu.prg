/***
*
*  Menu.prg
*
*
***/
#include "form.ch"

function hbm_menu()
   // Clear the screen
   MODULE MENU 
    // Allow mouse actions to take place
   SET( _SET_EVENTMASK, INKEY_ALL )

   // Make the mouse cursor visible
   msetcursor(.T.)
   cls

  

      // TopBar() creates the menu at the very top of the screen
      MENU INIT  
      MENU ADD ITEM "&File" 
      MENU ADD SUBITEM "&New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" CHECKED
      MENU ADD SUBITEM "&New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" DISABLED
      MENU ADD POPUP "Popup" 
      MENU ADD POPUP ITEM "&Popup New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" 
      MENU ADD POPUP ITEM "&Popup New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" CHECKED
      MENU ADD ITEM "Manut"
      MENU ADD SUBITEM "Print file" BLOCK {||MyPrintFile()} 
      MENU ADD SUBITEM "Exit" EXIT
      MENU SHOW

RETURN nil


// The following are dummy functions which do not do anything
// These functions are here to avoid receiving Unresolved External
// Errors

FUNCTION MyCreateFile()
RETURN NIL

FUNCTION MyOpenFile()
RETURN NIL

FUNCTION MySaveFile()
RETURN NIL

FUNCTION MyPrintFile()
RETURN NIL

FUNCTION MyUndo()
RETURN NIL

FUNCTION MyCut()
RETURN NIL

FUNCTION MyCopy()
RETURN NIL

FUNCTION MyPaste()
RETURN NIL

FUNCTION MyGoToLine()
RETURN NIL

FUNCTION MyGoTop()
RETURN NIL

FUNCTION MyGoBottom()
RETURN NIL

FUNCTION MySearch()
RETURN NIL

FUNCTION MyAutoSave()
RETURN NIL

FUNCTION MyTabStops()
RETURN NIL
