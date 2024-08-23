package com.apollo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.apollo.converter.impl.ImageConverterImpl;
import com.apollo.dto.ImageDTO;
import com.apollo.entity.Image;
import com.apollo.entity.Variant;
import com.apollo.repository.ImageRepository;
import com.apollo.repository.VariantRepository;
import com.apollo.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {
    private final ImageRepository imageRepository;
    private final ImageConverterImpl imageConverterImpl;
    private final VariantRepository variantRepository;


    public ImageServiceImpl(
            ImageRepository imageRepository,
            ImageConverterImpl imageConverterImpl,
            VariantRepository variantRepository
    ) {
        this.imageRepository = imageRepository;
        this.imageConverterImpl = imageConverterImpl;
        this.variantRepository = variantRepository;
    }

    @Override
    public List<ImageDTO> getImageByVariantId(Long variant_id) {
        List<Image> images = imageRepository.findImagesByVariant_Id(variant_id);
        return imageConverterImpl.entitiesToDTOs(images);
    }
    @Override
    public List<Image> createImage(List<ImageDTO> imageDtoList, Long variant_id) {
        Variant variant = variantRepository.findById(variant_id).orElse(null);
        List<Image> images= imageConverterImpl.dtosToEntities(imageDtoList);
        for(Image element : images){
            element.setVariant(variant);
            imageRepository.save(element);
        }
        assert variant != null;
        return variant.getImages();
    }
}
