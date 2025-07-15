package com.example.study.service;

import com.example.study.domain.User;
import com.example.study.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "hello from UserService";
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }
}
