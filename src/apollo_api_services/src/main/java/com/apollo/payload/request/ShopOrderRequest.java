package com.apollo.payload.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopOrderRequest {
    Long userId;
    List<OrderItemRequest> orderItems;
    String orderDate;
    Long addressId;
    Long paymentMethodId;
    Long shippingMethodId;
    Double orderTotal;
}

