<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Change Password</h2>
<from> action="saveuser" method="post">

		Email:<input type= "text" name="email"/><br><br>
		
				OTP: <input type="text" name="otp"/><br><br>
				
		New password:<input type="password" name="password"/><br><br>
		Confirm Password:<input type="password" name="confirmpassword"><br><br>
		
	    <input type="submit" value="'signup"/> 		
				 
</from>
</body>
</html>