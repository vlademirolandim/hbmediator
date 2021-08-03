#command MsgInfo( <list, ...> ) => AlertInfo( <list> )
#command MsgStop( <list, ...> ) => AlertInfo( <list> )

/*
COLOR_MENU 
(1) Linha da opção não selecionada (menu e submenu)
(2) Linha da opção selecionada
(3) Tecla de atalho quando a opção não está selecionada
(4) Tecla de atalho quando a opção está selecionada 
(5) Não consegui descobrir
(6) Contorno da janela de submenu
*/


#define COLOR_MENU "N/BG,BG/N, N/W,BG/N, g/g ,N/BG"
#define COLOR_DEFAULT "bG/N,n/BG, , , GR+/N"
#define COLOR_DEFAULT_INVERSE "N/bG"
#define COLOR_BUTTON "N/G"
#define COLOR_READ_ONLY "g/n" // Usado na exibição de campos de retorno
#define COLOR_READ_ONLY_2 "r+/n" // Usado em campos cuja alteração está proibida

#define COLOR_WARNING  "R+/N"

#define COLOR_HEAD "GR+/N" // Cabeçalho FScreen.prg
#define COLOR_TEXT_ATTENTION "GR+/N"
#define COLOR_ALERT "R+/N"


////////////////////////////////////
///* Padrão Verde */
///*
////////////////////////////////////
/*
#define COLOR_DEFAULT  "G/N,N/G, , , ,N/GR+"
#define COLOR_DEFAULT_INVERSE "N/G"
#define COLOR_BUTTON "N/BG"
#define COLOR_READ_ONLY "bg/n" // Usado na exibição de campos de retorno
#define COLOR_READ_ONLY_2 "r+/n" // Usado em campos cuja alteração está proibida

#define COLOR_WARNING  "R+/N"

#define COLOR_HEAD "GR+/N" // Cabeçalho FScreen.prg
#define COLOR_TEXT_ATTENTION "GR+/N"
#define COLOR_ALERT "R+/N"
*/
//////////////////////////////////////
//// Amarelo
//
//////////////////////////////////////
//
/*
#define COLOR_DEFAULT "GR+/N,n/gr+ , , , N/GR+"
#define COLOR_DEFAULT_INVERSE "N/bG"
#define COLOR_BUTTON "N/G"
#define COLOR_READ_ONLY "g/n" // Usado na exibição de campos de retorno
#define COLOR_READ_ONLY_2 "r+/n" // Usado em campos cuja alteração está proibida

#define COLOR_WARNING  "R+/N"

#define COLOR_HEAD "G/N" // Cabeçalho FScreen.prg
#define COLOR_TEXT_ATTENTION "R+/N"
#define COLOR_ALERT "R+/N"
*/

//////////////////////////////////////////////////////////
//GET
//////////////////////////////////////////////////////////
#define BUTTON_LEN_GET 18
#define BUTTON_GET_OK_ROW  39
#define BUTTON_GET_OK_COL  125
#define BUTTON_GET_OK_LABEL PADC( "Ok (Pg Down)" , BUTTON_LEN_GET )

#define BUTTON_GET_CANCEL_ROW  BUTTON_GET_OK_ROW + 3
#define BUTTON_GET_CANCEL_COL  BUTTON_GET_OK_COL
#define BUTTON_GET_CANCEL_LABEL PADC( "Cancelar (ESC)" , BUTTON_LEN_GET )




