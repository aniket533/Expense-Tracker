
package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.AccountEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.AccountRepository;
import com.grownited.repository.IncomeRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {

	@Autowired
	AccountRepository accountRepo;
	@Autowired
	UserRepository userRepo;
	@Autowired
	IncomeRepository incomeRepo;
	
	@GetMapping("/newaccount")
	public String newAccount(Model model) {
	    // Only get users with USER role
	    List<UserEntity> userList = userRepo.findByRole("USER");
	    model.addAttribute("userList", userList);
	    return "NewAccount";
	}
	
	
	@GetMapping("/listaccount")
	public String listAccount(Model model) {
		List<AccountEntity> accountList = accountRepo.findAll();
		model.addAttribute("accountList", accountList);
		return "ListAccount";
	}
	
	@PostMapping("/saveaccount")
	public String saveAccount(AccountEntity account) {
		accountRepo.save(account);
		return "redirect:/listaccount";
	}
	
	@GetMapping("/deleteaccount")
	public String deleteAccount(@RequestParam Integer accountId, HttpSession session) {
	    if (incomeRepo.existsByAccountId(accountId)) {
	        session.setAttribute("error", "This account is used in income records and cannot be deleted.");
	        return "redirect:/listaccount";
	    }

	    accountRepo.deleteById(accountId);
	    return "redirect:/listaccount";
	}
}
