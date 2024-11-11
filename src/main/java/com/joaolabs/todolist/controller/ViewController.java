package com.joaolabs.todolist.controller;

import com.joaolabs.todolist.domain.entity.User;
import com.joaolabs.todolist.dto.UserDTO;
import com.joaolabs.todolist.service.TaskService;
import com.joaolabs.todolist.service.UserService;
import com.joaolabs.todolist.util.ControllerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ViewController {

    @Autowired
    UserService userService;

    @Autowired
    TaskService taskService;

    @GetMapping("/")
    public String index() {
        return ControllerUtils.REDIRECT_MAIN_SITE;
    }

    @GetMapping("/register")
    public String register() {
        return ControllerUtils.REGISTER_JSP_SITE;
    }

    @PostMapping("/createUser")
    public String createUser(@ModelAttribute UserDTO userDTO) {
        userService.insert(userService.fromDTO(userDTO));
        return ControllerUtils.LOGIN_JSP_SITE;
    }

    @PostMapping("/validateLogin")
    public String validateLogin(@ModelAttribute UserDTO userDTO) {
        User user = userService.findByEmail(userDTO.getEmail());
        // TODO validar login do usuário
        return ControllerUtils.LOGIN_JSP_SITE;
    }

    @ModelAttribute
    @GetMapping("/site")
    public String site(Model model) {
        model.addAttribute("tasks", taskService.toDTO(taskService.findAll()));
        return ControllerUtils.MAIN_JSP_SITE;
    }

    @PostMapping("/createTask")
    public String createTask(@RequestParam("taskDescription") String taskDescription) {
        taskService.insert(taskDescription);
        return ControllerUtils.REDIRECT_MAIN_SITE;
    }

    @PostMapping("/deleteTask")
    public String deleteTask(@RequestParam("taskId") Long taskId) {
        taskService.deleteById(taskId);
        return ControllerUtils.REDIRECT_MAIN_SITE;
    }

    @PostMapping("/updateTask")
    public String finishTask(@RequestParam("taskId") Long taskId) {
        taskService.changeTaskStatus(taskId);
        return ControllerUtils.REDIRECT_MAIN_SITE;
    }

}
