package com.grownited.controller;
import java.time.LocalDate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.RoleEntity;
import com.grownited.entity.UserEntity;
import com.grownited.repository.RoleRepository;
import com.grownited.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	UserRepository userRepo;
	@Autowired
	RoleRepository roleRepo;
	
	@GetMapping("/newuser")
	public String newUser(Model model) {
		List<RoleEntity> roleList = roleRepo.findAll();
		model.addAttribute("roleList", roleList);
		return "NewUser";
	}
	
	
	@GetMapping("/listuser")
	public String listUser(Model model) {
		List<UserEntity> userList = userRepo.findAll();
		model.addAttribute("userList", userList);
		return "ListUser";
	}
	
	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam Integer userId) {
		userRepo.deleteById(userId);
		return "redirect:/listuser";
	}
	
	 
	
}

