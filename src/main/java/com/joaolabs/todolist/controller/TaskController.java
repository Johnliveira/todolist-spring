package com.joaolabs.todolist.controller;

import com.joaolabs.todolist.dto.TaskDTO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TaskController {

    @GetMapping("/task")
    public TaskDTO getTask() {
        TaskDTO taskDTO = new TaskDTO();
        taskDTO.setId(1L);
        taskDTO.setDescription("Test description");

        return taskDTO;
    }

    public static void main(String[] args) {
        String password = "SK4T3_b04rd";
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

        System.out.println(password);
        System.out.println(hashed);
        System.out.println(BCrypt.checkpw(password, hashed));
    }

}
