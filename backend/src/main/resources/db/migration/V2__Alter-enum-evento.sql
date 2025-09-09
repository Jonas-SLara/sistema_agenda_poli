--adicionar o tipo Oficina

ALTER TABLE evento DROP CONSTRAINT evento_tipo_check;

ALTER TABLE evento
    ADD CONSTRAINT evento_tipo_check
        CHECK (tipo IN ('disciplina', 'palestra', 'seminário', 'reunião', 'projeto', 'oficina'));