package com.apollo.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.apollo.converter.BulletConverter;
import com.apollo.converter.OptionTableConverter;
import com.apollo.converter.OptionValueConverter;
import com.apollo.converter.StoreConverter;
import com.apollo.converter.VariantConverter;
import com.apollo.converter.impl.ProductConverterImpl;
import com.apollo.dto.BulletDTO;
import com.apollo.dto.OptionTableDTO;
import com.apollo.dto.OptionValueDTO;
import com.apollo.dto.ProductDTO;
import com.apollo.dto.StoreDTO;
import com.apollo.dto.VariantDTO;
import com.apollo.entity.Bullet;
import com.apollo.entity.Category;
import com.apollo.entity.OptionTable;
import com.apollo.entity.OptionValue;
import com.apollo.entity.Product;
import com.apollo.entity.Store;
import com.apollo.entity.StoreCategory;
import com.apollo.entity.Variant;
import com.apollo.repository.CategoryRepository;
import com.apollo.repository.ProductRepository;
import com.apollo.repository.StoreCategoryRepository;
import com.apollo.repository.StoreRepository;
import com.apollo.repository.VariantRepository;
import com.apollo.service.ProductService;
import com.apollo.service.VariantService;

@SuppressWarnings("unused")
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductConverterImpl productConverterImpl;
    private final VariantRepository variantRepository;
    private final VariantConverter variantConverter;
    private final StoreConverter storeConverter;
    private final OptionValueConverter optionValueConverter;
    private final OptionTableConverter optionTableConverter;
    private final BulletConverter bulletConverter;
    private final StoreRepository storeRepository;
    private final StoreCategoryRepository storeCategoryRepository;
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final VariantService variantService;

    public ProductServiceImpl(StoreConverter storeConverter, ProductConverterImpl productConverterImpl,
            VariantRepository variantRepository, VariantConverter variantConverter,
            OptionValueConverter optionValueConverter, OptionTableConverter optionTableConverter,
            BulletConverter bulletConverter, StoreRepository storeRepository,
            StoreCategoryRepository storeCategoryRepository, ProductRepository productRepository,
            CategoryRepository categoryRepository, VariantService variantService) {
        this.storeConverter = storeConverter;
        this.productConverterImpl = productConverterImpl;
        this.variantRepository = variantRepository;
        this.variantConverter = variantConverter;
        this.optionValueConverter = optionValueConverter;
        this.optionTableConverter = optionTableConverter;
        this.bulletConverter = bulletConverter;
        this.storeRepository = storeRepository;
        this.storeCategoryRepository = storeCategoryRepository;
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
        this.variantService = variantService;
    }

    @Transactional
    public Product createProduct(Product product) {
        if (product.getCategory() != null && product.getCategory().getId() != null) {
            Category category = categoryRepository.findById(product.getCategory().getId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            product.setCategory(category);
        }

        if (product.getStoreCategory() != null && product.getStoreCategory().getId() != null) {
            StoreCategory storeCategory = storeCategoryRepository.findById(product.getStoreCategory().getId())
                    .orElseThrow(() -> new RuntimeException("Store Category not found"));
            product.setStoreCategory(storeCategory);
        }

        if (product.getStore() != null && product.getStore().getId() != null) {
            Store store = storeRepository.findById(product.getStore().getId())
                    .orElseThrow(() -> new RuntimeException("Store not found"));
            product.setStore(store);
        }

        Product savedProduct = productRepository.save(product);

        if (product.getVariants() != null && !product.getVariants().isEmpty()) {
            for (Variant variant : product.getVariants()) {
                variant.setProduct(savedProduct);
                variantRepository.save(variant);
            }
        }

        return savedProduct;
    }

    @Transactional
    public ProductDTO updateProduct(Long id, ProductDTO productDTO) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        existingProduct.setTitle(productDTO.getTitle());
        existingProduct.setDescription(productDTO.getDescription());
        existingProduct.setMainPicture(productDTO.getMainPicture());
        existingProduct.setStatus(productDTO.getStatus());

        if (productDTO.getCategoryId() != null) {
            Category category = categoryRepository.findById(productDTO.getCategoryId())
                    .orElseThrow(() -> new RuntimeException("Category not found"));
            existingProduct.setCategory(category);
        }

        if (productDTO.getStoreId() != null) {
            Store store = storeRepository.findById(productDTO.getStoreId())
                    .orElseThrow(() -> new RuntimeException("Store not found"));
            existingProduct.setStore(store);
        }

        if (productDTO.getStoreCategoryId() != null) {
            StoreCategory storeCategory = storeCategoryRepository.findById(productDTO.getStoreCategoryId())
                    .orElseThrow(() -> new RuntimeException("Store Category not found"));
            existingProduct.setStoreCategory(storeCategory);
        }

        Product updatedProduct = productRepository.save(existingProduct);

        return productConverterImpl.entityToDTO(updatedProduct);
    }

    @Override
    public ProductDTO getProductById(Long id) {
        Product product = productRepository.findById(id).orElse(new Product());

        List<Bullet> bullets = product.getBulletList();
        List<BulletDTO> bulletDTOList = bulletConverter.entitiesToDTOs(bullets);

        ProductDTO productDto = productConverterImpl.entityToDTO(product);
        productDto.setBulletDTOList(bulletDTOList);

        return productDto;
    }

    @Override
    public List<ProductDTO> getAllProductDtos() {
        List<Product> products = productRepository.findAll();
        List<ProductDTO> productDTOS = productConverterImpl.entitiesToDTOs(products);
        List<StoreDTO> storeDTOS = new ArrayList<>();
        for (Product product : products) {
            Store store = product.getStore();
            StoreDTO storeDto = storeConverter.entityToDTO(store);
            storeDTOS.add(storeDto);
        }
        for (int i = 0; i < products.toArray().length; i++) {
            productDTOS.get(i).setStore(storeDTOS.get(i));
        }
        return productDTOS;
    }

    @Override
    public List<ProductDTO> getAllProductDtosByStore(Long id) {
        Store store = storeRepository.findById(id).orElse(null);
        List<Product> products = productRepository.findAllByStore(store);
        List<ProductDTO> productDTOS = productConverterImpl.entitiesToDTOs(products);
        List<StoreDTO> storeDTOS = new ArrayList<>();
        for (Product product : products) {

            Store productStore = product.getStore();
            StoreDTO storeDto = storeConverter.entityToDTO(store);
            storeDTOS.add(storeDto);
        }
        for (int i = 0; i < products.toArray().length; i++) {
            productDTOS.get(i).setStore(storeDTOS.get(i));
        }
        return productDTOS;
    }

    @Override
    public List<ProductDTO> getAllProductDtosByStoreCategory(String categoryName) {
        StoreCategory storeCategory = storeCategoryRepository.findByName(categoryName);
        List<StoreCategory> subCategories = storeCategoryRepository.findAllByParentStoreCategory(storeCategory);
        List<Product> products = new ArrayList<>();
        for (StoreCategory category : subCategories) {
            List<Product> categoryProducts = productRepository.findAllByStoreCategory(category);
            for (Product product : categoryProducts) {
                products.add(product);
            }
        }
        List<ProductDTO> productDTOS = productConverterImpl.entitiesToDTOs(products);
        return productDTOS;
    }

    @Override
    public List<ProductDTO> getAllProductDtosByStoreSubCategory(String categoryName) {
        StoreCategory storeCategory = storeCategoryRepository.findByName(categoryName);
        List<Product> products = productRepository.findAllByStoreCategory(storeCategory);
        List<ProductDTO> productDTOS = productConverterImpl.entitiesToDTOs(products);
        return productDTOS;
    }

    @Override
    public List<VariantDTO> getVariantsByProductId(Long productId) {
        Product product = productRepository.findById(productId).orElse(new Product());
        List<Variant> variantList = product.getVariants();
        return variantConverter.entitiesToDTOs(variantList);
    }

    @Override
    public StoreDTO getStoreByProductId(Long productId) {
        Product product = productRepository.findById(productId).orElse(new Product());
        Store store = product.getStore();
        StoreDTO storeDto = storeConverter.entityToDTO(store);
        return storeDto;
    }

    @Override
    public List<OptionTableDTO> getOptionsByProductId(Long productId) {
        List<OptionTableDTO> optionTableDTOList = new ArrayList<>();
        Product product = productRepository.findById(productId).orElse(new Product());
        List<OptionTable> optionTableList = product.getOptionTables();
        for (OptionTable optionTable : optionTableList) {
            List<OptionValue> optionValueList = optionTable.getOptionValues();
            List<OptionValueDTO> optionValueDTOList = optionValueConverter.entitiesToDTOs(optionValueList);
            OptionTableDTO optionTableDto = optionTableConverter.entityToDTO(optionTable);
            optionTableDto.setOptionValueDTOList(optionValueDTOList);
            optionTableDTOList.add(optionTableDto);
        }
        return optionTableDTOList;
    }

    @Override
    public List<ProductDTO> getProductsByContaining(String text) {
        List<Product> products = productRepository.findByTitleContaining(text);
        return productConverterImpl.entitiesToDTOs(products);

    }

    @Override
    public List<ProductDTO> getProductsOfStoreByContaining(Long id, String text) {
        List<Product> products = productRepository.findByTitleContaining(text);
        return productConverterImpl.entitiesToDTOs(products);
    }

    @Override
    public ProductDTO deleteProduct(Long productId) {
        Product p = productRepository.findById(productId)
                .orElseThrow(() -> new EntityNotFoundException("Store not found"));
        if (p != null) {
            productRepository.deleteById(productId);
        }
        return productConverterImpl.entityToDTO(p);
    }

}