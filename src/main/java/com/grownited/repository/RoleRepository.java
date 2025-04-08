package com.grownited.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grownited.entity.RoleEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Integer> {
	
	 Optional<RoleEntity> findByRoleName(String roleName); 
	
}