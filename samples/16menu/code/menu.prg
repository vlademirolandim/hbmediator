/***
*
*  Menu.prg
*
*  Sample menu handling functions
*
*  Copyright (c) 1990-1995, Computer Associates International Inc.
*  All rights reserved.
*
*  This is not meant to run as a standalone file.  There are function
*  calls from within this file (such as MyCreateFile()) that do not
*  exist.  This code can be modified, however, for your use.  If it
*  is modified, use the /n switch when compiling.
*
*  Compile: CLIPPER menu /n
*  Link: EXOSPACE FI menu
*
***/

   #include "button.ch"   // Menu definitions
   #include "inkey.ch"    // Key definitions


// This function sets up the environment and then calls MENU_Create() to
// create the menu.  Finally, it waits for a menu event to occur by calling
// the MenuModal() function.

function hbm_menu()
   local oInfo

   // Allow mouse actions to take place
   SET( _SET_EVENTMASK, INKEY_ALL )

   // Make the mouse cursor visible
   msetcursor(.T.)

   // Clear the screen
   cls

   // Create the menu
   oInfo=MENU_Create()

   // Wait for a menu event and do not exit until File/Exit is chosen
   DO WHILE MenuModal(oInfo,1,24,1,79,"r/w") <> 999
   ENDDO

   return(NIL)



// This function will create the menu and return the newly created
// MenuObject as its return value.  This menu consists of three "Main Menu choices" ..
// File, Edit, and Options.  Additionally, the Edit TopBarMenu item has a secondary menu for
// one of its menu items.

#command MODULE MENU => LOCAL oTopBar, oPopUp, oItem, oPopUp1
#command MENU INIT ROW <nRow> COL <nCol> WIDTH <nWidth> => oTopBar := TopBar( <nRow>, <nCol>, <nWidth> )
#command MENU ADD ITEM <cTitle> => oTopBar:AddItem( MenuItem( <cTitle> , oPopUp ) )
#command MENU ADD SUBITEM <cTitle> BLOCK <bBlock> [KEY <nKey>] [MESSAGE <cMessage>] [<disabled:DISABLED>] [<checked:CHECKED>] =>;
        oItem :=MenuItem( <cTitle> ,<bBlock> , [<nKey>] , [<cMessage>] ) [; oItem:Enabled := .not. <.disabled.>] [; oItem:Checked := <.checked.>] ;oPopUp:AddItem( oItem ) 

#command MENU ADD POPUP <cTitle> => oPopUp1 := PopUp();oItem := MenuItem( <cTitle> , oPopUp1 );oPopUp:AddItem( oItem )

#command MENU ADD POPUP ITEM  <cTitle> BLOCK <bBlock> [KEY <nKey>] [MESSAGE <cMessage>] [<disabled:DISABLED>] =>;
        oItem :=MenuItem( <cTitle> ,<bBlock> , [<nKey>] , [<cMessage>] ) [; oItem:Enabled := .not. <.disabled.>];oPopUp1:AddItem( oItem ) 

#command MENU SEPARATOR =>  oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )


function MENU_Create()
   //local oTopBar, oPopUp, /*oPopUp1,*/ oItem
   MODULE MENU
   local oCfg := ConfigTUISingleton()


      // TopBar() creates the menu at the very top of the screen
      MENU INIT ROW 0 COL 0 WIDTH 78
      oTopBar:ColorSpec :=  "b/w,gr+/rb,r/w,g/rb,n+/w,w+/b"


      // Create a new popup menu named FILE and add it to the TopBar object
      oPopUp := PopUp()
      oPopUp :ColorSpec:= "b/w,gr+/rb,r/w,g/rb,n+/w,w+/b"

      MENU ADD ITEM "&File" 
//      oTopBar:AddItem( MenuItem ( "&File",oPopUp) )


      // Add some menu items to the newly created File popup

      MENU ADD SUBITEM "&New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" CHECKED
      MENU ADD SUBITEM "&New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" DISABLED
      MENU ADD POPUP "Popup" 
      MENU ADD POPUP ITEM "&Popup New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" 
      MENU ADD POPUP ITEM "&Popup New" BLOCK {||MyCreateFile()} KEY K_CTRL_N MESSAGE "Create new file" 
    
