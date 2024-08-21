-- Seleciona todas reservas de um unico hospede
-- ✅ - USO DE RECORD
-- ✅ - USO DE ESTRUTURA DE DADOS DO TIPO TABLE
-- ✅ - BLOCO ANÔNIMO
-- ✅ - CREATE PROCEDURE
-- ✅ - %TYPE
-- ✅ - %ROWTYPE
-- ✅ - FOR IN LOOP
-- ✅ - SELECT … INTO
DECLARE
    -- Criação da tabela temporária para armazenar as reservas do hóspede específico
    TYPE ContrataTab IS TABLE OF Contrata%ROWTYPE;
    reservas_hospede ContrataTab;

    -- Definindo uma procedure para buscar e imprimir os detalhes das reservas
    PROCEDURE imprimir_reservas IS
        reserva_rec Reserva%ROWTYPE;
    BEGIN
        FOR i IN 1..reservas_hospede.COUNT LOOP
            -- Buscar a reserva na tabela Reserva usando o id_reserva da tabela temporária
            SELECT * INTO reserva_rec
            FROM Reserva
            WHERE id_reserva = reservas_hospede(i).id_reserva;
            
            -- Imprimir os detalhes da reserva
            DBMS_OUTPUT.PUT_LINE('ID Reserva: ' || reserva_rec.id_reserva);
            DBMS_OUTPUT.PUT_LINE('Check-in: ' || TO_CHAR(reserva_rec.checkin, 'DD/MM/YYYY'));
            DBMS_OUTPUT.PUT_LINE('Check-out: ' || TO_CHAR(reserva_rec.checkout, 'DD/MM/YYYY'));
            DBMS_OUTPUT.PUT_LINE('Status: ' || reserva_rec.status);
            DBMS_OUTPUT.PUT_LINE('Número de Hóspedes: ' || reserva_rec.numero_hospedes);
            DBMS_OUTPUT.PUT_LINE('Método de Pagamento: ' || reserva_rec.metodo_pagamento);
            DBMS_OUTPUT.PUT_LINE('Data de Pagamento: ' || TO_CHAR(reserva_rec.data_pagamento, 'DD/MM/YYYY'));
            DBMS_OUTPUT.PUT_LINE('Valor: ' || reserva_rec.valor);
            DBMS_OUTPUT.PUT_LINE('---');
        END LOOP;
    END imprimir_reservas;

BEGIN
    -- Seleciona todas as reservas do hóspede com CPF 444444444
    SELECT *
    BULK COLLECT INTO reservas_hospede
    FROM Contrata
    WHERE cpf_hospede = 444444444;

    -- Chama a procedure para imprimir os detalhes das reservas
    imprimir_reservas;
END;