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