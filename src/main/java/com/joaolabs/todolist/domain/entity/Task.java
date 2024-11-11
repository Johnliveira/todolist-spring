package com.joaolabs.todolist.domain.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Column(nullable = false)
    public String description;

    @Column(nullable = false)
    public boolean finished;

    public Task() {
    }

    public Task(Long id, String description, boolean finished) {
        this.id = id;
        this.description = description;
        this.finished = finished;
    }
}
