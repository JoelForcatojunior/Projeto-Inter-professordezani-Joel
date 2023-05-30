-- SQL Server Script

-- -----------------------------------------------------
-- Schema Financeiro
-- -----------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Financeiro')
BEGIN
    EXEC('CREATE SCHEMA Financeiro');
END
GO

USE Financeiro;
GO

-- -----------------------------------------------------
-- Table Financeiro.Usuario
-- -----------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'Usuario')
BEGIN
    CREATE TABLE Financeiro.Usuario (
        Id INT NOT NULL IDENTITY(1,1),
        Nome VARCHAR(45) NOT NULL,
        Email VARCHAR(45) NOT NULL,
        Senha VARCHAR(255) NOT NULL,
        Data_Nascimento DATE NOT NULL,
        PRIMARY KEY (Id)
    );
END
GO

-- -----------------------------------------------------
-- Table Financeiro.Conta
-- -----------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'Conta')
BEGIN
    CREATE TABLE Financeiro.Conta (
        Id INT NOT NULL IDENTITY(1,1),
        Nome VARCHAR(45) NOT NULL,
        Saldo DECIMAL(9,2) NOT NULL,
        Usuario_Id INT NOT NULL,
        PRIMARY KEY (Id),
        CONSTRAINT fk_Conta_Usuario
            FOREIGN KEY (Usuario_Id)
            REFERENCES Financeiro.Usuario (Id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END
GO

-- -----------------------------------------------------
-- Table Financeiro.Plano_Contas
-- -----------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'Plano_Contas')
BEGIN
    CREATE TABLE Financeiro.Plano_Contas (
        Id INT NOT NULL IDENTITY(1,1),
        Descricao VARCHAR(45) NOT NULL,
        Tipo CHAR(1) NULL,
        PRIMARY KEY (Id)
    );
END
GO

-- -----------------------------------------------------
-- Table Financeiro.Transacao
-- -----------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.tables WHERE name = 'Transacao')
BEGIN
    CREATE TABLE Financeiro.Transacao (
        Id INT NOT NULL IDENTITY(1,1),
        Data DATETIME NOT NULL,
        Tipo CHAR(1) NOT NULL,
        Valor DECIMAL(9,2) NOT NULL,
        Descricao VARCHAR(45) NULL,
        Conta_Id INT NOT NULL,
        Plano_Contas_Id INT NOT NULL,
        PRIMARY KEY (Id),
        CONSTRAINT fk_Transacao_Conta
            FOREIGN KEY (Conta_Id)
            REFERENCES Financeiro.Conta (Id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
        CONSTRAINT fk_Transacao_Plano_Contas
            FOREIGN KEY (Plano_Contas_Id)
            REFERENCES Financeiro.Plano_Contas (Id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
    );
END
GO
