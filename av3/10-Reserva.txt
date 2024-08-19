CREATE SEQUENCE reserva_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Reserva (
    id_reserva INT,
    checkin DATE,
    checkout DATE,
    status VARCHAR2(20),
    numero_hospedes INT,
    metodo_pagamento VARCHAR2(20),
    data_pagamento DATE,
    valor NUMERIC(10, 2),
    PRIMARY KEY(id_reserva)
);

INSERT INTO Reserva (id_reserva, checkin, checkout, status, numero_hospedes, metodo_pagamento, data_pagamento, valor)
VALUES (reserva_seq.NEXTVAL, TO_DATE('01/08/2024', 'DD/MM/YYYY'), TO_DATE('05/08/2024', 'DD/MM/YYYY'), 'Confirmada', 2, 'Cartão de Crédito', TO_DATE('03/08/2024', 'DD/MM/YYYY'), 1000.00);

INSERT INTO Reserva (id_reserva, checkin, checkout, status, numero_hospedes, metodo_pagamento, data_pagamento, valor)
VALUES (reserva_seq.NEXTVAL, TO_DATE('01/08/2024', 'DD/MM/YYYY'), TO_DATE('03/08/2024', 'DD/MM/YYYY'), 'Confirmada', 3, 'Boleto Bancário', TO_DATE('03/08/2024', 'DD/MM/YYYY'), 2000.00);

SELECT * FROM Reserva;
