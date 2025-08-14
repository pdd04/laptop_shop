package com.example.study.repository;

import com.example.study.domain.Order;
import com.example.study.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    public Order save(Order order);
    public List<Order> findAll();
    public Order findById(long id);
    public void deleteById(long id);
    public List<Order> findByUser(User user);
}
