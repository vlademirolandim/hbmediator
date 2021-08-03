# README #

## vconfig ##

A classe vconfig é responsável pelas configurações do sistema. Por exemplo: o nome do arquivo de log, o nível do arquivo, o nome da organização, o endereço, etc. 

## Como devo realizar as configurações ? ##

Temos três categorias de atributos:

### Atributos com valores somente leitura.

Alguns atributos possuem valores-padrão atribuidos pelo sistema automaticamente e não podem ser modificados, por exemplo:

````
    cLogName --> nome do log padrão ( ANO + MES + DIA)
````

Ou seja, não se preocupe em configurar nada.

### Atributos configuráveis através de string JSON

Um exemplo típico são os atributos são os dados da organização, que podem ser usado para compor o cabeçalho de relatórios, telas de sistemas, etc.

Para criar atributos configuráveis através de arquivo você deve :

1. Criar uma string no formato JSON.
1. Informar esse arquivo através do comando `CONFIG INIT <cArquivo>`

Por exemplo :
````
cJson := hb_MemoRead( "config.json" )
CONFIG INIT cJson
````

**Dica**: em alguns casos você pode querer não ler os dados de configuração de um arquivo, mas deixar ele fixo dentro do sistema. Isso é comum em versões de demonstração, onde o nome da empresa não pode ser modificado. Nesses casos específicos, carregue o arquivo JSON em tempo de compilação. O exemplo abaixo ilustra isso:

````
#pragma __streaminclude "config.json" | cJson := %s // Compile time
CONFIG INIT cJson
````

Um exemplo de arquivo um `config.json` pode ser visto a seguir:

````
{   
    "loglevel": 2,
    "logdisplay": true,
    "sysname":"Sistema de análise de amostras de exames de sangue",
    "orgname":"Laboratório de Bio-Tecnologia Alpha&Omega",
    "deptname":"Gerencia Geral",
    "complement":"Filial São Gerardo",
    "address01":"Rua Pedro Pereira, 123",
    "address02":"Bairro : Centro, CEP: 90013-345",
    "email":"email@email.com",
    "url":"mydomain.com"
}
````

**Para saber quais os valores que podem ser configurados através de uma string JSON, consulte o código fonte do método `InitEnv()`.** Eu poderia manter aqui uma lista atualizada desses atributos, mas eu corro o risco de não incluir algum valor novo, por isso resolvi documentar aqui o local onde esses atributos são lidos: arquivo `src/vconfig.prg`, método `InitEnv()`.

### Atributos configuráveis de comandos

Alguns atributos podem ser configurados através de comandos. Por exemplo:

````
CONFIG LOG LEVEL INFO // Altera o nível do log para INFO
````

## Config é uma classe do tipo Singleton

Os valores da classe config perduram durante toda a execução do sistema. Se você alterar o valor de um atributo dentro de uma função sua, esse valor será alterado para todas as chamadas subsequentes da classe config, em todas as rotinas, porque ela foi implementada como um objeto singleton. Um objeto singleton é a forma que encontrei para evitar variáveis públicas. 

Se por acaso você for instanciar um objeto VConfig, faça usando a função `ConfigSingleton()`, conforme o exemplo abaixo:

````
    LOCAL oCfg := ConfigSingleton()
````

Dessa forma você garante que oCfg receberá os valores da configuração corretamente, não importa em que parte do sistema ele se encontre.

**Notas sobre singleton:** eu sou da época em que se utilizava variáveis públicas dentro dos projetos em DBase III+ e Basic, isso era normal para sistemas criados naquela época (1980/1990). Com o passar dos anos, ficou provado que essa prática torna o código confuso na hora de se dar uma manutenção. Com o advento das novas linguagens e dos padrões de projetos, o padrão *singleton* passou a ser utilizado para contornarmos esse problema gerado pelas variáveis públicas. Porém, o *singleton* também tem seus problemas: como ele é um objeto único para todo o sistema, ele pode ter um atributo seu alterado (erroneamente) em uma rotina, e esse valor impactar negativamente nas demais rotinas. Para evitarmos esse problema, eu limitei ao máximo as funções do tipo *set* na classe VConfig. O objeto singleton tem, portanto, a maioria dos seus atributos definidos na leitura do JSON durante a sua criação, e eles permanecem inalterados durante toda a execução do sistema. 

## Como devo realizar as compilações ? ##

Use o `hbmk2`, por exemplo:

````
hbmk2 vconfig01 
````

## Descrição dos comandos

### CONFIG INIT 

Faz a leitura das configurações padrão do sistema. 
````
CONFIG INIT 
````
Basicamente as configurações padrão são aquelas definidas no método `::InitEnv()` e também os valores default das propriedades da classe:

Caso você queira, você pode atribuir determinados valores a atributos através de uma string JSON. Nesse caso, você deve iniciar assim:
````
CONFIG INIT cStringJson
````

###  CONFIG LOG LEVEL

Configura o nível de log do sistema. Veja a pasta `vlog` para maiores informações.

###  CONFIG DATABASE INI

Informa o nome e a localização do arquivo configurador do banco de dados. Veja exemplos na lib `vdata`. Por questões de segurança, essa propriedade não pode ser definida em um JSON. Ela deve ser informada pelo programador. Se ele não informar, o valor padrão é a pasta do executável.

### O método ::GetConfigValues()

Esse método retornará um Hash com os valores atuais de todos os atributos do objeto `VConfig`.

Exemplo de uso:

````
LOCAL oCfg := ConfigSingleton()

    ? hb_ValToExp( oCfg:GetConfigValues() ) // Imprime as configurações
````

Ou

````
LOCAL oCfg := ConfigSingleton()
LOCAL xElem

    FOR EACH xElem IN oCfg:GetConfigValues()
        ? xElem:__enumkey() + " = " + hb_ValToExp( xElem )
    NEXT   
````    