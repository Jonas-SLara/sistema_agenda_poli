package com.ufsm.politecnico.model.sala;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "sala")
public class Sala {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
}
