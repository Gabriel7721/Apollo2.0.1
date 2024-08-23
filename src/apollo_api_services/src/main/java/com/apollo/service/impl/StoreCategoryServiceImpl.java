package com.apollo.service.impl;

import com.apollo.converter.StoreCategoryConverter;
import com.apollo.dto.StoreCategoryDTO;
import com.apollo.entity.Store;
import com.apollo.entity.StoreCategory;
import com.apollo.repository.StoreCategoryRepository;
import com.apollo.repository.StoreRepository;
import com.apollo.service.StoreCategoryService;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

@Service
public class StoreCategoryServiceImpl implements StoreCategoryService {

    private final StoreCategoryRepository storeCategoryRepository;
    private final StoreRepository storeRepository;
    private final StoreCategoryConverter storeCategoryConverter;

    public StoreCategoryServiceImpl(StoreCategoryRepository storeCategoryRepository, StoreRepository storeRepository, StoreCategoryConverter storeCategoryConverter) {
        this.storeCategoryRepository = storeCategoryRepository;
        this.storeRepository = storeRepository;
        this.storeCategoryConverter = storeCategoryConverter;
    }

    @Override
    public List<StoreCategoryDTO> getStoreCategories() {
        List<StoreCategory> storeCategories = storeCategoryRepository.findAll();
        return storeCategoryConverter.convertEntitiesToDTOs(storeCategories);
    }

    @Override
    public List<StoreCategoryDTO> getStoreCategoriesByStoreId(Long storeId) {
        List<StoreCategory> storeCategories = storeCategoryRepository.findByStoreId(storeId);
        return storeCategoryConverter.convertEntitiesToDTOs(storeCategories);
    }

    public StoreCategoryDTO createOrUpdateStoreCategory(StoreCategoryDTO storeCategoryDTO) {
        Store store = storeRepository.findById(storeCategoryDTO.getStoreId())
                .orElseThrow(() -> new RuntimeException("Store not found"));

        StoreCategory storeCategory = storeCategoryConverter.dtoToEntity(storeCategoryDTO);
        storeCategory.setStore(store);

        StoreCategory savedStoreCategory = storeCategoryRepository.save(storeCategory);
        return storeCategoryConverter.convertEntityToDTO(savedStoreCategory);
    }

    public void deleteStoreCategory(Long id) {
        storeCategoryRepository.deleteById(id);
    }

    @Override
    public List<StoreCategoryDTO> createStoreCategories(List<String> storeCateList, Long storeId) {
        List<StoreCategory> storeCategories = new ArrayList<>();
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new EntityNotFoundException("Store not found"));
        for (String element : storeCateList) {
            StoreCategoryDTO storeCategoryDTO = getStoreCategoryDTO(element);
            StoreCategory storeCategory = storeCategoryConverter.dtoToEntity(storeCategoryDTO);
            storeCategory.setStore(store);
            storeCategories.add(storeCategoryRepository.save(storeCategory));
        }
        return storeCategoryConverter.convertEntitiesToDTOs(storeCategories);
    }

    private static StoreCategoryDTO getStoreCategoryDTO(String element) {
        StoreCategoryDTO storeCategoryDTO = new StoreCategoryDTO();
        storeCategoryDTO.setHeroImage("https://m.media-amazon.com/images/S/aplus-media-library-service-media/721c2b2d-4528-481e-b722-6b5b44937046.__CR0,0,300,225_PT0_SX300_V1___.jpg");
        storeCategoryDTO.setSquareImage("https://m.media-amazon.com/images/S/stores-image-uploads-na-prod/e/AmazonStores/ATVPDKIKX0DER/946799e337c1bb687ede3fabb0c39d27.w784.h816._CR72%2C206%2C624%2C400_SX200_.png");
        storeCategoryDTO.setName(element);
        return storeCategoryDTO;
    }

    @Override
    public StoreCategoryDTO createStoreCategory(StoreCategoryDTO storeCategoryDTO, Long storeCategoryId) {
        return null;
    }
}
