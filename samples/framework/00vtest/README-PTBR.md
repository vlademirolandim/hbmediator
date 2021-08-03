# README #

## Apresentação ##

Essa pasta contém exemplos de testes unitários.

Para gerar os exemplos use o `hbmk2`.

Por exemplo:

````
hbmk2 vtest01
````

## Como funcionam os testes unitários ?

Os testes unitários são realizados a nível de rotina, isso já sabemos. Vou descrever como fiz para implementar os testes unitários através de um exemplo fictício.

Os testes unitários são agrupados por tipos. No exemplo abaixo temos um sistema de testes que verifica apenas funções do módulo financeiro. 

Dentro do módulo financeiro temos várias rotinas a serem testadas, vamos supor que temos apenas as 3 rotinas abaixo:

* Baixa de notas fiscais
* Conferencia de pedidos
* Geração de parcelas

Então, o nosso sistema de testes ficaria assim :

````
PROCEDURE MAIN

    MODULE TEST GROUP
    TEST GROUP TITLE "Módulo Financeiro"
    
    TEST GROUP ADD BaixaNotasFiscais_Test
    TEST GROUP ADD ConferenciaDePedidos_Test
    TEST GROUP ADD GeracaoDeParcelas_Test

    TEST GROUP EXEC

    RETURN
````

Ou seja, os passos para a geração dos testes:

1. Criação do módulo de testes (`MODULE TEST GROUP`)
1. Título para o módulo de testes (`TEST GROUP TITLE "Módulo Financeiro"`)
1. Adiciono as rotinas : `TEST GROUP ADD NomeDaRotina`. Inclua todas as rotinas a serem testadas. No nosso exemplo temos 3 rotinas.
1. Executo os testes : `TEST GROUP EXEC` e os envio automaticamente para um arquivo de log (nome padrão: `vtest.log`).

Feito isso eu vou adicionando as rotinas no projeto, por exemplo :

````
//-------------------------------------------------------------------
BEGIN TEST BaixaNotasFiscais_Test TITLE "Baixa de notas fiscais"

    ... Várias situações envolvendo a baixa de notas fiscais

END TEST
//-------------------------------------------------------------------
BEGIN TEST ConferenciaDePedidos_Test TITLE "Conferencia de pedidos"

    ... Várias situações envolvendo a conferencia de pedidos

END TEST
//-------------------------------------------------------------------
BEGIN TEST GeracaoDeParcelas_Test TITLE "Geração de parcelas"

    ... Várias situações envolvendo a geração de parcelas

END TEST
````

### Entendendo o funcionamento de um teste unitário

O teste unitário é feito pelo comando `TEST`, eles ficam agrupadas dentro de um grupo de testes. Vamos prosseguir com o nosso exemplo anterior, no grupo "Baixar notas fiscais". 

````
//-------------------------------------------------------------------
BEGIN TEST BaixaNotasFiscais_Test TITLE "Baixa de notas fiscais"

    ... Várias situações envolvendo a baixa de notas fiscais

END TEST
//-------------------------------------------------------------------
````

Vamos considerar que existe uma função que faz a baixa das notas fiscais :

````
BaixaDeNotasFiscais( cNumNota , dData, nValorBruto , nDesconto , nValorLiquido )
````

Vamos considerar também, que essa função retorna TRUE, caso a baixa seja feita com sucesso, e que ela retorne FALSE, caso ocorra algum problema na baixa da nota fiscal.

Várias situações podem ocorrer. Por exemplo:

* Todos os dados estão corretos (A função deve retornar TRUE)
* O número da nota fiscal não foi informado (A função deve retornar FALSE)
* A data é inválida (A função deve retornar FALSE)
* O valor bruto é menor ou igual a zero (A função deve retornar FALSE)

Para cada um desses casos, deve existir um teste, por exemplo, vou criar um teste para o primeiro caso, que é "Todos os dados estão corretos" :

````
//-------------------------------------------------------------------
BEGIN TEST BaixaNotasFiscais_Test TITLE "Baixa de notas fiscais"

    LOCAL lReturn // Valor de retorno da Função

    lReturn := BaixaNotasFiscais( '123456', Date(), 1000, 0.10 )
    TEST "Todos os valores corretos" EXPECTED .t. RESULT lReturn

