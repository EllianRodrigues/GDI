--consultar tem 

SELECT 
    t.id_tem,
    DEREF(t.contrato).id_contrato AS contrato_id,
    DEREF(t.servico).servico_id AS servico_id,
    t.data_de_contratacao
FROM tem t;