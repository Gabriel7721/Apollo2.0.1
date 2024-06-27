package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(length = 2000)
    private String description;

    private String mainPicture;
    private String status;
    private Date createAt;
    private Date updatedAt;

    @ManyToOne
    @JoinColumn (name = "category_id")
    @JsonBackReference(value = "product_category")
    private Category category;

    @ManyToOne
    @JoinColumn(name ="store_category_id")
    @JsonBackReference(value = "product_storeCategory")
    private StoreCategory storeCategory;

    @ManyToOne
    @JoinColumn(name="store_id")
    @JsonBackReference(value = "store_product")
    private Store store;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference(value = "product_optionTable")
    private List<OptionTable> optionTables;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference(value = "product_variant")
    private List<Variant> variants;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference(value = "product_attribute")
    private List<ProductAttribute> productAttributes;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference(value = "product_hashTag")
    private List<HashTag> hashTagList;

    @OneToMany(mappedBy = "product")
    @JsonManagedReference(value = "product_bulletList")
    private List<Bullet> bulletList;


}
