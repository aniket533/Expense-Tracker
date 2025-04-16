package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.AccountEntity;
import com.grownited.entity.IncomeEntity;
import com.grownited.entity.StatusEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.AccountRepository;
import com.grownited.repository.IncomeRepository;
import com.grownited.repository.StatusRepository;
import com.grownited.repository.UserRepository;

@Controller
public class UserIncomeController {
	@Autowired
	IncomeRepository incomeRepo;
	@Autowired
	AccountRepository accountRepo;
	@Autowired
	StatusRepository statusRepo;
	@Autowired
	UserRepository userRepo;

	@GetMapping("/usernewincome")
	public String usernewIncome(Model model) {
		List<IncomeEntity> accountList = incomeRepo.findAll();
		List<StatusEntity> statusList = statusRepo.findAll();
		List<UserEntity> userList = userRepo.findAll();
		model.addAttribute("accountList", accountList);
		model.addAttribute("statusList", statusList);
		model.addAttribute("userList", userList);
		return "UserNewIncome";
	}

	@PostMapping("/usersaveincome")
	public String usersaveIncome(IncomeEntity income) {

		// accountId
		// income

		AccountEntity account = accountRepo.findById(income.getAccountId()).get();
		double newAmount = account.getAmount() + income.getAmount(); 
		account.setAmount(newAmount);
		accountRepo.save(account); 
		incomeRepo.save(income);
		return "redirect:/listincome";
	}

	@GetMapping("/userlistincome")
	public String userlistIncome(Model model) {
		List<IncomeEntity> incomeList = incomeRepo.findAll();
		model.addAttribute("incomeList", incomeList);
		return "UserListIncome";
	}

	@GetMapping("/userdeleteincome")
	public String userdeleteIncome(@RequestParam Integer incomeId) {
		incomeRepo.deleteById(incomeId);
		return "redirect:/userlistincome";
	}
}