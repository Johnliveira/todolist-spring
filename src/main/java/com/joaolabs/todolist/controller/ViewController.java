package com.joaolabs.todolist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("/")
    public String index() {
        return "login";
    }

    @GetMapping("/hello")
    public String helloWorld() {
        return "hello_world";
    }
}
