package com.apollo.controller;

import com.apollo.service.ShippingMethodService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/shipping-methods")
@AllArgsConstructor
public class ShippingMethodController {
    private ShippingMethodService shippingMethodService;

    @GetMapping
    public ResponseEntity<?> getAllShippingMethod(){

        return null;
    }
}
