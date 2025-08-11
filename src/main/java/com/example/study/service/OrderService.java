package com.example.study.service;

import com.example.study.domain.Order;
import com.example.study.domain.OrderDetail;
import com.example.study.repository.OrderDetailRepository;
import com.example.study.repository.OrderRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository,
                        OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
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

}
