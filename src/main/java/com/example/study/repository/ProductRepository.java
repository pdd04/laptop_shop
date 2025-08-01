package com.example.study.repository;

import com.example.study.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    public Product save(Product newProduct);
    public List<Product> findAll();
    public Product findById(long id);
    public void deleteById(long id);
}