END TEST
//-------------------------------------------------------------------
````

Note, no exemplo acima, que eu informo no teste :
* o valor de retorno da função, com os valores válidos
* o valor esperado da função
* se o valor de retorno for igual ao valor esperado, então o teste foi bem sucedido.

Devo, agora, repetir o procedimento para todas as outras situações previstas:

````
//-------------------------------------------------------------------
BEGIN TEST BaixaNotasFiscais_Test TITLE "Baixa de notas fiscais"

    LOCAL lReturn // Valor de retorno da Função

    lReturn := BaixaNotasFiscais( '123456', Date(), 1000, 0.10 )
    TEST "Todos os valores corretos" EXPECTED .t. RESULT lReturn

    lReturn := BaixaNotasFiscais( NIL , Date(), 1000, 0.10 )
    TEST "Número da nota fiscal não informado" EXPECTED .f. RESULT lReturn

    lReturn := BaixaNotasFiscais( '123456' , NIL , 1000, 0.10 )
    TEST "Data inválida" EXPECTED .f. RESULT lReturn

    lReturn := BaixaNotasFiscais( '123456' , Date() , 0, 0.10 )
    TEST "Valor bruto menor ou igual a zero" EXPECTED .f. RESULT lReturn

END TEST
//-------------------------------------------------------------------
````

Observe, no exemplo acima, que apenas no primeiro caso o valor esperado é TRUE.

O ideal é que se crie um programa só para testar as rotinas do seu sistema. Esse programa deve ser do tipo "linha de comando", para poder ser executado automaticamente através do seu agendador de tarefas toda a madrugada, por exemplo. Quando `TEST GROUP EXEC` é executado, todos os testes da pilha são realizados na sequência e, caso haja algum erro, ele será gravado em um arquivo de log para posterior consulta.

### Observação final sobre nosso exemplo

Nós fizemos a implementação dos testes unitários da baixa de notas fiscais. Posteriormente, deve-se fazer também os testes das outras duas rotinas: "Geração de parcelas" e "Conferencia de pedidos". O esquema final ficaria assim :

````
┌─────────────────────────────────┐         ┌────────────────────────────────┐
│MAIN                             │         │BEGIN TEST BaixaNota_Test       │
│                                 │         │                                │
│    MODULE TEST GROUP            │         │                                │
│                                 │         │  TEST "Situação 1" ...         │
│    TEST GROUP ADD BaixaNota_Test├───────► │  TEST "Situação 2" ...         │
│    TEST GROUP ADD GeraParc_Test─┼────┐    │                                │
│    TEST GROUP ADD Confere_Test  │    │    │  TEST "Situação N" ...         │
│                              │  │    │    │                                │
│    TEST GROUP EXEC           │  │    │    │ENDTEST                         │
└──────────────────────────────┼──┘    │    └────────────────────────────────┘
                               │       │
                               │       │
                               │       │
                               │       │    ┌────────────────────────────────┐
                               │       │    │BEGIN TEST GeraParc_Test        │
                               │       │    │                                │
                               │       │    │                                │
                               │       └───►│  TEST "Situação 1" ...         │
                               │            │  TEST "Situação 2" ...         │
                               │            │                                │
                               │            │  TEST "Situação N" ...         │
                               │            │                                │
                               │            │ENDTEST                         │
                               │            └────────────────────────────────┘
                               │
                               │
                               │            ┌────────────────────────────────┐
                               │            │BEGIN TEST Confere_Test         │
                               │            │                                │
                               │            │                                │
                               │            │  TEST "Situação 1" ...         │
                               └───────────►│  TEST "Situação 2" ...         │
                                            │                                │
                                            │  TEST "Situação N" ...         │
                                            │                                │
                                            │ENDTEST                         │
                                            └────────────────────────────────┘

````

## Breve descrição das amostras

1. vtest01 : Exemplo simples (passou em todos os testes)
1. vtest02 : Exemplo simples (o primeiro teste falhou)
1. vtest03 : Exemplo com erro de execução na amostra

## Descrição dos comandos

### BEGIN TEST <xTitle> TITLE <cTitle> 

Cria um bloco com os testes.
Por exemplo

````
BEGIN TEST Test_BaixaNota TITLE "Testando baixa de notas fiscais"

    ... Rotinas de teste ...

END TEST
````




