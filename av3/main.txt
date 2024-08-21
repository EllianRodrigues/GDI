CREATE TABLE Endereco (
    cep int,
    bairro VARCHAR2(60),
    cidade VARCHAR2(60),
    estado VARCHAR2(60),
    pais VARCHAR2(60),
    PRIMARY KEY (cep)
);

INSERT INTO Endereco (cep, bairro, cidade, estado, pais)
VALUES (12345678, 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil');

INSERT INTO Endereco (cep, bairro, cidade, estado, pais)
VALUES (23456789, 'Jardins', 'São Paulo', 'São Paulo', 'Brasil');

INSERT INTO Endereco (cep, bairro, cidade, estado, pais)
VALUES (34567890, 'Ipanema', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil');

INSERT INTO Endereco (cep, bairro, cidade, estado, pais)
VALUES (45678901, 'Leblon', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil');

INSERT INTO Endereco (cep, bairro, cidade, estado, pais)
VALUES (56789012, 'Itaim Bibi', 'São Paulo', 'São Paulo', 'Brasil');

SELECT * FROM Endereco;


-------------------------------------------------------------------------------



CREATE TABLE Usuario ( 
    cpf int NOT NULL,  
    nome VARCHAR2(60),
    email VARCHAR2(60),
    cep int,
    numero int,
    complemento VARCHAR2(45),
    PRIMARY KEY (cpf),
    FOREIGN KEY (cep) REFERENCES Endereco(cep)
);

INSERT INTO Usuario (cpf, nome, email, cep, numero, complemento)
VALUES (111111111, 'João Silva', 'joao_silva@email.com', 12345678, 123, 'Apto 1');

INSERT INTO Usuario (cpf, nome, email, cep, numero, complemento)
VALUES (222222222, 'Maria Souza', 'Maria_souza@email.com', 23456789, 456, 'Apto 2');

INSERT INTO Usuario (cpf, nome, email, cep, numero, complemento)
VALUES (333333333, 'Pedro Oliveira', 'Pedro_Oliveira@email.com', 34567890, 789, 'Apto 3');

INSERT INTO Usuario (cpf, nome, email, cep, numero, complemento)
VALUES (444444444, 'Ana Costa', 'Ana.Costa@email.com', 45678901, 101, 'Apto 4');

INSERT INTO Usuario (cpf, nome, email, cep, numero, complemento)
VALUES (555555555, 'Carlos Lima', 'Carlos_Lima@email.com', 56789012, 102, 'Apto 5');

-- Consultando os dados
SELECT * FROM Usuario;



-------------------------------------------------------------------------------


CREATE TABLE Telefone (
    cpf int NOT NULL,
    num_telefone int,
    PRIMARY KEY (cpf, num_telefone),
    FOREIGN KEY (cpf) REFERENCES Usuario(cpf)
);
INSERT INTO Telefone (cpf, num_telefone) VALUES (111111111, 987654321);
INSERT INTO Telefone (cpf, num_telefone) VALUES (222222222, 123456789);
INSERT INTO Telefone (cpf, num_telefone) VALUES (333333333, 555555555);
INSERT INTO Telefone (cpf, num_telefone) VALUES (444444444, 444444444);
INSERT INTO Telefone (cpf, num_telefone) VALUES (555555555, 123123123);

SELECT * FROM Telefone;



-------------------------------------------------------------------------------


CREATE SEQUENCE id_sequence
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Cargo (
    id_cargo int NOT NULL,
    nome_cargo VARCHAR2(45),
    Salario NUMERIC(10, 2),
    PRIMARY KEY(id_cargo)
);

INSERT INTO Cargo (id_cargo, nome_cargo, Salario)
VALUES (id_sequence.NEXTVAL, 'Gerente', 5000.00);

INSERT INTO Cargo (id_cargo, nome_cargo, Salario)
VALUES (id_sequence.NEXTVAL, 'Assistente', 3000.00);

INSERT INTO Cargo (id_cargo, nome_cargo, Salario)
VALUES (id_sequence.NEXTVAL, 'Analista', 4000.00);

SELECT * FROM Cargo;



---------------------------------------------------------------------------------


CREATE TABLE Funcionario (
    cpf_funcionario INT NOT NULL,
    id_cargo int,
    data_contratacao DATE,
    cpf_supervisor INT,
    PRIMARY KEY (cpf_funcionario),
    FOREIGN KEY (cpf_funcionario) REFERENCES Usuario(CPF),
    FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf_funcionario),
    FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo)
);

INSERT INTO Funcionario (cpf_funcionario, id_cargo, data_contratacao, cpf_supervisor)
VALUES (111111111, 1, TO_DATE('01/01/2020', 'DD/MM/YYYY'), NULL);

INSERT INTO Funcionario (cpf_funcionario, id_cargo, data_contratacao, cpf_supervisor)
VALUES (222222222, 2, TO_DATE('01/02/2021', 'DD/MM/YYYY'), 111111111);

INSERT INTO Funcionario (cpf_funcionario, id_cargo, data_contratacao, cpf_supervisor)
VALUES (333333333, 3, TO_DATE('01/03/2021', 'DD/MM/YYYY'), 111111111);

SELECT * FROM Funcionario;


------------------------------------------------------------------------------------


CREATE TABLE Hospede (
    cpf_hospede int NOT NULL,
    profissao VARCHAR2(45),
    genero VARCHAR2(10),
    Data_nascimento date,
    PRIMARY KEY (cpf_hospede),
    FOREIGN KEY (cpf_hospede) REFERENCES Usuario(CPF)
);
INSERT INTO Hospede (cpf_hospede, profissao, genero, Data_nascimento)
VALUES (444444444, 'Q.A.', 'Feminino', TO_DATE('15/05/1985', 'DD/MM/YYYY'));

INSERT INTO Hospede (cpf_hospede, profissao, genero, Data_nascimento)
VALUES (555555555, 'DBA', 'Masculino', TO_DATE('20/07/1990', 'DD/MM/YYYY'));

SELECT * FROM Hospede;


-----------------------------------------------------------------------------------

CREATE TABLE Visita (
    cpf_hospede int NOT NULL,
    cpf_visita int,
    idade int,
    nome VARCHAR2(60),
    data_visita date,
    PRIMARY KEY (cpf_hospede, cpf_visita),
    FOREIGN KEY (cpf_hospede) REFERENCES Hospede(cpf_hospede),
    CHECK (idade > 17)
);

INSERT INTO Visita (cpf_hospede, cpf_visita, idade, nome, data_visita)
VALUES (444444444, 11122244455, 30, 'Lucas Silva', TO_DATE('01/08/2024', 'DD/MM/YYYY'));

INSERT INTO Visita (cpf_hospede, cpf_visita, idade, nome, data_visita)
VALUES (444444444, 11122244466, 25, 'Carla Souza', TO_DATE('02/08/2024', 'DD/MM/YYYY'));

INSERT INTO Visita (cpf_hospede, cpf_visita, idade, nome, data_visita)
VALUES (555555555, 11122244477, 40, 'Marcos Lima', TO_DATE('03/08/2024', 'DD/MM/YYYY'));

INSERT INTO Visita (cpf_hospede, cpf_visita, idade, nome, data_visita)
VALUES (555555555, 11122244488, 35, 'Renata Costa', TO_DATE('04/08/2024', 'DD/MM/YYYY'));

SELECT * FROM Visita;

-------------------------------------------------------------------------------------

CREATE TABLE TipoQuarto (
    nome_tipo VARCHAR2(20) PRIMARY KEY,
    area INT,
    qtd_camas INT,
    qtd_tvs INT,
    qtd_arcondicionados INT,
    qtd_comodos INT,
    qtd_banheiros INT,
    preco NUMERIC(10, 2)
);

INSERT INTO TipoQuarto (nome_tipo, area, qtd_camas, qtd_tvs, qtd_arcondicionados, qtd_comodos, qtd_banheiros, preco)
VALUES ('Standard', 30, 1, 1, 1, 1, 1, 100.00);

INSERT INTO TipoQuarto (nome_tipo, area, qtd_camas, qtd_tvs, qtd_arcondicionados, qtd_comodos, qtd_banheiros, preco)
VALUES ('Deluxe', 50, 2, 2, 1, 2, 2, 200.00);

INSERT INTO TipoQuarto (nome_tipo, area, qtd_camas, qtd_tvs, qtd_arcondicionados, qtd_comodos, qtd_banheiros, preco)
VALUES ('Suite', 70, 3, 3, 2, 3, 3, 300.00);

SELECT * FROM TipoQuarto;


----------------------------------------------------------------------------------------

CREATE TABLE Quarto (
    numero_quarto int,
    nome_tipo VARCHAR2(20),
    status VARCHAR2(20),
    reservado VARCHAR2(5),
    PRIMARY KEY (numero_quarto),
    FOREIGN KEY (nome_tipo) REFERENCES TipoQuarto(nome_tipo)
);

INSERT INTO Quarto (numero_quarto, nome_tipo, status, reservado)
VALUES (101, 'Standard', 'Disponível', 'Não');

INSERT INTO Quarto (numero_quarto, nome_tipo, status, reservado)
VALUES (102, 'Deluxe', 'Disponível', 'Não');

INSERT INTO Quarto (numero_quarto, nome_tipo, status, reservado)
VALUES (103, 'Suite', 'Reservado', 'Sim');

SELECT * FROM Quarto;


---------------------------------------------------------------------------------------

CREATE SEQUENCE reserva_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Reserva (
    id_reserva INT,
    checkin DATE,
    checkout DATE,
    status VARCHAR2(20),
    numero_hospedes INT,
    metodo_pagamento VARCHAR2(20),
    data_pagamento DATE,
    valor NUMERIC(10, 2),
    PRIMARY KEY(id_reserva)
);

INSERT INTO Reserva (id_reserva, checkin, checkout, status, numero_hospedes, metodo_pagamento, data_pagamento, valor)
VALUES (reserva_seq.NEXTVAL, TO_DATE('01/08/2024', 'DD/MM/YYYY'), TO_DATE('05/08/2024', 'DD/MM/YYYY'), 'Confirmada', 2, 'Cartão de Crédito', TO_DATE('03/08/2024', 'DD/MM/YYYY'), 1000.00);

INSERT INTO Reserva (id_reserva, checkin, checkout, status, numero_hospedes, metodo_pagamento, data_pagamento, valor)
VALUES (reserva_seq.NEXTVAL, TO_DATE('01/08/2024', 'DD/MM/YYYY'), TO_DATE('03/08/2024', 'DD/MM/YYYY'), 'Confirmada', 3, 'Boleto Bancário', TO_DATE('03/08/2024', 'DD/MM/YYYY'), 2000.00);

SELECT * FROM Reserva;

-----------------------------------------------------------------------------------------

CREATE SEQUENCE reserva_hosp
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE ServicoHospede (
    id_servico int NOT NULL,
    descricao VARCHAR2(60),
    preco NUMERIC(10, 2),
    PRIMARY KEY(id_servico)
);


INSERT INTO ServicoHospede (id_servico, descricao, preco)
VALUES (reserva_hosp.NEXTVAL, 'Serviço de Quarto', 50.00);

INSERT INTO ServicoHospede (id_servico, descricao, preco)
VALUES (reserva_hosp.NEXTVAL, 'Lavanderia', 30.00);

INSERT INTO ServicoHospede (id_servico, descricao, preco)
VALUES (reserva_hosp.NEXTVAL, 'SPA', 100.00);

SELECT * FROM ServicoHospede;


------------------------------------------------------------------------------------------------

CREATE TABLE Contrata (
    cpf_hospede INT,
    id_reserva INT,
    numero_quarto INT,
    PRIMARY KEY (cpf_hospede, id_reserva, numero_quarto),
    FOREIGN KEY (cpf_hospede) REFERENCES Hospede(cpf_hospede),
    FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
    FOREIGN KEY (numero_quarto) REFERENCES Quarto(numero_quarto)
);

INSERT INTO Contrata (cpf_hospede, id_reserva, numero_quarto)
VALUES (444444444, 1, 103);

INSERT INTO Contrata (cpf_hospede, id_reserva, numero_quarto)
VALUES (555555555, 2, 102);

SELECT * FROM Contrata;

------------------------------------------------------------------------------------------------

CREATE TABLE Tem (
    cpf_hospede INT,
    id_reserva INT,
    numero_quarto INT,
    id_servico INT,
	data_contratacao date,
    PRIMARY KEY (cpf_hospede, id_reserva, numero_quarto, id_servico),
    FOREIGN KEY (cpf_hospede, id_reserva, numero_quarto) REFERENCES Contrata(cpf_hospede, id_reserva, numero_quarto),
    FOREIGN KEY (id_servico) REFERENCES ServicoHospede(id_servico)
);

INSERT INTO Tem (cpf_hospede, id_reserva, numero_quarto, id_servico, data_contratacao)
VALUES (444444444, 1, 103, 1, TO_DATE('01/04/2020', 'DD/MM/YYYY'));

INSERT INTO Tem (cpf_hospede, id_reserva, numero_quarto, id_servico, data_contratacao)
VALUES (444444444, 1, 103, 2, TO_DATE('02/04/2020', 'DD/MM/YYYY'));

INSERT INTO Tem (cpf_hospede, id_reserva, numero_quarto, id_servico, data_contratacao)
VALUES (555555555, 2, 102, 3, TO_DATE('05/04/2020', 'DD/MM/YYYY'));

SELECT * FROM Tem;

