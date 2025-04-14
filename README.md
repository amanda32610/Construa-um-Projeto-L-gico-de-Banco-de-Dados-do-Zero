# Construa-um-Projeto-L-gico-de-Banco-de-Dados-do-Zero
# 🔧 Sistema de Gestão de Ordens de Serviço - Oficina Mecânica

Este projeto apresenta o desenvolvimento de um banco de dados relacional para o gerenciamento de ordens de serviço (OS) em uma oficina mecânica. Inclui desde o modelo conceitual até a implementação em SQL, com consultas complexas para extração de informações relevantes.

## 📖 Contexto

Clientes levam veículos à oficina para consertos ou revisões. Os veículos são designados a uma equipe de mecânicos que identificam os serviços necessários, estimam os valores com base em peças e mão-de-obra, e emitem uma ordem de serviço. O cliente autoriza a execução e a equipe realiza os serviços necessários.

---

## 📌 Modelo Conceitual (ER)

As principais entidades e atributos do sistema:

- **Cliente**: CPF, nome, endereço
- **Veículo**: Placa, modelo, ano
- **Mecânico**: Código, nome, endereço, especialidade
- **Ordem de Serviço (OS)**: Número, data de emissão, valor total, status, data de conclusão
- **Serviço**: Descrição, valor (associado à mão-de-obra)
- **Mão-de-Obra**: Descrição, valor base
- **Peça**: Descrição, valor

---

## 🧩 Modelo Lógico

O modelo lógico foi implementado utilizando o modelo relacional, com as tabelas:

- `Cliente`
- `Veiculo`
- `Mecanico`
- `MaoDeObra`
- `Servico`
- `Peca`
- `OrdemServico`
- `Servico_Mecanico`
- `OrdemServico_Servico`
- `OrdemServico_Peca`

Relacionamentos são representados por tabelas associativas.

---

## 🛠️ Implementação

O script de criação do banco de dados e das consultas pode ser encontrado em:

📄 [`sistema_oficina.sql`](sistema_oficina.sql)

---

## 🔎 Consultas SQL

Inclui consultas com os seguintes tópicos:

- SELECT simples
- WHERE com filtros
- Atributos derivados com expressões
- ORDER BY para ordenações
- HAVING para filtros em grupos
- JOINs para junções entre tabelas

### Exemplos de perguntas respondidas:

- Quais clientes possuem mais de duas ordens de serviço?
- Quais ordens de serviço estão em andamento?
- Qual o valor estimado de desconto de 10% por OS?
- Quais serviços cada mecânico realizou?
- Qual a relação entre cliente, veículo e ordem de serviço?

---

## 🚀 Como usar

1. Execute o script `sistema_oficina.sql` no seu banco de dados MySQL/PostgreSQL.
2. Popule as tabelas com dados fictícios para testes.
3. Execute as queries para visualizar os resultados.

---

## 🧠 Autor

Desenvolvido como parte do desafio de projeto de modelagem e implementação de banco de dados relacional.

---

