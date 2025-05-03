package com.grownited.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.entity.UserEntity;
import com.grownited.entity.VendorEntity;
import com.grownited.repository.UserRepository;
import com.grownited.repository.VendorRepository;

@Controller
public class VendorController {
	@Autowired
	VendorRepository vendorRepo;
	
	 @Autowired
	    UserRepository userRepo; 
	
	@GetMapping("/newvendor")
	public String newVendor(Model model) {
	    // Get only users with role "USER"
	    List<UserEntity> userList = userRepo.findByRole("USER");
	    model.addAttribute("userList", userList);
	    return "NewVendor";
	}
	
	@PostMapping("/savevendor")
	public String saveVendor(VendorEntity vendor, @RequestParam Integer userId) {
	    if (userId != null && userId > 0) {
	        vendor.setUserId(userId);  // Associate with selected user
	    } else {
	        vendor.setUserId(null);    // Global vendor
	    }
	    vendorRepo.save(vendor);
	    return "redirect:/listvendor";
	}

	
	@GetMapping("/listvendor")
	public String listVendor(Model model) {
		List<VendorEntity> vendorList = vendorRepo.findAll();
		model.addAttribute("vendorList", vendorList);
		return "ListVendor";
	}
	
	@GetMapping("/deletevendor")
	public String deleteVendor(@RequestParam Integer vendorId) {
		vendorRepo.deleteById(vendorId);
		return "redirect:/listvendor";
	}	
}