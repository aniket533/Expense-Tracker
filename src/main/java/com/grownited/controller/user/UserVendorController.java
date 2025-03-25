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

    @PostMapping("/usersavevendor")  // FIXED: Use @PostMapping and correct annotation format
    public String usersavevendor(VendorEntity vendorEntity, HttpSession session) {  
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login"; // Redirect to login if the user is not in session
        }
        vendorEntity.setVendorId(user.getUserId());
        vendorRepo.save(vendorEntity);
        return "redirect:/userlistvendor=" + user.getUserId();
    }

    @GetMapping("/userlistvendor")
    public String userlistvendor(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user"); // FIXED: Changed "vendor" to "user"
        if (user == null) {
            return "redirect:/login"; // Redirect to login if the user is not in session
        }
        
        // FIXED: Retrieve a list of vendors instead of an Optional<VendorEntity>
        List<VendorEntity> vendors = vendorRepo.findAll();  // Modify based on your requirements
        model.addAttribute("vendorList", vendors);
        return "UserListVendor";
    }

    @GetMapping("/userdeletevendor")
    public String userdeleteVendor(@RequestParam Integer vendorId) {
        vendorRepo.deleteById(vendorId);
        return "redirect:/userlistvendor";  // FIXED: Corrected the URL casing
    }    
}
