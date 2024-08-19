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
