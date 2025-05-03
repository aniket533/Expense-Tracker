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
    	/* Custom CSS for Account Form */
    	.account-form {
      		max-width: 600px;
      		margin: 0 auto;
      		padding: 30px;
      		background: #fff;
      		border-radius: 10px;
      		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    	}
    
    	.form-group {
      		margin-bottom: 25px;
    	}
    
    	.form-group label {
      		display: block;
      		margin-bottom: 8px;
      		font-weight: 500;
      		color: #4154f1;
    	}
    
    	.form-control {
      		width: 100%;
      		padding: 12px 15px;
      		border: 1px solid #ddd;
      		border-radius: 6px;
      		font-size: 16px;
      		transition: all 0.3s ease;
    	}
    
    	.form-control:focus {
      		border-color: #4154f1;
      		box-shadow: 0 0 0 3px rgba(65, 84, 241, 0.1);
      		outline: none;
    	}
    
    	.checkbox-group {
      		display: flex;
      		align-items: center;
      		margin-bottom: 25px;
    	}
    
    	.checkbox-group input[type="checkbox"] {
      		width: 18px;
      		height: 18px;
      		margin-right: 10px;
      		accent-color: #4154f1;
    	}
    
    	.checkbox-group label {
      		margin: 0;
      		font-weight: normal;
      		color: #495057;
    	}
    
    	.submit-btn {
      		background-color: #4154f1;
      		color: white;
      		padding: 12px 30px;
      		border: none;
      		border-radius: 6px;
      		font-size: 16px;
      		font-weight: 500;
      		cursor: pointer;
      		transition: all 0.3s ease;
      		display: inline-flex;
      		align-items: center;
      		gap: 8px;
      		box-shadow: 0 2px 10px rgba(65, 84, 241, 0.2);
    	}
    
    	.submit-btn:hover {
      		background-color: #2a3ac7;
      		transform: translateY(-2px);
      		box-shadow: 0 4px 12px rgba(65, 84, 241, 0.3);
    	}
    
    	.card {
      		border-radius: 10px;
      		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      		padding: 25px;
      		margin-bottom: 30px;
      		background-color: #fff;
    	}
    
    	.card-title {
      		color: #4154f1;
      		margin-bottom: 20px;
      		font-weight: 600;
    	}
    
    	@media (max-width: 768px) {
      		.account-form {
        		padding: 20px;
      		}
    	}
  	</style>
</head>

<body>

	<!-- ======= Session Validate ======= -->
  	<%@include file="SessionValidate.jsp" %>
  	<!-- End Session Validate -->

  	<!-- ======= Header ======= -->
  	<jsp:include page="UserHeader.jsp"></jsp:include>
  	<!-- End Header -->

  	<!-- ======= Sidebar ======= -->
  	<jsp:include page="UserSidebar.jsp"></jsp:include>
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
          			<div class="card">
            			<div class="card-body">
              				<h5 class="card-title">Account Information</h5>
              				
              				<form action="usersaveaccount" method="post" class="account-form">
                				<div class="form-group">
                  					<label for="title">Account Title</label>
                  					<input type="text" id="title" name="title" class="form-control" required placeholder="e.g., Bank Account, Cash Wallet">
                				</div>
                
                				
                
                				
                				<button type="submit" class="submit-btn">
                  					<i class="bi bi-save"></i> Save Account
                				</button>
              				</form>
            			</div>
          			</div>
        		</div>
      		</div>
    	</section>

  	</main><!-- End #main -->

  	<!-- ======= Footer ======= -->
  	<jsp:include page="UserFooter.jsp"></jsp:include>
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

</body>
</html>