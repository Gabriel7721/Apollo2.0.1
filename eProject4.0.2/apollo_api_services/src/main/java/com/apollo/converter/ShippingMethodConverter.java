package com.apollo.converter;

import com.apollo.entity.ShippingMethod;
import com.apollo.payload.response.ShippingMethodResponse;

public interface ShippingMethodConverter {
    ShippingMethodResponse convertToDto(ShippingMethod shippingMethod);
}