//      oItem :=MenuItem( "&New" ,{|| MyCreateFile() }, K_CTRL_N,"Create a new file", 101)
//      oPopUp:AddItem( oItem)


      oItem :=MenuItem( "&Open..." ,{|| MyOpenFile() }, K_CTRL_O,"Open a file")
      oPopUp:AddItem( oItem)


      oItem :=MenuItem( "Sa&ve" ,{|| MySaveFile() }, K_CTRL_V,"Save a file")

      // Disable this menu item
      oItem:Enabled := .f.
      oPopUp:AddItem( oItem)


      // Add a separator
      oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )


      oItem :=MenuItem( "&Print..." ,{|| MyPrintFile() }, K_CTRL_P,"Print a file")
      // Disable this menu item
      oItem:Enabled := .f.
      oPopUp:AddItem( oItem)


      // Another separator
      oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )


      oItem :=MenuItem( "E&xit" ,{|| .t. }, K_ALT_F4,"End of application", 999)
      oPopUp:AddItem( oItem)

//////////////////////////////////////////////////

      // Create a second popup menu named EDIT and attach it to oTopBar
      oPopUp := PopUp()
      oPopUp :ColorSpec:= "b/w,gr+/rb,r/w,g/rb,n+/w,w+/b"
      oTopBar:AddItem( MenuItem ( "&Edit",oPopUp) )

      // Add some menu items to this EDIT popup menu
      oItem :=MenuItem( "&Undo" ,{|| MyUndo() }, K_CTRL_Z,"Reverse changes made to this file")
      oPopUp:AddItem( oItem)


      oItem :=MenuItem( "Cu&t" ,{|| MyCut() }, K_CTRL_X,"Cut to clipboard")
      oPopUp:AddItem( oItem)


      oItem :=MenuItem( "&Copy" ,{|| MyCopy() }, K_CTRL_C,"Copy to clipboard")
      oPopUp:AddItem( oItem)


      oItem :=MenuItem( "&Paste" ,{|| MyPaste() }, K_CTRL_V,"Paste from clipboard")
      oPopUp:AddItem( oItem)
/*
      // Another separator
     oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )


      // Create a new popup menu on the EDIT popup menu named Go.  (This is also
      // known as a "Cascading" menu.)
      oPopUp1 := PopUp()
      oPopUp1 :ColorSpec:= "b/w,gr+/rb,r/w,g/rb,n+/w,w+/b"
      oItem :=MenuItem( "&Go",oPopUp1 )

      oPopup:AddItem( oItem )

      // Add some items to the Go cascading menu
      oItem :=MenuItem( "&Go To..." ,{|| MyGoToLine() }, K_F5,"Go to a specific line number")
      oPopUp1:AddItem( oItem)


      oItem :=MenuItem( "G&o To Top" ,{|| MyGoTop() }, K_CTRL_HOME,"Go to top of file")
      oPopUp1:AddItem( oItem)


      oItem :=MenuItem( "Go To &Bottom" ,{|| MyGoBottom() }, K_CTRL_END,"Go to bottom of file")
      oPopUp1:AddItem( oItem)
*/
      // Change the style of the GO popup menu.  The second character in
      // the string below represents the arrow that will be displayed next
      // to the word GO.  The default is a "", but I have changed it to
      // a ">".  I have kept the check mark ("�") the same as the default.
      //oItem:Style = "�>"

      // Add yet another separator
      oPopUp:AddItem( MenuItem( MENU_SEPARATOR ) )


      // Add one final menu item to the EDIT popup menu
      oItem :=MenuItem( "&Find..." ,{|| MySearch() }, K_ALT_F3,"Search for text")
      oPopUp:AddItem( oItem)

      //Create a 3rd PopUpMenu called OPTIONS and attatch it to oTopBar
      oPopUp := PopUp()
      oPopUp:ColorSpec:= "b/w,gr+/rb,r/w,g/rb,n+/w,w+/b"
      oTopBar:AddItem( MenuItem ( "&Options",oPopUp) )


      // Add the first item to the OPTIONS popup menu
      oItem :=MenuItem( "AutoSave" ,{|| MyAutoSave() },,"Toggle auto save preference")


      // Place a check mark next to this new item
      oItem:Checked := .t.
      oPopUp:AddItem( oItem)


      // Add a second item to the OPTIONS popup menu.
      oItem :=MenuItem( "Tab Stops..." ,{|| MyTabStops() },,"Set number of spaces for tab stops")
      oPopUp:AddItem( oItem)


   // Return our TopBar object back to MENU_Test()
   return ( oTopBar)


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
