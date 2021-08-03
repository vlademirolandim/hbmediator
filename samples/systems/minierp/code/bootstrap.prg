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
   MENU ADD SUBITEM " &Conta corrente " BLOCK {||HbmLoad("bancoconta")} MESSAGE "Conta corrente"
   MENU ADD SUBITEM " Movimentação Bancária " BLOCK {||HbmLoad("banco")} MESSAGE "Movimentação bancária"
   MENU ADD SUBITEM " Fornecedor " BLOCK {||HbmLoad("fornecedor")} MESSAGE "Cadastro de fornecedor"
   MENU ADD SUBITEM " Cliente " BLOCK {||HbmLoad("cliente")} MESSAGE "Cadastro de cliente"
   MENU ADD SUBITEM " Categorias de Produto " BLOCK {||HbmLoad("produtocategoria")} MESSAGE "Categoria de produtos"

   MENU ADD ITEM "[ Movimentações ]" 
   MENU ADD SUBITEM " Contas a pagar " BLOCK {||HbmLoad("cpagar")} MESSAGE "Contas a pagar"
   MENU ADD SUBITEM " Venda " BLOCK {||HbmLoad("venda")} MESSAGE "Vendas"
 
   MENU ADD ITEM "[ Configurações ]" 
   MENU ADD SUBITEM " &Contas " BLOCK {||HbmLoad("conta")} MESSAGE "Configuração das contas"
   MENU ADD SUBITEM " Forma de pagamento " BLOCK {||HbmLoad("formapagamento")} MESSAGE "Formas de pagamento"
   MENU ADD SUBITEM " Sair do sistema " EXIT

   MENU SHOW


RETURN 
