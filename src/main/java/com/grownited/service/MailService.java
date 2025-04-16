
package com.grownited.service;

import org.apache.logging.log4j.message.SimpleMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;

	public void sendWelcomeMail(String email, String firstName) {
		String subject = "Welcome to Expense Tracker";
		String body = "Hey " + firstName
				+ ", We're excited to have you on board. If you have any questions, feel free to reach out – we’re here to help!";
		String from = "koshtianiket@786gmail.com";

		// logic
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(from);
		message.setTo(email);
		message.setSubject(subject);
		message.setText(body);

		mailSender.send(message);

	}
	
	
	
	public void sendOtpForForgetPassword(String toEmail, String name, String otp) {
	    System.out.println("Sending OTP to: " + toEmail); // Debugging email
	    System.out.println("OTP: " + otp);
	    
	    try {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(toEmail);
	        message.setSubject("Your OTP for Password Reset");
	        message.setText("Hello " + name + ",\n\nYour OTP for password reset is: " + otp + "\n\nThank you!");

	        mailSender.send(message);
	        System.out.println("OTP email sent successfully!"); // Confirm email sent
	        
	    } catch (Exception e) {
	        System.out.println("Error sending email: " + e.getMessage());
	    }
	}
}