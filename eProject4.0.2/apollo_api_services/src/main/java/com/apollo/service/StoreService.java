package com.apollo.service;

import com.apollo.dto.StoreDTO;
import com.apollo.payload.request.AddStoreRequest;

public interface StoreService {

    StoreDTO findStore(Long id);

    StoreDTO createStore(Long sellerId, AddStoreRequest storeDto);
}
