package com.ufsm.politecnico.model.professor;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "professor")

public class Professor{
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    
}