package com.example.study.controller.admin;

import com.example.study.domain.User;
import com.example.study.service.UploadService;
import com.example.study.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;



import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,  PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }
    // injection
    // hàm tạo của controller, spring sẽ tự động thêm đối tượng service mà không cần tạo thủ công bằng new

    @RequestMapping("/")
    public String getHomePage(Model model) {
//      model.addAttribute("test", test);
        model.addAttribute("test2", "hello from UserController");
        return "hello";
    }

    @GetMapping("/admin/user/create")
    public String getAdminUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createAdminUser(Model model,
                                  @ModelAttribute("newUser")@Valid User user,
                                  BindingResult bindingResult,
                                  @RequestParam("avatarFile") MultipartFile avatarFile
                                  ) {
        //validate
        List<FieldError> fieldErrors = bindingResult.getFieldErrors();
        for(FieldError fieldError : fieldErrors){
            System.out.println(">>>>" + fieldError.getObjectName() + "-" +  fieldError.getDefaultMessage());
        }

        String avatarName = this.uploadService.handleSaveUploadFile(avatarFile,"avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setAvatar(avatarName);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String getTableUsers(Model model) {
        List<User> arrUsers = this.userService.getAllUsers();
        model.addAttribute("users", arrUsers);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{userId}")
    public String getUserDetailPage(Model model, @PathVariable long userId) {
        User userDetail = this.userService.findbyId(userId);
        model.addAttribute("userId", userId);
        model.addAttribute("userDetail", userDetail);
        return "admin/user/detail";
    }
    @RequestMapping("/admin/user/update/{userId}")
    public String getUpdateUserPage(Model model, @PathVariable long userId){
        User userDetail = this.userService.findbyId(userId);
        model.addAttribute("userId", userId);
        model.addAttribute("newUser", userDetail);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser")  User user, @RequestParam("avatarFileUpdate") MultipartFile avatarFile) {
        User userDetail = this.userService.findbyId(user.getId());
        String avatarName = this.uploadService.handleSaveUploadFile(avatarFile,"avatar");
        if (userDetail != null) {
            userDetail.setAddress(user.getAddress());
            userDetail.setPhone(user.getPhone());
            userDetail.setFullname(user.getFullname());
            userDetail.setRole(this.userService.getRoleByName(user.getRole().getName()));
            userDetail.setAvatar(avatarName);
            this.userService.handleSaveUser(userDetail);
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete/{userId}")
    public String getDeleteUserPage(Model model, @PathVariable long userId) {
        model.addAttribute("userId", userId);
        model.addAttribute("userdelete",new User());
        return "/admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("userdelete") User user) {
        this.userService.deleteUsers(user.getId());
        return "redirect:/admin/user";
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

