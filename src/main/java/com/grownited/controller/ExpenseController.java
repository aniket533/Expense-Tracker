package com.grownited.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.dto.ExpenseDto;
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

@Controller
public class ExpenseController {

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

    @GetMapping("/newexpense")
    public String newExpense(Model model) {
        List<CategoryEntity> categoryList = categoryRepo.findAll();
        List<SubcategoryEntity> subcategoryList = subcategoryRepo.findAll();
        List<VendorEntity> vendorList = vendorRepo.findAll();
        List<AccountEntity> accountList = accountRepo.findAll();
        List<StatusEntity> statusList = statusRepo.findAll();
        List<UserEntity> userList = userRepo.findAll();

        model.addAttribute("categoryList", categoryList);
        model.addAttribute("subcategoryList", subcategoryList);
        model.addAttribute("vendorList", vendorList);
        model.addAttribute("accountList", accountList);
        model.addAttribute("statusList", statusList);
        model.addAttribute("userList", userList);

        return "NewExpense";
    }

    @PostMapping("saveexpense")
    public String saveExpense(ExpenseEntity expense, BindingResult result, Model model) {
        System.out.println("Saving expense for user ID: " + expense.getUserId());
        System.out.println("Title: " + expense.getTitle());
        System.out.println("Amount: " + expense.getAmount());

        expenseRepo.save(expense);
        return "redirect:/listexpense";
    }

    @GetMapping("listexpense")
    public String listExpense(Model model) {
        List<ExpenseDto> expenseList = expenseRepo.getAllExpenses();
        model.addAttribute("expenseList", expenseList);
        return "ListExpense";
    }

    @GetMapping("deleteexpense")
    public String deleteExpense(@RequestParam Integer expenseId) {
        expenseRepo.deleteById(expenseId);
        return "redirect:/listexpense";
    }

    // ✅ NEW: Get Categories, Vendors, and Accounts for selected user
    @GetMapping("/getDataForUser/{userId}")
    @ResponseBody
    public Map<String, Object> getDataForUser(@PathVariable Long userId) {
        List<CategoryEntity> categories = categoryRepo.findByUserId(userId);
        List<VendorEntity> vendors = vendorRepo.findByUserId(userId);
        List<AccountEntity> accounts = accountRepo.findByUserId(userId);

        Map<String, Object> result = new HashMap<>();
        result.put("categories", categories);
        result.put("vendors", vendors);
        result.put("accounts", accounts);

        return result;
    }
 // Add these methods to ExpenseController.java

    @GetMapping("/api/user/{userId}/categories")
    @ResponseBody
    public List<CategoryEntity> getUserCategories(@PathVariable Integer userId) {
        return categoryRepo.findByUserId(userId);
    }

    @GetMapping("/api/user/{userId}/vendors")
    @ResponseBody
    public List<VendorEntity> getUserVendors(@PathVariable Integer userId) {
        return vendorRepo.findByUserId(userId);
    }

    @GetMapping("/api/user/{userId}/accounts")
    @ResponseBody
    public List<AccountEntity> getUserAccounts(@PathVariable Integer userId) {
        return accountRepo.findByUserId(userId);
    }

    @GetMapping("/api/user/{userId}/categories/{categoryId}/subcategories")
    @ResponseBody
    public List<SubcategoryEntity> getUserSubcategories(
            @PathVariable Integer userId,
            @PathVariable Integer categoryId) {
        return subcategoryRepo.findByUserIdAndCategoryId(userId, categoryId);
    }
}
