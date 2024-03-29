/* Modelagem  Basica */

/*Create database */

CREATE DATABASE TWB;

/* Connect database */

use twb;

/* create table */

CREATE TABLE CLIENTE (
	
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF  VARCHAR(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
	




);



/*LEMBRE-SE E SEMPRE () */

/* VERIFICANDO AS TABELAS */

SHOW  TABLES;


/* VISUALIZAR  ESTRUTURA DA TABELA */
DESC CLIENTE ;


/* SINTAXE BASICA DE INSERÇÃO - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO AS COLUNAS */


INSERT INTO CLIENTE VALUES("JOAO","M", "JOAO@GMAIL.COM","988638273","22923110","MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ");
INSERT INTO CLIENTE VALUES("CELIA","F", "CELIA@GMAIL.COM","541521456","25078869","RIACHUELO - CENTRO - RIO DE JANEIRO - RJ");
INSERT INTO CLIENTE VALUES("JORGE","M", "NULL","885755896","58748895","OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG");


/* MODELO 02 DE INSERÇÃO DE DADOS COLOCANDO AS COLUNAS */


INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE,CPF)VALUES("LILIAN","F","SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ'","947785696","887774856");


/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');


/* SELECT PROJEÇÃO, SELEÇÃO, JUNÇÃO */

SELECT NOW() AS DATA_HORA,"THALES WILLIAN" AS "ALUNO";


/* SELEÇÃO COM SELECT AQUI VOCE SELECIONA OS ATRIBUTOS DA SUA TABELA */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE;

/* USANDO *(ASTERISTICO) MÁ PRATICA */

SELECT * FROM CLIENTE;


/*FILTRANDO COM SELECT E WHERE E LIKE */

SELECT NOME, ENDERECO FROM CLIENTE 
WHERE SEXO ="F";



/*UTILIZANDO O LIKE */
SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE "RJ";




/* CARACTER CORINGA & QUALQUER COISA */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE "%RJ"; /* QUALQUER COISA ANTES DO % VAI SER BUSCADO */

/*EXATAMENTE */

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';


CREATE DATABASE LIVRARIA;



CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);




/* VARIFICANDO OS BANCOS */
SHOW DATABASES;

CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);


INSERT INTO LIVROS VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);


/*TRAZER TODOS OS ELEMENTOS DA TABELA */
SELECT * FROM LIVROS;

/*NOME DO LIVRO E DA EDITORA*/

SELECT LIVRO, EDITORA FROM LIVROS 


/*TRAZER OS LIVROS, UF TODOS DO SEXO MASCULINO */

SELECT LIVRO, UF FROM LIVROS
WHERE SEXO ="M";


/*TRAZER NOME DO LIVRO E A PAGINA  DO SEXO FEMININO */
SELECT LIVRO, PAGINAS FROM LIVROS
WHERE SEXO ="F";


/* TRAZER VALORES DOS LIVROS DE SÃO PAULO */
SELECT UF, VALOR FROM LIVROS
WHERE UF="SP";

/* TRAZER LIVROS DO SEXO MASCULINO PUBLICO NO RJ OU SP */
SELECT SEXO, LIVRO, UF, PAGINAS FROM LIVROS 
WHERE SEXO="M" AND (UF="RJ" OR UF="SP");

/*OPERADORES LOGICOS */
/* OR E AND 

OR --- PARA QUE A SAÍDA DA QUERY SEJA VERDADEIRA, BASTA UMA SAIDA SEJA VERDADE 
AND --- PARA QUE A SAÍDA DA QUERY SEJA VERDADEURA, TODAS AS SAÍDAS TEM QUE SER VERDADEIRA */


/*2 – Trazer o nome do livro e o nome da editora*/

SELECT LIVRO, EDITORA FROM LIVROS;

/*3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/

SELECT  LIVRO AS NOME, UF FROM LIVROS 
WHERE SEXO ="M";


/*TRAZER AUTOR DO SEXO MASCULINO UF SP PAGINAS > 100 */

SELECT AUTOR FROM LIVROS
WHERE SEXO="M" AND (UF="SP" OR PAGINAS > 100);


/* USANDO OR */


