package com.growinted.controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.growinted.entity.UserEntity;
import com.growinted.repository.UserRepository;





@Controller
public class Sessincontroller {
	
	@Autowired
	UserRepository repouser;
	
  @GetMapping("signup")
  public String signup() {
	  return "Signup";
  }
  
  @GetMapping("login")
  public String login() {
	  return "Login";
  }
  
  @PostMapping("saveuser")
  public String saveuser(UserEntity entityuser) {
	  repouser.save(entityuser);
	  System.out.println(entityuser.getFirstName());
	  System.out.println(entityuser.getLastName());
	  System.out.println(entityuser.getGender());
	  System.out.println(entityuser.getConntacNum());
	  System.out.println(entityuser.getEmail());
	  System.out.println(entityuser.getPassword());
	  System.out.println(entityuser.getBornYear());
	  return "Login";
  }
	  @GetMapping("detailpage")
	  public String detailpage(Model model) {
	  
		  List<UserEntity> userlist= repouser.findAll();
		 model.addAttribute("userslist" , userlist);
		  return "DetailPage";
			  
		  
	  
  }
  //open on forgetpassword jsp
  @GetMapping("forgetpassword")
  public String forgetpaasword() {
     return "forgetpassword";
  } 
//submit on forget password
	@GetMapping("sendotp")
	public String sendotp() {
		
		return "ChangePassword";
	}
  
   @PostMapping("updatepaswword")
   public String updatepaasword() {
	   return "Login";
   }
   @GetMapping("newmember")
   public String newmember() {
      return "newmember";
   } 
}



