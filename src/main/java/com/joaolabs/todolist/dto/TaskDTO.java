package com.joaolabs.todolist.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TaskDTO {

    public Long id;
    public String description;
    public boolean finished;

}
