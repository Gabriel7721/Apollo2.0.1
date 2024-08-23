package com.apollo.service;

import java.util.List;

import com.apollo.dto.ShopOrderDto;
import com.apollo.dto.order_sumary.OrderSummaryDTO;
import com.apollo.payload.request.ShopOrderRequest;
import com.apollo.payload.response.ShopOrderResponse;

public interface ShopOrderService {
    List<ShopOrderDto> getAllShopOrders();
    ShopOrderDto getShopOrder(Long shopOrderId);
    List<ShopOrderResponse> createShopOrder(List<ShopOrderRequest> shopOrderRequest);
    ShopOrderResponse acceptOrder(Long id);
    List<OrderSummaryDTO> getShopOrders(Long userId);
}
