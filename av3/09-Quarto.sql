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
