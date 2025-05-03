<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Session Validation -->
    <%@include file="SessionValidate.jsp"%>
    
    <!-- Header -->
    <jsp:include page="AdminHeader.jsp"/>
    
    <!-- Sidebar -->
    <jsp:include page="AdminSidebar.jsp"/>

     <!-- Footer -->
    <jsp:include page="AdminFooter.jsp"/>
    
</body>
</html>