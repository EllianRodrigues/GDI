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