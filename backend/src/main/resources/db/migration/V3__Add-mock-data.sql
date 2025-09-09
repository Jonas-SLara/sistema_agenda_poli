-- Inserir admins
INSERT INTO admin (email, senha) VALUES
                                     ('admin1@universidade.edu', 'senha123'),
                                     ('admin2@universidade.edu', 'senha123'),
                                     ('admin3@universidade.edu', 'senha123');

-- Inserir professores
INSERT INTO professor (email, senha, nome, matricula) VALUES
                                                          ('joao.silva@universidade.edu', 'senha123', 'João Silva', '202500001'),
                                                          ('maria.oliveira@universidade.edu', 'senha123', 'Maria Oliveira', '202500002'),
                                                          ('carlos.souza@universidade.edu', 'senha123', 'Carlos Souza', '202500003'),
                                                          ('ana.lima@universidade.edu', 'senha123', 'Ana Lima', '202500004'),
                                                          ('pedro.almeida@universidade.edu', 'senha123', 'Pedro Almeida', '202500005');

-- Inserir salas
INSERT INTO sala (nome, predio, capacidade, tipo) VALUES
                                                      ('A101', 'Prédio A', 30, 'aula'),
                                                      ('B202', 'Prédio B', 50, 'laboratório'),
                                                      ('C303', 'Prédio C', 100, 'auditório'),
                                                      ('D404', 'Prédio D', 25, 'oficina'),
                                                      ('E505', 'Prédio E', 40, 'aula'),
                                                      ('F606', 'Prédio F', 60, 'laboratório');

-- Inserir eventos
INSERT INTO evento (nome, id_professor, tipo) VALUES
                                                  ('Matemática Avançada', (SELECT id FROM professor WHERE nome='João Silva'), 'disciplina'),
                                                  ('Palestra sobre IA', (SELECT id FROM professor WHERE nome='Maria Oliveira'), 'palestra'),
                                                  ('Seminário de Física', (SELECT id FROM professor WHERE nome='Carlos Souza'), 'seminário'),
                                                  ('Reunião de Coordenação', (SELECT id FROM professor WHERE nome='Ana Lima'), 'reunião'),
                                                  ('Projeto de Robótica', (SELECT id FROM professor WHERE nome='Pedro Almeida'), 'projeto'),
                                                  ('Laboratório de Química', (SELECT id FROM professor WHERE nome='Carlos Souza'), 'disciplina'),
                                                  ('Oficina de Teatro', (SELECT id FROM professor WHERE nome='Ana Lima'), 'oficina');

-- Inserir agendamentos
INSERT INTO agendamento (id_sala, id_evento, data_hora_inicio, data_hora_fim) VALUES
                                                                                  ((SELECT id FROM sala WHERE nome='A101'), (SELECT id FROM evento WHERE nome='Matemática Avançada'), '2025-09-10 08:00:00', '2025-09-10 10:00:00'),
                                                                                  ((SELECT id FROM sala WHERE nome='B202'), (SELECT id FROM evento WHERE nome='Laboratório de Química'), '2025-09-10 09:00:00', '2025-09-10 12:00:00'),
                                                                                  ((SELECT id FROM sala WHERE nome='C303'), (SELECT id FROM evento WHERE nome='Palestra sobre IA'), '2025-09-11 14:00:00', '2025-09-11 16:00:00'),
                                                                                  ((SELECT id FROM sala WHERE nome='D404'), (SELECT id FROM evento WHERE nome='Oficina de Teatro'), '2025-09-12 10:00:00', '2025-09-12 12:00:00'),
                                                                                  ((SELECT id FROM sala WHERE nome='E505'), (SELECT id FROM evento WHERE nome='Seminário de Física'), '2025-09-13 08:30:00', '2025-09-13 10:30:00'),
                                                                                  ((SELECT id FROM sala WHERE nome='F606'), (SELECT id FROM evento WHERE nome='Projeto de Robótica'), '2025-09-14 13:00:00', '2025-09-14 15:00:00');

-- Inserir mais agendamentos aleatórios
DO $$
    DECLARE
        s_id UUID;
        e_id UUID;
        d_inicio TIMESTAMP;
        d_fim TIMESTAMP;
    BEGIN
        FOR i IN 1..20 LOOP
                SELECT id INTO s_id FROM sala ORDER BY random() LIMIT 1;
                SELECT id INTO e_id FROM evento ORDER BY random() LIMIT 1;
                d_inicio := timestamp '2025-09-10 08:00:00' + (random()*1000000)::int * interval '1 second';
                d_fim := d_inicio + (1 + random()*3)::int * interval '1 hour';
                INSERT INTO agendamento (id_sala, id_evento, data_hora_inicio, data_hora_fim)
                VALUES (s_id, e_id, d_inicio, d_fim);
            END LOOP;
    END $$;
