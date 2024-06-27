package com.apollo.controller;

import com.apollo.converter.impl.ProductConverterImpl;
import com.apollo.dto.*;
import com.apollo.entity.Product;
import com.apollo.payload.request.ProductRequest;
import com.apollo.payload.response.*;
import com.apollo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import java.util.Calendar;
import java.util.List;


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

    @PostMapping("/create/{storeId}/{categoryId}/{storeCategoryId}")
    public ResponseEntity<Product> createProduct(@RequestBody ProductRequest productRequest, @PathVariable Long storeId, @PathVariable Long categoryId, @PathVariable Long storeCategoryId) {

        ProductDTO productDto = ProductDTO.builder().title(productRequest.getTitle()).status("ACTIVE").createAt(Calendar.getInstance().getTime()).updatedAt(Calendar.getInstance().getTime()).description(productRequest.getDescription()).mainPicture(productRequest.getMainPicture()).build();
        Product product = productServiceImpl.createProduct(storeId, categoryId, storeCategoryId, productDto);

        if (product != null) {

            return new ResponseEntity<>(product, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(product, HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/update/{product_id}")
    public ResponseEntity<ProductResponse> updateProduct(
            @PathVariable("product_id") Long productId,
            @RequestBody ProductRequest productRequest) {

        // Lấy DTO của sản phẩm hiện tại
        ProductDTO productDto = productServiceImpl.getProductById(productId);

        if (productDto == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        // Cập nhật các trường từ request vào DTO
        productDto.setTitle(productRequest.getTitle());
        productDto.setDescription(productRequest.getDescription());
        productDto.setMainPicture(productRequest.getMainPicture());
        productDto.setStatus("currently for sale");
        productDto.setCreateAt(Calendar.getInstance().getTime());
        productDto.setUpdatedAt(Calendar.getInstance().getTime());

        // Cập nhật sản phẩm và lấy kết quả
        Product updatedProduct = productServiceImpl.updateProduct(productDto);

        if (updatedProduct != null) {
            // Tạo đối tượng ProductResponse để trả về, đảm bảo các liên kết với Store, Category và StoreCategory
            ProductResponse response = ProductResponse.builder()
                    .productDto(productConverterImpl.entityToDTO(updatedProduct))
                    .storeDto(productDto.getStore())
                    .build();

            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
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
