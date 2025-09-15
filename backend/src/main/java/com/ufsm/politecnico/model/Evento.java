package com.ufsm.politecnico.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
import java.util.UUID;

import com.ufsm.politecnico.model.evento.Agendamento;

@Entity
@Table(name = "evento")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Evento {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "nome", nullable = false, length = 100)
    private String nome;

    // Relacionamento ManyToOne com Professor, carregamento preguiçoso
    //então as entidades relacionadas não irão carregar automaticamente
    //somente quando uma consulta especifica elas
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_professor", nullable = false)
    private Professor professor;

    @Column(name = "tipo", nullable = false)
    private String tipo;

    // Relacionamento com Agendamento 1:N
    @OneToMany(mappedBy = "evento", cascade = CascadeType.ALL)
    private List<Agendamento> agendamentos;
  
}