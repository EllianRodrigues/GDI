-- ✅ - USO DE RECORD
-- ✅ - BLOCO ANÔNIMO
-- ✅ - CREATE FUNCTION
-- ✅ - %ROWTYPE
-- ✅ - IF ELSIF
-- ✅ - LOOP EXIT WHEN
-- ✅ - CURSOR (OPEN, FETCH e CLOSE)
-- ✅ - USO DE PARÂMETROS (IN)
DECLARE
    -- Definindo um tipo de registro que armazena uma linha da tabela Cargo
    cargo_rec Cargo%ROWTYPE;

    -- Cursor para iterar pelas linhas da tabela Cargo
    CURSOR cargo_cur IS
        SELECT * FROM Cargo;
    
    -- Função para ajustar os salários
    FUNCTION ajustar_salario(salario IN NUMBER) RETURN NUMBER IS
        novo_salario NUMBER;
    BEGIN
        -- Condições para ajuste do salário
        IF salario > 4500.00 THEN
            novo_salario := salario * 1.05;
        ELSIF salario > 3500.00 THEN
            novo_salario := salario * 1.10;
        ELSIF salario > 2500.00 THEN
            novo_salario := salario * 1.15;
        ELSE
            novo_salario := salario;
        END IF;
        RETURN novo_salario;
    END ajustar_salario;

BEGIN
    -- Abrindo o cursor
    OPEN cargo_cur;

    -- Iterando pelas linhas da tabela Cargo
    LOOP
        FETCH cargo_cur INTO cargo_rec;
        EXIT WHEN cargo_cur%NOTFOUND;
        
        -- Chamando a função para ajustar o salário
        cargo_rec.Salario := ajustar_salario(cargo_rec.Salario);
        
        -- Atualizando a linha na tabela Cargo
        UPDATE Cargo
        SET Salario = cargo_rec.Salario
        WHERE id_cargo = cargo_rec.id_cargo;
        
        DBMS_OUTPUT.PUT_LINE('Cargo: ' || cargo_rec.nome_cargo || ', Novo Salário: ' || cargo_rec.Salario);
    END LOOP;
    
    -- Fechando o cursor
    CLOSE cargo_cur;
END;