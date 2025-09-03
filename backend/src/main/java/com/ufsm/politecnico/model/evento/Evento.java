package com.ufsm.politecnico.model.evento;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "evento")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Evento {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "nome", nullable = false, length = 100)
    private String nome;

    // Relacionamento ManyToOne com Professor
    
    @Column(name = "tipo", nullable = false)
    private String tipo;

    // Relacionamento com Agendamento
    
    @Override
    public String toString(){
        return new String(this.getNome() + 
        this.getTipo() + this.getId());
    }
}