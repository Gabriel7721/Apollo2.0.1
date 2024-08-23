package com.apollo.service;

import java.util.List;

import com.apollo.dto.OptionTableDTO;
import com.apollo.dto.ProductDTO;
import com.apollo.dto.StoreDTO;
import com.apollo.dto.VariantDTO;
import com.apollo.entity.Product;

public interface ProductService {

    public List<ProductDTO> getAllProductDtosByStore(Long id);

    List<ProductDTO> getAllProductDtosByStoreCategory(String categoryName);

    List<ProductDTO> getAllProductDtosByStoreSubCategory(String categoryName);

    ProductDTO getProductById(Long id);

    List<ProductDTO> getAllProductDtos();

    List<VariantDTO> getVariantsByProductId(Long productId);

    StoreDTO getStoreByProductId(Long productId);

    List<OptionTableDTO> getOptionsByProductId(Long productId);

    List<ProductDTO> getProductsByContaining(String text);

    List<ProductDTO> getProductsOfStoreByContaining(Long id, String text);

    ProductDTO deleteProduct(Long productId);

    ProductDTO updateProduct(Long id, ProductDTO productDTO);

    Product createProduct(Product product);

}
