CREATE DATABASE IF NOT EXISTS db_sistema_mercado
    CHARACTER SET utf8mb4;
USE db_sistema_mercado;

CREATE TABLE tbl_email_cliente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(45) NOT NULL
);

INSERT INTO tbl_email_cliente
    (id, email)
VALUES
    (1, 'contato-278@example.com'),
    (2, 'contato-316@example.com'),
    (3, 'contato-354@example.com');

CREATE TABLE tbl_telefone_cliente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(15) NOT NULL
);

INSERT INTO tbl_telefone_cliente
    (id, numero)
VALUES
    (4, '1190000000000'),
    (5, '1160000000000'),
    (6, '1190000000000');

CREATE TABLE tbl_forma_de_pagamento (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dinheiro DECIMAL(10,2) NOT NULL,
    credito DECIMAL(10,2) NOT NULL,
    debito DECIMAL(10,2) NOT NULL,
    refeicao DECIMAL(10,2) NOT NULL,
    alimentacao DECIMAL(10,2) NOT NULL,
    pix DECIMAL(10,2) NOT NULL
);

INSERT INTO tbl_forma_de_pagamento
    (id, dinheiro, credito, debito, refeicao, alimentacao, pix)
VALUES
    (7, 0.0, 678.87, 0.0, 0.0, 0.0, 0.0),
    (8, 0.0, 0.0, 0.0, 0.0, 0.0, 349.59),
    (9, 100.0, 0.0, 293.21, 0.0, 0.0, 0.0);

CREATE TABLE tbl_fiscal (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    imposto DECIMAL(10,2) NOT NULL,
    nfe VARCHAR(45) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL
);

INSERT INTO tbl_fiscal
    (id, data_hora, imposto, nfe, valor_total)
VALUES
    (10, '2026-11-14 16:30:00', 11.07, 'NFE-TESTE-10', 689.94),
    (11, '2026-11-15 10:43:26', 6.25, 'NFE-TESTE-11', 355.84),
    (12, '2026-11-15 11:02:03', 4.11, 'NFE-TESTE-12', 297.32);

CREATE TABLE tbl_promocao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_promocao VARCHAR(45) NOT NULL,
    cupom VARCHAR(45) NOT NULL,
    desconto INT NOT NULL,
    descricao_promocao VARCHAR(45) NOT NULL
);

INSERT INTO tbl_promocao
    (id, nome_promocao, cupom, desconto, descricao_promocao)
VALUES
    (13, 'blackfriday', 'ABCD', 5, 'compre 3 pague 2'),
    (14, 'blackfriday', 'EFGH', 3, 'compre 2 pague 1'),
    (15, 'blackfriday', 'IJKL', 3, 'compre 2 pague 1');

CREATE TABLE tbl_estoque (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(45) NOT NULL,
    quantidade VARCHAR(45) NOT NULL,
    data DATE NOT NULL
);

INSERT INTO tbl_estoque
    (id, produto, quantidade, data)
VALUES
    (16, 'arroz', '50', '2026-11-15'),
    (17, 'feijao', '50', '2026-11-15'),
    (18, 'acucar', '50', '2026-11-15');

CREATE TABLE tbl_cancelamento (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    motivo VARCHAR(45) NOT NULL
);

INSERT INTO tbl_cancelamento
    (id, data, hora, motivo)
VALUES
    (19, '2026-11-15', '10:55:00', 'lancamento indevido'),
    (20, '2026-11-15', '11:03:04', 'preco incorreto'),
    (21, '2026-11-15', '11:38:27', 'lancamento indevido');

CREATE TABLE tbl_email_mercado (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_mercado VARCHAR(45) NOT NULL
);

INSERT INTO tbl_email_mercado
    (id, email_mercado)
VALUES
    (22, 'contato-3110@example.com');

CREATE TABLE tbl_telefone_mercado (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    telefone_mercado VARCHAR(45) NOT NULL
);

INSERT INTO tbl_telefone_mercado
    (id, telefone_mercado)
VALUES
    (25, '1190000000000');

CREATE TABLE tbl_endereco_mercado (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(45) NOT NULL,
    cep VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL
);

INSERT INTO tbl_endereco_mercado
    (id, logradouro, cep, bairro, cidade)
