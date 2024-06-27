package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String district;
    private String ward;
    private String city;
    private String street;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference(value = "user_address")
    private User user;

    @ManyToOne
    @JoinColumn(name = "shipper_id")
    @JsonBackReference(value = "shipper_address")
    private Shipper shipper;

    @ManyToOne
    @JoinColumn(name = "admin_id")
    @JsonBackReference(value = "admin_address")
    private Admin admin;

    @OneToMany(mappedBy = "address")
    @JsonManagedReference(value = "address_shopOrder")
    private Set<ShopOrder> shopOrders;
}
