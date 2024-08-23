package com.apollo.controller;

import java.util.List;

import com.apollo.dto.VariantDTO;
import com.apollo.entity.Variant;
import com.apollo.service.VariantService;
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

import com.apollo.dto.ProductDTO;
import com.apollo.entity.Product;
import com.apollo.service.impl.ProductServiceImpl;

@SuppressWarnings("null")
@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/products")
public class ProductController {

    private final VariantService variantService;

    private final ProductServiceImpl productServiceImpl;

    public ProductController(VariantService variantService, ProductServiceImpl productServiceImpl) {
        this.variantService = variantService;
        this.productServiceImpl = productServiceImpl;
    }

    @GetMapping
    public List<ProductDTO> productDtoList() {
        return productServiceImpl.getAllProductDtos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductDTO> getProduct(@PathVariable("id") Long id) {
        try {
            ProductDTO productDto = productServiceImpl.getProductById(id);
            if (productDto.getId() == null) {
                return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<>(productDto, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        try {
            Product createdProduct = productServiceImpl.createProduct(product);
            return new ResponseEntity<>(createdProduct, HttpStatus.CREATED);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<ProductDTO> updateProduct(@PathVariable("id") Long id, @RequestBody ProductDTO productDTO) {
        try {
            ProductDTO updatedProduct = productServiceImpl.updateProduct(id, productDTO);
            if (updatedProduct == null) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<>(updatedProduct, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}

