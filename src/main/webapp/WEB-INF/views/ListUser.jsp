
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Users | Expense Manager</title>
  	<meta content="" name="description">
  	<meta content="" name="keywords">

  	<!-- Favicons -->
  	<link href="assets/img/favicon.png" rel="icon">
  	<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  	<!-- Google Fonts -->	
  	<link href="https://fonts.gstatic.com" rel="preconnect">
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  	<!-- Vendor CSS Files -->
  	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  	<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  	<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  	<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  	<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
	
  	<!-- Template Main CSS File -->
  	<link href="assets/css/style.css" rel="stylesheet">
	
  	<!-- =======================================================
  	* Template Name: NiceAdmin
  	* Updated: Jan 29 2024 with Bootstrap v5.3.2
  	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  	* Author: BootstrapMade.com
  	* License: https://bootstrapmade.com/license/
  	======================================================== -->
</head>

<body>

	<!-- ======= Session Validate ======= -->
  	<%@include file="SessionValidate.jsp" %>
  	<!-- End Session Validate -->

  	<!-- ======= Header ======= -->
  	<jsp:include page="AdminHeader.jsp"></jsp:include>
  	<!-- End Header -->

  	<!-- ======= Sidebar ======= -->
  	<jsp:include page="AdminSidebar.jsp"></jsp:include>
  	<!-- End Sidebar-->

  	<main id="main" class="main">

    	<div class="pagetitle">
      		<h1>List of Users</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List User</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<style>
    table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
    }
    
    th, td {
        border: 1px solid black;
        padding: 10px;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    td {
        background-color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    a {
        text-decoration: none;
        color: blue;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

<table id="userTable" class="display">
    <thead>
        <tr>
            <th>User Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Contact Num</th>
            <th>Email</th>
            <th>Born Year</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>  <!-- Changed from user.id -->
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.gender}</td>
                <td>${user.contactNum}</td>
                <td>${user.email}</td>
                <td>${user.bornYear}</td>
                <td>${user.role}</td>
                <td>
                    <a href="deleteUser?id=${user.userId}">Delete</a> | 
                  <a href="editUser?userId=${user.userId}">Edit</a>    |<a href="viewUser?userId=${user.userId}">View</a>
                  

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<!-- Pagination Section (Insert Here) -->
<div class="pagination" style="margin-top: 20px;">
    <c:if test="${currentPage > 1}">
        <a href="listuser?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="listuser?page=${i}" 
           class="btn <c:if test="${i == currentPage}">btn-dark</c:if>">
            ${i}
        </a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="listuser?page=${currentPage + 1}" class="btn btn-primary">Next</a>
    </c:if>
</div>
			<br>
			<a href="newuser">Add User</a>
    	</section>

  	</main><!-- End #main -->

  	<!-- ======= Footer ======= -->
  	<jsp:include page="AdminFooter.jsp"></jsp:include>
  	<!-- End Footer -->

  	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  	<!-- Vendor JS Files -->
  	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="assets/vendor/chart.js/chart.umd.js"></script>
  	<script src="assets/vendor/echarts/echarts.min.js"></script>
  	<script src="assets/vendor/quill/quill.min.js"></script>
  	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
  	<script src="assets/vendor/php-email-form/validate.js"></script>
  	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
					
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
	

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>

<!-- Include jQuery and DataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<!-- Initialize DataTables -->
<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
            "paging": true,      // Enables pagination
            "lengthMenu": [5, 10, 25, 50], // Records per page
            "ordering": true,    // Enables sorting
            "info": true,        // Show table information
            "searching": true    // Enables search box
        });
    });
</script>


</body>

</html>
