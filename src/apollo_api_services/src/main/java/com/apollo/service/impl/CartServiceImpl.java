package com.apollo.service.impl;

import org.springframework.stereotype.Service;

import com.apollo.dto.UserRegisterDTO;
import com.apollo.entity.Cart;
import com.apollo.entity.User;
import com.apollo.repository.CartRepository;
import com.apollo.repository.UserRepository;
import com.apollo.service.CartService;

@Service
public class CartServiceImpl implements CartService {
    private final CartRepository cartRepository;
    private final UserRepository userRepository;

    public CartServiceImpl(CartRepository cartRepository, UserRepository userRepository) {
        this.cartRepository = cartRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Cart createCart(UserRegisterDTO userDTO) {
        Cart cart = new Cart();
        User user = userRepository.findByEmail(userDTO.getEmail());
        cart.setUser(user);
        cartRepository.save(cart);
        return cart;
    }

    @Override
    public Cart findCartByUserId(User user) {
        return cartRepository.findCartByUser(user);

    }

    @Override
    public Cart findById(Long id) {
        return cartRepository.findById(id).orElse(null);
    }
}
