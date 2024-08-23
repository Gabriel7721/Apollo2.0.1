package com.apollo.dto;
import java.util.List;
import java.util.stream.Collectors;

import com.apollo.entity.OptionValue;
import com.apollo.entity.Variant;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;


@Data
@Builder
@AllArgsConstructor
public class VariantDTO {
    private Long id;
    private String name;
    private String skuCode;
    private int stockQuantity;
    private double weight;
    private double price;
    private double salePrice;
    private String img;
    private Long productId;
    private Boolean isDeleted;
    private List<OptionValueDTO> optionValueDTOList;
    private List<ImageDTO> imageDTOList;
    private List<VideoDTO> videoDTOList;
    private List<ReviewDTO> reviewDTOList;
    private List<Long> optionValueIds;

    public VariantDTO() {
    }

    public VariantDTO(Variant variant) {
        this.id = variant.getId();
        this.name = variant.getName();
        this.skuCode = variant.getSkuCode();
        this.stockQuantity = variant.getStockQuantity();
        this.weight = variant.getWeight();
        this.price = variant.getPrice();
        this.salePrice = variant.getSalePrice();
        this.img = variant.getImg();
        this.isDeleted = variant.getIsDeleted();
        this.productId = variant.getProduct().getId();
        this.optionValueIds = variant.getOptionValues().stream()
                .map(OptionValue::getId)
                .collect(Collectors.toList());
    }
}
