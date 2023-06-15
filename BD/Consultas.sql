
-- Inserção de registros na tabela Consulta

--INSERT INTO ClinicaVeterinaria.Consulta (AnimalFK, FuncionarioFK, DataConsulta, Observacoes)
--VALUES (1, 1, '2023-06-01 09:00:00', 'Consulta de rotina'),
--       (2, 2, '2023-06-02 10:00:00', 'Tratamento de ferida');

select * from ClinicaVeterinaria.Consulta;

select * from ClinicaVeterinaria.Cliente;

UPDATE Empresa.Empregado
Set
super_numSegSocial = '888665555'
where
NumSegSocial in ('333445555', '987654321', '494549454', '512851285')


Delete from Empresa.Departamento where numDepto = 6


Select <lista de atributos> → campos que devem ser recuperados pela consulta 
from <lista de tabelas> → lista de tabelas que serão pesquisadas na consulta
[ where <condição>; ] → esta é a condição que identifica os registros desejados


Consulta 1: recupera o nome e o endereço de todos os empregados que trabalham no 
departamento ‘Pesquisa’:
SELECT Prenome, Sobrenome, Endereco
FROM
Empresa.EMPREGADO,
Empresa.DEPARTAMENTO
WHERE
NomeDepto = ‘Pesquisa’ AND NumDepto = NumDepto

select * from ClinicaVeterinaria.Cliente;
select * from ClinicaVeterinaria.sintomas;


-- Consulta 1 nome do cliente e data da consulta e o sintomas registrado
select CLI.nome as nomeCliente, DataConsulta, Sint.Descricao
from ClinicaVeterinaria.cliente as CLI, ClinicaVeterinaria.Consulta as CONS,  ClinicaVeterinaria.Sintomas as Sint
where  CLI.PKCliente = 1 and
	   CONS.PKConsulta = CLI.PKCliente and
	   Sint.PKSintoma = CONS.PKConsulta


-- Consulta 2 nome do departamento e nome do funcionario

select DEP.Nome as Nome_Departamento, FUN.nome as Nome_Funcionario
from ClinicaVeterinaria.Departamento as DEP, ClinicaVeterinaria.Funcionario as FUN
where DEP.PKDepartamento = FUN.DepartamentoFK

select * from ClinicaVeterinaria.Departamento;
select * from ClinicaVeterinaria.Funcionario;


-- Consulta 3 nome do cliente, nome do animal campo de observação da tabela ficha
select CLI.nome as Nome_cliente, ANI.Nome as Nome_animal, F.Observacoes
from  ClinicaVeterinaria.Cliente as CLI, ClinicaVeterinaria.Animal as ANI, ClinicaVeterinaria.Ficha as F
where PKCliente = PKAnimal and
	  AnimalFK = PKAnimal

select * from ClinicaVeterinaria.cliente;
select * from ClinicaVeterinaria.Animal;
select * from ClinicaVeterinaria.Ficha;


-- Consulta 4 - sintomas do animal, descricao da anamnese, descricao dos sintomas e o Campo Observacoes da tabela ficha
select 
	ANI.Nome as Nome_Animal, 
	ANA.Descricao as Descricao_Anamnese, 
	Sint.Descricao as Descricao_Sintomas, 
	F.Observacoes as Observacoes_Ficha
from 
	ClinicaVeterinaria.Animal as ANI,
	ClinicaVeterinaria.Anamnese as ANA,
	ClinicaVeterinaria.Sintomas as Sint,
	ClinicaVeterinaria.Ficha as F
where 
	ANA.PKAnamnese = ANI.PKAnimal and
	Sint.PKSintoma = ANI.PKAnimal and
	F.PKFicha = ANI.PKAnimal


select * from ClinicaVeterinaria.Anamnese;
select * from ClinicaVeterinaria.sintomas;
select * from ClinicaVeterinaria.Ficha;

