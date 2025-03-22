package com.grownited.controller.user;

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

import jakarta.servlet.http.HttpSession;

@Controller
public class UserAccountController {

	@Autowired
	AccountRepository accountRepo;

	@GetMapping("userlistaccount")
	public String userlistaccount(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		List<AccountEntity> accounts = accountRepo.findByUserId(user.getUserId());
		model.addAttribute("accountList",accounts);
		return "UserListAccount";
	}

	@GetMapping("usernewaccount")
	public String usernewccount() {
		return "UserNewAccount";
	}

	@PostMapping("usersaveaccount")
	public String usersaveaccount(AccountEntity accountEntity, HttpSession session) {

		UserEntity user = (UserEntity) session.getAttribute("user");
		accountEntity.setUserId(user.getUserId());
		accountRepo.save(accountEntity);
		return "redirect:/userlistaccount";
	}
	
	@GetMapping("/userdeleteaccount")
	public String deleteaccount(@RequestParam Integer accountId) {
		accountRepo.deleteById(accountId);
		return "redirect:/userlistaccount";
	}
}
