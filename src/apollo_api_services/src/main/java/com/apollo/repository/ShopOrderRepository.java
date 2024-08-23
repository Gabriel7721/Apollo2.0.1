package com.apollo.repository;

import com.apollo.entity.ShopOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopOrderRepository extends JpaRepository<ShopOrder, Long> {
    ShopOrder findByUserId(Long userId);

    @Query("SELECT so FROM ShopOrder so WHERE so.user.id = :userId")
//    List<ShopOrder> findAllByUserId(@Param("userId") Long userId);
    List<ShopOrder> findAllByUserId(Long userId);
}
