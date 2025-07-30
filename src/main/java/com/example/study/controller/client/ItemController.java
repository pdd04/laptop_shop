package com.example.study.controller.client;

import com.example.study.domain.Product;
import com.example.study.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id){
        Product product = this.productService.findById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }
}
