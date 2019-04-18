create database escola;
use escola;

create table alunos(
	MATRICULA numeric not null primary key,
	nome varchar(50) not null,
	endereco varchar(100),
	cidade varchar(50)
  );

create table disciplinas(
	COD_DISC numeric not null primary key,
	nome_disc varchar(50) not null,
	carga_hor numeric not null
 );
 
create table professores(
	COD_PROF numeric not null primary key,
    nome varchar(50) not null,
    endereço varchar(100),
    cidade varchar (50)
    );

create table turma(
	COD_DISC numeric not null,
    COD_TURMA numeric not null,
    COD_PROF numeric not null,
    ANO year(4) not null unique,
    horario time,
    constraint pk_turma_cod_turma primary key (COD_TURMA,ANO,COD_DISC,COD_PROF),
	constraint fk_turma_cod_disc foreign key (COD_DISC) references disciplinas (COD_DISC),
    constraint fk_turma_cod_prof foreign key (COD_PROF) references professores (COD_PROF)
    );
  
create table historico(
	MATRICULA numeric not null,
    COD_DISC numeric not null,
    COD_TURMA numeric not null,
    COD_PROF numeric not null,
    ANO year(4) not null,
    frequencia numeric(3) not null,
    nota numeric(5),
    constraint pk_historico primary key (MATRICULA, COD_DISC,COD_TURMA,COD_PROF,ANO),
    constraint fk_historico_matricula foreign key (MATRICULA) references alunos (MATRICULA),
    constraint fk_historico_cod_dic foreign key (COD_DISC) references disciplinas (COD_DISC),
    constraint fk_historico_cod_turma foreign key (COD_TURMA) references turma (COD_TURMA),
    constraint fk_historico_cod_prof foreign key (COD_PROF) references professores (COD_PROF),
    constraint fk_historico_ano foreign key (ANO) references turma (ANO)
    );