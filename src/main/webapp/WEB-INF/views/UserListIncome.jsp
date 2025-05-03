<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Incomes | Expense Tracker</title>
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
    	}
    	.table-container {
      		padding: 20px;
    	}
    	.table {
      		width: 100%;
      		border-collapse: collapse;
    	}
    	.table th {
      		background-color: #4154f1;
      		color: white;
      		padding: 12px;
      		text-align: left;
    	}
    	.table td {
      		padding: 12px;
      		border-bottom: 1px solid #e9ecef;
    	}
    	.table tr:hover {
      		background-color: #f8f9fa;
    	}
    	.action-btn {
      		display: inline-block;
      		padding: 6px 12px;
      		border-radius: 4px;
      		text-decoration: none;
      		font-weight: 500;
      		transition: all 0.3s;
    	}
    	.delete-btn {
      		background-color: #dc3545;
      		color: white;
    	}
    	.delete-btn:hover {
      		background-color: #bb2d3b;
      		color: white;
    	}
    	.add-btn {
      		background-color: #4154f1;
      		color: white;
      		padding: 10px 20px;
      		border-radius: 5px;
      		text-decoration: none;
      		display: inline-block;
      		margin-top: 20px;
      		transition: all 0.3s;
    	}
    	.add-btn:hover {
      		background-color: #2a3ac9;
      		color: white;
    	}
    	.table-responsive {
      		overflow-x: auto;
    	}
    	.amount-positive {
      		color: #28a745;
      		font-weight: 500;
    	}
    	.no-data {
      		text-align: center;
      		padding: 20px;
      		color: #6c757d;
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
          			<div class="card">
            			<div class="card-body">
              				<h5 class="card-title"> Your Incomes </h5>
              				<div class="table-responsive">
                				<table class="table table-hover">
                  					<thead>
                    						<tr>
                      						<th scope="col">Title</th>
                      						<th scope="col">Amount</th>
                      						<th scope="col">Date</th>
                      						<th scope="col">Action</th>
                    						</tr>
                  					</thead>
                  					<tbody>
                    						<c:choose>
                      						<c:when test="${not empty incomeList}">
    <c:forEach items="${incomeList}" var="inc">
        <tr>
            <td>${inc.title}</td>
            <td class="amount-positive">$${inc.amount}</td>
            <td>${inc.date}</td>
            <td>
                <a href="userdeleteincome?incomeId=${inc.incomeId}" class="action-btn delete-btn">
                    <i class="bi bi-trash"></i> Delete
                </a>
            </td>
        </tr>
    </c:forEach>
</c:when>
                      						<c:otherwise>
                        						<tr>
                          						<td colspan="4" class="no-data">No income records found</td>
                        						</tr>
                      						</c:otherwise>
                    						</c:choose>
                  					</tbody>
                				</table>
              				</div>
              				<a href="usernewincome" class="add-btn">
                				<i class="bi bi-plus-circle"></i> Add New Income
              				</a>
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