package com.joaolabs.todolist.domain.repository;

import com.joaolabs.todolist.domain.entity.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TaskRepository extends JpaRepository<Task, Long> {

    @Modifying
    @Query("UPDATE Task t SET t.finished = :taskIsFinished WHERE t.id = :taskId")
    void updateTaskStatus(@Param("taskId") Long taskId, @Param("taskIsFinished") boolean taskIsFinished);
}
