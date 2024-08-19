CREATE SEQUENCE reserva_hosp
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE ServicoHospede (
    id_servico int NOT NULL,
    descricao VARCHAR2(60),
    preco NUMERIC(10, 2),
    PRIMARY KEY(id_servico)
);


INSERT INTO ServicoHospede (id_servico, descricao, preco)
VALUES (reserva_hosp.NEXTVAL, 'Serviço de Quarto', 50.00);

INSERT INTO ServicoHospede (id_servico, descricao, preco)
VALUES (reserva_hosp.NEXTVAL, 'Lavanderia', 30.00);

INSERT INTO ServicoHospede (id_servico, descricao, preco)
VALUES (reserva_hosp.NEXTVAL, 'SPA', 100.00);

SELECT * FROM ServicoHospede;