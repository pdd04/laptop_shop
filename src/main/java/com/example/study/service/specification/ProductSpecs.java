package com.example.study.service.specification;

import com.example.study.domain.Product;
import com.example.study.domain.Product_;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public class ProductSpecs {

    static public Specification<Product> emptySpec() {
        return (root, query, cb) -> cb.conjunction();
    }

    static public Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder)
                ->  criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    static public Specification<Product> minPrice(Double price) {
        return (root, query, criteriaBuilder)
                ->  criteriaBuilder.ge(root.get(Product_.PRICE), price);
    }

    static public Specification<Product> maxPrice(Double price) {
        return (root, query, criteriaBuilder)
                ->  criteriaBuilder.le(root.get(Product_.PRICE), price);
    }

    static public Specification<Product> factoryLike(String factory) {
        return (root, query, criteriaBuilder)
                ->  criteriaBuilder.equal(root.get(Product_.FACTORY),factory);
    }

    static public Specification<Product> listFactoryLike(List<String> factory) {
        return (root, query, criteriaBuilder)
                ->  criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }

    static public Specification<Product> listTargetLike(List<String> target) {
        return (root, query, criteriaBuilder)
                ->  criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

}
