#!/home/vlademiro/sistemas/sistemas23/bin/hbmshell
-q0
-n
/**

*/
#include "vbase.ch"
#include "cmdterminal.ch"
PROCEDURE Hbm_Main( ... )

    LOCAL cIp, cFaixa
    LOCAL nComp 
    LOCAL nL1, nL2

    CONFIG INIT

    Help( hb_PValue(1) )

    // Verificações iniciais
    IF EMPTY( hb_PValue(1) )
        ? "Informe o endereço IP"
        ERRORLEVEL(1)
        RETURN
    ELSE
        cIp := hb_PValue(1)
    ENDIF    
    IF EMPTY( hb_PValue(2) )
        ? "Informe a faixa"
        ERRORLEVEL(2)
        RETURN
    ELSE
        cFaixa := hb_PValue(2)
    ENDIF    
    IF EMPTY( hb_PValue(3))
        ? "Informe o limite inferior"
        ERRORLEVEL(3)
        RETURN
    ELSE
        nL1 := VAL(hb_PValue(3))
    ENDIF    
    IF EMPTY( hb_PValue(4))
        ? "Informe o limite superior"
        ERRORLEVEL(4)
        RETURN
    ELSE
        nL2 := VAL(hb_PValue(4))
    ENDIF    
   

    // Colocar um ponto (.) no final da faixa (se for necessário)
    IF RIGHT( cFaixa , 1 ) == "."
    ELSE
        cFaixa += "."
    ENDIF

    // Verificar se a faixa está contida no endereço
    IF cFaixa $ cIp
    ELSE
        ? "A faixa deve estar contida no Endereço IP informado"
        ERRORLEVEL(5)
        RETURN
    ENDIF    

    nComp := VAL( SUBSTR( cIp , LEN( cFaixa ) + 1 ) )
    IF nComp < nL1 .OR. nComp >= nL2
        ? "Valor fora do  limite estabelecido"
        ERRORLEVEL(6)
        RETURN
    ELSE    
        ? cFaixa + hb_ntos(nComp+1)
    ENDIF    

    RETURN

STATIC PROCEDURE Help( cPar )

    IF !( cPar == "--help" .OR. cPar == "-?" )
        RETURN
    ENDIF

    ? "Descrição : Exibe o próximo IP de uma lista"
    ? "Uso       : nextip.prg <IP> <FAIXA> <L1> <L2>"
    ? "Onde      :     <IP>    - Endereço IP"
    ? "                <FAIXA> - Faixa"
    ? "                <L1>    - Limite inferior"
    ? "                <L2>    - Limite superior"
    ? ""
    ? "Exemplo   : nextip.prg 200.19.176.3 200.19.176 1 100 --> Retorna 200.19.176.4"
    ? "            nextip.prg 200.19.176.3 200.19.176 10 100 --> Retorna 'Valor fora do intervalo estabelecido'"
    ? ""
    ? "Códigos de retorno"
    ? "0 - Sucesso"
    ? "1 - Endereço IP não informado"
    ? "2 - Faixa não informada"
    ? "3 - Limite inferior não informado"
    ? "4 - Limite superior não informado"
    ? "5 - Faixa informada não está contida no Endereço IP (Ex: 200.19.14.100 e 200.19.10)"
    ? "6 - Valor obtido fora do limite informado"


    QUIT

    RETURN
