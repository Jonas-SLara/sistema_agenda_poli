package com.ufsm.politecnico.model.sala;

import java.util.List;
import java.util.UUID;

import com.ufsm.politecnico.model.agendamento.Agendamento;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "sala")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Sala {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "tipo", nullable = false)
    private String tipo;

    @Column(name = "predio", nullable = false)
    private String predio;

    @Column(name = "capacidade", nullable = false)
    private int capacidade;

    //relacionamento com agendamento 1:N
    @OneToMany(mappedBy = "sala", cascade = CascadeType.ALL)
    private List<Agendamento> agendamentos;
}
