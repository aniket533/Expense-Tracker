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

import jakarta.servlet.http.HttpServletRequest;
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
   public String admindashboard(Model model) {
	   
	   Long totalUsers = repouser.count();
	   
	   Integer totaluser = repouser.findByRole("USER").size();
	   
	   Integer totalAdmin = repouser.findByRole("ADMIN").size();
	    
	   long totalexpense = repouser.findByRole("USER").size();
	   
	   model.addAttribute("totalUser",totaluser);
	   
       return "AdminDashboard";  // This should match the actual template/view name
   }
  
   
   
   @GetMapping("home")
   public String home() {
       return "Home"; 
   }
   
   @GetMapping("/logout")
   public String logout(HttpServletRequest request) {
       HttpSession session = request.getSession(false);
       

       if (session != null) {
           session.invalidate();
       }
       return "redirect:/login?logout";
   }
  
   
  
  
   @PostMapping("sendotp")
	public String sendOtp(String email,Model model) {
		// email valid
	   System.out.println(email);
		Optional<UserEntity> op = repouser.findByEmail(email);
		System.out.println(op);
		if (op.isEmpty()) {
			// email invalid
			model.addAttribute("error", "Email not found");
			return "ForgotPassword";
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
			serviceMail.sendOtpForForgetPassword(user.getEmail(), user.getFirstName(), otp);
			System.out.println("otp send");
			return "ChangePassword";

		}
	}

   @PostMapping("updatepassword")
	public String updatepassword(String email, String password, String otp, Model model) {
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
   public String authenticate(String email, String password, Model model, HttpSession session) {
       Optional<UserEntity> op = repouser.findByEmail(email);
       if (op.isPresent()) {
           UserEntity dbUser = op.get();
           boolean ans = encoder.matches(password, dbUser.getPassword());

           if (ans) {
               // ✅ Fix added here
               session.setAttribute("user", dbUser);
               session.setAttribute("userId", dbUser.getUserId());

               session.setMaxInactiveInterval(24 * 60 * 60); // 24 hours

               if (dbUser.getRole().equals("ADMIN")) {
                   return "redirect:/admindashboard";
               } else {
                   return "redirect:/userdashboard";
               }
           }
       }
       model.addAttribute("error", "Invalid Credentials");
       return "Login";
   }

}



