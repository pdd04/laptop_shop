package com.example.study.domain.dto;

import com.example.study.domain.Product;

import java.util.List;
import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> Page;
    private Optional<List<String>> Factory;
    private Optional<List<String>> target;
    private Optional<List<String>> price;
    private Optional<String> sort;

    public Optional<String> getPage() {
        return Page;
    }

    public void setPage(Optional<String> page) {
        Page = page;
    }

    public Optional<List<String>> getFactory() {
        return Factory;
    }

    public void setFactory(Optional<List<String>> factory) {
        Factory = factory;
    }

    public Optional<List<String>> getTarget() {
        return target;
    }

    public void setTarget(Optional<List<String>> target) {
        this.target = target;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }
}
