package com.apollo.controller;

import com.apollo.dto.StoreCategoryDTO;
import com.apollo.service.StoreCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/store-category")
public class StoreCategoryController {
    @Autowired
    private StoreCategoryService iStoreCategoryService;

    @PostMapping("/{storeId}")
    public List<StoreCategoryDTO> createListStoreCategory(@RequestBody List<String> storeCateList,@PathVariable Long storeId){
        return iStoreCategoryService.createStoreCategories(storeCateList,storeId);
    }
}
