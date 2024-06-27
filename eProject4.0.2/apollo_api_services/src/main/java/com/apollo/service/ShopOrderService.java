package com.apollo.service;

import com.apollo.payload.request.ShopOrderRequest;
import com.apollo.payload.response.ShopOrderResponse;

import java.util.List;

public interface ShopOrderService {
    ShopOrderResponse findShopOrder(Long userId);
    List<ShopOrderResponse> createShopOrder(List<ShopOrderRequest> shopOrderRequest);
}
