package com.example.study.controller.admin;

import com.example.study.domain.Product;
import com.example.study.service.ProductService;
import com.example.study.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
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
    public String getProduct(Model model) {
        List<Product> arrProducts = this.productService.findAll();
        model.addAttribute("products", arrProducts);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute("newProduct")@Valid Product product,
                                    BindingResult newProductBindingResult,
                                @RequestParam("imageFile") MultipartFile imageFile) {
        //validate
        if(newProductBindingResult.hasErrors()){
            return "admin/product/create";
        }

        String imageName = this.uploadService.handleSaveUploadFile(imageFile,"product");
        product.setImage(imageName);
        this.productService.handelSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{productId}")
    public  String getProductDetailPage(Model model, @PathVariable long productId) {
        Product productDetail = this.productService.findById(productId);
        model.addAttribute("productDetail", productDetail);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/delete/{productId}")
    public String getDeleteProductPage(Model model, @PathVariable long productId) {
        model.addAttribute("deleteProduct",new Product());
        model.addAttribute("productId",productId);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(Model model, @ModelAttribute("deleteProduct") Product deleteProduct) {
        this.productService.deleteById(deleteProduct.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{productId}")
    public String getUpdateProductPage(Model model, @PathVariable long productId) {
        Product productDetail = this.productService.findById(productId);
        model.addAttribute("productDetail", productDetail);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("productDetail")@Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("imageFileUpdate") MultipartFile imageFile) {

        //validate
        if(newProductBindingResult.hasErrors()){
            return "admin/product/update";
        }
        Product newProduct = this.productService.findById(product.getId());
        if(newProduct != null){
            if(!imageFile.isEmpty()){
                String imageName = this.uploadService.handleSaveUploadFile(imageFile,"product");
                newProduct.setImage(imageName);
            }
            newProduct.setName(product.getName());
            newProduct.setPrice(product.getPrice());
            newProduct.setDetailDesc(product.getDetailDesc());
            newProduct.setShortDesc(product.getShortDesc());
            newProduct.setPrice(product.getPrice());
            newProduct.setQuantity(product.getQuantity());
            newProduct.setTarget(product.getTarget());
            newProduct.setFactory(product.getFactory());
            this.productService.handelSaveProduct(newProduct);
        }
        return "redirect:/admin/product";
    }

}