SELECT AUTOR, SEXO, UF FROM LIVROS
WHERE SEXO="M" OR UF="%RJ"; /* ELE VAI BUSCAR UM DOS DOIS OU CASO TENHA OS DOIS OS DOIS */

SELECT AUTOR, SEXO, UF FROM LIVROS
WHERE SEXO="F" AND UF="RJ"; /* ELE VAI BUSCAR EXATAMENTO OS DOIS ELEMENTOS E RETORNAR EXATEMENTE ESSES DOS ELEMENTOS DA QUERY*/











/*COUNT(*), GROUP BY, PERFORMACE COM OPERADORES LOGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT  COUNT(*)  FROM LIVROS; /* IRA MOSTRAR TODOS OS REGISTROS DA TABELA */

/*GROUP BY */

SELECT SEXO, COUNT(*)
FROM LIVROS
GROUP BY SEXO; /*ELE VAI CONTAR QUANTOS QUERYS DO SEXO TEM */

SELECT UF, COUNT(*)
FROM LIVROS 
GROUP BY UF;


SELECT COUNT(*), DEPARTAMENTO FROM FUNCIONARIOS
GROUP BY DEPARTAMENTO 
ORDER BY 1; /* DO MENOR PARA O MAIOR

/*PERFORMACE*/



/









/*TRAGA OS FUNCIONARIOS DE FILMES OU ROUPAS*/
SELECT NOME, DEPARTAMENTO FROM FUNCIONARIOS 
WHERE DEPARTAMENTO="FILMES" OR DEPARTAMENTO="ROUPAS";


/*LISTAR OS FUNCIONARIOS QUE TRABALHA NO SETOR DE FILMES OU NO SETOR LAR*/


/*BUSCAR OS GRUPOS DOS FILMES */

SELECT DEPARTAMENTO, COUNT(*)
FROM FUNCIONARIOS 
GROUP BY DEPARTAMENTO;




*UPDATE */

UPDATE CLIENTE 
SET EMAIL="LILIAN@HOTMAIL.COM" /*DESSA MANEIRA ELE PASSA A SOBREESCREVER TODOS OS EMAIL COM ESSE EMAIL QUE VOCE PASSOU NO SET*/

/*WHERE VAI SER SEU MELHOR AMIGO  FILTRAGEM */

UPDATE CLIENTE 
SET EMAIL="LILIAN@HOTMAIL.COM"
WHERE NOME="LILIAN";

UPDATE CLIENTE 
SET EMAIL="JORGE@GMAIL.COM"
WHERE NOME="JORGE"



/*DELETE*/

DELETE * FROM CLIENTE; /*APAGADA A TABELA INTEIRA*/

/*MANEIRA QUE O PROFESSOR USA */
SELECT COUNT(*) FROM CLIENTE;

/*DELETANDO COM WHERE(ESPECIFICO)*/
DELETE FROM CLIENTE
WHERE NOME="ANA";


INSERT INTO CLIENTE VALUES("CARLA","F","C.LOPES@UOL.COM",98739634789,"12991487061","RUA COPPER LEAF- WILLIAMSBURG- KITCHENER");



/*DELETANDO COM ELEMENTOS PARECIDOS*/
DELETE FROM CLIENTE 
WHERE NOME="ANA" AND ENDERECO="WILLIAMSBURG";

/*CRIAÇÃO DE UM BANCO DE DADOS */

CREATE DATABASE EXERCICIO;


/* USAR O BANCO DE DADOS */

USE EXERCICIO;

/*CRIAR TABELA */

CREATE TABLE FUNCIONARIOS 

{
	
	idFuncionario integer,
	nome varchar(100),
	email varchar(200),
	sexo varchar(10),
	departamento varchar(100),
	admissao varchar(10),
	salario integer,
	cargo varchar(100),
	idRegiao int



}


/* COMEÇANDO A MODELAR */

 /* CAMPO VETORIZADO É UM PROBLEMA */


 /*PRIMEIRA FORMA NORMAL */
 /* PARA MODELAR DE FORMA LIMPA */
 /* REGRAS DA PRIMEIRA MODELAGEM */

1 REGRA TODO CAMPO VETORIZADO SE TORNARÁ A OUTRA TABELA 

[AMARELO, AZUL, LARANJA, ROXO] - VETORES DE CORES
[FIESTA, PUNTO, GOL] - VETOR DE CARRO 


