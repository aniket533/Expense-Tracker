<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Sub-category | Expense Tracker</title>
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
    	/* Custom CSS for Subcategories Table */
    	.subcategory-table {
      		width: 100%;
      		border-collapse: collapse;
      		margin: 25px 0;
      		font-size: 0.9em;
      		min-width: 600px;
      		border-radius: 8px;
      		overflow: hidden;
      		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    	}
    
    	.subcategory-table thead tr {
      		background-color: #4154f1;
      		color: #ffffff;
      		text-align: left;
      		font-weight: bold;
    	}
    
    	.subcategory-table th,
    	.subcategory-table td {
      		padding: 12px 15px;
    	}
    
    	.subcategory-table tbody tr {
      		border-bottom: 1px solid #e0e0e0;
    	}
    
    	.subcategory-table tbody tr:nth-of-type(even) {
      		background-color: #f8f9fa;
    	}
    
    	.subcategory-table tbody tr:last-of-type {
      		border-bottom: 2px solid #4154f1;
    	}
    
    	.subcategory-table tbody tr:hover {
      		background-color: #f1f3ff;
    	}
    
    	.action-btns {
      		display: flex;
      		gap: 8px;
    	}
    
    	.action-btn {
      		display: inline-flex;
      		align-items: center;
      		padding: 6px 12px;
      		border-radius: 4px;
      		text-decoration: none;
      		font-weight: 500;
      		font-size: 0.85rem;
      		transition: all 0.3s ease;
    	}
    
    	.delete-btn {
      		background-color: #ff3d3d;
      		color: white;
    	}
    
    	.delete-btn:hover {
      		background-color: #ff0000;
      		transform: translateY(-2px);
      		box-shadow: 0 2px 8px rgba(255, 0, 0, 0.2);
    	}
    
    	.edit-btn {
      		background-color: #2ecc71;
      		color: white;
    	}
    
    	.edit-btn:hover {
      		background-color: #27ae60;
      		transform: translateY(-2px);
      		box-shadow: 0 2px 8px rgba(46, 204, 113, 0.2);
    	}
    
    	.add-subcategory-btn {
      		background-color: #4154f1;
      		color: white;
      		padding: 10px 20px;
      		border-radius: 6px;
      		text-decoration: none;
      		font-weight: 500;
      		display: inline-flex;
      		align-items: center;
      		gap: 8px;
      		margin-top: 20px;
      		transition: all 0.3s ease;
      		box-shadow: 0 2px 10px rgba(65, 84, 241, 0.2);
    	}
    
    	.add-subcategory-btn:hover {
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
    
    	.no-data {
      		text-align: center;
      		padding: 20px;
      		color: #6c757d;
      		font-style: italic;
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
      		<h1>List of Sub-categories</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List Sub-categories</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="card">
            			<div class="card-body">
              				<h5 class="card-title">Your Sub-categories</h5>
              				
              				<!-- Table with styled rows -->
              				<table class="subcategory-table">
                				<thead>
                  					<tr>
                    					<th>Sub-category ID</th>
                    					<th>Sub-category Name</th>
                    					<th>Category ID</th>
                    					<th>Actions</th>
                  					</tr>
                				</thead>
                				<tbody>
                  					<c:choose>
                    					<c:when test="${not empty subcategoryList}">
                      						<c:forEach items="${subcategoryList}" var="subcategory">
                        						<tr>
                          							<td>${subcategory.subCategoryId}</td>
                          							<td>${subcategory.subCategoryName}</td>
                          							<td>${subcategory.categoryId}</td>
                          							<td>
                            							<div class="action-btns">
                              								<a href="editsubcategory?subcategoryId=${subcategory.subCategoryId}" class="action-btn edit-btn">
                                								<i class="bi bi-pencil-square"></i> Edit
                              								</a>
                              								<a href="deletesubcategory?subcategoryId=${subcategory.subCategoryId}" class="action-btn delete-btn">
                                								<i class="bi bi-trash"></i> Delete
                              								</a>
                            							</div>
                          							</td>
                        						</tr>
                      						</c:forEach>
                    					</c:when>
                    					<c:otherwise>
                      						<tr>
                        						<td colspan="4" class="no-data">No sub-categories found. Add your first sub-category!</td>
                      						</tr>
                    					</c:otherwise>
                  					</c:choose>
                				</tbody>
              				</table>
              				<!-- End Table -->
              				
              				<a href="usernewsubcategory" class="add-subcategory-btn">
                					<i class="bi bi-plus-circle"></i> Add New Sub-category
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