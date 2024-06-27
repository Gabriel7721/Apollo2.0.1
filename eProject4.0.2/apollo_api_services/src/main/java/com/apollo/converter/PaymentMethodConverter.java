package com.apollo.converter;

import com.apollo.entity.PaymentMethod;
import com.apollo.payload.request.PaymentMethodRequest;
import com.apollo.payload.response.PaymentMethodResponse;


public interface PaymentMethodConverter {
    PaymentMethodResponse convertToDto(PaymentMethod paymentMethod);
    PaymentMethod convertToEntity(PaymentMethodRequest paymentMethodRequest);
}
