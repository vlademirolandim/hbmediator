# README #

## vdebug ##

A classe vdebug é responsável por gerar um log em operações de depuração. 

Para um correto uso dessa classe você deve :

1. Compilar o seu projeto com a opçao -b (para ativar o debugador)
1. Usar os comandos DEBUG definidos em vbase.ch

Essa segunda observação é muito importante. Se você usar diretamente o nome da classe, e não usar o comando definido em vbase.ch, o executável sempre irá gerar logs de depuração, independente do executável ser compilado com -b ou não. Isso é prejudicial porque gera uma queda no desempenho final do executável, além de expor informações potencialmente sigilosas em um log. O arquivo `vdebug_bad.prg` possui um exemplo do que NÃO SE DEVE FAZER.

Ou seja, faça assim :

````
DEBUG DUMP { "Test02" , { "Test03" => "ok" } } 
````

e não assim

````
oObj := VDebug():New()
oObj:Dump( { "Test02" , { "Test03" => "ok" } } )
````

## Como devo realizar as compilações ? ##

Sempre compile os exemplos com o parâmetro `-b`. Porque os comandos `DEBUG` só serão executados se você estiver em modo de depuração. Eu poderia ter fixado o `-b` dentro do arquivo `hbmk.hbm` mas eu preferi não incluir porque nós não fazemos assim na prática. 

Por exemplo
````
hbmk2 vdebug01 -b
````

## Descrição dos comandos

### DEBUG DISPLAY

Cria uma variável private com o valor da variável informada em \<xVar>. Útil para descobrirmos o valor de variáveis cujo valor é inecessível pelo depurador, como propriedades/atributos de objetos.

````
DEBUG DISPLAY <xVar>
````

A cláusula STOP gera um ponto de parada (break point), para você consultar os valores acesse o menu Monitor->Private. 

````
DEBUG DISPLAY <xVar> STOP
````

A nomenclatura da variável criada é __DEBUG_DISPLAY_\<xVar>. 

Por exemplo, vamos supor que você deseje saber o valor da propriedade `myProp` do objeto `myObj`, então faça :

````
DEBUG DISPLAY myObj:myProp
````

Quando você for procurar no debug, vá em Monitor->Private e procure por :

````
__DEBUG_DISPLAY_myObj:myProp
````

###  DEBUG BP

Cria um ponto de parada

````
DEBUG BP
````

Cria um ponto de parada somente se a condição <lCond> for verdadeira

````
DEBUG BP <lCond>
````

No exemplo abaixo o ponto de parada será gerado somente se o valor de `nCod` for igual a 100

````
DEBUG BP ( nCond == 100 )
````

###  DEBUG DUMP

Grava o DUMP da variável <xVar> no arquivo de log padrão.

````
DEBUG DUMP <xVar>
````

No exemplo a seguir, além de gravar o DUMP, grava também um descritivo, para facilitar a leitura do log.

````
DEBUG DUMP hClientes TITLE "Lista de clientes"
````

No exemplo a seguir, além de gravar no log padrão, grava também em um outro arquivo/log a sua escolha. Útil para buscas visuais (rápidas) em um log pequeno.

````
DEBUG DUMP hClientes TO FILE temp.log
````

Quando a variável é composta (array/hash), o DEBUG DUMP vai gravar o conteúdo completo em apenas uma linha, mas vai também gravar no log a árvore dessa variável (todos os níveis). 

Quando o conteúdo de um nível é muito grande ele exibe apenas os primeiros 80 caracteres na linha, mas a cláusula FULL força a exibição de todos os caracteres.


````
DEBUG DUMP hClientes FULL
````

###  DEBUG MINI DUMP

Faz a mesma coisa do DEBUG DUMP, mas não cria a árvore de subníveis, no caso de variáveis compostas (array/hash)

O exemplo a seguir irá realizar o dump da variável hCliente no log padrão e no log `temp.log`.

````
DEBUG MINI DUMP hClientes TITLE "Clientes devedores" TO FILE temp.log 
````

###  DEBUG ALIAS

Grava no log padrão um resumo da área de trabalho (workarea) do DBF.

No exemplo abaixo gravamos o resumo da área de trabalho atual.

````
DEBUG ALIAS
````

No exemplo abaixo gravamos o resumo da área de trabalho `CLIENTE`.

````
DEBUG ALIAS CLIENTE
````

###  DEBUG ENV

Grava um resumo do ambiente no LOG padrão. Usuário, endereço IP, nome da máquina, etc.

````
DEBUG ENV
````

No exemplo a seguir, direciona o resumo do ambiente, também, para um log chamado `env.log`.

````
DEBUG ENV TO FILE env.log
````

###  DEBUG BEGIN BLOCK / DEBUG END BLOCK

Apenas escreve no log padrão o início de um processamento e, quando o processamento terminar, o final de um processamento.

Por exemplo:

````
DEBUG BEGIN BLOCK "Baixa de nota fiscal"

// Seus comandos 
// Seus comandos 
// Seus comandos 

DEBUG END BLOCK
````

A cláusula `TO FILE` é permitida também. 
