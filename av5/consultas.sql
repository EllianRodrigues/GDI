--consultar tem 

SELECT 
    t.id_tem,
    DEREF(t.contrato).id_contrato AS contrato_id,
    DEREF(t.servico).servico_id AS servico_id,
    t.data_de_contratacao
FROM tem t;

-- Retorna todos os visitantes
SELECT v.cpf_visita AS CPF_Visitante,
       v.nome AS Nome_Visitante,
       v.idade AS Idade_Visitante,
       v.data_visita AS Data_Visita,
       DEREF(v.hospede_visitado).cpf AS CPF_Hospede,
       DEREF(v.hospede_visitado).nome AS Nome_Hospede,
       DEREF(v.hospede_visitado).email AS Email_Hospede
FROM visita v;

-- Testa os procedures e funções de quarto
DECLARE
    v_quarto tp_quarto;
    v_disponivel BOOLEAN;
BEGIN
    SELECT VALUE(q) INTO v_quarto
    FROM quarto q
    WHERE q.numero_quarto = 100; 
    
    v_disponivel := v_quarto.esta_disponivel;

    IF v_disponivel THEN
        DBMS_OUTPUT.PUT_LINE('Quarto Disponível');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Quarto Indisponível');
    END IF;

    v_quarto.ocupar_quarto; -- Chama a procedure

    v_disponivel := v_quarto.esta_disponivel;

    IF v_disponivel THEN
        DBMS_OUTPUT.PUT_LINE('Quarto Disponível');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Quarto Indisponível');
    END IF;

    v_quarto.descupar_quarto;

    v_disponivel := v_quarto.esta_disponivel;

    IF v_disponivel THEN
        DBMS_OUTPUT.PUT_LINE('Quarto Disponível');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Quarto Indisponível');
    END IF;

    -- Atualiza a tabela com o novo status 'Ocupado'
    UPDATE quarto
    SET status = v_quarto.status
    WHERE numero_quarto = 100;  

    COMMIT;
END;
/

-- Retorna todos os quartos
SELECT 
    q.numero_quarto,
    q.status,
    q.reservado,
    t.nome_tipo,
    t.area,
    t.qtd_camas,
    t.qtd_tvs,
    t.qtd_arcondicionados,
    t.qtd_comodos,
    t.qtd_banheiros,
    t.preco
FROM 
    quarto q,
    tipo_quarto t
WHERE 
    DEREF(q.tipo_quarto).nome_tipo = t.nome_tipo;


-- Retorna todos os hospedes
SELECT h.cpf AS CPF_Hospede,
       h.nome AS Nome_Hospede,
       h.profissao AS Profissao,
       h.genero AS Genero,
       h.data_de_nascimento AS Data_Nascimento
FROM hospede h;

-- Retorna todos os funcionários
SELECT f.cpf AS CPF_Funcionario,
       f.nome AS Nome_Funcionario,
       DEREF(f.cargo).nome_cargo AS Cargo,
       DEREF(f.supervisor).nome AS Nome_Supervisor
FROM funcionario f;

-- Retorna todas as reservas
SELECT r.reserva_id AS Reserva_ID,
       r.check_in AS Data_CheckIn,
       r.check_out AS Data_CheckOut,
       r.status AS Status_Reserva,
       r.numero_hospedes AS Numero_Hospedes,
       r.detalhes_pagamento.metodo_pagamento AS Metodo_Pagamento,
       r.detalhes_pagamento.valor AS Valor_Pagamento
FROM reserva r;

-- Retorna todos os contratos
SELECT c.id_contrato AS Contrato_ID,
       DEREF(c.reserva).reserva_id AS Reserva_ID,
       DEREF(c.hospede).cpf AS CPF_Hospede,
       DEREF(c.quarto).numero_quarto AS Numero_Quarto
FROM contrato c;
