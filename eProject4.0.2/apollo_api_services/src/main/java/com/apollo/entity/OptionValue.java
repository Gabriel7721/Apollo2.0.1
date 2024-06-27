package com.apollo.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "optionvalue")
public class OptionValue {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String value;

    @ManyToOne
    @JoinColumn(name = "option_id")
    @JsonBackReference(value = "optionTable_optionValue")
    private OptionTable optionTable;

    @ManyToMany(mappedBy = "optionValues")
    @JsonBackReference(value = "optionValue_variant")
    private List<Variant> variants ;
    public List<Variant> getVariants() {
        if (variants == null) {
            variants = new ArrayList<>();
        }
        return variants;
    }
}
