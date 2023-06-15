
-- Inser��o de registros na tabela Endereco
INSERT INTO ClinicaVeterinaria.Endereco (Rua, Numero, Cidade, Estado, CEP)
VALUES ('Rua dos Animais', 123, 'Cidade Animal', 'Estado Animal', '12345-678');

SELECT * FROM ClinicaVeterinaria.Endereco;

-- Inser��o de registros na tabela Telefone
INSERT INTO ClinicaVeterinaria.Telefone (Numero, Tipo)
VALUES ('123456789', 'Celular');

SELECT * FROM ClinicaVeterinaria.telefone;

-- Inser��o de registros na tabela Cliente
INSERT INTO ClinicaVeterinaria.Cliente (Nome, EnderecoFK, TelefoneFK)
VALUES ('Jo�o', 1, 1),
       ('Maria', 1, 1);

SELECT * FROM ClinicaVeterinaria.Cliente;

-- Inser��o de registros na tabela Animal
INSERT INTO ClinicaVeterinaria.Animal (Nome, Especie, ClienteFK)
VALUES ('Rex', 'Cachorro', 1),
       ('Mimi', 'Gato', 2);

SELECT * FROM ClinicaVeterinaria.Animal;

-- Inser��o de registros na tabela Medicamento
INSERT INTO ClinicaVeterinaria.Medicamento (Nome, Descricao, Preco)
VALUES ('Antibi�tico', 'Para tratamento de infec��es', 50.00),
       ('Verm�fugo', 'Para elimina��o de vermes', 30.00);

SELECT * FROM ClinicaVeterinaria.Medicamento;

-- Inser��o de registros na tabela Departamento
INSERT INTO ClinicaVeterinaria.Departamento (Nome)
VALUES ('Veterin�ria'),
       ('Recep��o');

SELECT * FROM ClinicaVeterinaria.Departamento;

-- Inser��o de registros na tabela Funcionario
INSERT INTO ClinicaVeterinaria.Funcionario (Nome, DepartamentoFK)
VALUES ('Joana', 1),
       ('Pedro', 2);

SELECT * FROM ClinicaVeterinaria.Funcionario;

-- Inser��o de registros na tabela Consulta
INSERT INTO ClinicaVeterinaria.Consulta (AnimalFK, FuncionarioFK, DataConsulta, Observacoes)
VALUES (1, 1, '2023-06-01 09:00:00', 'Consulta de rotina'),
       (2, 2, '2023-06-02 10:00:00', 'Tratamento de ferida');

SELECT * FROM ClinicaVeterinaria.Consulta;

-- Inser��o de registros na tabela Sintomas
INSERT INTO ClinicaVeterinaria.Sintomas (Descricao)
VALUES ('Febre'),
       ('Diarreia');

SELECT * FROM ClinicaVeterinaria.Sintomas;

-- Inser��o de registros na tabela Anamnese
INSERT INTO ClinicaVeterinaria.Anamnese (ConsultaFK, SintomaFK, Descricao)
VALUES (1, 1, 'O animal apresenta falta de apetite'),
       (2, 2, 'O animal est� co�ando muito');

SELECT * FROM ClinicaVeterinaria.Anamnese;

-- Inser��o de registros na tabela Ficha
INSERT INTO ClinicaVeterinaria.Ficha (AnimalFK, FuncionarioFK, DataFicha, Observacoes)
VALUES (1, 1, '2023-06-01', 'Observa��es sobre o animal'),
       (2, 2, '2023-06-02', 'Outras observa��es sobre o animal');

SELECT * FROM ClinicaVeterinaria.Ficha;