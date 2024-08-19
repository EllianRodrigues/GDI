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