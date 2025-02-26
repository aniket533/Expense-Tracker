<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SignUp Details</title>
</head>
<body>
    <h2>SignUp Details</h2>
    <table  border="1">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Gender</th>
                <th>Contact Number</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach  items="${userslist }"  var="u" >
                <tr>
                    <td>${u.firstName}</td>
                    <td>${u.lastName}</td>
                    <td>${u.email}</td>
                    <td>${u.gender}</td>
                    <td>${u.contactNum}</td>
                    <td>${u.password}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
