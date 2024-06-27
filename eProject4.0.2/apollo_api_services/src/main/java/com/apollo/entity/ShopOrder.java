package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "shop_order")
public class ShopOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference(value = "user_shopOrder")
    private User user;

    @ManyToOne
    @JoinColumn(name = "shipper_id")
    private Shipper shipper;

    @ManyToOne
    @JoinColumn(name = "variant_id", nullable = false)
    @JsonBackReference(value = "variant_shopOrder")
    private Variant variant;

    @Column(name = "order_date")
    private String orderDate;

    @ManyToOne
    @JoinColumn(name = "address_id")
    @JsonBackReference(value = "address_shopOrder")
    private Address address;

    @ManyToOne
    @JoinColumn(name = "payment_method_id")
    @JsonManagedReference(value = "paymentMethod_shopOrder")
    private PaymentMethod paymentMethod;

    @ManyToOne
    @JoinColumn(name = "shipping_method_id")
    @JsonManagedReference(value = "shippingMethod_shopOrder")
    private ShippingMethod shippingMethod;

    private int quantity;

    @Column(name = "order_total")
    private Double orderTotal;
}

