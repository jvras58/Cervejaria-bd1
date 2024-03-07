-- Atualizando o número de telefone para a Cervejaria com o CNPJ '12345678901234'
UPDATE Cervejaria
SET n_telefone = '111111111' --O SET é uma cláusula chave na instrução UPDATE em SQL. Ele especifica quais colunas da tabela devem ser atualizadas e quais valores devem ser atribuídos a essas colunas.
WHERE CNPJ = '12345678901234';

-- Atualizando o CEP para a Cervejaria com o CNPJ '98765432109876'
UPDATE Cervejaria
SET loc_cep = '98765432'
WHERE CNPJ = '98765432109876';
