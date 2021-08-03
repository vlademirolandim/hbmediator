# README #

## Iniciando ##

O objetivo dessa pasta é testar uma conexão com o arquivo `database.ini` criptografado.

Para compilar use o c.bat (windows) ou c.ssh (linux) :

````
c sample_crypt.prg
````

## Exemplos ##

### sample_crypt.prg - Query simples ###

Exibe o DBF virtual através da função BROWSE()

````
                                      A cláusula DECRYPT foi comentada (removida)
USE DBTEST USING CONNECT "SQLITE" /*DECRYPT*/ QUERY "SELECT * FROM EMP"  TO lResult
````

## Observação importante ##

Caso você deseje testar o processo de criptografia siga o procedimento abaixo :

1. Copie o arquivo `database.ini` da pasta superior 

Windows
````
copy ..\database.ini
````

Linux
````
cp ../database.ini .
````
2. Execute o utilitário para criptgrafar esse arquivo

````
cryptconfig --in database.ini --out database.ini
````

3. Pronto, o arquivo está criptografado e pode ser testado por `sample_crypt`
