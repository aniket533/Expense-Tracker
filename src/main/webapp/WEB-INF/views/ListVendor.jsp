<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Vendors | Expense Manager</title>
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
    	/* Vendor List Table Styling */
    	.vendor-table-container {
      		background: #fff;
      		padding: 20px;
      		border-radius: 8px;
      		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      		margin-bottom: 30px;
    	}
    
    	.vendor-table {
      		width: 100%;
      		border-collapse: collapse;
      		font-size: 0.95em;
    	}
    
    	.vendor-table thead tr {
      		background-color: #4154f1;
      		color: #fff;
      		text-align: left;
    	}
    
    	.vendor-table th {
      		padding: 12px 15px;
      		font-weight: 600;
    	}
    
    	.vendor-table td {
      		padding: 12px 15px;
      		border-bottom: 1px solid #eee;
    	}
    
    	.vendor-table tbody tr:last-child td {
      		border-bottom: none;
    	}
    
    	.vendor-table tbody tr:hover {
      		background-color: #f6f9ff;
    	}
    
    	/* Add Vendor Button */
    	.add-vendor-btn {
      		display: inline-flex;
      		align-items: center;
      		padding: 10px 20px;
      		background-color: #4154f1;
      		color: white;
      		text-decoration: none;
      		border-radius: 6px;
      		transition: all 0.3s ease;
      		margin-bottom: 20px;
      		font-weight: 500;
    	}
    
    	.add-vendor-btn:hover {
      		background-color: #2a3ab9;
      		transform: translateY(-2px);
      		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    	}
    
    	.add-vendor-btn i {
      		margin-right: 8px;
    	}
    
    	/* Global Badge */
    	.global-badge {
      		background-color: #2eca6a;
      		color: white;
      		padding: 4px 10px;
      		border-radius: 20px;
      		font-size: 0.8em;
      		font-weight: 500;
    	}
    
    	/* Responsive adjustments */
    	@media (max-width: 768px) {
      		.vendor-table {
        		display: block;
        		overflow-x: auto;
      		}
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
      		<h1>List of Vendors</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Vendor</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="vendor-table-container">
            				<a href="newvendor" class="add-vendor-btn">
              					<i class="bi bi-plus-circle"></i>Add Vendor
            				</a>
            
            				<table class="vendor-table">
              					<thead>
                					<tr>
                  						<th>Vendor ID</th>
                  						<th>Vendor Name</th>
                  						
                					</tr>
              					</thead>
              					<tbody>
                					<c:forEach var="vendor" items="${vendorList}">
                  						<tr>
                    							<td>${vendor.vendorId}</td>
                    							<td>${vendor.vendorName}</td>
                    							
                  						</tr>
                					</c:forEach>
              					</tbody>
            				</table>
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

</body>

</html>