package com.grownited.controller;

import java.util.List;
import java.util.Optional;
import java.util.Set;

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
    
    @GetMapping("/viewUser")
    public String viewUser(@RequestParam("userId") Integer userId, Model model) {
        Optional<UserEntity> user = userRepo.findById(userId);
        if (user.isPresent()) {
            model.addAttribute("user", user.get());
            return "viewUser";  
        }
        return "redirect:/listuser";  
    }

    // **Edit User Feature**
    @GetMapping("/editUser")
    public String editUser(@RequestParam("userId") Integer userId, Model model) {
        Optional<UserEntity> userOpt = userRepo.findById(userId);
        List<RoleEntity> roleList = roleRepo.findAll();
        
        if (userOpt.isPresent()) {
            model.addAttribute("user", userOpt.get());
            model.addAttribute("roleList", roleList);
            return "EditUser"; // Make sure this template exists
        }
        return "redirect:/listuser";
    }

    @PostMapping("/updateUser")
    public String updateUser(@RequestParam Integer userId, @RequestParam String roleName) {
        Optional<UserEntity> userOpt = userRepo.findById(userId);
        Optional<RoleEntity> roleOpt = roleRepo.findByRoleName(roleName); // Fetch role by name

        if (userOpt.isPresent() && roleOpt.isPresent()) {
            UserEntity user = userOpt.get();
          //  user.setRoles(Set.of(roleOpt.get())); // Update roles
//          user.setRole(Set.of(roleOpt.get()));
            userRepo.save(user); // Save updated user
        }

        return "redirect:/listuser";
    }

}
