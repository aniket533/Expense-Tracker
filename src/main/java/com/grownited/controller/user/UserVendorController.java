
package com.grownited.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.grownited.entity.UserEntity;
import com.grownited.entity.VendorEntity;
import com.grownited.repository.VendorRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserVendorController {
	@Autowired
	VendorRepository vendorRepo;
	
	@GetMapping("/usernewvendor")
	public String usernewVendor() {
		return "UserNewVendor";
	}
	
	@PostMapping("userlistvendor")
	public String usersavevendor(VendorEntity vendorEntity, HttpSession session) {

		UserEntity user = (UserEntity) session.getAttribute("user");
		vendorEntity.setVendorId(user.getUserId());
		vendorRepo.save(vendorEntity);
		return "redirect:/userlistvendor";
	}
	@GetMapping("userlistvendor")
	public String userlistvendor(Model model, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("vendor");
		Optional<VendorEntity> vendors = vendorRepo.findById(user.getUserId());
		model.addAttribute("vendorList",vendors);
		return "UserVendorAccount";
	}

	@GetMapping("/userdeletevendor")
	public String userdeleteVendor(@RequestParam Integer vendorId) {
		vendorRepo.deleteById(vendorId);
		return "redirect:/Userlistvendor";
	}	
}
