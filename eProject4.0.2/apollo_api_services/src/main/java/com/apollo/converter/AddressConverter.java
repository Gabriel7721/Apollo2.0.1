package com.apollo.converter;

import com.apollo.entity.Address;
import com.apollo.payload.request.AddressRequest;
import com.apollo.payload.response.AddressResponse;

public interface AddressConverter {
    AddressResponse convertToDto(Address address);
    Address convertToEntity(AddressRequest addressRequest);
}
