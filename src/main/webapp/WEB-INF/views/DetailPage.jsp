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
            <c:forEach var="signUp" items="${signUpList}">
                <tr>
                    <td>${signUp.firstName}</td>
                    <td>${signUp.lastName}</td>
                    <td>${signUp.email}</td>
                    <td>${signUp.gender}</td>
                    <td>${signUp.contactnum}</td>
                    <td>${signUp.password}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
