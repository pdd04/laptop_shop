package com.example.study.controller;

import com.example.study.domain.User;
import com.example.study.repository.UserRepository;
import com.example.study.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService, UserRepository userRepository) {
        this.userService = userService;
    }
    // injection
    // hàm tạo của controller, spring sẽ tự động thêm đối tượng service mà không cần tạo thủ công bằng new

    @RequestMapping("/")
    public String getHomePage(Model model) {
//      model.addAttribute("test", test);
        model.addAttribute("test2", "hello from UserController");
        return "hello";
    }

    @RequestMapping("/admin/user/create") // mac dinh la GET
    public String getAdminUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create/success", method = RequestMethod.POST) // mac dinh la GET
    public String createAdminUser(Model model, @ModelAttribute("newUser")  User user) {
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String getTableUsers(Model model) {
        List<User> arrUsers = this.userService.getAllUsers();
        model.addAttribute("users", arrUsers);
        return "admin/user/tableUser";
    }

    @RequestMapping("/admin/user/{userId}")
    public String getUserDetailPage(Model model, @PathVariable long userId) {
        User userDetail = this.userService.findbyId(userId);
        model.addAttribute("userId", userId);
        model.addAttribute("userDetail", userDetail);
        return "admin/user/userDetail";
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

