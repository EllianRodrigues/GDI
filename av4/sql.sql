--------- ALTER TABLE ------------
Adiciona uma nova coluna chamada data_nascimento do tipo DATE à tabela Usuario.

ALTER TABLE Usuario
ADD data_nascimento DATE;

-- Atualiza a nova coluna com valores fictícios ----
UPDATE Usuario
SET data_nascimento = CASE 
    WHEN cpf = 111111111 THEN TO_DATE('01/01/1980', 'DD/MM/YYYY')
    WHEN cpf = 222222222 THEN TO_DATE('01/02/1985', 'DD/MM/YYYY')
    WHEN cpf = 333333333 THEN TO_DATE('01/03/1990', 'DD/MM/YYYY')
    WHEN cpf = 444444444 THEN TO_DATE('01/04/1995', 'DD/MM/YYYY')
    WHEN cpf = 555555555 THEN TO_DATE('01/05/2000', 'DD/MM/YYYY')
    ELSE TO_DATE('01/01/2005', 'DD/MM/YYYY')
END;


-------------ANY -- ALL --- IN ---- MAX --- MIN --- AVG ------------- BETWEEN
A consulta retorna o salário máximo, mínimo e a média para os cargos 'Gerente' e 'Analista', com salários entre 3000 e 5000, maiores que 
os salários de 'Assistente' e menores que os de 'Gerente'. Resultados são agrupados e ordenados por nome do cargo.

SELECT 
    c.nome_cargo,
    MAX(c.Salario) AS MaxSalario,
    MIN(c.Salario) AS MinSalario,
    AVG(c.Salario) AS MediaSalario
FROM 
    Funcionario f
INNER JOIN 
    Cargo c ON f.id_cargo = c.id_cargo
WHERE 
    c.nome_cargo IN ('Gerente', 'Analista')  
    AND c.Salario BETWEEN 3000 AND 5000  
    AND c.Salario > ANY (SELECT Salario FROM Cargo WHERE nome_cargo = 'Assistente')  
    AND c.Salario < ALL (SELECT Salario FROM Cargo WHERE nome_cargo = 'Gerente')  
GROUP BY 
    c.nome_cargo
ORDER BY 
    c.nome_cargo;


-------- left join ----------
A consulta mostra todos os usuários com detalhes de cargo e salário, incluindo usuários sem cargo. 

SELECT 
    u.cpf AS CPF_Usuario,
    u.nome AS Nome_Usuario,
    u.email AS Email_Usuario,
    u.data_nascimento AS Data_Nascimento_Usuario,
    f.id_cargo AS ID_Cargo,
    c.nome_cargo AS Nome_Cargo,
    c.Salario AS Salario_Cargo
FROM 
    Usuario u
LEFT JOIN 
    Funcionario f ON u.cpf = f.cpf_funcionario
LEFT JOIN 
    Cargo c ON f.id_cargo = c.id_cargo
WHERE 
    c.Salario BETWEEN 3000 AND 5000  
    OR c.Salario IS NULL  
ORDER BY 
    u.cpf;


----- INDEX ------
Cria um INDEX

CREATE INDEX idx_salario ON Cargo (Salario);

---- SELECT-FROM-WHERE ----- INNER JOIN ----- ORDER BY -------
A consulta retorna nome, email, número de telefone, bairro e cidade dos usuários que moram em 'São Paulo', ordenados pelo nome.


SELECT
	u.nome,
	u.email,
	t.num_telefone,
	e.bairro,
	e.cidade
FROM
	Usuario u
INNER JOIN
	ENDERECO e ON u.cep = e.cep
INNER JOIN
	Telefone t ON u.cpf = t.cpf
WHERE
	e.cidade = 'São Paulo'
ORDER BY
	u.nome;

-------- UPDATE ---------
Atualiza o bairro para 'Botafogo' no endereço associado ao usuário chamado 'João Silva'.

UPDATE 
    Endereco e
SET 
    e.bairro = 'Botafogo'
WHERE 
    e.cep = (SELECT u.cep FROM Usuario u WHERE u.nome = 'João Silva');

-------- DELETE -------
Remove o telefone com o número 123123123 associado ao usuário chamado 'Carlos Lima'.

DELETE FROM 
    Telefone
WHERE 
    num_telefone = 123123123 AND cpf = (SELECT cpf FROM Usuario WHERE nome = 'Carlos Lima');

-------- LIKE ----------------------
Seleciona nomes e emails de usuários cujo email termina com '@email.com'

SELECT 
    u.nome, 
    u.email
FROM 
    Usuario u
WHERE 
    u.email LIKE '%@email.com';

------- COUNT ---- GROUP BY -------- HAVING -- Operador >
Conta o número de usuários por cidade, mostrando apenas cidades com mais de um usuário

SELECT 
    e.cidade, 
    COUNT(u.cpf) AS NumeroDeUsuarios
FROM 
    Usuario u
INNER JOIN 
    Endereco e ON u.cep = e.cep
GROUP BY 
    e.cidade;
HAVING
    COUNT(u.cpf) > 1;

---------- UNION -------------
Combina e mostra nomes de usuários e bairros de endereços como uma única lista.

SELECT 
    u.nome AS NomeOuBairro
FROM 
    Usuario u
UNION
SELECT 
    e.bairro AS NomeOuBairro
FROM 
    Endereco e;

------------- CREATE VIEWS -------
Cria uma visão chamada UsuarioBairro que mostra o nome dos usuários e seus bairros associados.

CREATE VIEW UsuarioBairro AS
SELECT 
    u.nome, 
    e.bairro
FROM 
    Usuario u
INNER JOIN 
    Endereco e ON u.cep = e.cep;


SELECT * FROM UsuarioBairro; * para ver a views















