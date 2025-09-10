package com.ufsm.politecnico.model.sala;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface SalaRepository extends JpaRepository<Sala, UUID> {
}
