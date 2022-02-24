Create database Prova;
use Prova;
create table Escola(
Cod_Escola int not null primary key auto_increment,
Nome_Escola varchar(100) not null,
CNPJ_Escola varchar(21) not null,
Endereco_Escola varchar (100) not null) engine=innodb;
create table Curso(
Cod_Curso int not null primary key auto_increment,
Nome_Curso varchar(100) not null,
Descrição_Curso Varchar(255) not null,
Cod_Escola int not null,
Cod_Aluno int not null) engine=innodb;
create table Disciplina(
Cod_Disciplina int not null primary key auto_increment,
Nome_Disciplina varchar(100) not null,
Descrição_Disciplina Varchar(255) not null,
Tipo_Disciplina varchar(100) not null,
Cod_Professor int not null,
Cod_Curso int not null) engine=InnoDB;
create table professor(
Cod_Professor int not null primary key auto_increment,
Nome_Professor varchar (200) not null,
Endereco_Professor varchar (200) not null,
Salario_Professor decimal (6,2) not null,
RG_Professor varchar (11) not null,
Disciplina_Professor varchar (200) not null) engine=InnoDB;
create table Avaliacao(
Cod_Avaliacao int not null primary key auto_increment,
Cod_Professor int not null,
Tipo_Avaliacao varchar (100) not null,
Descricao_Avaliacao varchar (200) not null) engine=InnoDB;
create table Mencao(
Cod_Mencao int not null primary key auto_increment,
Cod_Avaliacao int not null,
Cod_Aluno int not null,
Descricao_Mencao varchar (10) not null) engine=InnoDB;
create table Aluno(
Cod_Aluno int not null primary key auto_increment,
Nome_Aluno varchar (200) not null,
Endereco_Aluno varchar (200) not null,
RG_Aluno varchar (11) not null,
Serie_Aluno varchar (100) not null) engine=InnoDB;
alter table Curso
add constraint fk_Escola_Curso
foreign key (Cod_Escola)
references Escola(Cod_Escola);
alter table Disciplina
add constraint fk_Curso_Disciplina
foreign key (Cod_Curso)
references Curso(Cod_Curso);
alter table Disciplina
add constraint fk_Professor_Disciplina
foreign key (Cod_Professor)
references Professor(Cod_Professor);
alter table Avaliacao
add constraint fk_Professor_Avaliacao
foreign key (Cod_Professor)
references Professor(Cod_Professor);
alter table Mencao
add constraint fk_Avaliacao_Mencao
foreign key (Cod_Avaliacao)
references Avaliacao(Cod_Avaliacao);
alter table Mencao
add constraint fk_Avaliacao_Mencao
foreign key (Cod_Avaliacao)
references Avaliacao(Cod_Avaliacao);
alter table Mencao
add constraint fk_Alunos_Mencao
foreign key (Cod_Aluno)
references Aluno(Cod_Aluno);
alter table Curso
add constraint fk_Alunos_Curso
foreign key (Cod_Aluno)
references Aluno(Cod_Aluno);
alter table Disciplina ;
drop table Disciplina;

insert into Escola (Cod_Escola, Nome_Escola, CNPJ_Escola, Endereco_Escola)
values             (1, "Etec de Taboão da Serra", "202020", "Rua das Camélias");

insert into Curso (Cod_Curso, Nome_Curso, Descrição_Curso, Cod_Escola, Cod_Aluno)
values            (1, "DS", "Curso que faz o desenvolvimento de sistema", 1, 1);

insert into Disciplina (Cod_Disciplina, Nome_Disciplina, Descrição_Disciplina, Tipo_Disciplina, Cod_Professor, Cod_Curso)
values                 (1, "Banco de Dados", "Ensina a tecnologia da informação", "Técnico", 1, 1);
 
insert into professor (Cod_Professor, Nome_Professor, Endereco_Professor, Salario_Professor, RG_Professor, Disciplina_Professor)
values                (1, "Ronny", "Avenida BR", 100000.00, "12345678-91", "Banco de Dados");

insert into aluno (Cod_Aluno, Nome_Aluno, Endereco_Aluno, RG_Aluno, Serie_Aluno)
values            (1, "Rafael", "Alguma coisa", "123384", "1º DS A");

select professor.Nome_Professor, professor.Salario_Professor, Disciplina.Nome_Disciplina from disciplina
inner join professor
on professor.Cod_Professor = Disciplina.Cod_Professor;
