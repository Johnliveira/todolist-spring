package com.joaolabs.todolist.dto;

import lombok.Data;

@Data
public class UserDTO {

    private Long id;
    private String email;
    private String username;
    private String password;
}
