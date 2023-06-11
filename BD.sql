-- Criação do banco de dados
CREATE SCHEMA ClinicaVeterinaria;

-- Criação da tabela Endereco
CREATE TABLE ClinicaVeterinaria.Endereco (
    PKEndereco INT IDENTITY(1, 1) PRIMARY KEY,
    Rua VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    CONSTRAINT CONS_Endereco UNIQUE (Rua, Numero, CEP)
);

-- Criação da tabela Telefone
CREATE TABLE ClinicaVeterinaria.Telefone (
    PKTelefone INT IDENTITY(1, 1) PRIMARY KEY,
    Numero VARCHAR(20) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    CONSTRAINT CONS_Telefone UNIQUE (Numero)
);

-- Criação da tabela Cliente
CREATE TABLE ClinicaVeterinaria.Cliente (
    PKCliente INT IDENTITY(1, 1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    EnderecoFK INT NOT NULL,
    TelefoneFK INT NOT NULL,
    CONSTRAINT FK_Cliente_Endereco FOREIGN KEY (EnderecoFK) REFERENCES ClinicaVeterinaria.Endereco (PKEndereco),
    CONSTRAINT FK_Cliente_Telefone FOREIGN KEY (TelefoneFK) REFERENCES ClinicaVeterinaria.Telefone (PKTelefone)
);

-- Criação da tabela Animal
CREATE TABLE ClinicaVeterinaria.Animal (
    PKAnimal INT IDENTITY(1, 1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especie VARCHAR(50) NOT NULL,
    ClienteFK INT NOT NULL,
    CONSTRAINT FK_Animal_Cliente FOREIGN KEY (ClienteFK) REFERENCES ClinicaVeterinaria.Cliente (PKCliente)
);

-- Criação da tabela Medicamento
CREATE TABLE ClinicaVeterinaria.Medicamento (
    PKMedicamento INT IDENTITY(1, 1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(200) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    CONSTRAINT CONS_Medicamento_Nome UNIQUE (Nome)
);

-- Criação da tabela Departamento
CREATE TABLE ClinicaVeterinaria.Departamento (
    PKDepartamento INT IDENTITY(1, 1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CONSTRAINT CONS_Departamento_Nome UNIQUE (Nome)
);

-- Criação da tabela Funcionario
CREATE TABLE ClinicaVeterinaria.Funcionario (
    PKFuncionario INT IDENTITY(1, 1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DepartamentoFK INT NOT NULL,
    CONSTRAINT FK_Funcionario_Departamento FOREIGN KEY (DepartamentoFK) REFERENCES ClinicaVeterinaria.Departamento (PKDepartamento)
);

-- Criação da tabela Consulta
CREATE TABLE ClinicaVeterinaria.Consulta (
    PKConsulta INT IDENTITY(1, 1) PRIMARY KEY,
    AnimalFK INT NOT NULL,
    FuncionarioFK INT NOT NULL,
    DataConsulta DATETIME NOT NULL,
    Observacoes VARCHAR(MAX) NOT NULL,
    CONSTRAINT FK_Consulta_Animal FOREIGN KEY (AnimalFK) REFERENCES ClinicaVeterinaria.Animal (PKAnimal),
    CONSTRAINT FK_Consulta_Funcionario FOREIGN KEY (FuncionarioFK) REFERENCES ClinicaVeterinaria.Funcionario (PKFuncionario)
);

-- Criação da tabela Sintomas
CREATE TABLE ClinicaVeterinaria.Sintomas (
    PKSintoma INT IDENTITY(1, 1) PRIMARY KEY,
    Descricao VARCHAR(MAX) NOT NULL,
    CONSTRAINT CONS_Sintomas_Descricao UNIQUE (Descricao)
);

-- Criação da tabela Anamnese
CREATE TABLE ClinicaVeterinaria.Anamnese (
    PKAnamnese INT IDENTITY(1, 1) PRIMARY KEY,
    ConsultaFK INT NOT NULL,
    SintomaFK INT NOT NULL,
    Descricao VARCHAR(MAX) NOT NULL,
    CONSTRAINT FK_Anamnese_Consulta FOREIGN KEY (ConsultaFK) REFERENCES ClinicaVeterinaria.Consulta (PKConsulta),
    CONSTRAINT FK_Anamnese_Sintomas FOREIGN KEY (SintomaFK) REFERENCES ClinicaVeterinaria.Sintomas (PKSintoma)
);

-- Criação da tabela Ficha
CREATE TABLE ClinicaVeterinaria.Ficha (
    PKFicha INT IDENTITY(1, 1) PRIMARY KEY,
    AnimalFK INT NOT NULL,
    FuncionarioFK INT NOT NULL,
    DataFicha DATE NOT NULL,
    Observacoes VARCHAR(MAX) NOT NULL,
    CONSTRAINT FK_Ficha_Animal FOREIGN KEY (AnimalFK) REFERENCES ClinicaVeterinaria.Animal (PKAnimal),
    CONSTRAINT FK_Ficha_Funcionario FOREIGN KEY (FuncionarioFK) REFERENCES ClinicaVeterinaria.Funcionario (PKFuncionario)
);