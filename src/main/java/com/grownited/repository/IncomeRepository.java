package com.grownited.repository;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.IncomeEntity;

public interface IncomeRepository extends JpaRepository<IncomeEntity, Integer> {
    @EntityGraph(attributePaths = {"user", "account"})
    List<IncomeEntity> findAll();
    
    @EntityGraph(attributePaths = {"user", "account"})
    List<IncomeEntity> findByUserId(Integer userId);
    
    boolean existsByAccountId(Integer accountId);

}