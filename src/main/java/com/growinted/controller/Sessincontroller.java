package com.growinted.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Sessincontroller {
  @GetMapping("Signup")
  public String Signup() {
	  return "Signup";
  }
  
  @GetMapping("Login")
  public String Login() {
	  return "Login";
  }
 
}