VALUES
    (26, 'Rua do Mercado, 123', '01234-180', 'Vila Mercado', 'São Paulo');

CREATE TABLE tbl_mercado (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_endereco INT NOT NULL,
    id_email INT NOT NULL,
    id_telefone INT NOT NULL,
    razao_social VARCHAR(45) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    cnpj VARCHAR(45) NOT NULL,
    ie VARCHAR(45) NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES tbl_endereco_mercado(id),
    FOREIGN KEY (id_email) REFERENCES tbl_email_mercado(id),
    FOREIGN KEY (id_telefone) REFERENCES tbl_telefone_mercado(id)
);

INSERT INTO tbl_mercado
    (id, id_endereco, id_email, id_telefone, razao_social, nome, cnpj, ie)
VALUES
    (27, 26, 22, 25, 'Mercado Exemplo Ltda.', 'Mercado Exemplo',
     '00000000000000', '123456789');

CREATE TABLE tbl_compra (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_mercado INT NOT NULL,
    id_pagamento INT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    numero_pedido VARCHAR(45) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(45) NOT NULL,
    FOREIGN KEY (id_mercado) REFERENCES tbl_mercado(id),
    FOREIGN KEY (id_pagamento) REFERENCES tbl_forma_de_pagamento(id)
);

INSERT INTO tbl_compra
    (id, id_mercado, id_pagamento, data, hora, numero_pedido,
     valor_total, status)
VALUES
    (29, 27, 7, '2026-11-15', '11:15:00', 'PED-001', 678.87, 'Pago');

CREATE TABLE tbl_produto (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    valor_compra DECIMAL(10,2) NOT NULL,
    estoque VARCHAR(45) NOT NULL,
    codigo_barras VARCHAR(45) NOT NULL,
    tamanho VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    quantidade VARCHAR(45) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES tbl_compra(id)
);

INSERT INTO tbl_produto
    (id, id_compra, nome, descricao, valor_venda, valor_compra, estoque,
     codigo_barras, tamanho, marca, quantidade)
VALUES
    (28, 29, 'Arroz', 'Arroz tipo 1', 29.9, 22.5, '50', '7891234567890',
     '5 kg', 'Camil', '10');

CREATE TABLE tbl_cliente (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_telefone INT NOT NULL,
    id_email INT NOT NULL,
    id_produto INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(45) NOT NULL,
    FOREIGN KEY (id_telefone) REFERENCES tbl_telefone_cliente(id),
    FOREIGN KEY (id_email) REFERENCES tbl_email_cliente(id),
    FOREIGN KEY (id_produto) REFERENCES tbl_produto(id)
);

INSERT INTO tbl_cliente
    (id, id_telefone, id_email, id_produto, nome, cpf)
VALUES
    (30, 4, 1, 28, 'Cliente Teste', '00000000000');

CREATE TABLE tbl_colaborador (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pagamento INT NOT NULL,
    id_estoque INT NOT NULL,
    id_promocao INT NOT NULL,
    id_operacao_fiscal INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    cpf VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL,
    data_contratacao DATE NOT NULL,
    FOREIGN KEY (id_pagamento) REFERENCES tbl_forma_de_pagamento(id),
    FOREIGN KEY (id_estoque) REFERENCES tbl_estoque(id),
    FOREIGN KEY (id_promocao) REFERENCES tbl_promocao(id),
    FOREIGN KEY (id_operacao_fiscal) REFERENCES tbl_fiscal(id)
);

INSERT INTO tbl_colaborador
    (id_pagamento, id_estoque, id_promocao, id_operacao_fiscal, nome,
     sobrenome, cpf, cargo, data_contratacao)
VALUES
    (7, 16, 13, 10, 'Ana', 'Silva', '00000000000', 'Operadora de Caixa',
     '2026-11-15');

SELECT c.nome AS cliente, p.nome AS produto, co.numero_pedido,
       m.nome AS mercado, co.valor_total, pg.credito AS valor_no_credito
FROM tbl_cliente AS c
JOIN tbl_produto AS p ON p.id = c.id_produto
JOIN tbl_compra AS co ON co.id = p.id_compra
JOIN tbl_mercado AS m ON m.id = co.id_mercado
JOIN tbl_forma_de_pagamento AS pg ON pg.id = co.id_pagamento
WHERE c.id = 30;
