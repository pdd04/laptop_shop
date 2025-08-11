package com.example.study.repository;

import com.example.study.domain.Cart;
import com.example.study.domain.CartDetail;
import com.example.study.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail,Long> {
    public CartDetail save(CartDetail newCartDetail);
    CartDetail findByCartAndProduct(Cart cart, Product product);
    CartDetail deleteById(long id);
    CartDetail deleteByCartAndProduct(Cart cart, Product product);
    CartDetail findById(long id);
}
