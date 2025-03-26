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
  public String saveuser(UserEntity entityuser, @RequestParam("profilePic") MultipartFile profilePic) {
  
	
	  repouser.save(entityuser);
	  System.out.println(entityuser.getFirstName());
	  System.out.println(entityuser.getLastName());
	  System.out.println(entityuser.getGender());
	  System.out.println(entityuser.getContactNum());
	  System.out.println(entityuser.getEmail());
	  System.out.println(entityuser.getPassword());
	  System.out.println(entityuser.getBornYear());
      
	 
	 
	  serviceMail.sendWelcomeMail(entityuser.getEmail(), entityuser.getFirstName());
		
		
	  try {
	        if (profilePic != null && !profilePic.isEmpty()) {
	            System.out.println("✅ Received file: " + profilePic.getOriginalFilename());
	            System.out.println("✅ File size: " + profilePic.getSize() + " bytes");

	            // Uploading to Cloudinary
	            Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
	            String imageUrl = result.get("url").toString();

	            // ✅ Save profile picture path in entity
	            entityuser.setProfilePicPath(imageUrl);
	            System.out.println("✅ Uploaded Image URL: " + imageUrl);
	        } else {
	            System.out.println("❌ No file uploaded. Setting default image.");
	            entityuser.setProfilePicPath("http://example.com/default-profile.jpg"); // Optional
	        }
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    entityuser.setPassword(encoder.encode(entityuser.getPassword()));
	    entityuser.setRole("USER");

	    // ✅ Save user after setting profilePicPath
	    UserEntity savedUser = repouser.save(entityuser);
	    System.out.println("✅ User saved with ID: " + savedUser.getUserId());
	    System.out.println("✅ Final Profile Pic Path: " + savedUser.getProfilePicPath());

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
  public String forgotpassword() {
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
   public String sendotp(String email, Model model) {
       Optional<UserEntity> userOptional = repouser.findByEmail(email); // Use Optional<UserEntity>

       if (userOptional.isEmpty()) {
           model.addAttribute("error", "Email not found");
           return "ForgotPassword";
       } 

       UserEntity user = userOptional.get();
       String otp = String.valueOf((int) (Math.random() * 1000000)); // Generate 6-digit OTP

       System.out.println("Generated OTP: " + otp); // Debugging OTP

       user.setOtp(otp);
       repouser.save(user); // Save OTP in the database

       System.out.println("OTP Saved for: " + user.getEmail()); // Debugging save

       serviceMail.sendOtpForForgetPassword(email, user.getFirstName(), otp);

       return "ChangePassword";
   }

   @PostMapping("changepassword")
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



