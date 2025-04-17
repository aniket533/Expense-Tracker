<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Incomes | Expense Manager</title>
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
        /* Custom CSS for Income List */
        .income-table-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .income-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }
        
        .income-table th {
            background-color: #4154f1;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
        }
        
        .income-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }
        
        .income-table tr:hover {
            background-color: #f8f9fa;
        }
        
        .income-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .action-link {
            color: #4154f1;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .action-link:hover {
            color: #3143c5;
            text-decoration: underline;
        }
        
        .add-income-btn {
            display: inline-block;
            background-color: #4154f1;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.3s;
            margin-top: 1rem;
        }
        
        .add-income-btn:hover {
            background-color: #3143c5;
            color: white;
        }
        
        /* Responsive table */
        @media (max-width: 768px) {
            .income-table-container {
                padding: 1rem;
                overflow-x: auto;
            }
            
            .income-table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }
        
        /* Status badges */
        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.65rem;
            border-radius: 50rem;
            font-size: 0.75rem;
            font-weight: 600;
        }
        
        .status-active {
            background-color: #d1e7dd;
            color: #0f5132;
        }
        
        .status-inactive {
            background-color: #f8d7da;
            color: #842029;
        }
        
        /* Amount formatting */
        .income-amount {
            font-weight: 600;
            color: #2a9d8f;
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
      		<h1>List of Incomes</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Income</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="income-table-container">
            			<div class="table-responsive">
              				<table class="income-table">
                				<thead>
                  					<tr>
                    					<th>Income ID</th>
                    					<th>Title</th>
                    					<th>Account Type</th>
                    					<th>Status</th>
                    					<th>Amount</th>
                    					<th>Date</th>
                    					<th>Description</th>
                    					<th>User</th>
                    					<th>Action</th>
                  					</tr>
                				</thead>
                				<tbody>
                  					<c:forEach items="${incomeList}" var="income">
                    					<tr>
                      						<td>${income.incomeId}</td>
                      						<td>${income.title}</td>
                      						<td>${income.accountId}</td>
                      						<td>
                          						
                      						</td>
                      						<td class="income-amount">$${income.amount}</td>
                      						<td>${income.date}</td>
                      						<td>${income.description}</td>
                      						<td>${income.userId}</td>
                      						<td>
                          						<a href="deleteincome?incomeId=${income.incomeId}" class="action-link" 
                             						onclick="return confirm('Are you sure you want to delete this income record?')">
                              						Delete
                          						</a>
                      						</td>
                    					</tr>
                  					</c:forEach>
                				</tbody>
              				</table>
            			</div>
            			<a href="newincome" class="add-income-btn">
              				<i class="bi bi-plus-circle"></i> Add New Income
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