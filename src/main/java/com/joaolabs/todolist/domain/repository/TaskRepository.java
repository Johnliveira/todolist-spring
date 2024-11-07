package com.joaolabs.todolist.domain.repository;

import com.joaolabs.todolist.domain.entity.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Long> {
}
