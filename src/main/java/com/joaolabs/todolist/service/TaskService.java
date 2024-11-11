package com.joaolabs.todolist.service;

import com.joaolabs.todolist.domain.entity.Task;
import com.joaolabs.todolist.domain.repository.TaskRepository;
import com.joaolabs.todolist.dto.TaskDTO;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TaskService {

    @Autowired
    TaskRepository taskRepository;

    public Task find(Long id) {
        Optional<Task> user = taskRepository.findById(id);
        return user.orElseThrow(() -> new RuntimeException("Task not found"));
    }

    public List<Task> findAll() {
        return taskRepository.findAll();
    }

    @Transactional
    public void deleteById(Long taskId) {
        taskRepository.deleteById(taskId);
    }

    @Transactional
    public void changeTaskStatus(Long taskId) {
        boolean newStatus = !find(taskId).isFinished();
        taskRepository.updateTaskStatus(taskId, newStatus);
    }

    @Transactional
    public void insert(String taskDescription) {
        Task task = new Task(null, taskDescription, false);
        taskRepository.save(task);
    }

    public Task fromDTO(TaskDTO taskDTO) {
        return new Task(taskDTO.getId(), taskDTO.getDescription(), taskDTO.isFinished());
    }

    public TaskDTO toDTO(Task task) {
        return TaskDTO.builder()
                .id(task.getId())
                .description(task.getDescription())
                .finished(task.isFinished())
                .build();
    }

    public List<TaskDTO> toDTO(List<Task> tasks) {
        return tasks.stream().map(this::toDTO).collect(Collectors.toList());
    }
}
