package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "variant")
public class Variant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String skuCode;
    private int stockQuantity;
    private double weight;
    private double price;
    private double salePrice;
    private String img;
    private Boolean isDeleted;

    @ManyToOne
    @JoinColumn(name = "product_id")
    @JsonBackReference(value = "product_variant")
    private Product product;

    @OneToMany(mappedBy = "variant")
    @JsonManagedReference(value = "variant_image")
    private List<Image> images;

    @OneToMany(mappedBy = "variant")
    @JsonManagedReference(value = "variant_video")
    private List<Video> videos;

    @ManyToMany(fetch = FetchType.EAGER)
    @JsonManagedReference(value = "optionValue_variant")
    @JoinTable(name = "variant_optionvalue", joinColumns = @JoinColumn(name = "variant_id"), inverseJoinColumns = @JoinColumn(name = "optionvalue_id"))
    private List<OptionValue> optionValues;

    @OneToOne(mappedBy = "variant")
    @JsonBackReference(value = "variant_cartLine")
    private CartLine cartLine;

    @OneToOne(mappedBy = "variant")
    private SaveForLater saveForLater;

    @OneToMany(mappedBy = "variant")
    @JsonManagedReference(value = "variant_review")
    private List<Review> reviews;

    @OneToMany(mappedBy = "variant")
    @JsonManagedReference(value = "variant_shopOrder")
    private Set<ShopOrder> shopOrders;
}
