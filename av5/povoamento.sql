--criar a tabela cargo 

CREATE TABLE cargos OF tp_cargo(
    PRIMARY KEY (id)
);

--mapear cargos

INSERT INTO cargos VALUES (1,'Gerente', 5000);
INSERT INTO cargos VALUES (2,'Recepcionista', 2500);
INSERT INTO cargos VALUES (3,'Limpeza', 1800);

--Criar tabelas Usuario, hospede e funcionario

CREATE TABLE usuario OF tp_usuario (
    PRIMARY KEY (cpf)
);

CREATE TABLE hospede OF tp_hospede(
    PRIMARY KEY (cpf)
);

CREATE TABLE funcionario OF tp_funcionario(
    PRIMARY KEY (cpf)
);

--Mapear usuario, funcionario e hospede

--usuario que é funcionario
INSERT INTO usuario VALUES (
    '12345678901', 
    'Maria Silva', 
    'maria.silva@email.com', 
    tp_endereco('12345678', 'Brasil', 'SP', 'São Paulo', 'Centro', 'Rua A'),
    'Apto 101', 
    '1234', 
    tp_fones(tp_telefone('987654321'))
);
SELECT ROWID, nome, email FROM usuario;


INSERT INTO funcionario VALUES (
    '12345678901', 
    'Maria Silva', 
    'maria.silva@email.com', 
    tp_endereco('12345678', 'Brasil', 'SP', 'São Paulo', 'Centro', 'Rua A'),
    'Apto 101', 
    '1234', 
    tp_fones(tp_telefone('987654321')),
    (SELECT REF(c) FROM cargos c WHERE c.id = 1),
    NULL  
);


--usuario que é funcionario e supervisionado por Maria 
INSERT INTO usuario VALUES (
    '98765432101',                
    'João Pedro',                 
    'joao.pedro@email.com',        
    tp_endereco('87654321', 'Brasil', 'RJ', 'Rio de Janeiro', 'Centro', 'Rua B'), 
    'Apto 202',                   
    '5678',                       
    tp_fones(tp_telefone('912345678'))
);
SELECT ROWID, nome, email FROM usuario;


INSERT INTO funcionario VALUES (
    '98765432101',                
    'João Pedro',                 
    'joao.pedro@email.com',        
    tp_endereco('87654321', 'Brasil', 'RJ', 'Rio de Janeiro', 'Centro', 'Rua B'), 
    'Apto 202',                   
    '5678',                       
    tp_fones(tp_telefone('912345678')), 
    (SELECT REF(c) FROM cargos c WHERE c.id = 3),
    (SELECT REF(f) FROM funcionario f WHERE f.cpf = '12345678901')  
);

--usuario que hospede

INSERT INTO usuario VALUES (
    '98765432100',                
    'Ana Costa',                  
    'ana.costa@email.com',        
    tp_endereco('65432198', 'Brasil', 'MG', 'Belo Horizonte', 'Centro', 'Rua C'), 
    'Apto 303',                   
    '9012',                     
    tp_fones(tp_telefone('923456789'))
);
SELECT ROWID, nome, email FROM usuario;

INSERT INTO hospede VALUES (
    '98765432100',                
    'Ana Costa',                  
    'ana.costa@email.com',        
    tp_endereco('65432198', 'Brasil', 'MG', 'Belo Horizonte', 'Centro', 'Rua C'), 
    'Apto 303',                   
    '9012',                     
    tp_fones(tp_telefone('923456789')), 
    'Engenheira',                 
    'F',                          
    DATE '1985-07-15'             
);

INSERT INTO usuario VALUES (
    '12345678910',             
    'João Silva',              
    'joao.silva@email.com',    
    tp_endereco('12345678', 'Brasil', 'RJ', 'Rio de Janeiro', 'Botafogo', 'Rua A'),
    'Casa 101',                  
    '1234',                      
    tp_fones(tp_telefone('912345678')) 
);
SELECT ROWID, nome, email FROM usuario;

INSERT INTO hospede VALUES (
    '12345678910',                
    'João Silva',                 
    'joao.silva@email.com',       
    tp_endereco('12345678', 'Brasil', 'RJ', 'Rio de Janeiro', 'Botafogo', 'Rua A'), 
    'Casa 101',                   
    '1234',                       
    tp_fones(tp_telefone('912345678')), 
    'Professor',                 
    'M',                          
    DATE '1980-05-20'             
);

INSERT INTO usuario VALUES (
    '11223344556',                -- CPF
    'Maria Oliveira',             -- Nome
    'maria.oliveira@email.com',   -- Email
    tp_endereco('87654321', 'Brasil', 'SP', 'São Paulo', 'Jardins', 'Rua B'), -- Endereço
    'Apto 502',                   -- Complemento
    '5678',                       -- Número
    tp_fones(tp_telefone('911234567'))  -- Telefones
);
SELECT ROWID, nome, email FROM usuario;

INSERT INTO hospede VALUES (
    '11223344556',                
    'Maria Oliveira',             
    'maria.oliveira@email.com',   
    tp_endereco('87654321', 'Brasil', 'SP', 'São Paulo', 'Jardins', 'Rua B'),
    'Apto 502',                  
    '5678',                      
    tp_fones(tp_telefone('911234567')),
    'Advogada',                   
    'F',                          
    DATE '1990-09-10'             
);


--CRIAR TABELA VISITA

CREATE TABLE visita of tp_visita(
    PRIMARY KEY (cpf_visita)
);

-- CRIAR VISITANTE DE ANA COSTA

INSERT INTO visita VALUES (
    '73927936813',                 
    30,                           
    'Miguel',                   
    DATE '2024-09-04',            
    (SELECT REF(h) FROM hospede h WHERE h.cpf = '98765432100')  
);

