package com.apollo.service;

import com.apollo.dto.StoreCategoryDTO;

import java.util.List;

public interface StoreCategoryService {
    List<StoreCategoryDTO> createStoreCategories(List<String> storeCateList, Long storeId);

    StoreCategoryDTO createStoreCategory(StoreCategoryDTO storeCategoryDTO, Long storeCategoryId);
}
