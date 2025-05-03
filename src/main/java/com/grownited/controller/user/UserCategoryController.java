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
    
    @Autowired
    HttpSession session;
    
    @GetMapping("/usernewcategory")
    public String usernewCategory() {
        return "UserNewCategory";
    }
    
    @PostMapping("/usersavecategory")
    public String usersaveCategory(CategoryEntity category) {
        // Set current user's ID to the category
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            category.setUserId(user.getUserId());
        }
        categoryRepo.save(category);
        return "redirect:/userlistcategory";
    }
    
    @GetMapping("/userlistcategory")
    public String userlistCategory(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        List<CategoryEntity> categoryList;
        
        if (user != null) {
            // Get only categories for current user or global categories (where userId is null)
            categoryList = categoryRepo.findByUserIdOrUserIdIsNull(user.getUserId());
        } else {
            // If not logged in, show only global categories
            categoryList = categoryRepo.findByUserIdIsNull();
        }
        
        model.addAttribute("categoryList", categoryList);
        return "UserListCategory";
    }
    
    @GetMapping("/userdeletecategory")
    public String userdeleteCategory(@RequestParam Integer categoryId, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            // Only delete if the category belongs to the current user
            CategoryEntity category = categoryRepo.findById(categoryId).orElse(null);
            if (category != null && (category.getUserId() == null || category.getUserId().equals(user.getUserId()))) {
                categoryRepo.deleteById(categoryId);
            }
        }
        return "redirect:/userlistcategory";
    }
}