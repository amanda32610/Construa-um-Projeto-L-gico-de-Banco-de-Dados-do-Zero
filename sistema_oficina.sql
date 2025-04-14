
-- Criação das Tabelas

CREATE TABLE Cliente (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Veiculo (
    placa CHAR(7) PRIMARY KEY,
    modelo VARCHAR(50),
    ano INT,
    cpf_cliente CHAR(11),
    FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);

CREATE TABLE Mecanico (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    especialidade VARCHAR(50)
);

CREATE TABLE MaoDeObra (
    id_mao_de_obra INT PRIMARY KEY,
    descricao VARCHAR(100),
    valor_base DECIMAL(10,2)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10,2),
    id_mao_de_obra INT,
    FOREIGN KEY (id_mao_de_obra) REFERENCES MaoDeObra(id_mao_de_obra)
);

CREATE TABLE Peca (
    id_peca INT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10,2)
);

CREATE TABLE OrdemServico (
    numero_os INT PRIMARY KEY,
    data_emissao DATE,
    valor_total DECIMAL(10,2),
    status VARCHAR(20),
    data_conclusao DATE,
    placa_veiculo CHAR(7),
    FOREIGN KEY (placa_veiculo) REFERENCES Veiculo(placa)
);

CREATE TABLE Servico_Mecanico (
    id_servico INT,
    codigo_mecanico INT,
    PRIMARY KEY (id_servico, codigo_mecanico),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico),
    FOREIGN KEY (codigo_mecanico) REFERENCES Mecanico(codigo)
);

CREATE TABLE OrdemServico_Servico (
    numero_os INT,
    id_servico INT,
    PRIMARY KEY (numero_os, id_servico),
    FOREIGN KEY (numero_os) REFERENCES OrdemServico(numero_os),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE OrdemServico_Peca (
    numero_os INT,
    id_peca INT,
    quantidade INT,
    PRIMARY KEY (numero_os, id_peca),
    FOREIGN KEY (numero_os) REFERENCES OrdemServico(numero_os),
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);

-- Consultas SQL

-- 1. Recuperação simples
SELECT nome, endereco FROM Cliente;

-- 2. Filtro com WHERE
SELECT * FROM OrdemServico WHERE status = 'Em andamento';

-- 3. Expressão com atributo derivado
SELECT 
    numero_os,
    valor_total,
    valor_total * 0.10 AS valor_desconto
FROM OrdemServico;

-- 4. Ordenação dos dados
SELECT * FROM OrdemServico ORDER BY data_emissao DESC;

-- 5. Filtro com HAVING
SELECT 
    cpf_cliente,
    COUNT(*) AS total_os
FROM Veiculo v
JOIN OrdemServico os ON v.placa = os.placa_veiculo
GROUP BY cpf_cliente
HAVING COUNT(*) > 2;

-- 6. Junção entre tabelas
SELECT 
    os.numero_os,
    c.nome AS cliente,
    v.modelo,
    s.descricao AS servico,
    m.nome AS mecanico
FROM OrdemServico os
JOIN Veiculo v ON os.placa_veiculo = v.placa
JOIN Cliente c ON v.cpf_cliente = c.cpf
JOIN OrdemServico_Servico oss ON os.numero_os = oss.numero_os
JOIN Servico s ON oss.id_servico = s.id_servico
JOIN Servico_Mecanico sm ON s.id_servico = sm.id_servico
JOIN Mecanico m ON sm.codigo_mecanico = m.codigo;
