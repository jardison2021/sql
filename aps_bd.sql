#criando o banco de dados
create database bdescola;
use bdescola;

#criando tabelas
create table tb_aluno(
codigo_aluno int(3) primary key auto_increment,
nome_aluno varchar(60) not null,
ano_nascimento year,
email varchar(60),
sexo varchar(1) not null
);
create table tb_curso(
codigo_curso int(3) primary key auto_increment,
nome_curso varchar(60) not null
);
create table tb_matricula(
codigo_curso int(3),
codigo_aluno int(3)
);

#adicionando chave estrageira
alter table tb_matricula
add constraint codigo_curso
foreign key (codigo_curso)
references tb_curso (codigo_curso);

alter table tb_matricula
add constraint codigo_aluno
foreign key (codigo_aluno)
references tb_aluno (codigo_aluno);

#adicionando dados na tabela
insert into tb_aluno (nome_aluno, ano_nascimento, email, sexo)values('Josiel Jardim', 1974, 'josiel@provasql.com.br', 'M');
insert into tb_aluno (nome_aluno, ano_nascimento, email, sexo)values('Ana Maria', 1980, 'ana@provasql.com.br', 'F');
insert into tb_aluno (nome_aluno, ano_nascimento, email, sexo)values('João Pedro', 1979, 'joao@provasql.com.br', 'M');

insert into tb_curso (nome_curso)value('Medicina');
insert into tb_curso (nome_curso)value('Arquitetura');
insert into tb_curso (nome_curso)value('Filosofia');
insert into tb_curso (nome_curso)value('Informática');
insert into tb_curso (nome_curso)value('Jornalismo');

insert into tb_matricula (codigo_curso, codigo_aluno)values(1,1);
insert into tb_matricula (codigo_curso, codigo_aluno)values(1,2);
insert into tb_matricula (codigo_curso, codigo_aluno)values(2,3);
insert into tb_matricula (codigo_curso, codigo_aluno)values(5,3);

#1ª questão
insert into tb_aluno (nome_aluno, ano_nascimento, email, sexo)values('Pedro César', 1994, 'pedro@provasql.com.br', 'M');
insert into tb_matricula (codigo_curso, codigo_aluno)values(4,4);

#2ª questão
SELECT nome_aluno, nome_curso FROM tb_aluno g
JOIN tb_matricula a
ON g.codigo_aluno = a.codigo_aluno
JOIN tb_curso c
ON a.codigo_curso = c.codigo_curso
ORDER BY nome_curso;

#3ª questão
SELECT email
FROM tb_aluno a
WHERE a.ano_nascimento <= '2004';

#4ª questão
SELECT COUNT(*) AS nome_aluno FROM tb_aluno;

#5ª questão
SELECT tb_curso.nome_curso, Count(tb_matricula.codigo_curso) total_de_matriculas 
FROM tb_matricula INNER JOIN tb_curso
On tb_curso.codigo_curso=tb_matricula.codigo_curso GROUP BY tb_curso.nome_curso, 
tb_curso.nome_curso;

#6ª questão
select nome_aluno
from tb_aluno a
where a.ano_nascimento < 2004;

#7ª questão
select nome_aluno
from tb_aluno a
where a.sexo = 'F';

#8ª questão
SELECT nome_aluno FROM tb_aluno g
JOIN tb_matricula a
ON g.codigo_aluno = a.codigo_aluno
JOIN tb_curso c
ON a.codigo_curso = c.codigo_curso
WHERE nome_curso = 'Medicina'
AND sexo = 'F';

#9ª questão
select nome_curso from tb_curso
order by nome_curso;

#10ª questão