2 REGRA TODO CAMPO MULTIVALORADO SE TORNARA OUTRA TABELA QUANDO O CAMPOS FOR DIVISIVEL 


3 REGRA A MAIS IMPORTANTE TODA TABELA NECESSITA DE PELO MENOS UM CAMPO DE INDENTIFIQUE TODO O REGISTRO COMO SENDO UNICO ISSO QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY 
COLUNAS SÃO CAMPOS E AS LINHAS SAO REGISTROS 


CHAVE NATURAL PERTENCE AO REGISTRO 
CHAVE ARTIFICIAL ID (NUMERAÇÃO) MUITO MAIS UTILIZADAS 



/*cardialidade*/

/* PRIMEIRO ALGORITIMO - OBRIGATORIEDADE */
0 - NÃO OBRIGATÓRIO
1 - OBRIGATÓRIO

/* SEGUNDO ALGORITIMO - CARDINALIDADE */
1 - MAXIMO DE UM 
N - MAIS DE UM 


CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(10) NOT NULL, 		                       /*NOT NUM QUER DIZER QUE ESSA PARTE NÃO PODE FICAR EM BRANCO */
	SEXO ENUM("M", "F") NOT NULL,	                      /* VALOR FIXO VOCE DEFINE NAO PODE SER ALTERADO */ 
	EMAIL VARCHAR(50) UNIQUE, 		                        /* NÃO PODE SE REPETIR */
	CPF VARCHAR(15) UNIQUE





	);




CREATE TABLE ENDERECO(

	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE, /* UNICO ENDEREÇO PARA CADA CLIENTE 1 PARA 1 */
	
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)



);
/*apenas um endereço por cliente por isso o UNIQUE*/


CREATE TABLE TELEFONE (

	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM("RES","COM", "CEL") NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT, /* NÃO TEM UNIQUE PORQUE PARA CADA CLIENTE PODE TER VARIOS TELEFONES 1 PARA N*/
	
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)





);





/*ENDEREÇO OBRIGATÓRIO
CADASTRO SOMENTE UM.

TELEFONE - NÃO OBRIGATÓRIO 
CADASTRO DE MAIS DE UM (OPCIONAL) */


/*CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA QUE VAI ATE A OUTRA TABELA PARA FAZER REFERENCIA ENTRE REGISTROS */



/*RELACIONAMENTOS 1X1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */
/*DEPENDE DA REGRA DE NEGOCIO */

/*RELACIONAMENTO 1 X N  A CHAVE SEMPRE FICARA NA CARDINALIDADE N */


INSERT INTO CLIENTE VALUES(NULL,"JOÃO","M","JOAO@GMAIL.COM","39049738869");
INSERT INTO CLIENTE VALUES(NULL,"MARIA","F","MARIA@GMAIL.COM","7894538869");
INSERT INTO CLIENTE VALUES(NULL,"CARLOS","M","CARLOS@GMAIL.COM","5899938869");
INSERT INTO CLIENTE VALUES(NULL,"CLARA","F",NULL,"39049938869");
INSERT INTO CLIENTE VALUES(NULL,"CELIA","F","CELIA@GMAIL.COM","8884443869");

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+




/* SE O ENDEREÇO É OBRIGATÓRIO TEM QUE SER 6 ENDEREÇOS */

INSERT INTO ENDERECO VALUES(NULL,"RUA ANTONIO SA","CENTRO","B. HORIZONTE","MG",2);
INSERT INTO ENDERECO VALUES(NULL,"RUA CAPITAO HERMES","CENTRO","RIO DE JANEIRO","RJ",1);
INSERT INTO ENDERECO VALUES(NULL,"RUA ALFANDEGA","JARDINS","SAO PAULO","SP",3);
INSERT INTO ENDERECO VALUES(NULL,"RUA PRES VARGAS","ESTACIO","RIO DE JANEIRO ","RJ",4);
INSERT INTO ENDERECO VALUES(NULL,"RUA OUVIDOR","SANTANA","SÃO JOSE DOS CAMPOS","SP",5);

+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     | CENTRO   | B. HORIZONTE   | MG     |          4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SAO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGUAIANA     | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+

