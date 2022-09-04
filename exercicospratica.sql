#criação do banco de dados
create database empresa;
use empresa;

#criação das tabelas
create table funcionarios(
codigo int(3) primary key,
primeironome varchar(15),
ultimonome varchar(15),
datanasci date,
cpf int(11),
rg int(15),
endereco varchar(60),
cep int(8),
cidade varchar(20),
fone int(13),
codigodepartamento int(3),
funcao varchar(20),
salario double
);
create table departamentos(
codigo int (3) primary key,
nome varchar(20),
localizacao varchar(10),
codigofuncionariogerente int(3)
);