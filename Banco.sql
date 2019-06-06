create database bancario_IFB;

use bancario_IFB;

CREATE TABLE clientes (
	cod_cli INT NOT NULL,
	nome varchar (50) NOT NULL,
        endereco varchar(50),
        cidade varchar(50),
	PRIMARY KEY (cod_cli)
);

CREATE TABLE agencias (
	cod_ag INT NOT NULL,
	nome varchar (50) NOT NULL,
	cidade varchar (50),
	PRIMARY KEY (cod_ag)
);

CREATE TABLE contas (
	cod_ag INT NOT NULL,
	n_conta INT NOT NULL,
	cod_cli INT NOT NULL,
	saldo FLOAT,
	PRIMARY KEY (cod_ag, n_conta),
	FOREIGN KEY (cod_cli) REFERENCES clientes(cod_cli),
	FOREIGN KEY (cod_ag) REFERENCES agencias(cod_ag)
);

CREATE TABLE emprestimos (
    cod_ag INT NOT NULL,
    n_empr INT NOT NULL,
    cod_cli INT NOT NULL,
    valor FLOAT,
    CONSTRAINT PK_EMPR PRIMARY KEY (cod_ag , n_empr),
    CONSTRAINT FK_EMPR_CLI FOREIGN KEY (cod_cli)
        REFERENCES clientes (cod_cli),
    CONSTRAINT FK_EMPR_AG FOREIGN KEY (cod_ag)
        REFERENCES agencias (cod_ag),
    CONSTRAINT CHK_EMPR CHECK (valor > 0)
);

insert into clientes values (1, 'Jefferson', 'R. 13 de maio, 5','Taguatinga');
insert into clientes values (2, 'José', 'Av. Brasil, 100','Samambaia');
insert into clientes values (3, 'Ana', 'R. X, 51','Taguatinga');
insert into clientes values (4, 'Rita', 'R. A, 131','Taguatinga');
insert into clientes values (5, 'Carlos', 'R. Z, 222','Gama');
insert into clientes values (6, 'Marcelo', 'Av. 500, 121','Samambaia');
insert into clientes values (7, 'Celina', 'Av. Brasil, 201','Gama');
insert into clientes values (8, 'Oscar A Melo', null, null);

select *
from clientes;

insert into agencias values (10, 'Central', 'Gama');
insert into agencias values (52, 'Barão Geraldo', 'Gama');
insert into agencias values (34, 'Centro', 'Taguatinga');

insert into contas values (10, 12345, 5, 100.00);
insert into contas values (34, 43210, 7, 2000.00);
insert into contas values (52, 56789, 2, 100.00);
insert into contas values (52, 91011, 6, 500.00);
insert into contas values (10, 12131, 1, 3000.00);

insert into emprestimos values (10, 25, 1, 2000.00);
insert into emprestimos values (52, 315, 2, 20000.00);
insert into emprestimos values (34, 1021, 3, 10000.00);
insert into emprestimos values (52, 421, 4, 50000.00);
insert into emprestimos values (10, 26, 5, 30000.00);
insert into emprestimos values (52, 541, 1, 1000.00);

# mostre o nome dos clientes cuja cidade é Taguatinga
select nome
from clientes
where cidade='Taguatinga';
# mostre as agencias com saldo de contas acima de 3000
select A.cod_ag, nome
from agencias A inner join contas C
on A.cod_ag = C.cod_ag
where saldo >= 3000;
# mostre as agencias com valor de emprestimos acima de 5000
select A.cod_ag, nome
from agencias A inner join emprestimos C
on A.cod_ag = C.cod_ag
where valor >= 5000;
# mostre os clientes que tenham contas ou emprestimos na agencia de codigo 10
select nome
from clientes C inner join contas D
on C.cod_cli = D.cod_cli
where cod_ag = 10;
union
select nome
from C.cod_cli inner join emprestimos E
on C.cod_cli = E.cod_cli
where cod_ag = 10;
# mostre os clientes que tenham contas e emprestimos na agencia de codigo 10
# mostre o nome do cliente com maior saldo de contas
# mostre o nome do cliente com maior valor de emprestimos
# mostre o total de saldos por agencia
# mostre o total de emprestimos por agencia
# mostre os clientes que tenham a letra A no nome
# mostre as agencias da cidade do Gama

