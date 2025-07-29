package com.example.study.service;

import com.example.study.domain.Product;
import com.example.study.repository.ProductRepository;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handelSaveProduct(Product newProduct) {
        return this.productRepository.save(newProduct);
    }
}
