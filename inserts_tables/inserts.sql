-- Inserções para tabela Cervejaria
INSERT INTO Cervejaria (CNPJ, n_telefone, loc_bairro, loc_cep, loc_rua, loc_numero) 
VALUES ('12345678901234', '999999999', 'Centro', '12345678', 'Rua das Cervejas', 123),
       ('98765432109876', '888888888', 'Vila Madalena', '65432198', 'Rua da Cervejaria', 456);

-- Inserções para tabela Cerveja
INSERT INTO Cerveja (ID, preco, data_validade, nome, quantidade, CNPJ_cervejaria) 
VALUES (1, 10.99, '2024-12-31', 'IPA', 100, '12345678901234'),
       (2, 15.50, '2024-12-31', 'Stout', 80, '98765432109876');

-- Inserções para tabelas de tipos de cerveja (Industrializadas e Artesanal)
INSERT INTO Industrializadas (ID, tipos_de_producao) 
VALUES (1, 'Lager'),
       (2, 'Pilsen');
INSERT INTO Artesanal (ID, ingrediente_extra) 
VALUES (1, 'Laranja'),
       (2, 'Chocolate');

-- Inserções para tabela Garcom
INSERT INTO Garcom (CPF, Nome, LiderCPF, CNPJ_cervejaria) 
VALUES ('12345678901', 'João', NULL, '12345678901234'),
       ('98765432101', 'Pedro', NULL, '98765432109876'),
       -- lider
       ('55555555555', 'Fernanda', '55555555555', '98765432109876'),
       -- liderado por fernanda
         ('11111111111', 'Lucas', '55555555555', '98765432109876');


-- Inserções para tabela Escala
INSERT INTO Escala (Horario, CPF_garcom) 
VALUES ('2024-03-06 10:00:00', '12345678901'),
       ('2024-03-06 15:00:00', '98765432101');

-- Inserções para tabela Setor
INSERT INTO Setor (ID, Nome, CPF_garcom) 
VALUES (1, 'Bar', '12345678901'),
       (2, 'Mesas', '98765432101'),
       -- Setor liderado por Fernanda
       (3, 'Bar Externo', '55555555555'),

-- Inserções para tabela Responsavel pelo setor
INSERT INTO Responsavel (CPF, ID, id_escala) 
VALUES ('12345678901', 1, 1),
       ('98765432101', 2, 2);
       ('55555555555', 3, 2);
       ('11111111111', 4, 2);

-- Inserções para tabela Cliente
INSERT INTO Cliente (CPF, nome, data_nascimento) 
VALUES ('98765432101', 'Maria', '1990-03-06'),
       ('12312312312', 'Carlos', '1985-03-06'),
       -- Cliente sem desconto por aniversário
       ('11111111111', 'Ana', '1998-05-10');

-- Inserções para tabela Cartao_fidelidade
INSERT INTO Cartao_fidelidade (CPF_cliente) 
VALUES ('98765432101'),
       ('12312312312');

-- Inserções para tabela Desconto
INSERT INTO Desconto (id, Valor) 
VALUES (1, 5.00),
       (2, 10.00);

-- Inserções para tabela Aniversariante
INSERT INTO Aniversariante (CPF_cliente, CPF_garcom, id_desconto) 
VALUES ('98765432101', '12345678901', 1),
       ('12312312312', '98765432101', 2);

-- Inserções para tabela Pedido (com desconto para aniversariante)
INSERT INTO Pedido (CPF_cliente, CPF_garcom, id_desconto, valor, dataPedido) 
VALUES ('98765432101', '12345678901', 1, 50.00, '2024-03-06'),
       ('12312312312', '98765432101', 2, 75.00, '2024-03-06'),
       -- Pedido sem desconto
       ('11111111111', '98765432101', NULL, 60.00, '2024-03-06');
