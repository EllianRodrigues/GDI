CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	cep VARCHAR2(8),
	pais VARCHAR2(15),
	estado VARCHAR2(15),
	cidade VARCHAR2(100),
	bairro VARCHAR2(100)
);
/
-- Alter type para adicionar Rua
ALTER TYPE tp_endereco ADD ATTRIBUTE (rua VARCHAR2(100));

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
	telefone tp_fones,
	MEMBER PROCEDURE exibir_dados
	-- FINAL MAP MEMBER FUNCTION count_telefones RETURN NUMBER
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_usuario AS
    MEMBER PROCEDURE exibir_dados IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || nome);
    END exibir_dados;

    -- MAP MEMBER FUNCTION count_telefones RETURN NUMBER IS
    -- BEGIN
    --     IF telefone IS NULL THEN
    --         RETURN 0;
    --     ELSE
    --         RETURN telefone.COUNT;
    --     END IF;
    -- END count_telefones;
END;
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
	data_de_nascimento DATE,
	OVERRIDING MEMBER PROCEDURE exibir_dados
);
/

CREATE OR REPLACE TYPE BODY tp_hospede AS
    overriding MEMBER PROCEDURE exibir_dados IS
    BEGIN
        -- Chama o método base
		--SELF.exibir_dados;
        DBMS_OUTPUT.PUT_LINE('Profissão: ' || profissao);
    END exibir_dados;
END;
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
	preco NUMBER,
	MAP MEMBER FUNCTION preco_por_cama RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_tipo_quarto AS
	MAP MEMBER FUNCTION preco_por_cama RETURN NUMBER IS
	BEGIN
		RETURN preco / qtd_camas;
	END;
END;
/

CREATE OR REPLACE TYPE tp_quarto AS OBJECT (
    tipo_quarto REF tp_tipo_quarto,
    numero_quarto NUMBER,
    status VARCHAR2(20),
    reservado VARCHAR2(20),
    MEMBER PROCEDURE ocupar_quarto,
	MEMBER PROCEDURE descupar_quarto,
    MEMBER FUNCTION esta_disponivel RETURN BOOLEAN,
	ORDER MEMBER FUNCTION compare_quartos (q tp_quarto) RETURN INTEGER
);
/

-- Implementação dos Métodos
CREATE OR REPLACE TYPE BODY tp_quarto AS
    MEMBER PROCEDURE ocupar_quarto IS -- Atualiza o status para Ocupado
    BEGIN
        status := 'Ocupado';
    END ocupar_quarto;

	MEMBER PROCEDURE descupar_quarto IS -- Atualiza o status para Ocupado
    BEGIN
        status := 'Disponível';
    END descupar_quarto;

    MEMBER FUNCTION esta_disponivel RETURN BOOLEAN IS -- Retorna True se o quarto estiver disponível
    BEGIN
        RETURN status = 'Disponível';
    END esta_disponivel;

	ORDER MEMBER FUNCTION compare_quartos (q tp_quarto) RETURN INTEGER IS
    BEGIN
        IF SELF.numero_quarto < q.numero_quarto THEN
            RETURN -1;
        ELSIF SELF.numero_quarto > q.numero_quarto THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END compare_quartos;
END;
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