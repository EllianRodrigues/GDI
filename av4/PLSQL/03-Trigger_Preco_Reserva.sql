-- Atualiza o preco da reserva (será ativado pela proxima query)
-- ✅ - CREATE OR REPLACE TRIGGER (LINHA)
CREATE OR REPLACE TRIGGER AtualizarValorReserva
AFTER INSERT ON Contrata
FOR EACH ROW
DECLARE
    v_nome_tipo VARCHAR2(20);
    v_preco NUMERIC(10, 2);
    v_dias NUMBER;
BEGIN
    -- Buscar o nome_tipo na tabela Quarto usando o numero_quarto da nova linha inserida
    SELECT nome_tipo INTO v_nome_tipo
    FROM Quarto
    WHERE numero_quarto = :NEW.numero_quarto;

    -- Buscar o preço na tabela TipoQuarto usando o nome_tipo obtido anteriormente
    SELECT preco INTO v_preco
    FROM TipoQuarto
    WHERE nome_tipo = v_nome_tipo;

    -- Calcular o número de dias entre checkin e checkout
    SELECT (checkout - checkin) INTO v_dias
    FROM Reserva
    WHERE id_reserva = :NEW.id_reserva;

    -- Atualizar o valor na tabela Reserva usando o preço e a quantidade de dias
    UPDATE Reserva
    SET valor = v_dias * v_preco
    WHERE id_reserva = :NEW.id_reserva;
END;
/