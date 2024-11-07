package com.joaolabs.todolist.controller;

import com.joaolabs.todolist.domain.entity.User;
import com.joaolabs.todolist.dto.UserDTO;
import com.joaolabs.todolist.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ViewController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public String index() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/create_user")
    public String createUser(@ModelAttribute UserDTO userDTO) {
        System.out.println(userDTO.toString());

        User user = userService.fromDTO(userDTO);
        userService.insert(user);
        return "login";
    }

    @PostMapping("validate_login")
    public String validateLogin(@ModelAttribute UserDTO userDTO) {
        User user = userService.findByEmail(userDTO.getEmail());
        System.out.println(user.toString());
        return "login";
    }
}
