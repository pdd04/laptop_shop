package com.example.study.service;

import com.example.study.domain.*;
import com.example.study.repository.*;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;
    private final UserService userService;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;

    public ProductService(ProductRepository productRepository
                        ,CartDetailRepository cartDetailRepository
                        ,CartRepository cartRepository, UserService userService,
                          OrderDetailRepository orderDetailRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
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

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
        User user = this.userService.getUserByEmail(email);
        if(user!=null){
            // check xem da co cart chua
            Cart cart = this.cartRepository.findByUser(user);
            if(cart==null){
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }

            Product product = this.productRepository.findById(productId);

            //check xem product da co trong cart chua
            CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);

            if(oldDetail==null){
                CartDetail cartDetail = new CartDetail();
                cartDetail.setCart(cart);
                cartDetail.setProduct(product);
                cartDetail.setPrice(product.getPrice());
                cartDetail.setQuantity(quantity);
                this.cartDetailRepository.save(cartDetail);

                int sum = cart.getSum() + 1;
                cart.setSum(sum);
                this.cartRepository.save(cart);
                session.setAttribute("sum",sum);
            }else{
                oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                this.cartDetailRepository.save(oldDetail);
            }
        }
    }

    public List<CartDetail> findAll(HttpSession session) {
        User user = this.userService.getUserByEmail((String) session.getAttribute("email"));
        Cart cart = this.cartRepository.findByUser(user);
        if(cart==null){
            Cart newCart = new Cart();
            newCart.setUser(user);
            newCart.setSum(0);
            cart = this.cartRepository.save(newCart);
        }
        return cart.getCartDetails();
    }

    public void deleteCartProduct(HttpSession session, long id) {
        User user = this.userService.getUserByEmail((String) session.getAttribute("email"));
        Cart cart = this.cartRepository.findByUser(user);
        this.cartDetailRepository.deleteById(id);
        int  sum = cart.getSum() - 1;
        cart.setSum(sum);
        this.cartRepository.save(cart);
        session.setAttribute("sum",sum);
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            CartDetail oldDetail = this.cartDetailRepository.findById(cartDetail.getId());
            oldDetail.setQuantity(cartDetail.getQuantity());
            this.cartDetailRepository.save(oldDetail);
        }
    }

    public void handlePlaceOrder(HttpSession session, String receiverName, String receiverAddress, String receiverPhone) {
        User user = this.userService.getUserByEmail(session.getAttribute("email").toString());
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(receiverName);
        order.setReceiverAddress(receiverAddress);
        order.setReceiverPhone(receiverPhone);
        order= this.orderRepository.save(order);

        double total = 0;
        Cart cart = this.cartRepository.findByUser(user);
        if(cart!=null){
            List<CartDetail> cartDetails = new ArrayList<>(cart.getCartDetails());
            for (CartDetail cartDetail : cartDetails) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(order);
                orderDetail.setProduct(cartDetail.getProduct());
                orderDetail.setPrice(cartDetail.getPrice());
                orderDetail.setQuantity(cartDetail.getQuantity());
                this.orderDetailRepository.save(orderDetail);
                total = total + cartDetail.getPrice() * cartDetail.getQuantity();
                //delete cartDetail
                this.cartDetailRepository.deleteById(cartDetail.getId());
                int sum = cart.getSum() - 1;
                cart.setSum(sum);
                cart.setCartDetails(null);
                this.cartRepository.save(cart);
            }
            order.setTotalPrice(total);
            order.setStatus("PENDING");
            this.orderRepository.save(order);
            session.setAttribute("sum",0);
        }
//        trước đó ở hàm này có thực hiện xóa cart ở cuối nhưng bị lỗi 500 dù đã có fix nhưng
//        vẫn không thành công.
    }

    public long countProducts(){
        return this.productRepository.count();
    }
}
