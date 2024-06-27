package com.apollo.service;

import com.apollo.dto.CategoryDTO;

import java.util.List;

public interface CategoryService {
    List<CategoryDTO> findByText(String text);

    CategoryDTO findCategory(Long categoryId);
}
