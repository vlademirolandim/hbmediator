#include "vbase.ch"
#include "vdata.ch"
#include "form.ch"
#define TAMANHO_CLASSE_IMC 20

PROCEDURE Hbm_BootStrap

    MODULE FORM

    CONFIG INIT FILE "config.json" COMPILE
    CONFIG INIT TUI FILE "tui.json" COMPILE
    CONFIG LOG LEVEL INFO

    //--------------- INIT -----------------------//
    CLS
    hb_Alert("Hello World")

RETURN

