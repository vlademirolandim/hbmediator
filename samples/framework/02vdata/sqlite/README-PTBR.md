# README #

## Iniciando ##

Para compilar esses exemplos use o c.bat (windows) ou c.ssh (linux), por exemplo :

````
c sample01.prg
````

Se quiser gerar um arquivo ppo para analisar faça :

````
c sample01.prg -p
````

Caso haja a necessidade de gerar o banco de dados de testes use o utilitário testdbinit 

````
testdbinit --sqlite --no-crypt
````

Esse comando recriará o sistemas33.db3 e também o database.ini

## Nota importante ##

Os comandos usados tem a cláusula DECRYPT. Isso quer dizer que o arquivo `database.ini`, com as informações para a conexão, está descriptografado. Isso só deve ser usado para testes. Caso vá usar em modo de produção remova a cláusula DECRYPT e criptografe o arquivo `database.ini` através do utilitário `cryptconfig`

## Exemplos ##

### sample01.prg - Query simples ###

Exibe o DBF virtual através da função BROWSE()

````
USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP"  TO lResult
````

### sample01err.prg - Exemplo de erro ###

Simula um erro de conexão em tabela inexistente

````
USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM INEXISTENT_TABLE" MESSAGE TO cMessage TO lResult 
````

Nota : os demais exemplos possuem suas\ respectivos versões com erros. O nome do arquivo termina com err

### sample02.prg - Paginação ###

1. Gera um DBF virtual com os primeiros 5 registros da tabela EMP (página 1) e os exibe através da função BROWSE() 
````
USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP" PAGE 1 LIMIT 5 TO lResult
````

2. Gera um DBF virtual com os registros 6 a 10 da tabela EMP (página 2) e os exibe através da função BROWSE() 


````
USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP" PAGE 2 LIMIT 5 TO lResult
````

### sample03.prg  - Inclusão ###

Insere os dados na tabela  EMP

````
INSERT USING CONNECT "SQLITE" DECRYPT INTO emp  EMPNO , ENAME  VALUES  12 , 'MY TEST'  TO lResult
````

### sample04.prg - Alteração ###

Localiza dados na tabela EMP, se não existir cria o registro

1. Primeiro cria o DBF virtual com apenas o registro a ser buscado

````
     USE DBTEST USING CONNECT "SQLITE" DECRYPT QUERY "SELECT * FROM EMP WHERE EMPNO = 12" TO lResult 
     ? IIF( lResult , "Success" , "Failed. Error : " + cMessage )
````

2. Se o DBF virtual não tiver dados isso quer dizer que não achei o registro

````
    IF DBTEST->( RECCOUNT() ) <> 1  // NOT FOUND
````

3. Depois realiza uma alteração

Exemplo de uma alteração.

````
    UPDATE USING CONNECT "SQLITE" DECRYPT emp  SET ENAME = cName  WHERE EMPNO = 12  TO lResult 
````

### sample05.prg - Exclusão ###

````
DELETE USING CONNECT "SQLITE" DECRYPT FROM EMP WHERE ENAME = nId TO lResult 
````