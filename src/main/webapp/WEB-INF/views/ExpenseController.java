package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		model.addAttribute("userList", userList);
		return "NewExpense";
	}
	
	@PostMapping("saveexpense")
	public String saveExpense(ExpenseEntity expense, BindingResult result, Model model) {
	    // Remove the hardcoded userId setting
	    // if (expense.getUserId() == null) {
	    //     expense.setUserId(1); // 👈 assume 1 is a valid userId in DB
	    // }
	    
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
	    return "ListExpense";  // ✅ this is the admin's expense list JSP
	}

	
	@GetMapping("deleteexpense")
	public String deleteExpense(@RequestParam Integer expenseId) {
		expenseRepo.deleteById(expenseId);
		return "redirect:/listexpense";
	}
	 @GetMapping("/get-categories/{userId}")
	    public List<CategoryEntity> getCategoriesByUserId(@PathVariable Integer userId) {
	        return categoryRepo.findByUserId(userId);
	    }

	    @GetMapping("/get-accounts/{userId}")
	    public List<AccountEntity> getAccountsByUserId(@PathVariable Integer userId) {
	        return accountRepo.findByUserId(userId);
	    }

	    @GetMapping("/get-vendors/{userId}")
	    public List<VendorEntity> getVendorsByUserId(@PathVariable Integer userId) {
	        return vendorRepo.findByUserId(userId);
	    }

	    @GetMapping("/get-subcategories/{userId}/{categoryId}")
	    public List<SubcategoryEntity> getSubcategoriesByUserIdAndCategoryId(
	            @PathVariable Integer userId,
	            @PathVariable Integer categoryId) {
	        return subcategoryRepo.findByUserIdAndCategoryId(userId, categoryId);
	    }
}