INSERT INTO visita VALUES (
    '83927394856',                
    28,                           
    'Lucas Santos',               
    DATE '2024-09-05',            
    (SELECT REF(h) FROM hospede h WHERE h.cpf = '98765432100')  
);

INSERT INTO visita VALUES (
    '74839273845',                
    32,                           
    'Acsa',                
    DATE '2024-09-06',            
    (SELECT REF(h) FROM hospede h WHERE h.cpf = '98765432100')  
);

-- CRIAR VISITANTE DE JOAO SILVA
INSERT INTO visita VALUES (
    '93827465567',                
    45,                           
    'Pedro Gomes',                
    DATE '2024-09-07',            
    (SELECT REF(h) FROM hospede h WHERE h.cpf = '12345678910') 
);

INSERT INTO visita VALUES (
    '98765432123',                
    40,                           
    'Fernanda Lima',              
    DATE '2024-09-08',            
    (SELECT REF(h) FROM hospede h WHERE h.cpf = '12345678910')
);


-- criar tabela de reserva, tipo quarto e quarto

CREATE TABLE reserva of tp_reserva(
    PRIMARY KEY (reserva_id)
);

CREATE TABLE tipo_quarto of tp_tipo_quarto(
    PRIMARY KEY(nome_tipo)
);

CREATE TABLE quarto of tp_quarto(
    PRIMARY KEY (numero_quarto)
);



-- povoar tipo de quarto 

INSERT INTO tipo_quarto VALUES (
    'Simples',  
    20,         
    1,         
    1,          
    1,          
    1,          
    1,          
    150         
);

INSERT INTO tipo_quarto VALUES (
    'Duplo',    
    30,         
    2,          
    1,          
    1,          
    1,          
    1,          
    200         
);

INSERT INTO tipo_quarto VALUES (
    'Júnior', 
    40,            
    1,             
    1,             
    2,             
    2,             
    1,             
    300            
);

INSERT INTO tipo_quarto VALUES (
    'Familiar',    
    50,           
    2,            
    1,            
    2,            
    2,            
    1,            
    350           
);

INSERT INTO tipo_quarto VALUES (
    'Master', 
    60,            
    1,             
    2,             
    2,             
    3,             
    2,             
    500            
);

--povoar quartos 

INSERT INTO quarto VALUES (
    (SELECT REF(t) FROM tipo_quarto t WHERE t.nome_tipo = 'Simples'), 
    100,   
    'Disponível', 
    'Não Reservado'
);

INSERT INTO quarto VALUES (
    (SELECT REF(t) FROM tipo_quarto t WHERE t.nome_tipo = 'Duplo'), 
    101,   
    'Disponível', 
    'Não Reservado'
);

INSERT INTO quarto VALUES (
    (SELECT REF(t) FROM tipo_quarto t WHERE t.nome_tipo = 'Júnior'), 
    102,   
    'Disponível', 
    'Não Reservado'
);

INSERT INTO quarto VALUES (
    (SELECT REF(t) FROM tipo_quarto t WHERE t.nome_tipo = 'Familiar'), 
    103,   
    'Disponível', 
    'Não Reservado'
);

INSERT INTO quarto VALUES (
    (SELECT REF(t) FROM tipo_quarto t WHERE t.nome_tipo = 'Master'), 
    104,   
    'Disponível', 
    'Não Reservado'
);

-- Povoamento reserva 

INSERT INTO reserva VALUES(
    'R001', 
    DATE '2024-09-01', 
    DATE '2024-09-05', 
    'Confirmada', 
    2, 
    tp_detalhes_pagamento(DATE '2024-09-01', 'Cartão de Crédito', 1000)
);

INSERT INTO reserva VALUES(
    'R002', 
    DATE '2024-09-10', 
    DATE '2024-09-12', 
    'Confirmada', 
    1, 
    tp_detalhes_pagamento(DATE '2024-09-10', 'Dinheiro', 500)
);

-- criar tabela de contrato

CREATE TABLE contrato of tp_contrato(
    PRIMARY KEY(id_contrato),
    SCOPE FOR (reserva) IS reserva,  
    SCOPE FOR (hospede) IS hospede,   
    SCOPE FOR (quarto) IS quarto 
);

-- povoar contrato 

INSERT INTO contrato VALUES (
    'C002',
    (SELECT REF(r) FROM reserva r WHERE r.reserva_id = 'R002'),  
    (SELECT REF(h) FROM hospede h WHERE h.cpf = '98765432100'),  
    (SELECT REF(q) FROM quarto q WHERE q.numero_quarto = 102)
);

--criar tabela de serviço de hospede e tem

CREATE TABLE servico of tp_servico_hospede(
    PRIMARY KEY (servico_id)
);

CREATE TABLE tem of tp_tem(
    PRIMARY KEY (id_tem)
);

-- povoar tabela de serviço

INSERT INTO servico VALUES(
    'S001', 
    'Room Service - Refeição no quarto', 
    50 
);

INSERT INTO servico VALUES(
    'S002', 
    'Laundry - Lavagem de roupas', 
    30 
);

INSERT INTO servico VALUES(
    'S003', 
    'Spa - Massagem relaxante', 
    100 
);

INSERT INTO servico VALUES(
    'S004',
    'Excursão - Visita guiada pela cidade', 
    150
);

-- povoar tem 

INSERT INTO tem VALUES(
    'T001',
    (SELECT REF(c) FROM contrato c WHERE c.id_contrato = 'C002'), 
    (SELECT REF(s) FROM servico s WHERE s.servico_id = 'S004'), 
    DATE '2024-09-12'   
);


