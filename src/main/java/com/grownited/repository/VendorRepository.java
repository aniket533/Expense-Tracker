package com.grownited.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import com.grownited.entity.VendorEntity;

public interface VendorRepository extends JpaRepository<VendorEntity, Integer> {

    // ✅ Used by user: to fetch user-specific + global vendors
    List<VendorEntity> findByUserIdOrUserIdIsNull(Integer userId);
    List<VendorEntity> findByUserId(Integer userId);
    List<VendorEntity> findByUserId(Long userId);

}
