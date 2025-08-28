# Copie e cole este código no dbdiagramio para gerar o modelo ER

```txt
Table evento{
  id uuid [pk]
  id_professor uuid [ref: > professor.id]
  data_hora_inicio datetime
  data_hora_fim datetime
  nome varchar(100)
  tipo enum
}

Table admin{
  id uuid [pk]
  email varchar(80)
  senha varchar(255)
}

Table agendamento{
  id_sala uuid [pk, ref: > sala.id]
  id_evento uuid [pk, ref: > evento.id]
  id uuid [pk]
}

Table sala{
  id uuid [pk]
  predio varchar(8)
  nome varchar(5)
  tipo enum
  capacidade int
}

Table professor{
  id uuid [pk]
  nome varchar(80)
  codigo char(9)
  email varchar(80)
  senha varchar(255)
}
```
