package com.grownited.controller;

import java.util.List;
import java.util.Locale.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.dto.SubCategoryDto;
import com.grownited.entity.CategoryEntity;
import com.grownited.entity.SubcategoryEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.SubcategoryRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class SubcategoryController {

	@Autowired
	SubcategoryRepository subcategoryRepo;
	@Autowired
	CategoryRepository categoryRepo;
	@Autowired
	UserRepository userRepo;
	
	@GetMapping("/newsubcategory")
	public String newSubcategory(Model model) {
	    List<CategoryEntity> categoryList = categoryRepo.findAll();
	    List<UserEntity> userList = userRepo.findByRole("USER");
	    model.addAttribute("categoryList", categoryList);
	    model.addAttribute("userList", userList); // ✅ add this
	    return "NewSubcategory";
	}

	
	@PostMapping("/savesubcategory")
	public String saveSubcategory(SubcategoryEntity subcategory, @RequestParam Integer userId) {
	    subcategory.setUserId(userId);
	    subcategoryRepo.save(subcategory);
	    return "redirect:/listsubcategory";
	}

	
	@GetMapping("/listsubcategory")
	public String listSubcategory(Model model) {
		List<SubCategoryDto> subcategoryList = subcategoryRepo.getAllSub();
		model.addAttribute("subcategoryList", subcategoryList);
		for(SubCategoryDto s:subcategoryList) {
			System.out.println(s);
			System.out.println(s.getCategoryName());
		}
		
		return "ListSubcategory";
	}
	
	@GetMapping("/deletesubcategory")
	public String deleteSubcategory(@RequestParam Integer subcategoryId) {
		subcategoryRepo.deleteById(subcategoryId);
		return "redirect:/listsubcategory";
	}
	
	@GetMapping("/getSubcategoriesByCategory")
	@ResponseBody
	public List<SubcategoryEntity> getSubcategoriesByCategory(@RequestParam Integer categoryId) {
	    return subcategoryRepo.findByCategoryId(categoryId);
	}

	
	

	
}