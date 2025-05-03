package com.grownited.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.VendorEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
	 List<CategoryEntity> findByUserIdOrUserIdIsNull(Integer userId);

	List<CategoryEntity> findByUserIdIsNull();
	List<CategoryEntity> findByUserId(Integer userId);
	
	List<CategoryEntity> findByUserId(Long userId);

	
}