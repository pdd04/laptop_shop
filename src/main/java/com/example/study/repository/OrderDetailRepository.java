package com.example.study.repository;

import com.example.study.domain.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    public OrderDetail save(OrderDetail orderDetail);
}
