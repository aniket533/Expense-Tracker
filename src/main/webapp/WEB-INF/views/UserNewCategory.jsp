<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Category | Expense Tracker</title>
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
  	<style>
    	.card {
      		border-radius: 10px;
      		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      		padding: 20px;
    	}
    	.form-group {
      		margin-bottom: 1.5rem;
    	}
    	.form-label {
      		font-weight: 600;
      		margin-bottom: 0.5rem;
      		display: block;
    	}
    	.form-control {
      		width: 100%;
      		padding: 0.75rem 1rem;
      		border: 1px solid #ced4da;
      		border-radius: 0.375rem;
      		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    	}
    	.form-control:focus {
      		border-color: #4154f1;
      		outline: 0;
      		box-shadow: 0 0 0 0.25rem rgba(65, 84, 241, 0.25);
    	}
    	.btn-primary {
      		background-color: #4154f1;
      		border-color: #4154f1;
      		color: white;
      		padding: 0.75rem 1.5rem;
      		border-radius: 0.375rem;
      		font-weight: 500;
      		transition: all 0.3s;
    	}
    	.btn-primary:hover {
      		background-color: #2a3ac9;
      		border-color: #2a3ac9;
    	}
    	.btn-primary:focus {
      		box-shadow: 0 0 0 0.25rem rgba(65, 84, 241, 0.5);
    	}
    	.form-container {
      		max-width: 600px;
      		margin: 0 auto;
    	}
    	.required-field::after {
      		content: "*";
      		color: #dc3545;
      		margin-left: 4px;
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
      		<h1>New Category</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">New Category</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="card">
            			<div class="card-body">
              				<h5 class="card-title">Create New Category</h5>
              				<div class="form-container">
                				<form action="usersavecategory" method="post" class="row g-3">
                  					<div class="col-md-12 form-group">
                    						<label for="categoryName" class="form-label required-field">Category Name</label>
                    						<input type="text" class="form-control" id="categoryName" name="categoryName" required>
                  					</div>
                  					<div class="text-center">
                    						<button type="submit" class="btn btn-primary">
                      							<i class="bi bi-save"></i> Save Category
                    						</button>
                  					</div>
                				</form>
              				</div>
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