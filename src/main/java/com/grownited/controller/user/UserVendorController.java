package com.grownited.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
        return "UserNewVendor";  // This is the JSP where user adds vendor
    }
    @PostMapping("/usersavevendor")
    public String usersavevendor(VendorEntity vendorEntity, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // ✅ Save vendor with logged-in user's ID
        vendorEntity.setUserId(user.getUserId());

        vendorRepo.save(vendorEntity);

        return "redirect:/userlistvendor";
    }

    @GetMapping("/userlistvendor")
    public String userlistvendor(Model model, HttpSession session) {
        UserEntity user = (UserEntity) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        // ✅ Get user's vendors + global vendors
        List<VendorEntity> vendors = vendorRepo.findByUserIdOrUserIdIsNull(user.getUserId());

        model.addAttribute("vendorList", vendors);
        return "UserListVendor";
    }

    @GetMapping("/userdeletevendor")
    public String userdeleteVendor(Integer vendorId) {
        vendorRepo.deleteById(vendorId);
        return "redirect:/userlistvendor";
    }
}
