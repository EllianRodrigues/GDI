-- Bloqueia INSERT UPDATE DELETE no sabado e domingo
-- ✅ - CASE WHEN
-- ✅ - EXCEPTION WHEN
-- ✅ - CREATE OR REPLACE TRIGGER (COMANDO)
CREATE OR REPLACE TRIGGER check_dia_da_semana
BEFORE INSERT OR UPDATE OR DELETE
DECLARE
    -- Variáveis para armazenar a data/hora do comando e o dia da semana
    v_data_comando DATE;
    v_dia_da_semana NUMBER;
BEGIN
    -- Obtém a data/hora do comando
    v_data_comando := SYSDATE;

    -- Converte a data para o número do dia da semana (1 = Domingo, 7 = Sábado)
    v_dia_da_semana := TO_NUMBER(TO_CHAR(v_data_comando, 'D'));

    -- Usa CASE WHEN para cancelar a operação se for sábado ou domingo
    CASE
        WHEN v_dia_da_semana IN (1, 7) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Operações não permitidas aos sábados e domingos.');
    END CASE;

EXCEPTION
    WHEN OTHERS THEN
        -- Captura e trata qualquer exceção
        DBMS_OUTPUT.PUT_LINE('Erro no trigger: ' || SQLERRM);
        RAISE;  -- Propaga o erro para interromper a operação se necessário
END;
/