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