package com.joaolabs.todolist.dto;

import lombok.Data;

@Data
public class TaskDTO {

    public Long id;
    public String description;
    public boolean finished;

}
