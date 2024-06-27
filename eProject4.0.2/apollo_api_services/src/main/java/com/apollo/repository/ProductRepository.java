package com.apollo.repository;

import com.apollo.entity.Product;
import com.apollo.entity.Store;
import com.apollo.entity.StoreCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {
    Optional<Product> findById(Long id);
    List<Product> findAll();
    List<Product> findByTitleContaining(String text);

    List<Product> findAllByStore(Store store);
    List<Product> findAllByStoreCategory(StoreCategory storeCategory);
}

