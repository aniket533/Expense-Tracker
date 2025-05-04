package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    private SubcategoryRepository subcategoryRepo;

    @Autowired
    private CategoryRepository categoryRepo;

    /**
     * Display form for creating a new subcategory.
     */
    @GetMapping("/usernewsubcategory")
    public String usernewSubcategory(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user != null) {
            Integer userId = user.getUserId();
            List<CategoryEntity> categoryList = categoryRepo.findByUserId(userId);
            model.addAttribute("categoryList", categoryList);
        } else {
            return "redirect:/login"; // Fallback if session expired
        }

        return "UserNewSubcategory";
    }

    /**
     * Save subcategory for the logged-in user.
     */
    @PostMapping("/usersavesubcategory")
    public String usersaveSubcategory(SubcategoryEntity subcategory, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            subcategory.setUserId(userId);
            subcategoryRepo.save(subcategory);
        }

        return "redirect:/userlistsubcategory";
    }

    /**
     * List all subcategories for the current user.
     */
    @GetMapping("/userlistsubcategory")
    public String userlistSubcategory(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            List<SubCategoryDto> subcategoryList = subcategoryRepo.getSubcategoriesByUserId(userId);
            model.addAttribute("subcategoryList", subcategoryList);
        }

        return "UserListSubcategory";
    }

    /**
     * Delete a subcategory owned by the logged-in user.
     */
    @GetMapping("/userdeletesubcategory")
    public String userdeleteSubcategory(@RequestParam Integer subcategoryId, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId != null) {
            SubcategoryEntity subcategory = subcategoryRepo.findById(subcategoryId).orElse(null);

            if (subcategory != null && subcategory.getUserId().equals(userId)) {
                subcategoryRepo.deleteById(subcategoryId);
            }
        }

        return "redirect:/userlistsubcategory";
    }

    /**
     * AJAX endpoint to return subcategories by category ID and user ID.
     */
    @GetMapping("/user/subcategory/bycategory")
    @ResponseBody
    public List<SubcategoryEntity> getSubcategoriesByCategoryAndUser(
            @RequestParam("categoryId") Integer categoryId,
            @RequestParam("userId") Integer userId) {

        System.out.println("Fetching subcategories for categoryId: " + categoryId + ", userId: " + userId);
        List<SubcategoryEntity> result = subcategoryRepo.findByCategoryIdAndUserId(categoryId, userId);
        System.out.println("Found " + result.size() + " subcategories");
        return result;
    }
}
