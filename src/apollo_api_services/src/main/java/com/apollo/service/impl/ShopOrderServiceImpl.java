package com.apollo.service.impl;

import com.apollo.converter.ShopOrderConverter;
import com.apollo.dto.ShopOrderDto;
import com.apollo.dto.order_sumary.OrderItemSummaryDTO;
import com.apollo.dto.order_sumary.OrderSummaryDTO;
import com.apollo.entity.*;
import com.apollo.payload.request.OrderItemRequest;
import com.apollo.payload.request.ShopOrderRequest;
import com.apollo.payload.response.ShopOrderResponse;
import com.apollo.repository.*;
import com.apollo.service.EmailService;
import com.apollo.service.ShopOrderService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class ShopOrderServiceImpl implements ShopOrderService {

    private final ShopOrderRepository shopOrderRepository;

    private final ShopOrderConverter shopOrderConverter;

    private final UserRepository userRepository;

    private final VariantRepository variantRepository;

    private final AddressRepository addressRepository;

    private final PaymentMethodRepository paymentMethodRepository;

    private final ShippingMethodRepository shippingMethodRepository;

    private final EmailService emailService;

    public ShopOrderServiceImpl(ShopOrderRepository shopOrderRepository, ShopOrderConverter shopOrderConverter, UserRepository userRepository, VariantRepository variantRepository, AddressRepository addressRepository, PaymentMethodRepository paymentMethodRepository, ShippingMethodRepository shippingMethodRepository, EmailService emailService) {
        this.shopOrderRepository = shopOrderRepository;
        this.shopOrderConverter = shopOrderConverter;
        this.userRepository = userRepository;
        this.variantRepository = variantRepository;
        this.addressRepository = addressRepository;
        this.paymentMethodRepository = paymentMethodRepository;
        this.shippingMethodRepository = shippingMethodRepository;
        this.emailService = emailService;
    }

    @Override
    public List<OrderSummaryDTO> getShopOrders(Long userId) {
        List<ShopOrder> shopOrders = shopOrderRepository.findAllByUserId(userId);
        return shopOrders.stream()
                .map(this::convertToSummaryDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<ShopOrderDto> getAllShopOrders() {
        List<ShopOrder> shopOrders = shopOrderRepository.findAll();
        return shopOrderConverter.entitiesToDTOs(shopOrders);
    }

    @Override
    public ShopOrderDto getShopOrder(Long shopOrderId) {
        ShopOrder shopOrder = shopOrderRepository.findById(shopOrderId).get();
        return shopOrderConverter.entityToDTO(shopOrder);
    }

    @Override
    public List<ShopOrderResponse> createShopOrder(List<ShopOrderRequest> shopOrderRequests) {
        List<ShopOrderResponse> responses = new ArrayList<>();

        for (ShopOrderRequest request : shopOrderRequests) {
            ShopOrder shopOrder = new ShopOrder();

            User user = userRepository.findById(request.getUserId())
                    .orElseThrow(() -> new RuntimeException("User not found"));
            shopOrder.setUser(user);

            shopOrder.setOrderDate(LocalDateTime.now().toString());

            Address address = addressRepository.findById(request.getAddressId())
                    .orElseThrow(() -> new RuntimeException("Address not found"));
            shopOrder.setAddress(address);

            PaymentMethod paymentMethod = paymentMethodRepository.findById(request.getPaymentMethodId())
                    .orElseThrow(() -> new RuntimeException("Payment method not found"));
            shopOrder.setPaymentMethod(paymentMethod);

            ShippingMethod shippingMethod = shippingMethodRepository.findById(request.getShippingMethodId())
                    .orElseThrow(() -> new RuntimeException("Shipping method not found"));
            shopOrder.setShippingMethod(shippingMethod);

            // Process order items
            for (OrderItemRequest itemRequest : request.getOrderItems()) {
                OrderItem orderItem = new OrderItem();
                Variant variant = variantRepository.findById(itemRequest.getVariantId())
                        .orElseThrow(() -> new RuntimeException("Variant not found"));
                orderItem.setVariant(variant);
                orderItem.setQuantity(itemRequest.getQuantity());
                orderItem.setPrice(itemRequest.getPrice());
                orderItem.setOrder(shopOrder);
                shopOrder.getOrderItems().add(orderItem);
            }

            // Calculate and set order total
            shopOrder.setOrderTotal(shopOrder.calculateOrderTotal() + shippingMethod.getPrice());

            // Set initial status
            shopOrder.setStatus("PENDING");

            // Save the order
            ShopOrder savedOrder = shopOrderRepository.save(shopOrder);

            // Send payment email
            emailService.sendPaymentEmail(user);

            // Convert to response and add to list
            responses.add(shopOrderConverter.convertToDto(savedOrder));

        }

        return responses;
    }

    @Override
    public ShopOrderResponse acceptOrder(Long id) {
        ShopOrder order = shopOrderRepository.findById(id).get();
        order.setStatus("ACCEPTED");
        order.setDeliveryDate(new Date());
        shopOrderRepository.save(order);
        return shopOrderConverter.convertToDto(order);
    }

    private OrderSummaryDTO convertToSummaryDTO(ShopOrder shopOrder) {
        OrderSummaryDTO dto = new OrderSummaryDTO();
        dto.setId(shopOrder.getId());
        dto.setOrderDate(shopOrder.getOrderDate());
        dto.setStatus(shopOrder.getStatus());
        dto.setOrderTotal(shopOrder.getOrderTotal());

        List<OrderItemSummaryDTO> itemDTOs = shopOrder.getOrderItems().stream()
                .map(this::convertToOrderItemSummaryDTO)
                .collect(Collectors.toList());
        dto.setOrderItems(itemDTOs);

        return dto;
    }

    private OrderItemSummaryDTO convertToOrderItemSummaryDTO(OrderItem orderItem) {
        OrderItemSummaryDTO dto = new OrderItemSummaryDTO();
        dto.setVariantName(orderItem.getVariant().getName());
        dto.setQuantity(orderItem.getQuantity());
        dto.setPrice(orderItem.getPrice());
        return dto;
    }
}
