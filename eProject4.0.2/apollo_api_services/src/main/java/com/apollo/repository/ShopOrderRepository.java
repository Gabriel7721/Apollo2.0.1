package com.apollo.repository;

import com.apollo.entity.ShopOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShopOrderRepository extends JpaRepository<ShopOrder, Long> {
    ShopOrder findByUserId(Long userId);
}
