CREATE TABLE admin(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE professor(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    matricula CHAR(9) UNIQUE NOT NULL
);

--tabela evento possui uma restrição check para validar o tipo de valor aceitavel para evento

CREATE TABLE evento(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL,
    id_professor UUID NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professor(id) ON DELETE CASCADE,
    tipo VARCHAR(30) NOT NULL CHECK (tipo IN(
        'disciplina', 'palestra', 'seminário', 'reunião', 'projeto'
    ))
);

--tabela sala possui uma restrição check para validar o tipo de valor aceitável para sala

CREATE TABLE sala(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome CHAR(5) NOT NULL,
    predio CHAR(8) NOT NULL,
    capacidade int NOT NULL,
    tipo VARCHAR(30) NOT NULL CHECK (tipo IN(
        'laboratório', 'aula', 'auditório', 'oficina', 'outro'
    ))
);

--tabela de agendamento possui uma restrição check para validar a hora
-- timestam no formato 'YYYY-MM-DD HH:MI:SS'
CREATE TABLE agendamento(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_sala UUID NOT NULL REFERENCES sala(id) ON DELETE CASCADE,
    id_evento UUID NOT NULL REFERENCES evento(id) ON DELETE CASCADE,
    data_hora_inicio TIMESTAMP,
    data_hora_fim TIMESTAMP,
    CONSTRAINT check_horario CHECK (data_hora_inicio < data_hora_fim),
    CONSTRAINT unique_agenda UNIQUE(id_sala, data_hora_inicio, data_hora_fim)
);

-- Criar um índice GIST para otimizar consultas de intervalo de tempo
-- O GIST agora usa a função tsrange, compatível com colunas TIMESTAMP
CREATE INDEX idx_periodo ON agendamento USING gist (tsrange(data_hora_inicio, data_hora_fim));

