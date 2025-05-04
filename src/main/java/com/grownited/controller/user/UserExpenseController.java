package com.grownited.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.entity.AccountEntity;
import com.grownited.entity.CategoryEntity;
import com.grownited.entity.ExpenseEntity;
import com.grownited.entity.StatusEntity;
import com.grownited.entity.SubcategoryEntity;
import com.grownited.entity.UserEntity;
import com.grownited.entity.VendorEntity;
import com.grownited.repository.AccountRepository;
import com.grownited.repository.CategoryRepository;
import com.grownited.repository.ExpenseRepository;
import com.grownited.repository.StatusRepository;
import com.grownited.repository.SubcategoryRepository;
import com.grownited.repository.UserRepository;
import com.grownited.repository.VendorRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserExpenseController {

    @Autowired
    ExpenseRepository expenseRepo;

    @Autowired
    CategoryRepository categoryRepo;

    @Autowired
    SubcategoryRepository subcategoryRepo;

    @Autowired
    VendorRepository vendorRepo;

    @Autowired
    AccountRepository accountRepo;

    @Autowired
    StatusRepository statusRepo;

    @Autowired
    UserRepository userRepo;

    @GetMapping("/usernewexpense")
    public String usernewExpense(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user != null) {
            Integer userId = user.getUserId();
            session.setAttribute("userId", userId);

            List<CategoryEntity> categoryList = categoryRepo.findByUserId(userId);
            List<SubcategoryEntity> subcategoryList = subcategoryRepo.findByUserId(userId);
            List<VendorEntity> vendorList = vendorRepo.findByUserId(userId);
            List<AccountEntity> accountList = accountRepo.findByUserId(userId);
            List<StatusEntity> statusList = statusRepo.findAll(); // status usually global

            model.addAttribute("categoryList", categoryList);
            model.addAttribute("subcategoryList", subcategoryList);
            model.addAttribute("vendorList", vendorList);
            model.addAttribute("accountList", accountList);
            model.addAttribute("statusList", statusList);
        }

        return "UserNewExpense";
    }

    @PostMapping("/usersaveexpense")
    public String usersaveExpense(ExpenseEntity expense, HttpSession session) {
        if (expense.getUserId() == null) {
            Integer userId = (Integer) session.getAttribute("userId");
            expense.setUserId(userId);
        }

        expenseRepo.save(expense);
        return "redirect:/userlistexpense";
    }

    @GetMapping("/userlistexpense")
    public String userlistExpense(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");

        List<ExpenseEntity> userExpenses = expenseRepo.findByUserId(userId);
        List<CategoryEntity> categoryList = categoryRepo.findByUserId(userId);
        List<SubcategoryEntity> subcategoryList = subcategoryRepo.findByUserId(userId);
        List<VendorEntity> vendorList = vendorRepo.findByUserId(userId);

        model.addAttribute("expenseList", userExpenses);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("subcategoryList", subcategoryList);
        model.addAttribute("vendorList", vendorList);

        return "UserListExpense";
    }

    @GetMapping("/userdeleteexpense")
    public String userdeleteExpense(@RequestParam Integer expenseId) {
        expenseRepo.deleteById(expenseId);
        return "redirect:/userlistexpense";
    }

    // ✅ Get categories, vendors, and accounts for a given user
    @GetMapping("/user/{userId}/metadata")
    @ResponseBody
    public Map<String, List<?>> getUserMetadata(@PathVariable Integer userId) {
        Map<String, List<?>> response = new HashMap<>();
        response.put("accounts", accountRepo.findByUserId(userId));
        response.put("vendors", vendorRepo.findByUserId(userId));
        response.put("categories", categoryRepo.findByUserId(userId));
        return response;
    }

    // ✅ Get subcategories for user and selected category
    @GetMapping("/user/{userId}/category/{categoryId}/subcategories")
    @ResponseBody
    public List<SubcategoryEntity> getSubcategories(@PathVariable Integer userId, @PathVariable Integer categoryId) {
        return subcategoryRepo.findByUserIdAndCategoryId(userId, categoryId);
    }

}
