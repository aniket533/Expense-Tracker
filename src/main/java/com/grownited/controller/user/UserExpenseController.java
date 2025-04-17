
package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String usernewExpense(Model model) {
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
		return "UserNewExpense";
	}
	
	@GetMapping("/userlistexpense")
	public String userlistExpense(Model model, HttpSession session) {
	    Integer userId = (Integer) session.getAttribute("userId");
	    
	    // Get only this user's expenses
	    List<ExpenseEntity> userExpenses = expenseRepo.findByUserId(userId);
	    model.addAttribute("expenseList", userExpenses);
	    
	    // Add category list to the model
	    List<CategoryEntity> categoryList = categoryRepo.findAll();
	    model.addAttribute("categoryList", categoryList);
	    
	    return "UserListExpense";
	}
	@PostMapping("/usersaveexpense")
	public String usersaveExpense(ExpenseEntity expense, HttpSession session) {
	    if (expense.getUserId() == null) {
	        Integer userId = (Integer) session.getAttribute("userId");
	        System.out.println("Setting userId from session: " + userId);
	        expense.setUserId(userId); // ✅ yeh line important hai
	    }

	    expenseRepo.save(expense);
	    return "redirect:/userlistexpense";
	}


	
	@GetMapping("/userdeleteexpense")
	public String userdeleteExpense(@RequestParam Integer expenseId) {
	    expenseRepo.deleteById(expenseId);
	    return "redirect:/userlistexpense"; // ✅ Correct way to reload fresh expense list
	}

} 