package com.ufsm.politecnico.service;

import com.ufsm.politecnico.model.professor.Professor;
import com.ufsm.politecnico.model.professor.ProfessorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ProfessorService {
    private final ProfessorRepository professorRepository;
    public ProfessorService(ProfessorRepository professorRepository) {this.professorRepository = professorRepository;}

    public List<Professor> findAll() {
        return professorRepository.findAll();
    }

    //Isso aqui tá certo?
    public Optional<Professor> findById(UUID uuid) {
        return professorRepository.findById(uuid);
    }

    public void insert(Professor professor) {
        professorRepository.save(professor);
    }

    public void delete(UUID uuid) {
        professorRepository.deleteById(uuid);
    }

    public Professor atualizar(Professor professor) {

        return professorRepository.save(professor);
    }
}
