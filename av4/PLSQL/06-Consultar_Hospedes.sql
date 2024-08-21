-- Exibe o nome de todos os Hóspedes e verifica se o CPF é válido
-- ✅ - %TYPE
-- ✅ - WHILE LOOP
DECLARE
    -- Definindo variáveis usando %TYPE
    v_cpf Hospede.cpf_hospede%TYPE;
    v_nome Usuario.nome%TYPE;

    -- Cursor para selecionar todos os CPF dos hóspedes
    CURSOR hospede_cursor IS
        SELECT cpf_hospede
        FROM Hospede;

    -- Contador para controle do WHILE LOOP
    v_total_count NUMBER := 0;
    v_index NUMBER := 1;
BEGIN
    -- Obtendo a contagem total de registros
    SELECT COUNT(*) INTO v_total_count
    FROM Hospede;

    -- Abrindo o cursor
    OPEN hospede_cursor;

    -- Iniciando o WHILE LOOP
    WHILE v_index <= v_total_count LOOP
        -- Buscando o próximo CPF do cursor
        FETCH hospede_cursor INTO v_cpf;
        
        EXIT WHEN hospede_cursor%NOTFOUND;

        -- Buscando o nome do usuário correspondente
        BEGIN
            SELECT nome INTO v_nome
            FROM Usuario
            WHERE cpf = v_cpf;

            -- Exibindo o nome do usuário
            DBMS_OUTPUT.PUT_LINE('Nome do Hóspede: ' || v_nome);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Nenhum usuário encontrado para o CPF: ' || v_cpf);
        END;

        -- Incrementando o contador
        v_index := v_index + 1;
    END LOOP;

    -- Fechando o cursor
    CLOSE hospede_cursor;
END;
/