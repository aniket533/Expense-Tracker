package com.grownited.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.grownited.dto.SubCategoryDto;
import com.grownited.entity.SubcategoryEntity;

public interface SubcategoryRepository extends JpaRepository<SubcategoryEntity, Integer> {

    // Admin: Fetch all subcategories with category & user info
    @Query(value = "SELECT s.subcategory_id AS subCategoryId, " +
                   "s.category_id AS categoryId, " +
                   "s.subcategory_name AS subCategoryName, " +
                   "c.category_name AS categoryName, " +
                   "s.user_id AS userId " +
                   "FROM subcategories s " +
                   "JOIN categories c ON c.category_id = s.category_id", 
           nativeQuery = true)
    List<SubCategoryDto> getAllSub();

    // User-specific subcategories
    @Query(value = "SELECT s.subcategory_id AS subCategoryId, " +
                   "s.category_id AS categoryId, " +
                   "s.subcategory_name AS subCategoryName, " +
                   "c.category_name AS categoryName, " +
                   "s.user_id AS userId " +
                   "FROM subcategories s " +
                   "JOIN categories c ON c.category_id = s.category_id " +
                   "WHERE s.user_id = :userId", 
           nativeQuery = true)
    List<SubCategoryDto> getSubcategoriesByUserId(Integer userId);

    // Filtering
    List<SubcategoryEntity> findByUserIdAndCategoryId(Integer userId, Integer categoryId);
    List<SubcategoryEntity> findByUserId(Integer userId);
    List<SubcategoryEntity> findByCategoryId(Integer categoryId);
    List<SubcategoryEntity> findByUserIdAndCategoryId(Long userId, Long categoryId);

}
