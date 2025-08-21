package com.example.study.controller.client;

import com.example.study.domain.*;
import com.example.study.domain.dto.ProductCriteriaDTO;
import com.example.study.service.OrderService;
import com.example.study.service.ProductService;
import com.example.study.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class ItemController {

    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;

    public ItemController(ProductService productService,
                          UserService userService,
                          OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id){
        Product product = this.productService.findById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addToCart(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email,id, session, 1);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<CartDetail> cartDetails = this.productService.findAll(session);
        User user = this.userService.getUserByEmail(session.getAttribute("email").toString());
        Cart cart = user.getCart();
        model.addAttribute("cart", cart);
        model.addAttribute("cartDetails", cartDetails);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartProduct(@PathVariable long id, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        this.productService.deleteCartProduct(session, id);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model,HttpServletRequest request){
        HttpSession session = request.getSession(false);
        List<CartDetail> cartDetails = this.productService.findAll(session);
        model.addAttribute("cartDetails", cartDetails);
        return "client/cart/checkout";
    }

    @PostMapping("/comfirm-checkout")
    public String checkout(@ModelAttribute("cart") Cart cart){
        List<CartDetail> cartDetails = cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
                                   @RequestParam("receiverName") String receiverName,
                                   @RequestParam("receiverAddress") String receiverAddress,
                                   @RequestParam("receiverPhone") String receiverPhone){
        HttpSession session = request.getSession(false);
        this.productService.handlePlaceOrder(session, receiverName, receiverAddress, receiverPhone);
        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThanksPage(){
        return "client/cart/thanks";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        List<Order> orders = this.orderService.getOrderHistory(session);
        model.addAttribute("orders", orders);
        return "client/history/show";
    }

    @PostMapping("/add-product-from-view-detail")
    public String addFromViewDetail(@RequestParam("id") long id,
                                    @RequestParam("quantity") long quantity,
                                    HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email,id, session, quantity);
        return "redirect:/";
    }

    @GetMapping("/products")
    public String getProductsPage(Model model, ProductCriteriaDTO productCriteriaDTO){
        int page = 1;
        try{
            page = Integer.parseInt(productCriteriaDTO.getPage().get());
        }catch(Exception e){

        }
        Pageable pageable = PageRequest.of(page - 1, 60);

        Page<Product> products = this.productService.findAll(pageable, productCriteriaDTO);



        List<Product> productList = products.getContent().size() > 0 ? products.getContent() : new ArrayList<Product>();

        model.addAttribute("products", productList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "client/product/show";
    }
}
