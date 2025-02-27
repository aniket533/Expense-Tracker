package com.grownited.controller;




import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailService;





@Controller
public class Sessincontroller {
	
	@Autowired
	MailService serviceMail;
	
	@Autowired
	UserRepository repouser;
	
	@Autowired
	PasswordEncoder encoder;
	
	
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
	  System.out.println(entityuser.getContactNum());
	  System.out.println(entityuser.getEmail());
	  System.out.println(entityuser.getPassword());
	  System.out.println(entityuser.getBornYear());

	 
	 
	  serviceMail.sendWelcomeMail(entityuser.getEmail(), entityuser.getFirstName());
		
		
		// BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(5); //salt
		//--------> Not use this line  new keyword because it's gain more memeory
	  
	  

		String encPassword = encoder.encode(entityuser.getPassword());
		entityuser.setPassword(encPassword);
		
		entityuser.setRole("USER");
	
		repouser.save(entityuser);	
	//	serviceMail.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());

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
 
}