/* INSERÇÃO DO TELEDONE */
INSERT INTO TELEFONE VALUES("TEL","784558947",4);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);


+------------+------+----------+------------+
| IDTELEFONE | TIPO | NUMERO   | ID_CLIENTE |
+------------+------+----------+------------+
|          1 | CEL  | 78458743 |          5 |
|          2 | RES  | 56576876 |          5 |
|          3 | CEL  | 87866896 |          1 |
|          4 | COM  | 54768899 |          2 |
|          5 | RES  | 99667587 |          1 |
|          6 | CEL  | 78989765 |          3 |
|          7 | CEL  | 99766676 |          3 |
|          8 | COM  | 66687899 |          1 |
|          9 | RES  | 89986668 |          5 |
|         10 | CEL  | 88687909 |          2 |
+------------+------+----------+------------+


/*SELECAO, PROJECAO , JUNCAO */

/*PROJEÇÃO É TUDO O QUE VOCE QUER VER NA TELA */

SELECT NOW(); /*PROJETANDO DATA E HORA */

SELECT NOW() AS DATA_ATUAL; /* PROJETANDO ALGO QUE NÃO EXISTE*/

SELECT 2 * 2 AS SOMA, NOME, NOW()
FROM CLIENTE; 

/*SELEÇÃO TRAZER UM SUB CONJUNTO DE UM CONJUNTO FILTRAGEM COM WHERE*/

SELECT NOME, SEXO, EMAIL
FROM CLIENTE
WHERE SEXO="F"; /*AQUI SERIA A SELEÇÃO DO SUBCONJUNTO DA TABELA COM WHERE(CLAUSULA DE CELEÇÃO) */


SELECT NUMERO /*CAMPO*/ /*PROJECAO*/
FROM TELEFONE /*TABELA*/ /*ORIGEM*/
WHERE TIPO = "CEL" ;/*SUBCONJUNTO */ /*SELEÇÃO*/


/*JUNÇÃO -> JOIN */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE; /* IDCLIENTE PRIMARY KEY DE CLIENTE = ID_CLIENTE DE FORENKEY DE ENDERECO*/
+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* NÃO É UMA BOA PRATICA */

/* INNER JOIN*/

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE 
INNER JOIN ENDERECO /* QUANDO O ATRIBUTO DA TABELA FOR DIFERENTE PRIMEIRO VOCE BUSCA FROM CLIENTE E INNER JOIN PROXIMA TABELA*/
ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+


/*FAZENDO UM FILTRO COM UNIÃO DE TABELAS */
SELECT NOME, SEXO, BAIRRO, CIDADE /*PROJECAO*/
FROM CLIENTE /*ORIGEM */
INNER JOIN ENDERECO 
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = "M";

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+


SELECT NOME, SEXO , EMAIL , TIPO , NUMERO 
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;


+--------+------+----------------+------+----------+
| NOME   | SEXO | EMAIL          | TIPO | NUMERO   |
+--------+------+----------------+------+----------+
| JORGE  | M    | JORGE@IG.COM   | CEL  | 78458743 |
| JORGE  | M    | JORGE@IG.COM   | RES  | 56576876 |
| JOAO   | M    | JOAOA@IG.COM   | CEL  | 87866896 |
| CARLOS | M    | CARLOSA@IG.COM | COM  | 54768899 |
| JOAO   | M    | JOAOA@IG.COM   | RES  | 99667587 |
| ANA    | F    | ANA@IG.COM     | CEL  | 78989765 |
| ANA    | F    | ANA@IG.COM     | CEL  | 99766676 |
| JOAO   | M    | JOAOA@IG.COM   | COM  | 66687899 |
| JORGE  | M    | JORGE@IG.COM   | RES  | 89986668 |
| CARLOS | M    | CARLOSA@IG.COM | CEL  | 88687909 |
+--------+------+----------------+------+----------+



/*INNER JOIN */

/* MAIS DE DUAS TABELAS */


/*NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */
/*ESPECIFICAR DE ONDE VEM OS ATRIBUTOS */
SELECT CLIENTE.NOME, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO , TELEFONE.NUMERO 
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE 
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE ; 

