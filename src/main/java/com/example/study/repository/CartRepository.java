package com.example.study.repository;

import com.example.study.domain.Cart;
import com.example.study.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {
    Cart findByUser(User user);
    Cart save(Cart cart);
}
