create schema ClinicaVeterinaria;


create table ClinicaVeterinaria.endereço(
ID_Endereco int not null primary key,
Logradouro varchar(50) not null,
Numero int not null,
Bairro varchar(20) not null,
Complemento varchar(50) not null,
Cep int not null
);

create table ClinicaVeterinaria.telefone(
ID_Telefone int not null primary key,
numeroTelefone int not null
);

create table ClinicaVeterinaria.Cliente(
ID_cliente int not null primary key,
Nome varchar(15) not null,
sobrenome varchar(50) not null,
RG int not null,
CPF int not null,
dataNascimento date,
Fk_Endereco int not null,
FK_Telefone int not null,

foreign key (FK_Endereco)
	references ClinicaVeterinaria.Endereco(ID_Endereco),

foreign key (FK_Telefone)
	references ClinicaVeterinaria.telefone(ID_Telefone)
);

create table ClinicaVeterinaria.Animal(
ID_animal int not null primary key,
Nome varchar(15) not null,
dataDeNascimento date,
cor varchar(15) not null,
Raca varchar(15) not null

);


create table ClinicaVeterinaria.Ficha(
ID_ficha int not null primary key,
Tutor varchar(15) not null,
nome varchar(15) not null,
FK_animal int not null,
Documento int not null,
Gênero varchar(15) not null,
Espécie varchar(15) not null,
Peso float not null,
Altura float not null,

foreign key (FK_animal)
	references ClinicaVeterinaria.Animal(ID_animal),
);

create table ClinicaVeterinaria.Medicamento(
ID_Medicacao int not null primary key,
Nome varchar(15) not null,
Validade date,
Quantidade int not null,
CustoDeCompra float,
CustoDeVenda float,
Lote int,
Fabricante varchar(20)
);

create table ClinicaVeterinaria.Funcionarios(
ID_funcionario int not null primary key,
Nome varchar(15) not null,
RG int not null,
CPF int not null,
dataDeNascimento date,
FK_Endereco varchar(15) not null,
FK_Telefone int not null,

foreign key (FK_Endereco)
	references ClinicaVeterinaria.Endereco(ID_Endereco),
foreign key (FK_Telefone)
	references ClinicaVeterinaria.telefone(ID_Telefone)
);

create table ClinicaVeterinaria.Anamnese(
ID_anamnese int not null primary key,
Sintomas varchar(20),
Historico varchar(150) not null
);

create table ClinicaVeterinaria.Consulta(
ID_consulta int not null primary key,
Data date,
Hora datetime,
ExameFisico varchar(20),
Diagnostico varchar(20),
ExameSolicitados varchar(20),
Pagamento float not null,
FK_anamnese varchar(20) not null,

foreign key (FK_anamnese)
	references ClinicaVeterinaria.Anamnese(ID_anamnese)
);




