CREATE DATABASE BDVendas_InterJoel;
GO

CREATE LOGIN usuario WITH PASSWORD = '123';
GO

USE BDVendas_InterJoel;
GO

/**** TABELA CLIENTES ****/
CREATE TABLE tb_clientes (
    id int IDENTITY(1,1) PRIMARY KEY,
    nome varchar(10),
    rg varchar(30),
    cpf varchar(20),
    email varchar(200),
    telefone varchar(30),
    celular varchar(30),
    cep varchar(100),
    endereco varchar(255),
    numero int,
    complemento varchar(200),
    bairro varchar(100),
    cidade varchar(100),
    estado varchar(2)
);
GO

/**********************/

/**** TABELA FORNECEDORES ****/
CREATE TABLE tb_fornecedores (
    id int IDENTITY(1,1) PRIMARY KEY,
    nome varchar(10),
    cnpj varchar(30),
    cpf varchar(20),
    email varchar(200),
    telefone varchar(30),
    celular varchar(30),
    cep varchar(100),
    endereco varchar(255),
    numero int,
    complemento varchar(200),
    bairro varchar(100),
    cidade varchar(100),
    estado varchar(2)
);
GO

/**********************/

/**** TABELA FUNCIONARIOS ****/
CREATE TABLE tb_funcionarios (
    id int IDENTITY(1,1) PRIMARY KEY,
    nome varchar(10),
    rg varchar(30),
    cpf varchar(20),
    email varchar(200),
    telefone varchar(30),
    celular varchar(30),
    cep varchar(100),
    endereco varchar(255),
    numero int,
    complemento varchar(200),
    bairro varchar(100),
    cidade varchar(100),
    estado varchar(2)
);
GO

/**********************/

/**** TABELA PRODUTOS ****/
CREATE TABLE tb_produtos (
    id int IDENTITY(1,1) PRIMARY KEY,
    descricao varchar(100),
    preco decimal(10,2),
    qtd_estoque int,
    for_id int,
    FOREIGN KEY (for_id) REFERENCES tb_fornecedores(id)
);
GO

/**********************/

/**** TABELA VENDAS ****/
CREATE TABLE tb_vendas (
    id int IDENTITY(1,1) PRIMARY KEY,
    cliente_id int,
    data_venda datetime,
    total_Venda decimal(10,2),
    observacoes text,
    FOREIGN KEY (cliente_id) REFERENCES tb_clientes(id)
);
GO

/**********************/

/**** TABELA INTES_VENDAS ****/
CREATE TABLE tb_itensvendas (
    id int IDENTITY(1,1) PRIMARY KEY,
    venda_id int,
    produto_id int,
    qtd int,
    subtotal decimal(10,2),
    FOREIGN KEY (venda_id) REFERENCES tb_vendas(id),
    FOREIGN KEY (produto_id) REFERENCES tb_produtos(id)
);
GO

/**********************/

SELECT * FROM tb_clientes WHERE nome LIKE 'a%';
