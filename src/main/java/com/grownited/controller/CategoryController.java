package com.grownited.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.UserRepository;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryRepository categoryRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@GetMapping("/newcategory")
	public String newCategory(Model model) {
	    List<UserEntity> userList = userRepo.findByRole("USER");
	    model.addAttribute("userList", userList);
	    return "NewCategory";
	}

	@PostMapping("/savecategory")
	public String saveCategory(CategoryEntity category, @RequestParam(required = false) Integer userId) {
	    if (userId != null) {
	        category.setUserId(userId);
	    } else {
	        category.setUserId(null); // Global category
	    }
	    categoryRepo.save(category);
	    return "redirect:/listcategory";
	}

	
	
	@GetMapping("/deletecategory")
	public String deleteCategory(@RequestParam Integer categoryId) {
		categoryRepo.deleteById(categoryId);
		return "redirect:/listcategory";
	}
	
	@GetMapping("/listcategory")
	public String listCategory(Model model) {
		List<CategoryEntity> categoryList = categoryRepo.findAll();
		model.addAttribute("categoryList", categoryList);
		return "ListCategory";
	}
	
	@GetMapping("/getcategoriesbyuser")
	public ResponseEntity<List<CategoryEntity>> getCategoriesByUser(@RequestParam Integer userId) {
	    List<CategoryEntity> categories = categoryRepo.findByUserId(userId);
	    return ResponseEntity.ok(categories);
	}

}