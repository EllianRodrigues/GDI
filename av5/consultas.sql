

-- Retorna todos os visitantes
SELECT v.cpf_visita AS CPF_Visitante,
       v.nome AS Nome_Visitante,
       v.idade AS Idade_Visitante,
       v.data_visita AS Data_Visita,
       DEREF(v.hospede_visitado).cpf AS CPF_Hospede,
       DEREF(v.hospede_visitado).nome AS Nome_Hospede,
       DEREF(v.hospede_visitado).email AS Email_Hospede
FROM visita v;

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

--consultar nasted tables tem 

SELECT
    t.id_tem,
    s.servico_id,
    s.descricao,
    s.preco
FROM 
    tem t,
    TABLE(t.servico) s;