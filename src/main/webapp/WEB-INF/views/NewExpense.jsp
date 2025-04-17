<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>New Expense | Expense Tracker</title>
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
      		<h1>New Expense</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">New Expense</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Add New Expense</h5>
					
					<form action="saveexpense" method="post" class="row g-3">
						<div class="col-md-6">
							<label for="title" class="form-label">Title</label>
							<input type="text" class="form-control" id="title" name="title" required>
						</div>
						
						<div class="col-md-6">
							<label for="amount" class="form-label">Amount</label>
							<input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
						</div>
						
						<div class="col-md-6">
							<label for="date" class="form-label">Date</label>
							<input type="date" class="form-control" id="date" name="date" required>
						</div>
						
						<div class="col-md-6">
							<label for="categoryId" class="form-label">Category</label>
							<select class="form-select" id="categoryId" name="categoryId" required>
								<option value="">---Select Category---</option>
								<c:forEach items="${categoryList}" var="category">
									<option value="${category.categoryId}">${category.categoryName}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-md-6">
							<label for="subcategoryId" class="form-label">Sub-category</label>
							<select class="form-select" id="subcategoryId" name="subcategoryId" required>
								<option value="">---Select Sub-category---</option>
								<c:forEach items="${subcategoryList}" var="subcategory">
									<option value="${subcategory.subcategoryId}">${subcategory.subcategoryName}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-md-6">
							<label for="vendorId" class="form-label">Vendor</label>
							<select class="form-select" id="vendorId" name="vendorId" required>
								<option value="">---Select Vendor---</option>
								<c:forEach items="${vendorList}" var="vendor">
									<option value="${vendor.vendorId}">${vendor.vendorName}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-md-6">
							<label for="accountId" class="form-label">Account</label>
							<select class="form-select" id="accountId" name="accountId" required>
								<option value="">---Select Account---</option>
								<c:forEach items="${accountList}" var="account">
									<option value="${account.accountId}">${account.title}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-md-6">
    <label for="userId" class="form-label">User</label>
    <select class="form-select" id="userId" name="userId" required>
        <option value="">--- Select User ---</option>
        <c:forEach items="${userList}" var="user">
            <option value="${user.userId}">${user.firstName} ${user.lastName}</option>
        </c:forEach>
    </select>
</div>

						
						<div class="col-12">
							<label for="description" class="form-label">Description</label>
							<textarea class="form-control" id="description" name="description" rows="3"></textarea>
						</div>
						
						<!-- Hidden status field (if needed) -->
						
						
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Save Expense</button>
							<button type="reset" class="btn btn-secondary">Reset</button>
						</div>
					</form>
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