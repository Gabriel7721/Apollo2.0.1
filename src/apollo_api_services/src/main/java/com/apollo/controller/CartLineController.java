package com.apollo.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.apollo.dto.CartLineDTO;
import com.apollo.entity.Cart;
import com.apollo.entity.CartLine;
import com.apollo.entity.User;
import com.apollo.entity.Variant;
import com.apollo.payload.request.CartLineRequest;
import com.apollo.repository.CartLineRepository;
import com.apollo.repository.CartRepository;
import com.apollo.repository.VariantRepository;
import com.apollo.service.AuthService;
import com.apollo.service.CartLineService;
import com.apollo.service.CartService;

import lombok.AllArgsConstructor;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/cart-lines")
@AllArgsConstructor
public class CartLineController {
    private CartLineService cartLineService;
    private CartService cartService;
    private AuthService authService;

    private final CartLineRepository cartLineRepository;
    private final CartRepository cartRepository;
    private final VariantRepository variantRepository;


    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteCartLine(@PathVariable("id")Long cartLineId){
        cartLineService.removeCartLine(cartLineId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/add-to-cart")
    public ResponseEntity<CartLineDTO> addCartLine(@RequestBody CartLineRequest cartLineRequest){
        CartLineDTO cartLineDto = cartLineService.saveCartLine(cartLineRequest);
        return new ResponseEntity<>(cartLineDto ,HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getAllCartLines(@PathVariable("id") Long userId){
        User user = authService.findById(userId);
        Cart cart = cartService.findCartByUserId(user);
        List<CartLineDTO> cartLineDTOS = cartLineService.findCartLinesByCartId(cart.getId());
        return new ResponseEntity<>(cartLineDTOS,HttpStatus.OK);
    }

    @PutMapping
    public ResponseEntity<?> updateCartLine(@RequestBody CartLineDTO cartLineDto) throws Exception {
        cartLineService.updateCartLine(cartLineDto, cartLineDto.getId());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/delete-all/{id}")
    public ResponseEntity<?> deleteAllCartLine(@PathVariable("id") Long userId){
        User user = authService.findById(userId);
        Cart cart = cartService.findCartByUserId(user);
        cartLineService.removeAllCartLines(cart.getId());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @Transactional
    @PostMapping("/manage-cart-line")
    public ResponseEntity<?> manageCartLine(@RequestBody CartLineDTO cartLineDto) throws Exception {
        if (cartLineDto.getId() != null) {
            // Tìm kiếm dòng giỏ hàng theo ID
            CartLine cartLine = cartLineRepository.findById(cartLineDto.getId()).orElse(null);

            if (cartLine != null) {
                if (cartLineDto.getQuantity() == 0) {
                    // Xóa dòng sản phẩm nếu số lượng là 0
                    cartLineRepository.deleteCartLineById(cartLine.getId());
                } else {
                    // Cập nhật số lượng nếu số lượng > 0
                    cartLine.setQuantity(cartLineDto.getQuantity());
                    cartLineRepository.save(cartLine);
                }
                return new ResponseEntity<>(HttpStatus.OK);
            }
        }

        // Nếu dòng sản phẩm chưa tồn tại hoặc ID là null, thêm mới dòng sản phẩm
        Cart cart = cartRepository.findById(cartLineDto.getCartDto().getId()).orElse(null);
        Variant variant = variantRepository.findById(cartLineDto.getVariantDto().getId()).orElse(null);

        CartLine newCartLine = new CartLine();
        newCartLine.setCart(cart);
        newCartLine.setVariant(variant);
        newCartLine.setQuantity(cartLineDto.getQuantity());

        cartLineRepository.save(newCartLine);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
