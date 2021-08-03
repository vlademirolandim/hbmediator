PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Cliente ( 
    id                 INTEGER       PRIMARY KEY AUTOINCREMENT,
    nome               TEXT          ,
    endereco           TEXT          ,
    bairro             TEXT          ,
    telefones          TEXT          ,
    cidade             TEXT          ,
    uf                 TEXT          ,
    cep                TEXT          ,
    email              TEXT          ,
    dataNascimento     DATE,
    cpf                TEXT         ,
    rg                 TEXT          ,
    nomeDaMae          TEXT          ,
    nomeDoPai          TEXT          ,
    clienteBloqueado   INTEGER,
    ultimareceita      TEXT,
    obs                TEXT,
    sexo               TEXT  ,
    localtrabalho      TEXT          ,
    datacadastro       TEXT          ,
    dataultimaconsulta TEXT          ,
    criadoEm           TEXT          ,
    criadoPor          TEXT          ,
    alteradoEm         TEXT          ,
    alteradoPor        TEXT          
);
INSERT INTO Cliente VALUES(2,'Venda direta ao Consumidor','RUA Ensolarada, s/n','Centro','9999-0000','MONTE ALEGRE DE MINAS','MG','38420-00','','NULL','','777','mãe','pai',1,'','Observações adicionais','F','','2010-09-02',NULL,'2015-01-18 16:16:51','IMPORTAÇÃO','2015-10-09 10:25:11','admin');
INSERT INTO Cliente VALUES(3,'Tiago Bacciotti Moreira','AV:TRABALHADORES 0','CENTRO','00','MONTE ALEGRE DE MINAS','MG','38420123','','1966-02-03','66666','7777','','',0,replace('lente cr p/perto\r+2,75 ao\rdp 61\r\rwalmir','\r',char(13)),'','F','','2010-09-02',NULL,'2015-01-18 16:16:51','IMPORTAÇÃO','2015-08-31 16:59:06','admin');
INSERT INTO Cliente VALUES(4822,'VLADEMIRO','','','','','CE','','','2021-07-16','','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Cliente VALUES(4823,'REGINA CLAUDIA','','','','','CE','','','2021-07-16','','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Cliente VALUES(4824,'NOVATEC','','','','','AC','','','2021-07-16','','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Cliente VALUES(4832,'VLADER FELISMINO LANDIM','','','','','CE','','','2021-07-16','','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO Cliente VALUES(4833,'REGINA CLAUDIA FELISMINO LANDIM','Rua Tereza Cristina, 575','Centro','85-98656-1063','Fortaleza','CE','60015140','reginaclaudia@gmail','1970-07-09','','','','',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE [Fornecedor] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [nome] TEXT, [endereco] TEXT, [bairro] TEXT, [telefones] TEXT, [cidade] TEXT, [uf] TEXT, [cep] TEXT, [email] TEXT, [dataNascimento] DATE, [cnpj] TEXT, [inscestadual] TEXT, [contato1] TEXT, [contato2] TEXT, [obs] TEXT, [obs2] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
INSERT INTO Fornecedor VALUES(4,'Prestador de serviços X','Travessa Ricardo Silva, N 71999','centro','3456-9087','Uberlândia','MG','hhhhh','admin@servx.com.br','NULL','','','Paula 9678-98098','Madureira','','','2015-01-19 08:17:29','admin',NULL,NULL);
INSERT INTO Fornecedor VALUES(14,'VIVO INTERNET FIXA','','','103233','','CE','','','NULL','','','','','','',NULL,NULL,NULL,NULL);
CREATE TABLE ProdutoCategoria ( 
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    nome           TEXT,
    obs            TEXT,
    criadoEm       TEXT,
    criadoPor      TEXT,
    alteradoEm     TEXT,
    alteradoPor    TEXT 
);
INSERT INTO ProdutoCategoria VALUES(1,'OCULOS SOLARES','','2013-12-23 09:05:43','baciotti','2015-01-18 20:09:32','admin');
INSERT INTO ProdutoCategoria VALUES(8,'PERFUMARIA DE LINHA','',NULL,NULL,NULL,NULL);
CREATE TABLE Conta ( 
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    nome        TEXT,
    tipoconta   TEXT,
    obs         TEXT,
    criadoEm    TEXT,
    criadoPor   TEXT,
    alteradoEm  TEXT,
    alteradoPor TEXT 
);
INSERT INTO Conta VALUES(1,'Vendas a Vista','C','Observações','2013-12-23 09:24:45','baciotti','2013-12-23 09:25:03','baciotti');
INSERT INTO Conta VALUES(2,'Recebimentos de Parcelas','C','','2013-12-23 09:24:55','baciotti',NULL,NULL);
INSERT INTO Conta VALUES(3,'Serviços','C',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(4,'Outras Receitas','C',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(5,'Despesas com Fornecedores a Vista','D',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(6,'Despesas com Fornecedores a Prazo','D',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(7,'Despesas Operacionais','D',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(8,'Outras Despesas','D',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(9,'Recebimento de Entradas','C',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(10,'Juros Recebidos','C',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(11,'Descontos Concedidos','D',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(12,'Juros Pagos','D',NULL,NULL,NULL,NULL,NULL);
INSERT INTO Conta VALUES(19,'Contador','C','','2015-10-05 08:35:54','admin',NULL,NULL);
CREATE TABLE CReceber ( 
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id     INTEGER,
    venda_id       INTEGER,
    conta_id       INTEGER,    
    dataVencimento TEXT   ,
    dataPagamento  TEXT   ,
    dataConta      TEXT   ,
    valor          REAL   ,
    valor_pago     REAL   ,
    descricao      TEXT   ,
    obs            TEXT,
    criadoEm       TEXT   ,
    criadoPor      TEXT   ,
    alteradoEm     TEXT   ,
    alteradoPor    TEXT    
);
INSERT INTO CReceber VALUES(1,3,1,NULL,'2012-11-29 00:00:00','2012-11-02 00:00:00','2012-09-24 00:00:00',75.0,75.0,'Parcela 1/3','','2015-01-18 16:38:10','IMPORTAÇÃO',NULL,NULL);
INSERT INTO CReceber VALUES(9,3,1,NULL,'2012-12-22 00:00:00','2012-12-23 00:00:00','2012-09-23 00:00:00',50.0,50.080000000000000071,'Parcela 3/3','','2015-01-18 16:38:10','IMPORTAÇÃO',NULL,NULL);
INSERT INTO CReceber VALUES(10697,3,1,NULL,'2018-06-22',NULL,NULL,350.0,NULL,'Venda parcelada',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CReceber VALUES(10698,3,1,NULL,'2018-05-10',NULL,NULL,277.99999999999998046,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE [CPagar] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [fornecedor_id] INTEGER, [conta_id] INTEGER, [dataVencimento] DATE, [dataPagamento] DATE, [dataConta] DATE, [valor] REAL, [valor_pago] REAL, [descricao] TEXT, [obs] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
INSERT INTO CPagar VALUES(5,13,7,'2015-02-05','2015-02-05','2014-11-27',27.000000000000001776,27.000000000000001776,'Conta de Água','','2014-11-27 18:14:46','admin','2015-01-27 18:59:01','admin');
INSERT INTO CPagar VALUES(7,14,7,'2018-06-11',NULL,'2018-06-11',520.00000000000001776,NULL,'compra de mercadorias','',NULL,NULL,NULL,NULL);
INSERT INTO CPagar VALUES(9,14,6,'2021-07-13',NULL,'2021-07-13',150.0,NULL,'COMPRA DE COMPUTADOR','Nota fiscal 7',NULL,NULL,NULL,NULL);
CREATE TABLE [Caixa] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [conta_id] INTEGER, [venda_id] INTEGER, [cliente_id] INTEGER, [debito] REAL DEFAULT(0), [credito] REAL DEFAULT(0), [descricao] TEXT, [obs] TEXT, [data] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT, [fornecedor_id] INTEGER);
INSERT INTO Caixa VALUES(32,0,0,0,0.0,50.0,'SALDO INICIAL','','2014-12-06','2014-12-06 10:35:12','admin',NULL,NULL,0);
INSERT INTO Caixa VALUES(4405,2,NULL,3,NULL,500.0,'Teste',NULL,'2018-01-20',NULL,NULL,NULL,NULL,NULL);
CREATE TABLE [FormaPagamento] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [descricao] TEXT, [entrada] INTEGER, [parcelas] INTEGER, [obs] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
INSERT INTO FormaPagamento VALUES(1,'30 DIRETO',0,1,'','2013-12-04 14:58:29','','2015-09-29 16:42:54','admin');
INSERT INTO FormaPagamento VALUES(2,'30,60',0,2,'',NULL,NULL,'2015-09-29 16:20:59','admin');
INSERT INTO FormaPagamento VALUES(3,'30, 60 E 90',0,3,NULL,NULL,NULL,NULL,NULL);
INSERT INTO FormaPagamento VALUES(5,'30,60,90,120',0,4,'',NULL,NULL,'2015-10-06 10:54:58','admin');
INSERT INTO FormaPagamento VALUES(6,'30,60,90,120,150',0,5,'',NULL,NULL,'2015-09-29 16:21:26','admin');
INSERT INTO FormaPagamento VALUES(18,'30,60,90,120,150,180',0,6,'','2015-09-29 16:23:53','admin',NULL,NULL);
INSERT INTO FormaPagamento VALUES(19,'entr +30+60',1,2,'','2015-09-29 16:24:18','admin',NULL,NULL);
INSERT INTO FormaPagamento VALUES(20,'entr +30,60,90',1,3,'','2015-09-29 16:24:39','admin',NULL,NULL);
INSERT INTO FormaPagamento VALUES(21,'entr +30,60,90,120',1,4,'','2015-09-29 16:25:01','admin',NULL,NULL);
INSERT INTO FormaPagamento VALUES(22,'entr+30,60,90,120,150',1,5,'','2015-09-29 16:25:46','admin',NULL,NULL);
INSERT INTO FormaPagamento VALUES(34,'Entrada + 30',1,1,'','2015-10-15 18:45:06','admin',NULL,NULL);
CREATE TABLE [VendaDetalhes] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [venda_id] INTEGER, [produto_id] INTEGER, [qtd] INTEGER, [preco_venda] INTEGER, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
CREATE TABLE [Produto] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [nome] TEXT, [descricao] TEXT, [categoria_id] INTEGER, [fornecedor_id] INTEGER, [preco_custo] REAL DEFAULT(0), [preco_avista] REAL DEFAULT(0), [preco_aprazo] REAL DEFAULT(0), [tipo_cadastro] TEXT, [estoque_minimo] INTEGER DEFAULT(0), [estoque_atual] INTEGER DEFAULT(0), [codigo_barras] TEXT, [obs] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
INSERT INTO Produto VALUES(1,'Óculos Solar','-',1,0,0.0,0.0,0.0,'Produto',0,50,'0','0','2015-09-28 17:00:00','admin','2015-10-15 18:45:51','admin');
INSERT INTO Produto VALUES(2,'Semijoias','-',1,0,0.0,0.0,0.0,'Produto',0,100,'0','0','2015-09-28 17:00:00','admin',NULL,NULL);
INSERT INTO Produto VALUES(4,'Serviços','-',1,0,0.0,0.0,0.0,'Servico',0,0,'0','0','2015-09-28 17:00:00','admin',NULL,NULL);
CREATE TABLE [Config] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [chave] TEXT UNIQUE, [valor] TEXT, [obs] TEXT, [ordem] INTEGER DEFAULT(0));
INSERT INTO Config VALUES(1,'CONTACRECEBER','2','Conta Padrão de Recebimentos das Contas a Receber',30);
INSERT INTO Config VALUES(2,'CONTACPAGAR','6','Conta Padrão de Lançamento das Contas a Pagar',30);
INSERT INTO Config VALUES(3,'MODELORELATORIO1_old',replace('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\n<html>\n<head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  <title>modelo.html</title>\n</head>\n<body>\n<h1>\n<center>{TITLE}</center>\n</h1>\n<h3 align="right">{COMPANY}</h3>\n<h4>{DATE}</h4>\n{CONTEUDO}\n<br>\n<br>\n<h3 align="right">{RODAPE}</h3>\n\n</body>\n</html>\n','\n',char(10)),'Modelo padrão do relatório',0);
INSERT INTO Config VALUES(4,'EMPRESA','Antiquário Macleod LTDA','Nome da Empresa',1);
INSERT INTO Config VALUES(5,'TAXASJUROS','6','Taxa Mensal de Juros a ser cobrada',9);
INSERT INTO Config VALUES(6,'RAZAOSOCIAL','Antiquário Macleod LTDA','Dados da empresa',0);
INSERT INTO Config VALUES(7,'ENDERECO','Rua das Flores s/n','Endereço',2);
INSERT INTO Config VALUES(8,'CIDADE','Monte Alegre de Minas','Cidade',3);
INSERT INTO Config VALUES(9,'UF','MG','Estado',4);
INSERT INTO Config VALUES(10,'CEP','38420-000','Cep',5);
INSERT INTO Config VALUES(11,'CNPJ','','CNPJ',6);
INSERT INTO Config VALUES(12,'INSCESTADUAL','ISENTO','Inscrição Estadual',7);
INSERT INTO Config VALUES(13,'EMAIL','tiagobaciotti.com','Email',8);
INSERT INTO Config VALUES(14,'CONTAVENDASAVISTA','1','Conta que serão lançadas as Vendas a Vista',30);
INSERT INTO Config VALUES(15,'CONTARECEBIMENTOPARCELAS','2','Conta que serão computados os recebimentos de Parcelas',30);
INSERT INTO Config VALUES(16,'CONTARECEBIMENTOENTRADAS','9','Conta onde serão lançadas as Entradas',30);
INSERT INTO Config VALUES(17,'MODELORELATORIO1',replace('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\n<html>\n<head>\n  <meta http-equiv="Content-Type"\n content="text/html; charset=UTF-8">\n  <title>Relatório do Sistema Financeiro</title>\n  <style type="text/css">\nh1 {\n  font-family: Arial,Helvetica,sans-serif;\n  font-weight: bold;\n}\nh3 {\n  font-family: Arial,Helvetica,sans-serif;\n}\nh4 {\n  font-family: Arial,Helvetica,sans-serif;\n}\nbody {\n  font-family: Arial,Helvetica,sans-serif;\n}\ntable.bordasimples {border-collapse: collapse;}\ntable.bordasimples tr td {border:1px solid #666666 ;}\n\n\n\n\n  </style>\n</head>\n<body>\n<h1>\n<center>{TITLE}</center>\n</h1>\n<h3 align="right">{COMPANY}</h3>\n<h4>{DATE}</h4>\n{CONTEUDO}\n<br>\n<br>\n<h3 align="right"><big>{TOTAIS}</big></h3>\n<hr style="width: 100%; height: 1px;">\n<h3 align="right">{RODAPE}</h3>\n</body>\n</html>\n','\n',char(10)),'ordem 0 não aparece na tela de opções',0);
INSERT INTO Config VALUES(18,'REL_PLANODECONTAS',replace('select co.nome as "Conta",\n\nCASE \n            When tipoconta="C" then "Crédito"\n            WHEN tipoconta="D" then "Débito"\n            else ifnull(tipoconta,"-")\nend\nas "Tipo da Conta",\n\nCASE \nWhen tipoconta="C" then (\n                select case \n                    when substr(sum(credito),length(ROUND(sum(credito),2))-1,1) = "." then replace(sum(credito),".",",") || "0"     \n                    else ifnull(replace(sum(credito),".",","),"-") end  as "Crédito"\n                from Caixa ca where ca.conta_id=co.id\n                and DATA>="{DATA_INICIAL}" and data<="{DATA_FINAL}"\n                \n                )\nWHEN tipoconta="D" then (\nselect case \n                when substr(sum(debito),length(ROUND(sum(debito),2))-1,1) = "." then replace(sum(debito),".",",") || "0"     \n                else ifnull(replace(sum(debito),".",","),"-") end  as "Crédito"\n                from Caixa ca where ca.conta_id=co.id\n                and DATA>="{DATA_INICIAL}" and data<="{DATA_FINAL}"\n)\nend as Valor\nfrom Conta co\norder by tipoconta\n','\n',char(10)),NULL,0);
INSERT INTO Config VALUES(19,'REL_VENDAS_CLIENTE',replace('select ifnull(v.id,"-") as "Código",\nifnull(v.data,"-") as Data,\n--ifnull((select nome from cliente c where c.id=v.cliente_id),"-") as "Nome do Cliente",\nifnull(v.descricao,"-") as "Descrição",\nifnull(v.meiopagamento,"-") as "Meio de Pagamento",\nifnull((select descricao from formapagamento fp where fp.id = v.formapagamento_id),"-") as "Forma Pagamento",\ncase \n    when substr(v.totaldavenda,length(ROUND(v.totaldavenda,2))-1,1) = "." then replace(v.totaldavenda,".",",") || "0"     \n    else replace(v.totaldavenda,".",",") end as "Total da Venda"\n\n\nfrom venda v\nwhere v.cliente_id={CLIENTE_ID}\nand v.DATA>="{DATA_INICIAL}" and v.data<="{DATA_FINAL}"\n\norder by v.data','\n',char(10)),NULL,0);
INSERT INTO Config VALUES(20,'REL_BANCO',replace('select \n\ndata as "Data",\nifnull(b.descricao,"-") as "Descrição",\n\ncase \n    when substr(b.debito,length(ROUND(debito,2))-1,1) = "." then replace(b.debito,".",",") || "0" \n    else replace(b.debito,".",",") end  as "Débito",\n    \ncase \n    when substr(b.credito,length(ROUND(credito,2))-1,1) = "." then replace(b.credito,".",",") || "0" \n    else replace(b.credito,".",",") end  as "Crédito",\n\ncase \n    when substr((select SUM(credito) - SUM(debito) from banco banco where banco.id<=b.id),length(ROUND((select SUM(credito) - SUM(debito) from banco banco where banco.id<=b.id),2))-1,1) = "." then replace((select SUM(credito) - SUM(debito) from banco banco where banco.id<=b.id),".",",") || "0" \n    else replace((select SUM(credito) - SUM(debito) from banco banco where banco.id<=b.id),".",",") end  as "Saldo"\n    \n    from Banco b\n    \n    where b.data>="{DATA_INICIAL}" and b.data<="{DATA_FINAL}"\n    and b.bancoconta_id = {BANCOCONTA_ID}\n    \n    order by b.data','\n',char(10)),NULL,0);
INSERT INTO Config VALUES(21,'PROMISSORIAHEADER',replace('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\n<html><head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<title>Nota Promissória</title>\n\n<style type="text/css">\nbody {\nfont-family: Arial,Helvetica,sans-serif;\n}\n.texto {\nfont-family: Arial,Helvetica,sans-serif;\n}\n.texto2 a{position:absolute; left:40%; -webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);-o-transform: rotate(270deg);writing-mode: lr-tb;}\n.tabela {\ndisplay: table;\nvisibility: visible;\n}\n.folha { \npage-break-after: always; \n} \n\n\n</style>\n</head>\n<body>\n','\n',char(10)),'Início do HTML',0);
INSERT INTO Config VALUES(22,'PROMISSORIANOTA',replace('<table style="border-style: solid; border-width: 2px; text-align: left; width: 100%;" border="0" cellpadding="0" cellspacing="0">\n<tbody>\n<tr>\n<td class="texto2" colspan="1" rowspan="14" style="border-style: solid; border-width: 0pt 2px 0pt 0pt; font-weight: bold; text-align: center; width: 133px;" valign="middle"><span style="top: 111px; left: -1px;" class="texto">NOTA<br><br>PROMISSÓRIA</span>\n</td>\n<td style="text-align: left; width: 227px;" valign="middle">Nº\n{NUMERO}</td>\n<td style="text-align: right; width: 711px;" colspan="3" rowspan="1" valign="middle">Vencimento: {VENCIMENTO}</td>\n\n\n</tr>\n<tr><td style="width: 227px;" align="center" valign="middle"></td><td colspan="3" rowspan="1" style="text-align: right; width: 711px;" valign="middle"><big style="font-weight: bold;">Valor: R${VALOR}</big></td></tr><tr align="left">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">Aos {DATA-AOS} ***</td>\n</tr>\n<tr align="right">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">***\npagarei por essa única via de NOTA PROMISSÓRIA</td>\n</tr>\n<tr align="left">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">A<b>\n{EMPRESA} -&nbsp;CNPJ {CNPJ}</b></td>\n</tr>\n<tr align="left">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">ou\nà sua ordem a quantia de<big><span style="font-weight: bold;"> {EXTENSO}</span></big> em moeda corrente nacional </td>\n</tr>\n<tr align="left">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">Pagável em: {CIDADEEMPRESA}</td>\n</tr>\n<tr align="left">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">\nEmitente:\n<b>{NOME} (CPF: {CPF})</b></td>\n</tr>\n<tr>\n<td style="text-align: left; width: 711px;" colspan="4" rowspan="1" valign="middle">{ENDERECO}</td>\n</tr>\n<tr>\n<td colspan="4" rowspan="1" style="width: 711px;" align="center" valign="middle"></td>\n\n\n\n</tr>\n<tr align="left">\n<td style="width: 711px;" colspan="4" rowspan="1" valign="middle">{CIDADE}<br></td>\n</tr>\n<tr>\n<td style="width: 227px;" align="center" valign="middle"></td>\n<td style="width: 711px;" align="center" valign="middle"></td>\n<td align="center" valign="middle"></td>\n<td align="center" valign="middle"></td>\n</tr>\n<tr>\n<td colspan="1" rowspan="1" style="width: 227px;" align="center" valign="middle"></td><td style="width: 711px;" colspan="1" align="center" valign="middle"><br>____________________________________________________________<br>{NOME}</td><td colspan="1" align="center" valign="middle"></td><td align="center" valign="middle"></td>\n\n\n\n</tr>\n<tr>\n<td style="width: 227px;" align="center" valign="middle"></td>\n<td style="width: 711px;" align="center" valign="middle"></td>\n<td align="center" valign="middle"></td>\n<td align="center" valign="middle"></td>\n</tr>\n</tbody>\n</table>','\n',char(10)),'HTML de cada NOTA',0);
INSERT INTO Config VALUES(23,'PROMISSORIAFOOTER','</body></html>','Fim do HTML',0);
INSERT INTO Config VALUES(24,'REL_RECIBO',replace('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">\n<html>\n<head>\n  <meta http-equiv="Content-Type"\n content="text/html; charset=UTF-8">\n  <title>recibo</title>\n</head>\n<body>\n<table\n style="font-family: ''Times New Roman''; letter-spacing: normal; text-indent: 0px; text-transform: none; word-spacing: 0px; width: 600px; height: 403px;"\n border="0" cellpadding="2" cellspacing="2">\n  <tbody>\n    <tr\n style="font-weight: bold; font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="27" width="580">\n      <p align="center"><big><big><font\n size="4"><big><big>R E C I B O</big></big></font></big></big></p>\n      </td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="40" width="590"></td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td style="text-align: right;" colspan="2"\n height="38" width="590"><font size="3">Recibo\nR$:<u>{VALOR}</u></font></td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="40" width="590"></td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="38" width="590">\n      <p align="justify"><font size="3">Recebi(emos)\nde <span style="font-weight: bold;">{NOME} - CPF/CNPJ n°\n{CPF}</span>, a importância supra de:<span\n class="Apple-converted-space">&nbsp;</span><u\n style="font-weight: bold;">***{EXTENSO}***</u><span\n class="Apple-converted-space">&nbsp;</span>-\nreferente a: {REFERENTE}.</font></p>\n      <p align="justify"><font size="3">E,\npara maior clareza firmo o presente recibo para que\nproduza os seus efeitos, dando plena, rasa e irrevogável quitação, pelo\nvalor recebido.</font></p>\n      </td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="38" width="590">\n      <p align="justify"><font size="3"><br>\n      </font></p>\n      </td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="38" width="590">\n      <p align="justify"><font size="3">{CIDADE},\n{DATA}</font></p>\n      </td>\n    </tr>\n    <tr style="font-family: Helvetica,Arial,sans-serif;">\n      <td colspan="2" height="40" width="590"></td>\n    </tr>\n    <tr>\n      <td style="font-family: Helvetica,Arial,sans-serif;"\n width="286"></td>\n      <td style="font-family: Helvetica,Arial,sans-serif;"\n width="50%"><font size="3"><span\n style="font-weight: bold;">{EMPRESA}</span><br>\nCPF/CNPJ n° {CNPJ}</font></td>\n    </tr>\n  </tbody>\n</table>\n</body>\n</html>\n','\n',char(10)),'Modelo de Recibo',0);
INSERT INTO Config VALUES(25,'CONTARECEBIMENTOJUROS','10','Conta onde serão computados os juros recebidos',30);
INSERT INTO Config VALUES(26,'ANOTACOES','Escreva aqui','Anotacoes 360',0);
INSERT INTO Config VALUES(27,'RECADOS','Anote Aqui','Recados 360',0);
INSERT INTO Config VALUES(29,'PASTABACKUP','','Onde será gravado a cópia de segurança de seu banco de dados?',50);
INSERT INTO Config VALUES(30,'REGISTRODATA','0','Data que iniciou o uso',0);
INSERT INTO Config VALUES(31,'REGISTROSERIAL','','Serial gerado para o Código de Registro',0);
INSERT INTO Config VALUES(32,'GERENTE360_PLANODECONTAS',replace('select co.nome as "Conta",\n\nCASE \n            When tipoconta="C" then "Crédito"\n            WHEN tipoconta="D" then "Débito"\n            else ifnull(tipoconta,"-")\nend\nas "Tipo da Conta",\n\nCASE \nWhen tipoconta="C" then (\n                select case \n                    when substr(sum(credito),length(ROUND(sum(credito),2))-1,1) = "." then replace(sum(credito),".",",") || "0"     \n                    else ifnull(replace(sum(credito),".",","),"-") end  as "Crédito"\n                from Caixa ca where ca.conta_id=co.id\n                and DATA>="{DATA_INICIAL}" and data<="{DATA_FINAL}"\n                \n                )\nWHEN tipoconta="D" then (\nselect case \n                when substr(sum(debito),length(ROUND(sum(debito),2))-1,1) = "." then replace(sum(debito),".",",") || "0"     \n                else ifnull(replace(sum(debito),".",","),"-") end  as "Crédito"\n                from Caixa ca where ca.conta_id=co.id\n                and DATA>="{DATA_INICIAL}" and data<="{DATA_FINAL}"\n)\nend as Valor\nfrom Conta co\nwhere tipoconta="{TIPO_CONTA}"\norder by tipoconta\n\n\n','\n',char(10)),'Select para busca dos dados para Gerente 360 do Plano de Contas',0);
INSERT INTO Config VALUES(33,'COMISSAO','3','Valor Percentual da Comissão de Vendas',9);
INSERT INTO Config VALUES(34,'REL_COMISSAO',replace('select  v.data as "Data da Venda", \n        u.nome as "Nome do Vendedor", \n        (select case \n                    when substr(round(v.totaldavenda,2),length(ROUND(v.totaldavenda,2))-1,1) = "." then replace(v.totaldavenda,".",",") || "0"     \n                    else ifnull(replace(v.totaldavenda,".",","),"-") end) as "Total da Venda", \n        \n(select case \n                    when substr(round(({COMISSAO} * v.totaldavenda)/100,2),length(ROUND(({COMISSAO} * v.totaldavenda)/100,2))-1,1) = "." then replace(round(({COMISSAO} * v.totaldavenda)/100,2),".",",") || "0"     \n                    else ifnull(replace(round(({COMISSAO} * v.totaldavenda)/100,2),".",","),"-") end) as "Comissão"\n\n\nfrom venda v, usuario u\n\nwhere u.id = v.usuario_id\nand v.data>="{DATA_INICIAL}" and v.data <="{DATA_FINAL}" \n\n{OUTROSPARAMETROS}\n\n\n;\n','\n',char(10)),NULL,0);
INSERT INTO Config VALUES(35,'REL_COMISSAO_TOTAL',replace('\n\nselect  v.data as "Data da Venda", \n        u.nome as "Nome do Vendedor", \n        (select case \n                    when substr(round(sum(v.totaldavenda),2),length(ROUND(sum(v.totaldavenda),2))-1,1) = "." then replace(sum(v.totaldavenda),".",",") || "0"     \n                    else ifnull(replace(sum(v.totaldavenda),".",","),"-") end) as "Total da Venda", \n        \n(select case \n                    when substr(round(    sum(({COMISSAO} * v.totaldavenda)/100)    ,2),length(ROUND(    sum(({COMISSAO} * v.totaldavenda)/100)    ,2))-1,1) = "." then replace(round(      sum( ({COMISSAO} * v.totaldavenda)/100 )      ,2),".",",") || "0"     \n                    else ifnull(replace(round(        sum(({COMISSAO} * v.totaldavenda)/100)       ,2),".",","),"-") end) as "Comissão"\n\n\nfrom venda v, usuario u\n\nwhere u.id = v.usuario_id\nand v.data>="{DATA_INICIAL}" and v.data <="{DATA_FINAL}"\ngroup by u.nome\n\n;','\n',char(10)),NULL,0);
INSERT INTO Config VALUES(36,'C_EXIBIR_DATACONSULTA','NAO','Mostra campo de última consulta na tabela de clientes',0);
INSERT INTO Config VALUES(37,'C_EXIBIR_ULTIMARECEITA','NAO','Mostra campo de Última receita na tabela de clientes',0);
INSERT INTO Config VALUES(38,'CONTAJUROSPAGOS','12',NULL,0);
INSERT INTO Config VALUES(39,'EXIGIR_LOGIN','SIM','Será solicitado login ao abrir o sistema?',0);
INSERT INTO Config VALUES(40,'ANO_A_PARTIR_DE','2014','A partir de que ano será criado o popup de anos para relatórios de análises?',0);
INSERT INTO Config VALUES(41,'REL_VENDA_PRODUTO',replace('select p.nome as "Nome do Produto", sum(d.qtd) as "Quantidade"\nfrom venda v, vendadetalhes d, produto p\nwhere v.id = d.venda_id\nand p.id = d.produto_id\nand v.data>="{DATA_INICIAL}" and v.data<="{DATA_FINAL}"\ngroup by d.produto_id\norder by sum(d.qtd) desc\n','\n',char(10)),NULL,0);
INSERT INTO Config VALUES(42,'CRIPTOGRAFARBANCO','NAO','Se for sim vai criptografar o banco no início caso não esteja criptografado',0);
INSERT INTO Config VALUES(43,'CIDADEPADRAO','Monte Alegre de Minas','Cidade Padrão Cadastro',8);
INSERT INTO Config VALUES(44,'UFPADRAO','MG','Estado Padrão Cadastro',8);
INSERT INTO Config VALUES(45,'CEPPADRAO','38420-000','Cep Padrão Cadastro',8);
INSERT INTO Config VALUES(46,'REGISTROUSUARIO',NULL,NULL,0);
CREATE TABLE [Banco] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [bancoconta_id] INTEGER, [debito] REAL DEFAULT(0), [credito] REAL DEFAULT(0), [descricao] TEXT, [obs] TEXT, [data] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
INSERT INTO Banco VALUES(11,27,0.0,7000000.0,'SALDO INICIAL','','2021-07-13',NULL,NULL,NULL,NULL);
INSERT INTO Banco VALUES(12,27,450000.0,0.0,'COMPRA DE TERRENO','','2021-07-13',NULL,NULL,NULL,NULL);
INSERT INTO Banco VALUES(13,27,33999.999999999999111,0.0,'ELETRICA/HIDRAULICA E RUA','INSTALAÇÃO ELÉTRICA, HIDRAULICA E RUA PRINCIPAL','2021-07-13',NULL,NULL,NULL,NULL);
CREATE TABLE [BancoConta] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [nome] TEXT, [tipoconta] TEXT, [obs] TEXT, [banco_nome] TEXT, [agencia] TEXT, [conta] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT);
INSERT INTO BancoConta VALUES(27,'CAMPUS DO PICI','CONTA_CORRENTE',NULL,'BANCO DO BRASIL','CAMPUS DO PICI','',NULL,NULL,NULL,NULL);
CREATE TABLE [Venda] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [cliente_id] INTEGER, [descricao] TEXT, [obs] TEXT, [data] TEXT, [meiopagamento] TEXT, [formaPagamento_id] INTEGER, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT, [totaldavenda] REAL, [usuario_id] INTEGER DEFAULT(0));
INSERT INTO Venda VALUES(1013,4824,'des','obs','2021-07-15',NULL,NULL,NULL,NULL,NULL,NULL,150.0,0);
INSERT INTO Venda VALUES(1014,3,'','','2021-07-16',NULL,NULL,NULL,NULL,NULL,NULL,200.0,0);
INSERT INTO Venda VALUES(1015,4833,'','','2021-07-16',NULL,NULL,NULL,NULL,NULL,NULL,250.0,0);
CREATE TABLE [temporaria] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [texto1] TEXT, [texto2] TEXT, [texto3] TEXT, [texto4] TEXT, [valor1] Real, [valor2] Real, [valor3] Real, [valor4] Real, [valor5] Real, [inteiro1] Integer, [inteiro2] Integer, [inteiro3] Integer, [inteiro4] Integer, [inteiro5] Integer, [data1] date, [data2] date, [data3] date, [data4] date, [data5] date, [chave] STRING);
INSERT INTO temporaria VALUES(3,'Novembro',NULL,NULL,NULL,2191.8699999999997629,3106.2100000000003596,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO temporaria VALUES(4,'Novembro',NULL,NULL,NULL,0.0,0.0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE [Usuario] ([id] INTEGER PRIMARY KEY AUTOINCREMENT, [nome] TEXT, [email] TEXT, [username] TEXT, [senha] TEXT, [criadoEm] TEXT, [criadoPor] TEXT, [alteradoEm] TEXT, [alteradoPor] TEXT, [root] BOOLEAN, [menu] TEXT (2000));
INSERT INTO Usuario VALUES(1,'Administrador','','admin','202cb962ac59075b964b07152d234b70',NULL,NULL,'2014-11-27 18:14:06','admin','True','(Arquivo)Sair!(Cadastro)Clientes!(Cadastro)Vendas!(Cadastro)Fornecedores!(Cadastro)Produtos!(Cadastro)Categorias de Produtos!(Cadastro)Formas de pagamento!(Cadastro)Contas do Caixa!(Cadastro)Contas Bancárias!(Cadastro)Usuários/Vendedores!(Movimentação)Contas a Pagar!(Movimentação)Contas a Receber!(Movimentação)Caixa!(Movimentação)Movimentação Bancária!(Movimentação)Efetuar Venda!(Movimentação)Receber Conta!(Movimentação)Lançar Pagamento de Contas!(Relatórios)Clientes!(Relatórios)Clientes Básico!(Relatórios)Aniversariantes!(Relatórios)Ficha Do Cliente!(Relatórios)Fornecedores!(Relatórios)Fornecedores Básico!(Relatórios)Ficha do Fornecedor!(Relatórios)Contas a Pagar e Receber!(Relatórios)Contas a Pagar!(Relatórios)Contas a Receber!(Relatórios)Contas a Receber - Clientes Bloqueados!(Relatórios)Cobrança!(Relatórios)Cobrança - Todas Contas em Atraso!(Relatórios)Cobrança - Contas que vencem hoje!(Relatórios)Cobrança - Contas vencidas a mais de 5 dias!(Relatórios)Carta de Cobrança!(Relatórios)Caixa e Movimentação Bancária!(Relatórios)Caixa!(Relatórios)Contas Bancárias!(Relatórios)Movimentação Bancária!(Relatórios)Plano de Contas Gerenciais!(Relatórios)Contas do Plano de Contas Gerenciais!(Relatórios)Espelho do Plano de Contas Gerenciais!(Relatórios)Produtos!(Relatórios)Categoria de Produtos!(Relatórios)Vendas!(Relatórios)Vendas!(Relatórios)Vendas por Cliente!(Relatórios)Vendas por Produto!(Relatórios)Comissões!(Relatórios)Comissões por Venda!(Relatórios)Total de Comissões!(Relatórios)Formas de Pagamento!(Relatórios)Usuários do Sistema!(Relatórios)Análises Gerenciais!(Relatórios)Comparativo Vendas e Recebimentos Anuais!(Ferramentas)Gerente 360!(Ferramentas)Opções do Sistema!(Ajuda)Sobre');
INSERT INTO Usuario VALUES(3,'Vendas','','v','202cb962ac59075b964b07152d234b70','2013-12-07 13:12:40','baciotti','2015-09-28 08:48:36','admin','False','(Arquivo)Sair!(Cadastro)Clientes!(Cadastro)Fornecedores!(Movimentação)Receber Conta!(Relatórios)Aniversariantes!(Ajuda)Sobre');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Cliente',4833);
INSERT INTO sqlite_sequence VALUES('Fornecedor',14);
INSERT INTO sqlite_sequence VALUES('ProdutoCategoria',8);
INSERT INTO sqlite_sequence VALUES('Conta',19);
INSERT INTO sqlite_sequence VALUES('CPagar',9);
INSERT INTO sqlite_sequence VALUES('Caixa',4405);
INSERT INTO sqlite_sequence VALUES('FormaPagamento',34);
INSERT INTO sqlite_sequence VALUES('CReceber',10698);
INSERT INTO sqlite_sequence VALUES('VendaDetalhes',1040);
INSERT INTO sqlite_sequence VALUES('Produto',21);
INSERT INTO sqlite_sequence VALUES('Config',46);
INSERT INTO sqlite_sequence VALUES('BancoConta',27);
INSERT INTO sqlite_sequence VALUES('Banco',13);
INSERT INTO sqlite_sequence VALUES('Venda',1015);
INSERT INTO sqlite_sequence VALUES('temporaria',4);
INSERT INTO sqlite_sequence VALUES('Usuario',6);
CREATE INDEX [idx_Caixa] ON [Caixa] ([conta_id]);
CREATE INDEX [Config_Chave] ON [Config] ( [chave] );
CREATE INDEX [idx_temporaria] ON [temporaria] ([chave]);
CREATE INDEX [idx_Cliente] ON [Cliente] ([nome]);
CREATE VIEW [rel_cliente_aniversario_nome] AS select id as "Código",ifnull(nome,"-") as "Nome do Cliente", 
ifnull(telefones,"-") as "Telefone", ifnull(strftime("%d/%m",dataNascimento),"-") as "Aniversário"
from cliente
order by nome;
CREATE VIEW [rel_cliente_aniversario_mes] AS select id as "Código",ifnull(nome,"-") as "Nome do Cliente", 
ifnull(telefones,"-") as "Telefone", ifnull(strftime("%d/%m",dataNascimento),"-") as "Aniversário"
from cliente
order by strftime("%m", dataNascimento);
CREATE VIEW [rel_cliente] AS select id as "Código",
ifnull(nome,"-") as "Nome do Cliente", 
ifnull(endereco,"-") as "Endereço", 
ifnull(bairro,"-") as "Bairro", 
ifnull(cidade,"-") as "Cidade", 
ifnull(uf,"-") as "Estado", 
ifnull(cep,"-") as "Cep", 
ifnull(telefones,"-") as "Telefone" from cliente
order by nome;
CREATE VIEW [rel_cliente_cidadebairro] AS select id as "Código",
ifnull(nome,"-") as "Nome do Cliente", 
ifnull(endereco,"-") as "Endereço", 
ifnull(bairro,"-") as "Bairro", 
ifnull(cidade,"-") as "Cidade", 
ifnull(uf,"-") as "Estado", 
ifnull(cep,"-") as "Cep", 
ifnull(telefones,"-") as "Telefone" from cliente
order by cidade, bairro;
CREATE VIEW [rel_produtocategoria_id] AS select id as "Código", 
ifnull(nome,"-") as "Nome da Categoria"
from ProdutoCategoria
order by id;
CREATE VIEW [rel_produtocategoria_nome] AS select id as "Código", 
ifnull(nome,"-") as "Nome da Categoria"
from ProdutoCategoria
order by nome;
CREATE VIEW [rel_conta_id] AS select id as "Código", 
ifnull(nome,"-") as "Nome da Conta",

CASE 
When tipoconta="C" then "Crédito"
WHEN tipoconta="D" then "Débito"
else ifnull(tipoconta,"-")
end
 as "Tipo da Conta"

from Conta
order by id;
CREATE VIEW [rel_conta_nome] AS select id as "Código", 
ifnull(nome,"-") as "Nome da Conta",

CASE 
When tipoconta="C" then "Crédito"
WHEN tipoconta="D" then "Débito"
else ifnull(tipoconta,"-")
end
 as "Tipo da Conta"

from Conta
order by nome;
CREATE VIEW [rel_formapagamento_id] AS select id as "Código", 
ifnull(descricao,"-") as "Forma de Pagamento",
case
when entrada=1 then "Sim"
when entrada=0 then "Não"
end as "Possui Entrada?",
parcelas as "Número de Parcelas"

 from formapagamento
 order by id;
CREATE VIEW [rel_formapagamento_descricao] AS select id as "Código", 
ifnull(descricao,"-") as "Forma de Pagamento",
case
when entrada=1 then "Sim"
when entrada=0 then "Não"
end as "Possui Entrada?",
parcelas as "Número de Parcelas"

 from formapagamento
 order by descricao;
CREATE VIEW [rel_fornecedor_nome] AS select id as "Código",ifnull(nome,"-") as "Nome do Fornecedor", 
ifnull(telefones,"-") as "Telefone",
ifnull(endereco,"-") as "Endereço",
ifnull(bairro,"-") as "Bairro",
ifnull(cidade,"-") as "Cidade",
ifnull(uf,"-") as "UF",
ifnull(cep,"-") as "Cep"


from Fornecedor
order by nome;
CREATE VIEW [rel_fornecedor_id] AS select id as "Código",ifnull(nome,"-") as "Nome do Fornecedor", 
ifnull(telefones,"-") as "Telefone",
ifnull(endereco,"-") as "Endereço",
ifnull(bairro,"-") as "Bairro",
ifnull(cidade,"-") as "Cidade",
ifnull(uf,"-") as "UF",
ifnull(cep,"-") as "Cep"


from Fornecedor
order by id;
CREATE VIEW [rel_produto_id] AS select p.id as "Código",
ifnull(p.nome,"-") as "Nome do Produto", 
ifnull(c.nome,"-") as "Nome da Categoria",

case 
    when substr(preco_custo,length(ROUND(preco_custo,2))-1,1) = "." then replace(p.preco_custo,".",",") || "0" 
    else replace(p.preco_custo,".",",") end  as "Preço de Custo",

case 
    when substr(preco_avista,length(ROUND(preco_avista,2))-1,1) = "." then replace(p.preco_avista,".",",") || "0" 
    else replace(p.preco_avista,".",",") end  as "Preço A Vista",

case 
    when substr(preco_aprazo,length(ROUND(preco_aprazo,2))-1,1) = "." then replace(p.preco_aprazo,".",",") || "0" 
    else replace(p.preco_aprazo,".",",") end  as "Preço A Prazo",
    
p.tipo_cadastro as "Tipo Cadastro",
p.estoque_atual as "Estoque Atual",
p.estoque_minimo as "Estoque Mínimo"
    






from produto p, Produtocategoria c

where p.categoria_id = c.id

order by p.id;
CREATE VIEW [rel_produto_nome] AS select p.id as "Código",
ifnull(p.nome,"-") as "Nome do Produto", 
ifnull(c.nome,"-") as "Nome da Categoria",

case 
    when substr(preco_custo,length(ROUND(preco_custo,2))-1,1) = "." then replace(p.preco_custo,".",",") || "0" 
    else replace(p.preco_custo,".",",") end  as "Preço de Custo",

case 
    when substr(preco_avista,length(ROUND(preco_avista,2))-1,1) = "." then replace(p.preco_avista,".",",") || "0" 
    else replace(p.preco_avista,".",",") end  as "Preço A Vista",

case 
    when substr(preco_aprazo,length(ROUND(preco_aprazo,2))-1,1) = "." then replace(p.preco_aprazo,".",",") || "0" 
    else replace(p.preco_aprazo,".",",") end  as "Preço A Prazo",
    
p.tipo_cadastro as "Tipo Cadastro",
p.estoque_atual as "Estoque Atual",
p.estoque_minimo as "Estoque Mínimo"
    






from produto p, Produtocategoria c

where p.categoria_id = c.id

order by p.nome;
CREATE VIEW [rel_produto_categoria] AS select p.id as "Código",
ifnull(p.nome,"-") as "Nome do Produto", 
ifnull(c.nome,"-") as "Nome da Categoria",

case 
    when substr(preco_custo,length(ROUND(preco_custo,2))-1,1) = "." then replace(p.preco_custo,".",",") || "0" 
    else replace(p.preco_custo,".",",") end  as "Preço de Custo",

case 
    when substr(preco_avista,length(ROUND(preco_avista,2))-1,1) = "." then replace(p.preco_avista,".",",") || "0" 
    else replace(p.preco_avista,".",",") end  as "Preço A Vista",

case 
    when substr(preco_aprazo,length(ROUND(preco_aprazo,2))-1,1) = "." then replace(p.preco_aprazo,".",",") || "0" 
    else replace(p.preco_aprazo,".",",") end  as "Preço A Prazo",
    
p.tipo_cadastro as "Tipo Cadastro",
p.estoque_atual as "Estoque Atual",
p.estoque_minimo as "Estoque Mínimo"
    






from produto p, Produtocategoria c

where p.categoria_id = c.id

order by c.nome;
CREATE VIEW [rel_cpagar_vencimento] AS select p.dataConta as "Data Conta", 
ifnull(p.descricao,"-") as "Descricao",
case 
    when substr(p.valor,length(ROUND(valor,2))-1,1) = "." then replace(p.valor,".",",") || "0"     
    else replace(p.valor,".",",") end  as "Valor",

case 
    when substr(p.valor_pago,length(ROUND(valor_pago,2))-1,1) = "." then replace(p.valor_pago,".",",") || "0"     
    else ifnull(replace(p.valor_pago,".",","),"-") end  as "Valor Pago",

ifnull((select nome from fornecedor where id=p.fornecedor_id),"-") as "Nome do Fornecedor",

p.dataVencimento as "Data Vencimento",

ifnull(p.dataPagamento,"-") as "Data Pagamento",

Case 
  when (dataVencimento<date()  and  dataPagamento is null) then "EM ATRASO"
  when dataPagamento is null then "Em aberto"
  when dataPagamento is not null then "Pago"
  END as Status

from cPagar p

order by p.dataVencimento;
CREATE VIEW [rel_cliente_ficha] AS select id as "Código",
ifnull(nome,"-") as "Nome",
ifnull(endereco,"-") as "Endereço",
ifnull(bairro,"-") as "Bairro",
ifnull(cidade,"-") as "Cidade",
ifnull(uf,"-") as "Estado",
ifnull(cep,"-") as "Cep",
ifnull(telefones,"-") as "Telefones",
ifnull(Datanascimento,"-") as "Data de Nascimento",
ifnull(cpf,"-") as "CPF",
ifnull(rg,"-") as "Rg",
ifnull(sexo,"-") as "Sexo",
ifnull(nomedamae,"-") as "Nome da Mãe",
ifnull(nomedopai,"-") as "Nome do Pai",
ifnull(localTrabalho,"-") as "Local de Trabalho",
ifnull(datacadastro,"-") as "Data de Cadastro",
ifnull(dataultimaconsulta,"-") as "Data da Última Consulta",
ifnull(ultimareceita,"-") as "Última Receita"



from cliente;
CREATE VIEW [rel_fornecedor_ficha] AS select id as "Código",
ifnull(nome,"-") as "Nome",
ifnull(endereco,"-") as "Endereço",
ifnull(bairro,"-") as "Bairro",
ifnull(cidade,"-") as "Cidade",
ifnull(uf,"-") as "Estado",
ifnull(cep,"-") as "Cep",
ifnull(telefones,"-") as "Telefones",
ifnull(Datanascimento,"-") as "Data Fundação",
ifnull(cnpj,"-") as "CNPJ",
ifnull(inscestadual,"-") as "Insc. Estadual",
ifnull(contato1,"-") as "Contato 1",
ifnull(contato2,"-") as "Contato 2"


from fornecedor;
CREATE VIEW [rel_bancoconta_id] AS select ifnull(id,"-") as "Código",
ifnull(nome,"-") as "Nome",
ifnull(banco_nome,"-") as "Banco",
ifnull(agencia,"-") as "Agência",
ifnull(conta,"-") as "Número Da Conta",

case
 when tipoconta="C" then "Conta Corrente"
 when tipoconta="P" then "Conta Poupança"
 end as "Tipo da Conta"
 


from BancoConta

order by id;
CREATE VIEW [rel_bancoconta_nome] AS select ifnull(id,"-") as "Código",
ifnull(nome,"-") as "Nome",
ifnull(banco_nome,"-") as "Banco",
ifnull(agencia,"-") as "Agência",
ifnull(conta,"-") as "Número Da Conta",

case
 when tipoconta="C" then "Conta Corrente"
 when tipoconta="P" then "Conta Poupança"
 end as "Tipo da Conta"
 


from BancoConta

order by nome;
CREATE VIEW [rel_creceber_vencimento] AS select r.dataConta as "Data Conta", 
ifnull(r.descricao,"-") as "Descricao",
case 
    when substr(r.valor,length(ROUND(valor,2))-1,1) = "." then replace(r.valor,".",",") || "0"     
    else replace(r.valor,".",",") end  as "Valor",

case 
    when substr(r.valor_pago,length(ROUND(valor_pago,2))-1,1) = "." then replace(r.valor_pago,".",",") || "0"     
    else ifnull(replace(r.valor_pago,".",","),"-") end  as "Valor Pago",

ifnull(c.nome,"-") as "Nome do Cliente",

r.dataVencimento as "Data Vencimento",
ifnull(r.dataPagamento,"-") as "Data Pagamento",

(select f.descricao 
 from FormaPagamento f, venda v
 where f.id = v.formapagamento_id
 and v.id = r.venda_id 
 ) as "FormaPagamento",


Case 
  when (dataVencimento<date()  and  dataPagamento is null) then "EM ATRASO"
  when dataPagamento is null then "Em aberto"
  when dataPagamento is not null then "Pago"
  END as Status

from CReceber r, cliente c

where c.id = r.cliente_id

and c.clienteBloqueado = 0

order by r.dataVencimento;
CREATE VIEW [rel_creceber_BLOQUEADOS] AS select r.dataConta as "Data Conta", 
ifnull(r.descricao,"-") as "Descricao",
case 
    when substr(r.valor,length(ROUND(valor,2))-1,1) = "." then replace(r.valor,".",",") || "0"     
    else replace(r.valor,".",",") end  as "Valor",

case 
    when substr(r.valor_pago,length(ROUND(valor_pago,2))-1,1) = "." then replace(r.valor_pago,".",",") || "0"     
    else ifnull(replace(r.valor_pago,".",","),"-") end  as "Valor Pago",

ifnull(c.nome,"-") as "Nome do Cliente",

r.dataVencimento as "Data Vencimento",
ifnull(r.dataPagamento,"-") as "Data Pagamento",

(select f.descricao 
 from FormaPagamento f, venda v
 where f.id = v.formapagamento_id
 and v.id = r.venda_id 
 ) as "FormaPagamento",


Case 
  when (dataVencimento<date()  and  dataPagamento is null) then "EM ATRASO"
  when dataPagamento is null then "Em aberto"
  when dataPagamento is not null then "Pago"
  END as Status

from CReceber r, cliente c

where c.id = r.cliente_id

and c.clienteBloqueado = 1

order by r.dataVencimento;
CREATE VIEW [rel_cobranca] AS select r.dataConta as "Data Conta", 
ifnull(r.descricao,"-") as "Descricao",
case 
    when substr(r.valor,length(ROUND(valor,2))-1,1) = "." then replace(r.valor,".",",") || "0"     
    else replace(r.valor,".",",") end  as "Valor",

ifnull(c.nome,"-") as "Nome do Cliente",
ifnull(c.telefones,"-") as "Telefone",

r.dataVencimento as "Data Vencimento",



Case 
  when (dataVencimento<date()  and  dataPagamento is null) then "EM ATRASO"
  when dataPagamento is null then "Em aberto"
  when dataPagamento is not null then "Pago"
  END as Status

from CReceber r, cliente c

where c.id = r.cliente_id

and c.clienteBloqueado = 0


order by r.dataVencimento;
CREATE VIEW [rel_venda] AS SELECT ifnull ( v . id , "-" ) AS "Código" , ifnull ( v . data , "-" ) AS Data , ifnull ( ( SELECT nome FROM cliente c WHERE c . id = v . cliente_id ) , "-" ) AS "Nome do Cliente" , ifnull ( v . descricao , "-" ) AS "Descrição" , ifnull ( v . meiopagamento , "-" ) AS "Meio de Pagamento" , ifnull ( ( SELECT descricao FROM formapagamento fp WHERE fp . id = v . formapagamento_id ) , "-" ) AS "Forma Pagamento" , CASE WHEN substr ( v . totaldavenda , length ( ROUND ( v . totaldavenda , 2 ) ) - 1 , 1 ) = "." THEN REPLACE ( v . totaldavenda , "." , "," ) || "0" ELSE REPLACE ( v . totaldavenda , "." , "," ) END AS "Total da Venda" FROM Venda v ORDER BY v . data;
CREATE VIEW [rel_analiseanual1] AS SELECT texto1 AS "Mês" , CASE WHEN substr ( valor1 , length ( ROUND ( valor1 , 2 ) ) - 1 , 1 ) = "." THEN REPLACE ( valor1 , "." , "," ) || "0" ELSE REPLACE ( valor1 , "." , "," ) END AS "Total de Vendas" , CASE WHEN substr ( valor2 , length ( ROUND ( valor2 , 2 ) ) - 1 , 1 ) = "." THEN REPLACE ( valor2 , "." , "," ) || "0" ELSE REPLACE ( valor2 , "." , "," ) END AS "Total de Recebimentos" 
FROM temporaria where chave="analiseanual1";
CREATE VIEW [rel_usuario_id] AS SELECT id AS "Código" , ifnull ( nome , "-" ) AS "Nome do Usuário" , ifnull ( email , "-" ) AS "Email" , ifnull ( username , "-" ) AS "Identificação" , CASE WHEN root = "True" THEN "Administrador" WHEN root = "False" THEN "Usuário Normal" END AS "Perfil do Usuário" FROM Usuario ORDER BY id;
CREATE VIEW [rel_usuario_nome] AS SELECT id AS "Código" , ifnull ( nome , "-" ) AS "Nome do Usuário" , ifnull ( email , "-" ) AS "Email" , ifnull ( username , "-" ) AS "Identificação" , CASE WHEN root = "True" THEN "Administrador" WHEN root = "False" THEN "Usuário Normal" END AS "Perfil do Usuário" FROM Usuario ORDER BY nome;
CREATE VIEW [rel_caixa] AS select 

data as "Data",
ifnull(c.descricao,"-") as "Descrição",
ifnull((select nome from conta where id = c.conta_id),"-") as "Conta Gerencial",
ifnull((select nome from cliente where id = c.cliente_id),"-") as "Nome do Cliente",
ifnull((select nome from fornecedor where id = c.fornecedor_id),"-") as "Nome do Fornecedor",

case 
    when substr(c.debito,length(ROUND(debito,2))-1,1) = "." then replace(c.debito,".",",") || "0" 
    else replace(c.debito,".",",") end as "Débito",
    
case 
    when substr(c.credito,length(ROUND(credito,2))-1,1) = "." then replace(c.credito,".",",") || "0" 
    else replace(c.credito,".",",") end  as "Crédito",

case 
    when substr((select SUM(credito) - SUM(debito) from Caixa caixa where caixa.id<=c.id),length(ROUND((select SUM(credito) - SUM(debito) from Caixa caixa where caixa.id<=c.id),2))-1,1) = "." then replace(round((select SUM(credito) - SUM(debito) from Caixa caixa where caixa.id<=c.id),2),".",",") || "0" 
    else replace(round((select SUM(credito) - SUM(debito) from Caixa caixa where caixa.id<=c.id),2),".",",") end  as "Saldo"
    
    from Caixa c
    
    where data >="2015-09-20"
    
    order by c.data;
COMMIT;
main: /home/vlademiro/sistemas/hbmediator/samples/minierp/data/destino.sqlite
