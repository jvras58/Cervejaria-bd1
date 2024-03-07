-- cervejaria:
CREATE TABLE Cervejaria ( 
  CNPJ VARCHAR(14) PRIMARY KEY, 
  n_telefone VARCHAR(20), 
  loc_bairro VARCHAR(100), 
  loc_cep VARCHAR(8), 
  loc_rua VARCHAR(100), 
  loc_numero INT 
);

-- cerveja:
CREATE TABLE Cerveja ( 
  ID INT PRIMARY KEY, 
  preco DECIMAL(10,2), 
  data_validade DATE, 
  nome VARCHAR(100), 
  quantidade INT, 
  CNPJ_cervejaria VARCHAR(14), 
  FOREIGN KEY (CNPJ_cervejaria) REFERENCES Cervejaria (CNPJ) 
);

-- tipos de cerveja:
-- industrializado:
CREATE TABLE Industrializadas ( 
  ID INT PRIMARY KEY, 
  tipos_de_producao VARCHAR(100), 
  FOREIGN KEY (ID) REFERENCES Cerveja (ID) 
);

-- tipos de cerveja:
-- artesanal:
CREATE TABLE Artesanal ( 
  ID INT PRIMARY KEY, 
  ingrediente_extra VARCHAR(100), 
  FOREIGN KEY (ID) REFERENCES Cerveja (ID) 
);

-- garcon:
CREATE TABLE Garcom ( 
  CPF VARCHAR(11) PRIMARY KEY, 
  Nome VARCHAR(100), 
  LiderCPF VARCHAR(11), 
  CNPJ_cervejaria VARCHAR(14), 
  FOREIGN KEY (LiderCPF) REFERENCES Garcom (CPF), 
  FOREIGN KEY (CNPJ_cervejaria) REFERENCES Cervejaria (CNPJ) 
);

-- escala(ajustes: Horario não deve ser chave primária e sim um atributo id deve ser atribuido como pk):
CREATE TABLE Escala ( 
  Horario TIMESTAMP, 
  CPF_garcom VARCHAR(11), 
  PRIMARY KEY (Horario), 
  FOREIGN KEY (CPF_garcom) REFERENCES Garcom (CPF) 
);


-- setor:
CREATE TABLE Setor ( 
  ID INT PRIMARY KEY, 
  Nome VARCHAR(100), 
  CPF_garcom VARCHAR(11), 
  FOREIGN KEY (CPF_garcom) REFERENCES Garcom (CPF) 
);


-- responsavel:
CREATE TABLE Responsavel ( 
  CPF VARCHAR(11), 
  ID INT, 
  Horario TIMESTAMP, 
  PRIMARY KEY (CPF, ID, Horario), 
  FOREIGN KEY (CPF) REFERENCES Garcom (CPF), 
  FOREIGN KEY (ID) REFERENCES Setor (ID), 
  FOREIGN KEY (Horario) REFERENCES Escala (Horario) 
);

-- cliente:
CREATE TABLE Cliente ( 
  CPF VARCHAR(11) PRIMARY KEY, 
  nome VARCHAR(100), 
  data_nascimento DATE 
);

-- cartão fidalidade:
CREATE TABLE Cartao_fidelidade ( 
  CPF_cliente VARCHAR(11), 
  PRIMARY KEY (CPF_cliente), 
  FOREIGN KEY (CPF_cliente) REFERENCES Cliente (CPF) 
);

-- desconto (ajustes: valor não deve ser chave primária e sim um atributo id deve ser atribuido como pk):
CREATE TABLE Desconto ( 
  Valor DECIMAL(10,2) PRIMARY KEY 
);

-- aniversariante:
CREATE TABLE Aniversariante ( 
  CPF_cliente VARCHAR(11), 
  CPF_garcom VARCHAR(11), 
  Valor DECIMAL(10,2), 
  PRIMARY KEY (CPF_cliente, CPF_garcom), 
  FOREIGN KEY (CPF_cliente) REFERENCES Cliente (CPF), 
  FOREIGN KEY (CPF_garcom) REFERENCES Garcom (CPF), 
  FOREIGN KEY (Valor) REFERENCES Desconto (Valor) 
);

-- pedido:
CREATE TABLE Pedido ( 
  CPF_cliente VARCHAR(11), 
  CPF_garcom VARCHAR(11), 
  Valor DECIMAL(10,2), 
  dataPedido DATE, 
  PRIMARY KEY (CPF_cliente, CPF_garcom, dataPedido), 
  FOREIGN KEY (CPF_cliente) REFERENCES Cliente (CPF), 
  FOREIGN KEY (CPF_garcom) REFERENCES Garcom (CPF), 
  FOREIGN KEY (Valor) REFERENCES Desconto (Valor) 
);
