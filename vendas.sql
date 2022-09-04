create database Vendas;
Use Vendas;
 
Create Table Categoria_Produto
(
id smallint not null ,
nome varchar(30)
);

Create table Produto
(
id	smallint,
nome varchar(40),
preco decimal(5,2),
Id_categoria int

);

Create Table venda_produto
(
id smallint,	
id_produto	int,
valor	decimal(6,2),
data date
);

insert into Categoria_produto values (1,'Infantil');
insert into Categoria_produto values (2,'Informatica');
insert into Categoria_produto values (3,'Educacional');

insert into Produto values (1,'Bola',	35.00,	1);
insert into Produto values (2,	'Patinete',	120.00,	1);
insert into Produto values (3,	'Carrinho',	15.00,	1);
insert into Produto values (4,	'Skate',	296.00,	1);
insert into Produto values (5,	'Notebook',	3500.00,	2);
insert into Produto values (6,	'Monitor LG 19',	450.00,	2);
insert into Produto values (7,	'O Diário de Anne Frank',	45.00,	3);
insert into Produto values (8,	'O dia do Curinga',	65.00,	3);
insert into Produto values (9,	'O mundo de Sofia',	48.00,	3);
insert into Produto values (10,	'Através do Espelho',	38.00,	3);


insert into Venda_produto values (1,	1,	35.00,	'2018-05-15');
insert into Venda_produto values (2,	1,	35.00,	'2018-06-15');
insert into Venda_produto values (3,	1,	35.00,	'2019-07-15');
insert into Venda_produto values (4,	2,	120.00,	'2019-07-15');
insert into Venda_produto values (5,	2,	120.00,	'2020-07-14');
insert into Venda_produto values (6,	3,	15.00,	'2020-07-15');
insert into Venda_produto values (7,	7,	45.00,	'2021-07-15');
insert into Venda_produto values (8,	8,	65.00,	'2021-07-15');
insert into Venda_produto values (9,	8,	65.00,	'2018-07-16');
insert into Venda_produto values (10,	9,	48.00,	'2019-07-16');
insert into Venda_produto values (11,	5,	3500.00,	'2020-07-16');
insert into Venda_produto values (12,	5,	3500.00,	'2021-07-16');
insert into Venda_produto values (13,	6,	450.00,	'2018-07-16');

select * from venda_produto;
SELECT nome.Produto, preco.Produto FROM Produto g
JOIN Categoria_Produto a
ON g.id = a.id;