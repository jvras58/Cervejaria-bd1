-- Escala (Ajustes: O horário não deve ser a chave primária; um novo atributo "id" deve ser adicionado como chave primária):
-- Ao ajustar a escala, é necessário também modificar a referência do responsável.

-- Removendo a chave estrangeira na tabela Responsavel
ALTER TABLE Responsavel
DROP CONSTRAINT responsavel_horario_fkey;

-- Adicionando a nova coluna "id" na tabela Escala
ALTER TABLE Escala
ADD COLUMN id SERIAL;

-- Definindo a nova coluna "id" como chave primária na tabela Escala
ALTER TABLE Escala
DROP CONSTRAINT escala_pkey,
ADD PRIMARY KEY (id);

-- Adicionando a nova coluna "id_escala" na tabela Responsavel
ALTER TABLE Responsavel
ADD COLUMN id_escala INT;

-- Definindo a nova coluna "id_escala" como chave estrangeira na tabela Responsavel
ALTER TABLE Responsavel
ADD CONSTRAINT responsavel_id_escala_fkey FOREIGN KEY (id_escala) REFERENCES Escala(id);

-- Removendo a coluna "Horario" da tabela Responsavel
ALTER TABLE Responsavel
DROP COLUMN Horario;


-- desconto (ajustes: valor não deve ser chave primária e sim um atributo id deve ser atribuido como pk):
-- Ao ajustar a desconto, é necessário também modificar a referência do Aniversariante & Pedido.

-- Removendo as chaves estrangeiras que referenciam a tabela Desconto
ALTER TABLE Aniversariante
DROP CONSTRAINT aniversariante_valor_fkey;

ALTER TABLE Pedido
DROP CONSTRAINT pedido_valor_fkey;

-- Removendo a chave primária atual da tabela Desconto
ALTER TABLE Desconto
DROP CONSTRAINT desconto_pkey;

-- Adicionando a nova chave primária
ALTER TABLE Desconto
ADD id SERIAL PRIMARY KEY;

-- Adicionando a nova coluna nas tabelas Aniversariante e Pedido
ALTER TABLE Aniversariante
ADD COLUMN id_desconto INT;

ALTER TABLE Pedido
ADD COLUMN id_desconto INT;

-- Adicionando as novas chaves estrangeiras
ALTER TABLE Aniversariante
ADD FOREIGN KEY (id_desconto) REFERENCES Desconto(id);

ALTER TABLE Pedido
ADD FOREIGN KEY (id_desconto) REFERENCES Desconto(id);

-- Removendo a coluna valor da tabela aniversariante
ALTER TABLE aniversariante DROP COLUMN valor;
