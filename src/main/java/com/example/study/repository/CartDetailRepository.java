package com.example.study.repository;

import com.example.study.domain.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail,Long> {
    public CartDetail save(CartDetail newCartDetail);
}
