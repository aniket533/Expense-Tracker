<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Account | Expense Tracker</title>
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
	
  	<style>
        /* Custom CSS for New Account Form */
        .account-form {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 0 auto;
        }
        
        .account-form .form-group {
            margin-bottom: 1.5rem;
        }
        
        .account-form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #4154f1;
        }
        
        .account-form input[type="text"],
        .account-form input[type="number"],
        .account-form select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .account-form input[type="text"]:focus,
        .account-form input[type="number"]:focus,
        .account-form select:focus {
            border-color: #4154f1;
            outline: none;
            box-shadow: 0 0 0 3px rgba(65, 84, 241, 0.1);
        }
        
        .account-form .checkbox-group {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }
        
        .account-form .checkbox-group input {
            margin-right: 0.5rem;
        }
        
        .account-form .submit-btn {
            background-color: #4154f1;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .account-form .submit-btn:hover {
            background-color: #3143c5;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .account-form {
                padding: 1.5rem;
            }
        }
        
        /* Form validation styling */
        .error-message {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        .is-invalid {
            border-color: #dc3545 !important;
        }
    </style>
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
      		<h1>New Account</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">New Account</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="account-form">
            			<h5 class="card-title">Create New Account</h5>
            			<form action="saveaccount" method="post">
              				<div class="form-group">
                				<label for="title">Account Title</label>
                				<input type="text" id="title" name="title" class="form-control" required>
              				</div>
              
              				<div class="form-group">
                				<label for="amount">Initial Amount</label>
                				<input type="number" id="amount" name="amount" class="form-control" step="0.01" required>
              				</div>
              
              				<div class="form-group">
                				<label for="userId">User</label>
                				<select id="userId" name="userId" class="form-control" required>
                  					<option value="">Select User</option>
                  					<c:forEach items="${userList}" var="user">
                    						<option value="${user.userId}">${user.firstName} ${user.lastName}</option>
                  					</c:forEach>
                				</select>
              				</div>
              
              				<div class="checkbox-group">
                				<input type="checkbox" id="isDefault" name="isDefault">
                				<label for="isDefault">Set as Default Account</label>
              				</div>
              
              				<button type="submit" class="submit-btn">Save Account</button>
            			</form>
          			</div>
        		</div>
      		</div>
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

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>

  	<script>
    	// Basic form validation
    	document.querySelector('form').addEventListener('submit', function(e) {
      		const title = document.getElementById('title').value.trim();
      		const amount = document.getElementById('amount').value.trim();
      		const userId = document.getElementById('userId').value;
      
      		if (!title) {
        		e.preventDefault();
        		alert('Please enter an account title');
        		return;
      		}
      
      		if (!amount) {
        		e.preventDefault();
        		alert('Please enter an initial amount');
        		return;
      		}
      
      		if (!userId) {
        		e.preventDefault();
        		alert('Please select a user');
        		return;
      		}
    	});
  	</script>

</body>
</html>