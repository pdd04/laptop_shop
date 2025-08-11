package com.example.study.controller.client;

import com.example.study.domain.Cart;
import com.example.study.domain.CartDetail;
import com.example.study.domain.Product;
import com.example.study.domain.User;
import com.example.study.service.ProductService;
import com.example.study.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ItemController {

    private final ProductService productService;
    private final UserService userService;

    public ItemController(ProductService productService,
                          UserService userService) {
        this.productService = productService;
        this.userService = userService;
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
        this.productService.handleAddProductToCart(email,id, session);
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
}
