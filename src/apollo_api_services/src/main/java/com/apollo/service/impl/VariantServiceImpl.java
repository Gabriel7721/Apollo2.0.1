package com.apollo.service.impl;

import com.apollo.converter.*;
import com.apollo.dto.*;
import com.apollo.entity.*;
import com.apollo.repository.*;
import com.apollo.service.ReviewService;
import com.apollo.service.VariantService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class VariantServiceImpl implements VariantService {

    private final VariantConverter variantConverterImpl;
    private final VariantRepository variantRepository;
    private final OptionValueConverter optionValueConverter;
    private final ImageConverter iImageConverter;
    private final VideoConverter iVideoConverter;
    private final ProductRepository productRepository;
    private final OptionValueRepository optionValueRepository;
    private final ReviewConverter reviewConverter;
    private final UserConverter userConverter;
    private final ReviewService reviewService;
    private final ImageRepository imageRepository;
    private final VideoRepository videoRepository;

    public VariantServiceImpl(OptionValueConverter optionValueConverter, VariantConverter variantConverterImpl, VariantRepository variantRepository, ImageConverter iImageConverter, VideoConverter iVideoConverter, ProductRepository productRepository, OptionValueRepository optionValueRepository, ReviewConverter reviewConverter, UserConverter userConverter, ReviewService reviewService, ImageRepository imageRepository, VideoRepository videoRepository) {
        this.optionValueConverter = optionValueConverter;
        this.variantConverterImpl = variantConverterImpl;
        this.variantRepository = variantRepository;
        this.iImageConverter = iImageConverter;
        this.iVideoConverter = iVideoConverter;
        this.productRepository = productRepository;
        this.optionValueRepository = optionValueRepository;
        this.reviewConverter = reviewConverter;
        this.userConverter = userConverter;
        this.reviewService = reviewService;
        this.imageRepository = imageRepository;
        this.videoRepository = videoRepository;
    }

    public List<VariantDTO> getVariantsByProduct(Long productId) {
        return variantRepository.findByProductId(productId).stream()
                .map(VariantDTO::new)
                .collect(Collectors.toList());
    }

    public VariantDTO createVariantForProduct(Long productId, VariantDTO createVariantDTO) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found with id: " + productId));

        Variant variant = new Variant();
        variant.setName(createVariantDTO.getName());
        variant.setSkuCode(createVariantDTO.getSkuCode());
        variant.setStockQuantity(createVariantDTO.getStockQuantity());
        variant.setWeight(createVariantDTO.getWeight());
        variant.setPrice(createVariantDTO.getPrice());
        variant.setSalePrice(createVariantDTO.getSalePrice());
        variant.setImg(createVariantDTO.getImg());
        variant.setProduct(product);

        if (createVariantDTO.getOptionValueIds() != null) {
            List<OptionValue> optionValues = optionValueRepository.findAllById(createVariantDTO.getOptionValueIds());
            variant.setOptionValues(optionValues);
        }

        Variant savedVariant = variantRepository.save(variant);
        return variantConverterImpl.entityToDTO(savedVariant);
    }

    private VariantDTO convertToDTO(Variant variant) {
        VariantDTO dto = new VariantDTO();
        dto.setId(variant.getId());
        dto.setName(variant.getName());
        dto.setSkuCode(variant.getSkuCode());
        dto.setStockQuantity(variant.getStockQuantity());
        dto.setWeight(variant.getWeight());
        dto.setPrice(variant.getPrice());
        dto.setSalePrice(variant.getSalePrice());
        dto.setImg(variant.getImg());
        dto.setProductId(variant.getProduct().getId());
        return dto;
    }

    public VariantDTO getVariantById(Long id) {
        return variantConverterImpl.entityToDTO(variantRepository.findById(id).orElse(null));
    }

    @Transactional
    public List<VariantDTO> getVariantByProductId(Long product_id) {
        List<VariantDTO> variantDtoList = new ArrayList<>();
        List<Variant> variants = variantRepository.findByProduct_Id(product_id);
        for (Variant variant : variants) {
            List<OptionValue> optionValueList = variant.getOptionValues();
            List<Image> imageList = variant.getImages();
            List<Video> videoList = variant.getVideos();
            List<ReviewDTO> reviewList = reviewService.getReviewsByVariantId(variant.getId());
            List<ImageDTO> imageDTOList = iImageConverter.entitiesToDTOs(imageList);
            List<VideoDTO> videoDTOList = iVideoConverter.entitiesToDTOs(videoList);
            List<OptionValueDTO> optionValueDto = optionValueConverter.entitiesToDTOs(optionValueList);
            VariantDTO variantDto = variantConverterImpl.entityToDTO(variant);
            variantDto.setOptionValueDTOList(optionValueDto);
            variantDto.setImageDTOList(imageDTOList);
            variantDto.setVideoDTOList(videoDTOList);
            variantDto.setReviewDTOList(reviewList);
            variantDtoList.add(variantDto);
        }
        return variantDtoList;
    }

    @Override
    public Variant findById(Long id) {
        return variantRepository.findById(id).orElse(null);
    }

    @Override
    public VariantDTO getLowestPriceVariantByProductId(Long product_id) {
        List<Variant> variants = variantRepository.findByProduct_Id(product_id);
        Variant minVariant = variants.get(0);
        for (Variant variant : variants) {
            if (variant.getSalePrice() < minVariant.getSalePrice()) {
                minVariant = variant;
            }
        }
        List<OptionValue> optionValueList = minVariant.getOptionValues();
        List<Image> images = minVariant.getImages();
        List<Video> videos = minVariant.getVideos();
        List<OptionValueDTO> optionValueDto = optionValueConverter.entitiesToDTOs(optionValueList);
        List<ImageDTO> imageDtoList = iImageConverter.entitiesToDTOs(images);
        List<VideoDTO> videoDtoList = iVideoConverter.entitiesToDTOs(videos);
        VariantDTO variantDto = variantConverterImpl.entityToDTO(minVariant);
        variantDto.setOptionValueDTOList(optionValueDto);
        variantDto.setImageDTOList(imageDtoList);
        variantDto.setVideoDTOList(videoDtoList);
        return variantDto;
    }

    @Override
    public VariantDTO getVariantByProductPriceMin(Long product_id) {
        Variant variant = variantRepository.findTopByProductIdOrderByPriceAsc(product_id);
        return variantConverterImpl.entityToDTO(variant);
    }

    @Override
    public Variant createVariant(VariantDTO variantDto, Long product_id) {
        Variant variant = variantConverterImpl.dtoToEntity(variantDto);
        Product product = productRepository.findById(product_id).orElse(null);
        variant.setProduct(product);
        return variantRepository.save(variant);
    }

    @Override
    public VariantDTO updateVariant(Long variantId, VariantDTO variantDto) {
        Variant variant = variantRepository.findById(variantId).orElseThrow(() -> new EntityNotFoundException("variant not found"));
        variant.setName(variantDto.getName());
        variant.setSkuCode(variantDto.getSkuCode());
        variant.setStockQuantity(variantDto.getStockQuantity());
        variant.setWeight(variantDto.getWeight());
        variant.setPrice(variantDto.getPrice());
        variant.setSalePrice(variantDto.getSalePrice());
        variant.setImg(variantDto.getImg()); // Update this line of code to update images.
        Variant variant1 = variantRepository.save(variant);
        return variantConverterImpl.entityToDTO(variant1);
    }

    @Override
    public void deleteVariant(Long variantId) {
        Variant variant = variantRepository.findById(variantId).orElseThrow(() -> new EntityNotFoundException("variant not found"));
        List<Image> images = variant.getImages();
        List<Video> videos = variant.getVideos();
        for (Image ele : images) {
            imageRepository.deleteById(ele.getId());
        }
        for (Image ele1 : images) {
            videoRepository.deleteById(ele1.getId());
        }
        variantRepository.deleteById(variantId);
    }

    public Page<VariantDTO> getVariantsByContaining(String text, Pageable pageable) {
        Page<Variant> variantPage = variantRepository.findByNameContaining(text, pageable);
        return variantPage.map(variantConverterImpl::entityToDTO);
    }

    @Override
    public Page<VariantDTO> getVariantsByNameContainingAndPriceBetween(String text, double minPrice, double maxPrice, Pageable pageable) {
        Page<Variant> variantPage = variantRepository.findVariantsByNameContainingAndPriceBetween(text, minPrice, maxPrice, pageable);
        System.out.println("888888888888888888888" + variantPage.getSize());
        return variantPage.map(variantConverterImpl::entityToDTO);
    }

    @Override
    public Page<VariantDTO> getVariantsBySearchTextAndRating(String text, long star, Pageable pageable) {
        List<VariantDTO> variantList = new ArrayList<>();
        Page<Variant> variantPage = variantRepository.findByNameContaining(text, pageable);
        if (variantPage != null) {
            for (Variant variant : variantPage) {
                if (variantRepository.findAverageStarByReview(variant) != null) {
                    long rating = Math.round(variantRepository.findAverageStarByReview(variant));
                    System.out.println("******************************************" + rating);
                    if (rating == star) {
                        variantList.add(variantConverterImpl.entityToDTO(variant));
                    }

                }
            }
        }

        return new PageImpl<>(variantList, pageable, variantPage.getTotalElements());
    }

    public VariantDTO createRawVariant(List<Long> valueIdList, Long productId) {
        List<OptionValue> optionValueList = new ArrayList<>();
        for (Long ele : valueIdList) {
            OptionValue optionValue = optionValueRepository.findById(ele).orElse(new OptionValue());
            optionValueList.add(optionValue);
        }
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("product not found"));
        Variant variant = new Variant();
        variant.setProduct(product);
        variant.setOptionValues(optionValueList);
        variantRepository.save(variant);
        List<OptionValue> optionValues = variant.getOptionValues();
        List<OptionValueDTO> optionValueDtoList = optionValueConverter.entitiesToDTOs(optionValues);
        VariantDTO variantDto = variantConverterImpl.entityToDTO(variant);
        variantDto.setOptionValueDTOList(optionValueDtoList);
        return variantDto;
    }

    @Override
    public VariantDTO getVariantInfoById(Long id) {
        Variant variant = variantRepository.findById(id).orElse(null);
        if (variant == null) {
            return null;
        } else {
            List<OptionValue> optionValueList = variant.getOptionValues();
            List<Image> images = variant.getImages();
            List<Video> videos = variant.getVideos();
            List<OptionValueDTO> optionValueDto = optionValueConverter.entitiesToDTOs(optionValueList);
            List<ImageDTO> imageDtoList = iImageConverter.entitiesToDTOs(images);
            List<VideoDTO> videoDtoList = iVideoConverter.entitiesToDTOs(videos);
            VariantDTO variantDto = variantConverterImpl.entityToDTO(variant);
            variantDto.setOptionValueDTOList(optionValueDto);
            variantDto.setImageDTOList(imageDtoList);
            variantDto.setVideoDTOList(videoDtoList);
            return variantDto;
        }

    }

    @Override
    public Page<VariantDTO> getNewestVariantsByText(String text, Pageable pageable) {
        Page<Variant> variantPage = variantRepository.findByNameContaining(text, pageable);
        List<Variant> variants = variantPage.getContent();
        List<Variant> sortedVariants = variants.stream()
                .sorted((variant1, variant2) -> {
                    Date createdAt1 = variantRepository.findCreatedAtByVariantId(variant1.getId());
                    Date createdAt2 = variantRepository.findCreatedAtByVariantId(variant2.getId());
                    return createdAt1.compareTo(createdAt2); // Descending sorting
                })
                .collect(Collectors.toList());
        Page<Variant> sortedVariantPage = new PageImpl<>(sortedVariants, pageable, variantPage.getTotalElements());
        List<VariantDTO> sortedVariantDTOs = sortedVariants.stream()
                .map(variant -> variantConverterImpl.entityToDTO(variant))
                .collect(Collectors.toList());
        return new PageImpl<>(sortedVariantDTOs, pageable, sortedVariantPage.getTotalElements());

    }

}
