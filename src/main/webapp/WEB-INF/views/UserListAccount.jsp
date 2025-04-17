<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Accounts | Expense Tracker</title>
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
        /* Custom CSS for Accounts List */
        .accounts-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .accounts-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1.5rem;
        }
        
        .accounts-table th {
            background-color: #4154f1;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .accounts-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }
        
        .accounts-table tr:hover {
            background-color: #f8f9fa;
        }
        
        .accounts-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .action-link {
            color: #4154f1;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .action-link:hover {
            color: #3143c5;
            text-decoration: underline;
        }
        
        .add-account-btn {
            display: inline-flex;
            align-items: center;
            background-color: #4154f1;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        
        .add-account-btn:hover {
            background-color: #3143c5;
            color: white;
        }
        
        .add-account-btn i {
            margin-right: 8px;
        }
        
        /* Status indicator */
        .default-status {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 50rem;
            font-size: 0.875rem;
            font-weight: 600;
        }
        
        .default-true {
            background-color: #d1e7dd;
            color: #0f5132;
        }
        
        .default-false {
            background-color: #fff3cd;
            color: #664d03;
        }
        
        /* Amount styling */
        .account-amount {
            font-weight: 600;
            color: #2a9d8f;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .accounts-container {
                padding: 1rem;
                overflow-x: auto;
            }
            
            .accounts-table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
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
      		<h1>List of Accounts</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Account</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="accounts-container">
            			<div class="table-responsive">
              				<table class="accounts-table">
                				<thead>
                  					<tr>
                    					<th>Account Title</th>
                    					<th>Amount</th>
                    					<th>Default Account</th>
                    					<th>Action</th>
                  					</tr>
                				</thead>
                				<tbody>
                  					<c:forEach items="${accountList}" var="account">
                    					<tr>
                      						<td>${account.title}</td>
                      						<td class="account-amount">$${account.amount}</td>
                      						<td>
                          						<span class="default-status ${account.isDefault ? 'default-true' : 'default-false'}">
                              						${account.isDefault ? 'Yes' : 'No'}
                          						</span>
                      						</td>
                      						<td>
                          						<a href="userdeleteaccount?accountId=${account.accountId}" class="action-link"
                             						onclick="return confirm('Are you sure you want to delete this account?')">
                              						Delete
                          						</a>
                      						</td>
                    					</tr>
                  					</c:forEach>
                				</tbody>
              				</table>
            			</div>
            			<a href="usernewaccount" class="add-account-btn">
              				<i class="bi bi-plus-circle"></i> Add New Account
            			</a>
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