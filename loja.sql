create database LOJA;

use LOJA;

CREATE TABLE clientes (
    CPF NUMERIC(11) NOT NULL PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    rua VARCHAR(50),
    bairro VARCHAR(50),
    CEP NUMERIC(8),
    cidade VARCHAR(50)
);

CREATE TABLE fones_cli (
    CPF_cli NUMERIC(11) NOT NULL,
    DDD NUMERIC(3),
    numero NUMERIC(9),
    PRIMARY KEY (CPF_cli , DDD , numero),
    FOREIGN KEY (CPF_cli)
        REFERENCES clientes (CPF)
);

CREATE TABLE NF (
    numero NUMERIC(4) NOT NULL PRIMARY KEY,
    data_emissao DATETIME NOT NULL,
    CPF_cli NUMERIC(11) NOT NULL,
    FOREIGN KEY (CPF_cli)
        REFERENCES clientes (CPF)
);

CREATE TABLE compoe (
    numero_NF NUMERIC(4) NOT NULL,
    codigo_produtos NUMERIC(10) NOT NULL,
    quantidade INT,
    CHECK (quantidade >= 0),
    FOREIGN KEY (numero_NF)
        REFERENCES NF (numero),
    FOREIGN KEY (codigo_produtos)
        REFERENCES produtos (codigo),
	PRIMARY KEY (numero_NF,codigo_produtos)
);

CREATE TABLE produtos (
    codigo NUMERIC(10) NOT NULL PRIMARY KEY,
    descricao VARCHAR(500),
    preco NUMERIC(6,2) NOT NULL,
    quantidade INT,
    CHECK (preco >= 0),
    CHECK (quantidade >= 0)
);

create table fornecem(
	codigo_produtos NUMERIC(10) NOT NULL,
    CNPJ_fornecedores NUMERIC(11) NOT NULL,
    data datetime not null,
    quantidade INT,
    CHECK (quantidade >= 0),
    FOREIGN KEY (CNPJ_fornecedores)
        REFERENCES fornecedores(CNPJ),
    FOREIGN KEY (codigo_produtos)
        REFERENCES produtos (codigo),
	PRIMARY KEY (CNPJ_fornecedores,codigo_produtos,data)
);

CREATE TABLE fornecedores (
    CNPJ NUMERIC(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ramo VARCHAR(30)
);
show tables;
CREATE TABLE fones_forne (
    CNPJ_fornecedores NUMERIC(11) NOT NULL,
    DDD NUMERIC(3),
    numero NUMERIC(9),
    PRIMARY KEY (CNPJ_fornecedores , DDD , numero),
    FOREIGN KEY (CNPJ_fornecedores)
        REFERENCES fornecedores (CNPJ)
);
