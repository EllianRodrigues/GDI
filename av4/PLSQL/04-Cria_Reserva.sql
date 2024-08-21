-- ✅ - CREATE OR REPLACE PACKAGE
CREATE OR REPLACE PACKAGE ReservaPackage AS
    PROCEDURE ReservarQuarto(
        p_cpf_hospede IN INT,
        p_numero_quarto IN INT,
        p_checkin IN DATE,
        p_checkout IN DATE,
        p_status IN VARCHAR2,
        p_numero_hospedes IN INT,
        p_metodo_pagamento IN VARCHAR2
    );
END ReservaPackage;
/
-- ✅ - CREATE OR REPLACE PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY ReservaPackage AS

    PROCEDURE ReservarQuarto(
        p_cpf_hospede IN INT,
        p_numero_quarto IN INT,
        p_checkin IN DATE,
        p_checkout IN DATE,
        p_status IN VARCHAR2,
        p_numero_hospedes IN INT,
        p_metodo_pagamento IN VARCHAR2
    ) IS
        v_id_reserva INT;
    BEGIN
        -- Verifica se o quarto está disponível
        DECLARE
            v_status VARCHAR2(20);
        BEGIN
            SELECT status INTO v_status
            FROM Quarto
            WHERE numero_quarto = p_numero_quarto;

            IF v_status = 'Disponível' THEN
                -- Insere a nova reserva
                INSERT INTO Reserva (id_reserva, checkin, checkout, status, numero_hospedes, metodo_pagamento, data_pagamento)
                VALUES (reserva_seq.NEXTVAL, p_checkin, p_checkout, p_status, p_numero_hospedes, p_metodo_pagamento, p_checkout)
                RETURNING id_reserva INTO v_id_reserva;
                
                -- Atualiza o status do quarto para reservado
                UPDATE Quarto
                SET status = 'Reservado', reservado = 'Sim'
                WHERE numero_quarto = p_numero_quarto;
                
                -- Insere a relação na tabela Contrata
                INSERT INTO Contrata (cpf_hospede, id_reserva, numero_quarto)
                VALUES (p_cpf_hospede, v_id_reserva, p_numero_quarto);
            ELSE
                DBMS_OUTPUT.PUT_LINE('Quarto não disponível.');
            END IF;
        END;
    END ReservarQuarto;
END ReservaPackage;
/
-- Utiliza o pacote para reservar um quarto
BEGIN
    ReservaPackage.ReservarQuarto(
        p_cpf_hospede => 444444444,
        p_numero_quarto => 102,
        p_checkin => TO_DATE('21/08/2024', 'DD/MM/YYYY'),
        p_checkout => TO_DATE('25/08/2024', 'DD/MM/YYYY'),
        p_status => 'Confirmada',
        p_numero_hospedes => 2,
        p_metodo_pagamento => 'Cartão de Crédito'
    );
END;
/