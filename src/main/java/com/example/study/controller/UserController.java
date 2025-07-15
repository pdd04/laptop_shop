package com.example.study.controller;

import com.example.study.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }
    // injection
    // hàm tạo của controller, spring sẽ tự động thêm đối tượng service mà không cần tạo thủ công bằng new

    @RequestMapping("/")
    public String getHomePage() {
        String test = this.userService.handleHello();
        return "hello";
    }
}

//@RestController
//public class UserController {
//
//    private UserService userService;
//
//    public UserController(UserService userService) {
//        this.userService = userService;
//    }
//    // injection
//    // hàm tạo của controller, spring sẽ tự động thêm đối tượng service mà không cần tạo thủ công bằng new
//
//    @GetMapping("")
//    public String getHomePage() {
//        return this.userService.handleHello();
//    }
//}

