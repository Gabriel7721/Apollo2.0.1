package com.apollo.converter;

import java.util.List;

import com.apollo.dto.ShopOrderDto;
import com.apollo.entity.ShopOrder;
import com.apollo.payload.request.ShopOrderRequest;
import com.apollo.payload.response.ShopOrderResponse;

public interface ShopOrderConverter {
    List<ShopOrderDto> entitiesToDTOs(List<ShopOrder> element);
    ShopOrderDto entityToDTO(ShopOrder element);
    ShopOrderResponse convertToDto(ShopOrder shopOrder);
    ShopOrder convertToEntity(ShopOrderRequest shopOrderRequest);
}
