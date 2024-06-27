package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "shippers")
public class Shipper {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "shipper_name")
    private String shipperName;

    @Column(name = "password")
    private String password;

    @Column(name = "enabled")
    private boolean enabled;

    @OneToMany(mappedBy = "shipper")
    @JsonManagedReference(value = "shipper_address")
    private Set<Address> address;

    @Column(name = "email")
    private String email;

    @Column(name = "role")
    private String role;

    @OneToOne(mappedBy = "shipper")
    private Cart cart;

    @OneToMany(mappedBy = "shipper")
    private Set<ShopOrder> shopOrders;

    @OneToMany(mappedBy = "customer")
    @JsonManagedReference(value = "shipper_review")
    private List<Review> reviewList;

}
