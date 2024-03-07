-- Cervejas produzidas por uma cervejaria específica:
-- Essa consulta selecionará todas as colunas da tabela Cerveja onde o CNPJ_cervejaria corresponde ao CNPJ da cervejaria que você especificou.
SELECT * 
FROM Cerveja 
WHERE CNPJ_cervejaria = '12345678901234';

-- Clientes que têm um cartão de fidelidade:
-- Essa consulta selecionará todas as colunas da tabela Cliente para os clientes que têm um registro correspondente na tabela Cartao_fidelidade. A junção é feita com base na coluna CPF na tabela Cliente e na coluna CPF_cliente na tabela Cartao_fidelidade.
SELECT Cliente.* 
FROM Cliente 
INNER JOIN Cartao_fidelidade ON Cliente.CPF = Cartao_fidelidade.CPF_cliente;

-- Pedidos atendidos por um garçom específico:
-- Essa consulta selecionará todas as colunas da tabela Pedido onde o CPF_garcom corresponde ao CPF do garçom que você especificou.
SELECT * 
FROM Pedido 
WHERE CPF_garcom = '12345678901';

-- Relatório de vendas de cerveja por cervejaria:
-- Essa consulta junta as tabelas Cervejaria, Cerveja e Pedido com base nas chaves estrangeiras apropriadas. Em seguida, agrupa os resultados por CNPJ da cervejaria, localização do bairro e nome da cerveja, e calcula a soma total das vendas para cada grupo.
SELECT Cervejaria.CNPJ, Cervejaria.loc_bairro, Cerveja.nome, SUM(Pedido.valor) AS Total_vendas
FROM Cervejaria
INNER JOIN Cerveja ON Cervejaria.CNPJ = Cerveja.CNPJ_cervejaria
INNER JOIN Pedido ON Cerveja.ID = Pedido.id_desconto
GROUP BY Cervejaria.CNPJ, Cervejaria.loc_bairro, Cerveja.nome;


-- Relatório de descontos oferecidos aos aniversariantes:
-- Essa consulta junta as tabelas Aniversariante, Cliente, Garcom e Desconto com base nas chaves estrangeiras apropriadas. Em seguida, seleciona o nome do cliente, o nome do garçom e o valor do desconto para cada registro na tabela Aniversariante.
SELECT Cliente.nome AS Cliente, Garcom.Nome AS Garcom, Desconto.Valor AS Desconto
FROM Aniversariante
INNER JOIN Cliente ON Aniversariante.CPF_cliente = Cliente.CPF
INNER JOIN Garcom ON Aniversariante.CPF_garcom = Garcom.CPF
INNER JOIN Desconto ON Aniversariante.id_desconto = Desconto.id;


-- Relatório de horários de trabalho dos garçons:
-- Essa consulta junta as tabelas Garcom e Escala com base na chave estrangeira apropriada. Em seguida, seleciona o nome do garçom e o horário de trabalho para cada registro. Os resultados são ordenados pelo nome do garçom e pelo horário de trabalho.
SELECT Garcom.Nome, Escala.Horario
FROM Garcom
INNER JOIN Escala ON Garcom.CPF = Escala.CPF_garcom
ORDER BY Garcom.Nome, Escala.Horario;

-- Relatório de responsáveis por setores:
-- Essa consulta junta as tabelas Responsavel, Setor e Garcom com base nas chaves estrangeiras apropriadas. Em seguida, seleciona o nome do setor e o nome do responsável para cada registro. Os resultados são ordenados pelo nome do setor.
SELECT Setor.Nome AS Setor, Garcom.Nome AS Responsavel
FROM Responsavel
INNER JOIN Setor ON Responsavel.ID = Setor.ID
INNER JOIN Garcom ON Responsavel.CPF = Garcom.CPF
ORDER BY Setor.Nome;

-- Relatório de lideres e liderados:
-- Essa consulta junta a tabela Garcom consigo mesma com base na chave estrangeira LiderCPF. Em seguida, seleciona o nome do líder e o nome do liderado para cada registro. Os resultados são ordenados pelo nome do líder.
SELECT Lider.Nome AS Lider, Liderado.Nome AS Liderado
FROM Garcom AS Lider
INNER JOIN Garcom AS Liderado ON Lider.CPF = Liderado.LiderCPF
ORDER BY Lider.Nome;
