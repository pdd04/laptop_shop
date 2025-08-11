package com.example.study.controller.admin;

import com.example.study.domain.Order;
import com.example.study.domain.OrderDetail;
import com.example.study.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrder(Model model) {
        List<Order> orders = orderService.findAll();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{orderId}")
    public String getOrder(@PathVariable("orderId") Long orderId, Model model) {
        List<OrderDetail> orderDetails = orderService.getOrderDetail(orderId);
        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/update/{orderId}")
    public String getOrderUpdatePage(@PathVariable("orderId") Long orderId, Model model) {
        Order order = this.orderService.findById(orderId);
        model.addAttribute("order", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateOrder(Model model,@ModelAttribute("order")  Order order) {
        Order newOrder = this.orderService.findById(order.getId());
        newOrder.setStatus(order.getStatus());
        this.orderService.save(newOrder);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{orderId}")
    public String getDeleteOrderPage(Model model, @PathVariable("orderId") Long orderId) {
        Order deleteOrder = this.orderService.findById(orderId);
        model.addAttribute("deleteOrder", deleteOrder);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(Model model, @ModelAttribute("deleteOrder") Order deleteOrder) {
        this.orderService.deleteOrder(deleteOrder);
        return"redirect:/admin/order";
    }
}
