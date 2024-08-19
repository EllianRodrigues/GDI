CREATE TABLE TipoQuarto (
    nome_tipo VARCHAR2(20) PRIMARY KEY,
    area INT,
    qtd_camas INT,
    qtd_tvs INT,
    qtd_arcondicionados INT,
    qtd_comodos INT,
    qtd_banheiros INT,
    preco NUMERIC(10, 2)
);

INSERT INTO TipoQuarto (nome_tipo, area, qtd_camas, qtd_tvs, qtd_arcondicionados, qtd_comodos, qtd_banheiros, preco)
VALUES ('Standard', 30, 1, 1, 1, 1, 1, 100.00);

INSERT INTO TipoQuarto (nome_tipo, area, qtd_camas, qtd_tvs, qtd_arcondicionados, qtd_comodos, qtd_banheiros, preco)
VALUES ('Deluxe', 50, 2, 2, 1, 2, 2, 200.00);

INSERT INTO TipoQuarto (nome_tipo, area, qtd_camas, qtd_tvs, qtd_arcondicionados, qtd_comodos, qtd_banheiros, preco)
VALUES ('Suite', 70, 3, 3, 2, 3, 3, 300.00);

SELECT * FROM TipoQuarto;