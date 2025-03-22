package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.dto.SubCategoryDto;
import com.grownited.entity.CategoryEntity;
import com.grownited.entity.SubcategoryEntity;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.SubcategoryRepository;

@Controller
public class UserSubcategoryController {

	@Autowired
	SubcategoryRepository subcategoryRepo;
	@Autowired
	CategoryRepository categoryRepo;
	
	@GetMapping("/usernewsubcategory")
	public String usernewSubcategory(Model model) {
		List<CategoryEntity> categoryList = categoryRepo.findAll();
		model.addAttribute("categoryList", categoryList);
		return "UserNewSubcategory";
	}
	
	@PostMapping("/usersavesubcategory")
	public String usersaveSubcategory(SubcategoryEntity subcategory) {
		subcategoryRepo.save(subcategory);
		return "redirect:/userlistsubcategory";
	}
	
	@GetMapping("/userlistsubcategory")
	public String userlistSubcategory(Model model) {
		List<SubCategoryDto> subcategoryList = subcategoryRepo.getAllSub();
		model.addAttribute("subcategoryList", subcategoryList);
		for(SubCategoryDto s:subcategoryList) {
			System.out.println(s);
			System.out.println(s.getCategoryName());
		}
		
		return "UserListSubcategory";
	}
	
	@GetMapping("/userdeletesubcategory")
	public String userdeleteSubcategory(@RequestParam Integer subcategoryId) {
		subcategoryRepo.deleteById(subcategoryId);
		return "redirect:/userlistsubcategory";
	}
}