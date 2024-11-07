package com.joaolabs.todolist.service;

import com.joaolabs.todolist.domain.entity.User;
import com.joaolabs.todolist.domain.repository.UserRepository;
import com.joaolabs.todolist.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public User find(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElseThrow(() -> new RuntimeException("User not found"));
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User insert(User user) {
        user.setId(null);
        return userRepository.save(user);
    }

    public User fromDTO(UserDTO userDTO) {
        return new User(userDTO.getId(), userDTO.getEmail(), userDTO.getUsername(), userDTO.getPassword());
    }
}
