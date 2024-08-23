package com.apollo.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.apollo.converter.StoreCategoryConverter;
import com.apollo.converter.StoreConverter;
import com.apollo.dto.StoreCategoryDTO;
import com.apollo.dto.StoreDTO;
import com.apollo.entity.Admin;
import com.apollo.entity.Store;
import com.apollo.entity.StoreCategory;
import com.apollo.payload.request.AddStoreRequest;
import com.apollo.repository.AdminRepository;
import com.apollo.repository.StoreRepository;
import com.apollo.service.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

    private final StoreRepository repo;
    private final StoreConverter convert;
    private final AdminRepository adminRepository;
    private final StoreCategoryConverter storeCategoryConverter;

    public StoreServiceImpl(StoreRepository repo, StoreConverter convert, AdminRepository adminRepository,
            StoreCategoryConverter storeCategoryConverter) {
        this.repo = repo;
        this.convert = convert;
        this.adminRepository = adminRepository;
        this.storeCategoryConverter = storeCategoryConverter;
    }

    @Override
    public List<StoreDTO> getAllStores() {
        List<Store> stores = repo.findAll();
        List<StoreDTO> dto = convert.entitiesToDTOs(stores);
        return dto;
    }

    @Override
    public StoreDTO findStore(Long id) {
        Store store = repo.findById(id).orElse(null);
        List<StoreCategory> storeCategories = store.getStoreCategoryList();
        List<StoreCategoryDTO> storeCategoryDTOS = new ArrayList<>();
        List<StoreCategoryDTO> parentStoreCategoryDTOS = new ArrayList<>();
        for (StoreCategory storeCategory : storeCategories) {
            StoreCategoryDTO storeCategoryDTO = storeCategoryConverter.convertEntityToDTO(storeCategory);
            storeCategoryDTOS.add(storeCategoryDTO);
            StoreCategory parentStoreCategory = storeCategory.getParentStoreCategory();
            if (parentStoreCategory != null) {
                StoreCategoryDTO parentStoreCategoryDTO = storeCategoryConverter
                        .convertEntityToDTO(parentStoreCategory);
                parentStoreCategoryDTOS.add(parentStoreCategoryDTO);
            }
        }
        StoreDTO storeDto = convert.entityToDTO(store);
        storeDto.setStoreCategoryList(storeCategoryDTOS);
        return storeDto;
    }

    @Override
    public StoreDTO createStore(Long adminId, AddStoreRequest storeDto) {
        Admin admin = adminRepository.findById(adminId).orElseThrow(
                () -> new UsernameNotFoundException("admin not found"));
        Store store = new Store();
        store.setName(storeDto.getName());
        store.setDealsImage(
                "https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/1f6cbd86-1e6a-42d5-bd7c-e137bfef3fc6._CR0%2C0%2C3000%2C600_SX1920_.jpg");
        store.setHomeImage("https://congluan-cdn.congluan.vn/files/dieulinh/2020/07/16/st2-0904.jpg");
        store.setDealsSquareImage("https://i.ytimg.com/vi/YczCAwQ3wgs/maxresdefault.jpg");
        store.setInteractiveImage(
                "https://png.pngtree.com/background/20210715/original/pngtree-black-friday-neon-lights-pink-background-banner-picture-image_1266832.jpg");
        store.setLogo("https://img.pikbest.com/origin/06/53/62/292pIkbEsTqDa.jpg!w700wp");
        store.setAdmin(admin);
        repo.save(store);
        return convert.entityToDTO(store);
    }

    @Override
    public StoreDTO deleteStore(Long id) {
        Store store = repo.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Store not found"));
        repo.delete(store);
        return convert.entityToDTO(store);
    }
}
