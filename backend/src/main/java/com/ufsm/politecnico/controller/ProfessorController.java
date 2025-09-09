package com.ufsm.politecnico.controller;


import com.ufsm.politecnico.model.professor.Professor;
import com.ufsm.politecnico.service.ProfessorService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping({"/professor"})
public class ProfessorController {

    private final ProfessorService professorService;
    public ProfessorController(ProfessorService professorService) {this.professorService = professorService;}

    @GetMapping("/listar")
    public List<Professor> listar() {
        return professorService.findAll();
    }

    @GetMapping("{id}")
    public Optional<Professor> buscar(@PathVariable UUID id) {
        return professorService.findById(id);
    }

    @PostMapping
    public void inserir(@RequestBody Professor professor) {
        professorService.insert(professor);
    }

    @DeleteMapping("{id}")
    public void remover(@PathVariable UUID id) {
        professorService.delete(id);
    }

    @PutMapping
    public Professor atualizar(@RequestBody Professor professor) {
        return professorService.atualizar(professor);
    }

}
