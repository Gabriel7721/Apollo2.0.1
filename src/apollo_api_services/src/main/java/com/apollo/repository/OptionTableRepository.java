package com.apollo.repository;

import com.apollo.entity.OptionTable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OptionTableRepository  extends JpaRepository<OptionTable, Long> {
}
