package com.apollo.converter;

import com.apollo.entity.ShopOrder;
import com.apollo.payload.request.ShopOrderRequest;
import com.apollo.payload.response.ShopOrderResponse;

public interface ShopOrderConverter {
    ShopOrderResponse convertToDto(ShopOrder shopOrder);
    ShopOrder convertToEntity(ShopOrderRequest shopOrderRequest);
}
