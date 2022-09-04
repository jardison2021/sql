SET SQL_SAFE_UPDATES=0;
create Database Clinica;
Use Clinica;

Create table Ambulatorio
(nroa int primary key, 
andar numeric(3) not null, 
capacidade smallint
);

Create Table Medicos 
(codm int primary key, 
nome varchar(40) not null, 
idade smallint not null, 
especialidade char(20), 
CPF numeric(11) Unique, 
cidade varchar(30),  
nroa int
);

Create Table Pacientes
(codp int primary key, 
nome varchar(40) not null, 
idade smallint not null, 
cidade char(30), 
CPF numeric(11) Unique, 
doenca varchar(40)  not null
);

#alterando tabela Pacientes
alter table Pacientes
drop doenca;
select * from Pacientes;

Create Table Funcionarios
(codf int primary key, 
nome varchar(40) not null, 
idade smallint, 
cidade varchar(30),
salario numeric(10),
CPF numeric(11) Unique  
);

Create Table Consultas
(codm int, 
codp int, 
data date, 
hora time
);

Insert into Ambulatorio values (1,1,30);
Insert into Ambulatorio values (2,1,50);
Insert into Ambulatorio values (3,2,40);
Insert into Ambulatorio values (4,2,25);
Insert into Ambulatorio values (5,2,55);

insert into Medicos values (1,'Joao',40,'ortopedia',10000100000,'Florianopolis',1);
insert into Medicos values (2,'Maria',42,'traumatologia',10000110000,'Blumenau',2);
insert into Medicos values (3,'Pedro',51,'pediatria',11000100000,'Sao Jose',2);
insert into Medicos values (4,'Carlos',28,'ortopedia',11000110000,'Joinville',null);
insert into Medicos values (5,'Marcia',33,'neurologia',11000111000,'Canela',3);

Insert Into Pacientes values (1,'Ana',20,'Florianopolis',20000200000,'gripe');
Insert Into Pacientes values (2,'Paulo',24,'Palhoca',20000220000,'fratura');
Insert Into Pacientes values (3,'Lucio',30,'Canela',22000200000,'Tendinite');
Insert Into Pacientes values (4,'Carlos',28,'Joinville',11000110000,'sarampo');

Insert into Funcionarios values (1,'Rita',32,'Sao Jose',1200,20000100000);
Insert into Funcionarios values (2,'Maria',55,'Palhoca',1220,30000110000);
Insert into Funcionarios values (3,'Caio',45,'Florianopolis',1100,41000100000);
Insert into Funcionarios values (4,'Carlos',44,'Florianopolis',1200,51000110000);
Insert into Funcionarios values (5,'Paula',33,'Florianopolis',2500,61000111000);

Insert into Consultas values (1,1,'2006/06/12','14:00');
Insert into Consultas values (1,4,'2006/06/13','10:00');
Insert into Consultas values (2,1,'2006/06/13','09:00');
Insert into Consultas values (2,2,'2006/06/13','11:00');
Insert into Consultas values (2,3,'2006/06/14','14:00');
Insert into Consultas values (2,4,'2006/06/14','17:00');
Insert into Consultas values (3,1,'2006/06/19','18:00');
Insert into Consultas values (3,3,'2006/06/12','10:00');
Insert into Consultas values (3,4,'2006/06/19','13:00');
Insert into Consultas values (4,4,'2006/06/20','13:00');
Insert into Consultas values (4,4,'2006/06/22','19:30');

#chamando chave estrangeira na tabela consultas
alter table Consultas
add constraint codm
foreign key (codm)
references Medicos (codm);
select * from Consultas;

#alterando a tabela funcionários
#adicionando a coluna nroa na tabela funcionarios
ALTER TABLE funcionarios ADD nroa int;
#adicionando a cargo na tabela funcionarios
alter table Funcionarios
add cargo varchar (40);
#deletando as colunas nroa e cargo da tabela funcionarios
alter table Funcionarios
drop nroa, drop cargo;
select * from Funcionarios;

#atualizações no banco de dados
#questão 1
UPDATE Pacientes SET cidade = 'Ilhota' WHERE codp=2;
select * from Pacientes;
#questão 2
UPDATE Consultas Set hora = '12:00' WHERE codm = 1 AND codp = 4;
UPDATE Consultas SET data = '2006/06/04' WHERE codm = 1 AND codp = 4;
select * from Consultas;
#questão 3
#readicionando a coluna doença à tabela Pacientes
alter table Pacientes
add doenca varchar(40);
#atualizando a coluna doença
update Pacientes set doenca = 'Gripe' where codp = 1;
update Pacientes set doenca = 'Fratura' where codp = 2;
update Pacientes set doenca = 'Tendinite' where codp = 3;
update Pacientes set doenca = 'Sarampo' where codp = 4;
#alterando a doença da paciente Ana
update Pacientes set doenca = 'Cancer' where codp = 1;
select * from Pacientes;

#questão 4
UPDATE Consultas Set hora = '14:30' WHERE codm = 3 AND codp = 4;
select * from Consultas;

#questão 5
delete from Funcionarios where codf = 4;
select * from funcionarios;

#questão 6
delete from Consultas where hora >= '19:00';
select * from consultas;

#questão 7
delete from pacientes where doenca = 'Cancer' or idade < 10;
select * from pacientes;
#obs.: Pra fazer essa alteração é preciso utilizar a seguinte linha de código: SET SQL_SAFE_UPDATES=0;. Deixei no comeaço do código.

#questão 8
select * from medicos;
#Essa questão não da pra fazer, pois a cidades cidades citadas não existem na tabela em questão.

#Realizando consultas
#questão 1
SELECT  nome, cpf FROM Medicos 
WHERE idade <= 40 OR especialidade <> 'traumatologia';

#questão 2
select * from consultas where hora >= '12:00' and data >= '2006/06/19';

#questão 3
select * from pacientes;
select nome, idade from pacientes where cidade='Florianópolis';

#questão 4
select * from consultas;
select hora, data from consultas where data <= '2006/06/14' or data >= '2006/06/20';

#questão 5
select * from pacientes;
select nome, idade * 12 'meses' from pacientes;

#questão 6
select * from funcionarios;
select nome, cidade from funcionarios;

#questão 7 
select * from funcionarios;
select nome, max(salario) 'salário maior', min(salario) 'salário menor', cidade from funcionarios where cidade = 'Florianopolis';

#questão 8
select * from consultas;
select hora, max(hora) 'último horário', data from consultas where data = '2006/06/13';

#questão 9
select * from medicos;
select avg(idade), sum(nroa) from medicos;

#questão 10
select * from funcionarios;
select codf, nome, salario, salario - salario * 0.2 'salario liquido' from funcionarios;

#questão 11
select * from funcionarios;
select nome from funcionarios WHERE nome LIKE '%a';

#questão 12
select * from funcionarios;
select nome, cpf from funcionarios where cpf not like '%00000%';

#questão 13
select nome, especialidade from medicos where nome like '_o%';
select * from medicos;

#questão 14 
select * from pacientes;
select idade, doenca from pacientes where idade >= 25 or doenca = 'Sarampo' or 'Tendinite' or 'Fratura' or 'Gripe' ;