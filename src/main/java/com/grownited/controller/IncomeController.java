package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.grownited.entity.AccountEntity;
import com.grownited.entity.IncomeEntity;
import com.grownited.entity.StatusEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.AccountRepository;
import com.grownited.repository.IncomeRepository;
import com.grownited.repository.StatusRepository;
import com.grownited.repository.UserRepository;

@Controller
public class IncomeController {
	@Autowired
	IncomeRepository incomeRepo;
	@Autowired
	AccountRepository accountRepo;
	@Autowired
	StatusRepository statusRepo;
	@Autowired
	UserRepository userRepo;
	

	@GetMapping("/newincome")
	public String newIncome(Model model) {
		List<AccountEntity> accountList = accountRepo.findAll();
		List<StatusEntity> statusList = statusRepo.findAll();
		List<UserEntity> userList = userRepo.findByRole("USER");
		model.addAttribute("accountList", accountList);
		model.addAttribute("statusList", statusList);
		model.addAttribute("userList", userList);
		return "NewIncome";
	}

	@PostMapping("/saveincome")
	public String saveIncome(IncomeEntity income, @RequestParam Integer userId) {
	    income.setUserId(userId); // ✅ Set user ID
	    incomeRepo.save(income);

	    // Update account balance
	    AccountEntity account = accountRepo.findById(income.getAccountId()).orElse(null);
	    if (account != null) {
	        Double currentAmount = account.getAmount() != null ? account.getAmount() : 0.0;
	        Double newAmount = currentAmount + income.getAmount();
	        account.setAmount(newAmount);
	        accountRepo.save(account);
	    }

	    return "redirect:/listincome";
	}

	

	@GetMapping("/getAccountsByUser")
	@ResponseBody
	public List<AccountEntity> getAccountsByUser(@RequestParam Integer userId) {
	    return accountRepo.findByUserId(userId);
	}

	
	@GetMapping("/listincome")
	public String listIncome(Model model) {
		List<IncomeEntity> incomeList = incomeRepo.findAll();
		model.addAttribute("incomeList", incomeList);
		return "ListIncome";
	}

	@GetMapping("/deleteincome")
	public String deleteIncome(@RequestParam Integer incomeId) {
		incomeRepo.deleteById(incomeId);
		return "redirect:/listincome";
	}
}