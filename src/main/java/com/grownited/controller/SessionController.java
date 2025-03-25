package com.grownited.controller;




import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.grownited.entity.UserEntity;
import com.grownited.repository.UserRepository;
import com.grownited.service.MailService;

import jakarta.servlet.http.HttpSession;





@Controller
public class SessionController {
	
	@Autowired
	MailService serviceMail;
	
	@Autowired
	UserRepository repouser;
	
	@Autowired
	PasswordEncoder encoder;
	
    @Autowired
    Cloudinary cloudinary;
	
  @GetMapping("signup")
  public String signup() {
	  
	  
	  return "Signup";
  }
  
  @GetMapping("login")
  public String login() {
	  return "Login";
  }

  @PostMapping("saveuser")
  public String saveuser(UserEntity entityuser,  MultipartFile profilePic) {
  
	
	  repouser.save(entityuser);
	  System.out.println(entityuser.getFirstName());
	  System.out.println(entityuser.getLastName());
	  System.out.println(entityuser.getGender());
	  System.out.println(entityuser.getContactNum());
	  System.out.println(entityuser.getEmail());
	  System.out.println(entityuser.getPassword());
	  System.out.println(entityuser.getBornYear());
      
	 
	 
	  //serviceMail.sendWelcomeMail(entityuser.getEmail(), entityuser.getFirstName());
		
		
	  try {
	        if (profilePic != null && !profilePic.isEmpty()) {
	            System.out.println("Uploaded file: " + profilePic.getOriginalFilename());

	            // Example: Uploading to Cloudinary (or your storage)
	            Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
	            String imageUrl = result.get("url").toString();

	            // ✅ Save profile picture path in entity
	            entityuser.setProfilePicPath(imageUrl);
	        } else {
	            System.out.println("No file uploaded.");
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    entityuser.setPassword(encoder.encode(entityuser.getPassword()));
	    entityuser.setRole("USER");
	    repouser.save(entityuser);

	    return "Login";
	}
  
  @GetMapping("detailpage")
	  public String detailpage(Model model) {
	  
		  List<UserEntity> userlist= repouser.findAll();
		 model.addAttribute("userslist" , userlist);
		  return "DetailPage";
			  
		  
	  
  }
  //open on forgetpassword jsp
  @GetMapping("forgotpassword")
  public String forgetPaasword() {
     return "ForgotPassword";
  } 
//submit on forget password
	
  
  
 
   @GetMapping("admindashboard")
   public String admindashboard() {
       return "AdminDashboard";  // This should match the actual template/view name
   }
  
   
   
   @GetMapping("home")
   public String home() {
       return "Home"; 
   }
   
   @GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";// login url
	}
   
  
   
  
   
  
  
 
   
   @PostMapping("sendotp")
	public String sendOtp(String email, Model model) {
		// email valid
		Optional<UserEntity> op = repouser.findByEmail(email);
		if (op.isEmpty()) {
			// email invalid
			model.addAttribute("error","Email not found");
			return "ForgetPassword";
		} else {
			// email valid
			// send mail otp
			// opt generate
			// send mail otp
			String otp = "";
			otp = (int) (Math.random() * 1000000) + "";// 0.25875621458541

			UserEntity user = op.get();
			user.setOtp(otp);
			repouser.save(user);// update otp for user
			serviceMail.sendOtpForForgetPassword(email, user.getFirstName(), otp);
			return "ChangePassword";

		}
	}
   
   @PostMapping("updatepassword")
	public String updatePassword(String email, String password, String otp, Model model) {
		Optional<UserEntity> op = repouser.findByEmail(email);
		if (op.isEmpty()) {
			model.addAttribute("error", "Invalid Data");
			return "ChangePassword";
		} else {
			UserEntity user = op.get();
			if (user.getOtp().equals(otp)) {
				String encPwd = encoder.encode(password);
				user.setPassword(encPwd);
				user.setOtp("");
				repouser.save(user);// update
			} else {

				model.addAttribute("error", "Invalid Data");
				return "ChangePassword";
			}
		}
		model.addAttribute("msg", "Password updated");
		return "Login";
	}


   
   @PostMapping("authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {// sakira@yopmail.com
																									// sakira
		System.out.println(email);
		System.out.println(password);

		// users -> email,password
		Optional<UserEntity> op = repouser.findByEmail(email);
		// select * from users where email = :email and password = :password
		if (op.isPresent()) {
			// true
			// email
			UserEntity dbUser = op.get();

			boolean ans = encoder.matches(password, dbUser.getPassword());

			if (ans == true) {
				session.setAttribute("user", dbUser); // session -> user set
				if (dbUser.getRole().equals("ADMIN")) {

					return "redirect:/admindashboard";
				} else if (dbUser.getRole().equals("USER")) {

					return "redirect:/userdashboard";
				} else {
					model.addAttribute("error", "Please contact Admin with Error Code #0991");
					return "Login";
				}

			}
		}
		model.addAttribute("error", "Invalid Credentials");
		return "Login";
	}
   
}



