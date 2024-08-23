package com.apollo.converter;

import com.apollo.dto.ShippingMethodDto;
import com.apollo.entity.ShippingMethod;
import com.apollo.payload.response.ShippingMethodResponse;

public interface ShippingMethodConverter {
    ShippingMethodResponse convertToDto(ShippingMethod shippingMethod);
    ShippingMethodDto entityToDTO(ShippingMethod element);
    ShippingMethod dtoToEntity(ShippingMethodDto element);
}
