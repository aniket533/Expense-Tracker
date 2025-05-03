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
import com.grownited.entity.UserEntity;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.SubcategoryRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserSubcategoryController {

    @Autowired
    SubcategoryRepository subcategoryRepo;
    
    @Autowired
    CategoryRepository categoryRepo;
    
    @GetMapping("/usernewsubcategory")
    public String usernewSubcategory(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user != null) {
            Integer userId = user.getUserId();
            session.setAttribute("userId", userId);
            
            List<CategoryEntity> categoryList = categoryRepo.findByUserId(userId);
            model.addAttribute("categoryList", categoryList);
        }

        return "UserNewSubcategory";
    }

    
    @PostMapping("/usersavesubcategory")
    public String usersaveSubcategory(SubcategoryEntity subcategory, HttpSession session) {
        // Get logged-in user ID from session
        Integer userId = (Integer) session.getAttribute("userId");
        subcategory.setUserId(userId);
        subcategoryRepo.save(subcategory);
        return "redirect:/userlistsubcategory";
    }
    
    @GetMapping("/userlistsubcategory")
    public String userlistSubcategory(Model model, HttpSession session) {
        // Get logged-in user ID from session
        Integer userId = (Integer) session.getAttribute("userId");
        
        // Get only this user's subcategories
        List<SubCategoryDto> subcategoryList = subcategoryRepo.getSubcategoriesByUserId(userId);
        model.addAttribute("subcategoryList", subcategoryList);
        
        return "UserListSubcategory";
    }
    
    @GetMapping("/userdeletesubcategory")
    public String userdeleteSubcategory(@RequestParam Integer subcategoryId, HttpSession session) {
        // Optional: Add validation to ensure user can only delete their own subcategories
        Integer userId = (Integer) session.getAttribute("userId");
        SubcategoryEntity subcategory = subcategoryRepo.findById(subcategoryId).orElse(null);
        
        if (subcategory != null && subcategory.getUserId().equals(userId)) {
            subcategoryRepo.deleteById(subcategoryId);
        }
        
        return "redirect:/userlistsubcategory";
    }
}