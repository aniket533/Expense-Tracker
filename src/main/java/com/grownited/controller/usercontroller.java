package com.grownited.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
    
    @Autowired
    UserRepository userRepo;
    
    @Autowired
    Cloudinary cloudinary;

    @GetMapping("/newuser")
    public String newUser() {
        return "NewUser";
    }
    
    @GetMapping("/listuser")
    public String listUser(Model model) {
        model.addAttribute("userList", userRepo.findAll());
        return "ListUser";
    }
    
    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam Integer userId) {
        userRepo.deleteById(userId);
        return "redirect:/listuser";
    }
    
    @GetMapping("/viewUser")
    public String viewUser(@RequestParam Integer userId, Model model) {
        userRepo.findById(userId).ifPresent(user -> model.addAttribute("user", user));
        return "viewUser";
    }

    @GetMapping("/editUser")
    public String editUser(@RequestParam Integer userId, Model model) {
        userRepo.findById(userId).ifPresent(user -> model.addAttribute("user", user));
        return "EditUser";
    }

    @PostMapping("/updateUser")
    public String updateUser(
            @RequestParam Integer userId,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String contactNum,
            @RequestParam String email,
            @RequestParam String bornYear,
            @RequestParam String role,
            @RequestParam(required = false) MultipartFile profilePic,
            @RequestParam(required = false) String currentProfilePic,
            HttpSession session) {

        userRepo.findById(userId).ifPresent(user -> {
            // Update basic fields
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setContactNum(contactNum);
            user.setEmail(email);
            user.setBornYear(bornYear);
            user.setRole(role);
            
            // Handle profile picture upload
            if (profilePic != null && !profilePic.isEmpty()) {
                try {
                    // Generate consistent filename: user_{userId}.jpg
                    String publicId = "user_" + userId;
                    String format = "jpg"; // Force JPG format for consistency
                    
                    Map uploadResult = cloudinary.uploader().upload(profilePic.getBytes(),
                        ObjectUtils.asMap(
                            "public_id", publicId,
                            "format", format,
                            "overwrite", true,
                            "resource_type", "image",
                            "transformation", new Transformation()
                                .width(200)
                                .height(200)
                                .crop("fill")
                                .gravity("face")
                        ));
                    
                    // Construct consistent URL pattern
                    String imageUrl = String.format("http://res.cloudinary.com/dg7ak6mpp/image/upload/%s.%s",
                        publicId, format);
                    
                    user.setProfilePicPath(imageUrl);
                    
                    // Update session if same user
                    UserEntity sessionUser = (UserEntity) session.getAttribute("user");
                    if (sessionUser != null && sessionUser.getUserId().equals(userId)) {
                        sessionUser.setProfilePicPath(imageUrl);
                        session.setAttribute("user", sessionUser);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    user.setProfilePicPath(currentProfilePic); // Keep current if upload fails
                }
            } else {
                user.setProfilePicPath(currentProfilePic);
            }
            
            userRepo.save(user);
        });

        return "redirect:/listuser";
    }
}