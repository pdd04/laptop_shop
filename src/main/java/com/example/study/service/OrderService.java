package com.example.study.service;

import com.example.study.domain.Order;
import com.example.study.domain.OrderDetail;
import com.example.study.domain.User;
import com.example.study.repository.OrderDetailRepository;
import com.example.study.repository.OrderRepository;
import com.example.study.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final UserRepository userRepository;

    public OrderService(OrderRepository orderRepository,
                        OrderDetailRepository orderDetailRepository,
                        UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.userRepository = userRepository;
    }

    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    public List<OrderDetail> getOrderDetail(long id) {
        Order order = orderRepository.findById(id);
        return order.getOrderDetails();
    }

    public Order findById(long id) {
        return orderRepository.findById(id);
    }

    public Order save(Order order) {
        return orderRepository.save(order);
    }

    public void deleteOrder(Order order) {
        List<OrderDetail> orderDetails = this.orderDetailRepository.findByOrderId(order.getId());
        for (OrderDetail orderDetail : orderDetails) {
            this.orderDetailRepository.deleteById(orderDetail.getId());
        }
        orderRepository.deleteById(order.getId());
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public List<Order> getOrderHistory(HttpSession session) {
        User user =  this.userRepository.findByEmail((String) session.getAttribute("email"));
        return orderRepository.findByUser(user);
    }
}
