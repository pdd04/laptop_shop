package com.example.study.controller.admin;

import com.example.study.domain.Product;
import com.example.study.service.ProductService;
import com.example.study.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService,  UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProduct() {
        return "admin/product/show";

    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct")@Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("imageFile") MultipartFile imageFile) {

        List<FieldError> fieldErrors = newProductBindingResult.getFieldErrors();
        for(FieldError fieldError : fieldErrors){
            System.out.println(">>>>" + fieldError.getField() + "-" +  fieldError.getDefaultMessage());
        }

        //validate
        if(newProductBindingResult.hasErrors()){
            return "admin/product/create";
        }

        String imageName = this.uploadService.handleSaveUploadFile(imageFile,"product");
        product.setImage(imageName);
        this.productService.handelSaveProduct(product);
        return "redirect:/admin/product";
    }
}
