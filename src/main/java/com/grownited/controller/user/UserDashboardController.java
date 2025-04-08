package com.grownited.controller.user;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.UserEntity;
import com.grownited.repository.ExpenseRepository;
import com.grownited.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserDashboardController {

    @Autowired 
    ExpenseRepository expRepo;

    @Autowired
    Cloudinary cloudinary;
    
    @Autowired 
    UserRepository userRepo;

    @GetMapping("/userdashboard") 
    public String userdashboard(HttpSession session, Model model) {
        UserEntity user = (UserEntity) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        LocalDate l = LocalDate.now();
        Integer month = l.getMonth().getValue();
        Integer year = l.getYear();

        Integer currentMonthExp = expRepo.getCurrentMonthExpAmountByUserId(month, user.getUserId());
        model.addAttribute("currentMonthExp", currentMonthExp);

        Integer currentYearExp = expRepo.getCurrentYearExpAmountByUserId(year, user.getUserId());
        model.addAttribute("currentYearExp", currentYearExp);

        // User month-wise expense sum for chart
        List<Integer[]> exp = expRepo.getExpenseSumByMonthByUser(user.getUserId());

        StringBuilder data = new StringBuilder();
        HashMap<String, Integer> map = new HashMap<>();

        for (int i = 1; i <= 12; i++) { 
            map.put(i + "", 0); 
        }

        for (Integer[] e : exp) { 
            map.put(e[1] + "", e[0]); 
            data.append(e[0]).append(",");
        }

        model.addAttribute("datamap", map);

        return "UserDashboard"; 
    }

    @GetMapping("/myprofile") 
    public String myProfile() { 
        return "MyProfile"; 
    }

    @GetMapping("/editprofile") 
    public String editProfile() { 
        return "EditMyProfile"; 
    }

  /*  @PostMapping("/updatemyprofile") 
    public String updateMyProfile(UserEntity user) {
        UserEntity dbUser = userRepo.findById(user.getUserId()).orElse(null);
    	
    	

        if (dbUser != null) {
            dbUser.setFirstName(user.getFirstName());
            dbUser.setLastName(user.getLastName());
            dbUser.setGender(user.getGender());

            userRepo.save(dbUser);
        }

        return "MyProfile"; 
    }*/
    
    @PostMapping("updatemyprofile")
	public String updateMyProfile(UserEntity entity) {
//		System.out.println(entity.getUserId());
		
		
		Optional<UserEntity> op = userRepo.findById(entity.getUserId());
		
		if(op.isPresent()) {
			
			UserEntity dbuser = op.get();
			dbuser.setFirstName(entity.getFirstName());
			dbuser.setLastName(entity.getLastName());
//			dbuser.setGender(entity.getGender());
			dbuser.setEmail(entity.getEmail());
			dbuser.setBornYear(entity.getBornYear());
			dbuser.setContactNum(entity.getContactNum());
//			dbuser.setProfilePicPath(entity.getProfilePicPath());
			
			
			
			userRepo.save(entity);
		}	
		return "redirect:/listuser";
	}
}
