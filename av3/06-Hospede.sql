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