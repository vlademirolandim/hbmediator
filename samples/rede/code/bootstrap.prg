#include "vbase.ch"
#include "form.ch"
#include "inkey.ch"

PROCEDURE Hbm_BootStrap

   MODULE MENU

   CONFIG INIT FILE "config.json" COMPILE
   CONFIG INIT TUI FILE "tui.json" COMPILE
   CONFIG LOG LEVEL INFO

   MENU INIT
   MENU ADD ITEM "[ Cadastro ]"
   MENU ADD SUBITEM " Endereços dos equipamentos " BLOCK {||HbmLoad("cfg_ip")} MESSAGE "Controle dos endereços IPs da rede"
   MENU ADD SUBITEM " Faixa de endereços " BLOCK {||HbmLoad("faixa")} MESSAGE "Faixas de IPs existentes na rede"
   MENU ADD SUBITEM " Sair do sistema " EXIT

   MENU SHOW


RETURN 
