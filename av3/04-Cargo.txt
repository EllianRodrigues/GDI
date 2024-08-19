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