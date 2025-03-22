package com.grownited.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.grownited.dto.SubCategoryDto;
import com.grownited.entity.SubcategoryEntity;

public interface SubcategoryRepository extends JpaRepository<SubcategoryEntity, Integer> {

	@Query(value = "select s.subcategory_id as subCategoryId,s.category_id as categoryId,s.subcategory_name as subCategoryName  ,c.category_name as categoryName from subcategories s,categories c where s.category_id = s.category_id ",nativeQuery = true)
	public List<SubCategoryDto> getAllSub();
}