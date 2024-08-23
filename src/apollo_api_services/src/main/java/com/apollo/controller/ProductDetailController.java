package com.apollo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.apollo.converter.impl.ProductConverterImpl;
import com.apollo.dto.ImageDTO;
import com.apollo.dto.OptionValueDTO;
import com.apollo.dto.ProductDTO;
import com.apollo.dto.VariantDTO;
import com.apollo.dto.VideoDTO;
import com.apollo.payload.response.ProductDetailResponse;
import com.apollo.payload.response.VariantDetailResponse;
import com.apollo.service.ImageService;
import com.apollo.service.OptionValueService;
import com.apollo.service.ProductAttributeService;
import com.apollo.service.ProductService;
import com.apollo.service.VariantService;
import com.apollo.service.VideoService;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/product-detail")
public class ProductDetailController {

    private final ImageService imageServiceImpl;
    private final ProductService productServiceImpl;
    private final ProductAttributeService productAttributeServiceImpl;
    private final VariantService variantServiceImpl;
    private final VideoService videoServiceImpl;
    private final ProductConverterImpl productConverterImpl;

    private final OptionValueService optionValueServiceImpl;
    ProductDetailResponse productDetailResponse = new ProductDetailResponse();
    VariantDetailResponse variantDetailResponse = new VariantDetailResponse();

    @Autowired
    public ProductDetailController(ImageService imageServiceImpl, ProductService productServiceImpl, ProductAttributeService productAttributeServiceImpl, VariantService variantServiceImpl, VideoService videoServiceImpl, ProductConverterImpl productConverterImpl, OptionValueService optionValueServiceImpl) {
        this.imageServiceImpl = imageServiceImpl;
        this.productServiceImpl = productServiceImpl;
        this.productAttributeServiceImpl = productAttributeServiceImpl;
        this.variantServiceImpl = variantServiceImpl;
        this.videoServiceImpl = videoServiceImpl;
        this.productConverterImpl = productConverterImpl;
        this.optionValueServiceImpl = optionValueServiceImpl;
    }

    @GetMapping("/{product_id}")
    public ResponseEntity<ProductDetailResponse> getProduct(@PathVariable("product_id") Long productId) {
        productDetailResponse.setProductDTO(productServiceImpl.getProductById(productId));
        productDetailResponse.setStoreDto(productServiceImpl.getStoreByProductId(productId));
        productDetailResponse.setOptionTableDto(productServiceImpl.getOptionsByProductId(productId));
        productDetailResponse.setVariantDTOList(variantServiceImpl.getVariantByProductId(productId));
        productDetailResponse.setProductAttributeDTOList(productAttributeServiceImpl.getProductAttributeByProductId(productId));
        return ResponseEntity.ok(productDetailResponse);
    }

    @GetMapping("/{product_id}/{variant_id}")
    public ResponseEntity<VariantDetailResponse> getVariant(@PathVariable("variant_id") Long variantId) {
        List<ImageDTO> images = imageServiceImpl.getImageByVariantId(variantId);
        List<VideoDTO> videos = videoServiceImpl.getVideosByVariantId(variantId);
        VariantDTO variantDto = variantServiceImpl.getVariantById(variantId);
        List<OptionValueDTO> optionValueDTOList = optionValueServiceImpl.getOptionValuesByVariantId(variantId);
        variantDetailResponse.setVariantDto(variantDto);
        variantDetailResponse.setImageDTOS(images);
        variantDetailResponse.setVideoDTOS(videos);
        variantDetailResponse.setOptionValueDTOS(optionValueDTOList);
        return ResponseEntity.ok(variantDetailResponse);
    }

    @DeleteMapping("/delete/{product_id}")
    public ResponseEntity<String> deleteProduct(@PathVariable("product_id") Long productId) {
        ProductDTO productDto = productServiceImpl.getProductById(productId);

        if (productDto == null) {
            return new ResponseEntity<>("Product not found", HttpStatus.NOT_FOUND);
        }

        try {
            productServiceImpl.deleteProduct(productId);
            return new ResponseEntity<>("Product deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Failed to delete product", HttpStatus.BAD_REQUEST);
        }
    }

}
