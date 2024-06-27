package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "store_category")
public class StoreCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String heroImage;
    private String squareImage;

    @ManyToOne
    @JoinColumn(name="store_id")
    @JsonBackReference(value = "store_category")
    private Store store;

    @ManyToOne
    @JoinColumn(name="parent_store_Category_Id")
    private StoreCategory parentStoreCategory;

    @OneToMany(mappedBy = "storeCategory")
    @JsonManagedReference(value = "product_storeCategory")
    private List<Product> productList;

    @OneToMany(mappedBy ="storeCategory")
    @JsonManagedReference(value = "storeCategory_image")
    private List<Image> imageList;

    @OneToMany(mappedBy ="storeCategory")
    @JsonManagedReference(value = "storeCategory_video")
    private List<Video> videoList;

}
