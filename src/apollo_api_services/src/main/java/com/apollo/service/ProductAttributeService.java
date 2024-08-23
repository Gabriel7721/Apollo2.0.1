package com.apollo.service;

import java.util.List;

import com.apollo.dto.ProductAttributeDTO;
import com.apollo.entity.ProductAttribute;

public interface ProductAttributeService {
    List<ProductAttributeDTO> getProductAttributeByProductId(Long product_id);
    List<ProductAttribute> createProductAttribute(List<ProductAttributeDTO> productAttributeDtoList, Long product_Id);
}
