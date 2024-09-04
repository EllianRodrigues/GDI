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