+--------+---------+----------------+------+----------+
| NOME   | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+---------+----------------+------+----------+
| JOAO   | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO   | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| JOAO   | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| CARLOS | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| CARLOS | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
| ANA    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JORGE  | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | CENTRO  | VITORIA        | RES  | 56576876 |
| JORGE  | CENTRO  | VITORIA        | RES  | 89986668 |
+--------+---------+----------------+------+----------+

/* DA ERRO POR QUE VAI DAR ID AMBIGUO  ID ENDERECO E ID TELEFONE DA ERRO */

/*PONTERAMENTO */

SELECT C.NOME, E.BAIRRO, E.BAIRRO, T.TIPO, T.NUMERO 
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;


/* CATECORIAS 

	DML - DATA MANIPULATION LANGUAGE 
	DDL - DATA-DEFINITION-LANGUAGE
	DCL - DATA CONTROL LANGUAGE 
	TCL - TRANSACTION CONTROL LANGUAGE (ATOMICIDADE)
	
*/

/*  >>>DML <<<
	INSERT INTO CLIENTE VALUES(NULL,"PAULA", "M", "NULL","77437493");
	INSERT INTO ENDERECO VALUES(NULL, "RUA JOAQUIM SILVA","ALVORADA", "NITEROI", "RJ",7);
	INSERT INTO CLIENTE VALUES(NULL,"XXX", "F",NULL,"XXX"); POREM SEXO É M ELE ESTA SEM NOME E SEM CPF
	SELECT 
	FROM 
	UPDATE 
	DELETE (DELETA APENAS OS REGISTRO )
	

*/


/*FILTRO CORREÇÃO DA LINHA PAULA QUE ESTA COM O SEXO ERRADO CORREÇÃO PELO ID*/

SELECT * FROM CLIENTE
WHERE SEXO ="M";


/*UPDATE */

SELECT * FROM CLIENTE 
WHERE IDCLIENTE = 7;

+-----------+-------+------+-------+----------+
| IDCLIENTE | NOME  | SEXO | EMAIL | CPF      |
+-----------+-------+------+-------+----------+
|         7 | PAULA | M    | NULL  | 77437493 |
+-----------+-------+------+-------+----------+


UPDATE CLIENTE 
SET SEXO ="F"
WHERE IDCLIENTE = 7;

/*DELETE*/
DELETE FROM CLIENTE 
WHERE IDCLIENTE = 8;


/*COMANDO DDL - DATA DEFINITION LANGUAGE 


CREATE 
ALTER
CHANGE = ALTERA A COLUNA DA TABELA 
MODIFY = ALTERA A COLUNA DA TABELA MESMA FUNÇÃO DO CHANCE POREM NA LITERATURA ELE MUDA O TIPO 
ADD 
DROP 




*/

CREATE TABLE PRODUTO(
 IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
 NOME_PRODUTO VARCHAR(30) NOT NULL ,
 PRECO INT,
 FRETE FLOAT(10,20) NOT NULL


); /* OBRIGATORIO ESSE VALOR NÃO PODE SER NULO */
	

/*ALTER TABLE*/

/*ALTERANDO O NOME DE UMA COLUNA - CHANGE */
 ALTER TABLE PRODUTO 
 CHANGE PRECO VALOR_UNITARIO INT NOT NULL /* CHANGE ELE ALTERA A COLUNA DA DATEBAL */
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| FRETE          | float       | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/* ALTERANDO APENAS PARA INTEIRO RETIRANDO O NOT NULL */


ALTER TABLE PRODUTO 
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| FRETE          | float       | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/*MODIFY ALTERANDO O TIPO */

ALTER TABLE PRODUTO 
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL; /* TANTO O MODIFY QUANDO O CHANGE ELES FAZEM A MESMA COISA MUDAM O NOME, MUDA O TIPO ENTRE OUTRAS COISAS)  */


+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float       | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+



/* ADICIONANDO COLUNAS */
ALTER TABLE PRODUTO 
ADD PESO FLOAT(10,2);

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float       | NO   |     | NULL    |                |
| PESO           | float       | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float       | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


ALTER TABLE PRODUTO 
ADD PESO FLOAT(5.5);

/* QUERO MODIFICAR PARA NOT NULL */

ALTER TABLE PRODUTO
MODIFY PESO FLOAT(5,5) NOT NULL;