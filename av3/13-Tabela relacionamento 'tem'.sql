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