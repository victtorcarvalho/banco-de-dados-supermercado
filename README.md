# Sistema Mercado

Projeto acadêmico de banco de dados relacional para o Supermercado Boa Compra, um cenário fictício. O trabalho parte de 15 perguntas de levantamento de requisitos e passa pelos modelos conceitual, lógico e físico.

## O que o projeto demonstra

- Modelagem de dados com brModelo e MySQL Workbench.
- Script MySQL com 15 tabelas, chaves primárias e estrangeiras e dados de teste.
- Consulta com `JOIN` que reúne cliente, produto, pedido, supermercado e pagamento.

## Como executar

1. Abra [`sql/supermercado.sql`](sql/supermercado.sql) no MySQL Workbench.
2. Use uma conexão de teste em que o esquema `db_sistema_mercado` ainda não exista.
3. Execute o script completo. A consulta final deve retornar o pedido `PED-001`, com Arroz e pagamento de R$ 678,87 no crédito.

## Escopo da implementação

O modelo físico demonstra os cadastros e a consulta de teste. Múltiplos itens por venda, vínculo de cancelamentos, baixa e estorno de estoque e permissões por usuário fazem parte dos requisitos para evoluções do projeto.
