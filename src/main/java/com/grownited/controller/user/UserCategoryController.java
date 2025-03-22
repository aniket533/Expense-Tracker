package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.CategoryEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CategoryRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserCategoryController {
	
	@Autowired
	CategoryRepository categoryRepo;
	
	@GetMapping("/usernewcategory")
	public String usernewCategory() {
		return "UserNewCategory";
	}
	
	@PostMapping("/usersavecategory")
	public String usersaveCategory(CategoryEntity category) {
		categoryRepo.save(category);
		return "redirect:/userlistcategory";
	}
	
	@GetMapping("/userlistcategory")
	public String userlistCategory(Model model) {
		List<CategoryEntity> categoryList = categoryRepo.findAll();
		model.addAttribute("categoryList", categoryList);
		return "UserListCategory";
	}
	
	@GetMapping("/userdeletecategory")
	public String userdeleteCategory(@RequestParam Integer categoryId) {
		categoryRepo.deleteById(categoryId);
		return "redirect:/userlistcategory";
	}
}