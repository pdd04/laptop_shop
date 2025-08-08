package com.example.study.service;

import com.example.study.domain.Cart;
import com.example.study.domain.CartDetail;
import com.example.study.domain.Product;
import com.example.study.domain.User;
import com.example.study.repository.CartDetailRepository;
import com.example.study.repository.CartRepository;
import com.example.study.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository
                        ,CartDetailRepository cartDetailRepository
                        ,CartRepository cartRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
    }

    public Product handelSaveProduct(Product newProduct) {
        return this.productRepository.save(newProduct);
    }

    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    public Product findById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId) {
        User user = this.userService.getUserByEmail(email);
        if(user!=null){
            // check xem da co cart chua
            Cart cart = this.cartRepository.findByUser(user);
            if(cart==null){
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(1);
                cart = this.cartRepository.save(newCart);
            }
            CartDetail cartDetail = new CartDetail();
            Product product = this.productRepository.findById(productId);
            cartDetail.setCart(cart);
            cartDetail.setProduct(product);
            cartDetail.setPrice(product.getPrice());
            cartDetail.setQuantity(1);
            this.cartDetailRepository.save(cartDetail);
        }
    }
}
