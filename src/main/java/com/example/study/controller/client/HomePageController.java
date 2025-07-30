package com.example.study.controller.client;

import com.example.study.domain.Product;
import com.example.study.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomePageController {

    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
        return "/client/homepage/show";
    }
}
