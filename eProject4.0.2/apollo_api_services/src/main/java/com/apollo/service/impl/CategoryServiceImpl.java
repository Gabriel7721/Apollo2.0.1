package com.apollo.service.impl;

import com.apollo.converter.CategoryConverter;
import com.apollo.dto.CategoryDTO;
import com.apollo.entity.Category;
import com.apollo.repository.CategoryRepository;
import com.apollo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CategoryConverter iCategoryConverter;
    @Override
    public List<CategoryDTO> findByText(String text) {
        List<Category> categories = categoryRepository.findByAttributeContaining(text);
        List<CategoryDTO> categoryDtoList = iCategoryConverter.entitiesToDTOs(categories);
        return categoryDtoList;
    }

    @Override
    public CategoryDTO findCategory(Long categoryId) {
        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() -> new EntityNotFoundException("category not found"));
        CategoryDTO categoryDto = iCategoryConverter.entityToDTO(category);
        return categoryDto;
    }
}
