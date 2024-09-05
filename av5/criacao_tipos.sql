CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	cep VARCHAR2(8),
	pais VARCHAR2(15),
	estado VARCHAR2(15),
	cidade VARCHAR2(100),
	bairro VARCHAR2(100),
	rua VARCHAR2(100)
);
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    numero VARCHAR(9)
);
/

CREATE OR REPLACE TYPE tp_fones AS VARRAY(5) OF tp_telefone;
/

CREATE OR REPLACE TYPE tp_usuario AS OBJECT (
	cpf VARCHAR2(11),
	nome VARCHAR2(100),
	email VARCHAR2(50),
	endereco tp_endereco,
	complemento VARCHAR2(100),
	numero VARCHAR2(7),
	telefone tp_fones
) NOT FINAL;
/

CREATE OR REPLACE TYPE tp_cargo AS OBJECT (
	id NUMBER,
	nome_cargo VARCHAR2(20),
	salario NUMBER
);
/

CREATE OR REPLACE TYPE tp_funcionario UNDER tp_usuario (
	cargo REF tp_cargo,
	supervisor REF tp_funcionario
);
/

CREATE OR REPLACE TYPE tp_hospede UNDER tp_usuario (
	profissao VARCHAR2(30),
	genero VARCHAR2(1),
	data_de_nascimento DATE
);
/

CREATE OR REPLACE TYPE tp_visita AS OBJECT (
	cpf_visita VARCHAR2(11),
	idade NUMBER,
	nome VARCHAR2(100),
	data_visita DATE,
	hospede_visitado REF tp_hospede
);
/

CREATE OR REPLACE TYPE tp_detalhes_pagamento AS OBJECT (
	data_pagamento DATE,
	metodo_pagamento VARCHAR2(50),
	valor NUMBER
);
/

CREATE OR REPLACE TYPE tp_reserva AS OBJECT (
	reserva_id VARCHAR2(10), 
	check_in DATE,
	check_out DATE,
	status VARCHAR2(20),
	numero_hospedes NUMBER,
	detalhes_pagamento tp_detalhes_pagamento
);
/

CREATE OR REPLACE TYPE tp_tipo_quarto AS OBJECT (
	nome_tipo VARCHAR2(10),
	area NUMBER,
	qtd_camas NUMBER,
	qtd_tvs NUMBER,
	qtd_arcondicionados NUMBER,
	qtd_comodos NUMBER,
	qtd_banheiros NUMBER,
	preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_quarto AS OBJECT (
	tipo_quarto REF tp_tipo_quarto,
	numero_quarto NUMBER,
	status VARCHAR2(20),
	reservado VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_contrato AS OBJECT(
	id_contrato VARCHAR2(100),
	reserva REF tp_reserva,
	hospede REF tp_hospede,
	quarto REF tp_quarto
);
/

CREATE OR REPLACE TYPE tp_servico_hospede AS OBJECT(
	servico_id VARCHAR2(100),
	descricao VARCHAR2(100),
	preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_tem AS OBJECT(
	id_tem VARCHAR2(100),
	contrato REF tp_contrato,
	servico REF tp_servico_hospede,
	data_de_contratacao DATE
);
/