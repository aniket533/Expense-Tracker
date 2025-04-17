<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>User profile | Expense Tracker</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<style>
/* Custom CSS for Profile Page */
.profile-card {
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
    border: none;
}

.profile-card .card-body {
    padding: 2rem;
}

.profile-tab-content {
    padding: 20px 0;
}

.profile-overview .label {
    font-weight: 600;
    color: #4154f1;
}

.profile-overview .row {
    margin-bottom: 15px;
    padding: 10px 0;
    border-bottom: 1px solid #f0f0f0;
}

.profile-overview .row:last-child {
    border-bottom: none;
}

.nav-tabs-bordered {
    border-bottom: 2px solid #dee2e6;
}

.nav-tabs-bordered .nav-link {
    margin-bottom: -2px;
    border: none;
    color: #6c757d;
    font-weight: 600;
    padding: 12px 20px;
}

.nav-tabs-bordered .nav-link.active {
    color: #4154f1;
    border-bottom: 3px solid #4154f1;
    background-color: transparent;
}

.profile-header {
    margin-bottom: 30px;
}

.profile-header h1 {
    color: #012970;
    font-weight: 700;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .profile-overview .label, 
    .profile-overview .col-lg-9 {
        padding: 5px 0;
    }
    
    .profile-card .card-body {
        padding: 1.5rem;
    }
}

/* Animation for tab switching */
.tab-pane.fade {
    transition: opacity 0.3s ease-in;
}

/* Hover effects */
.nav-tabs-bordered .nav-link:hover {
    color: #4154f1;
    border-bottom: 3px solid rgba(65, 84, 241, 0.2);
}
</style>

</head>

<body>

	<!-- ======= Session Validate ======= -->
	<%@include file="SessionValidate.jsp"%>
	<!-- End Session Validate -->

	<!-- ======= Header ======= -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>	

	<!-- ======= Sidebar ======= -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>User Profile</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">User Profile</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
      <div class="row">
        <div class="col-xl-12">
          <div class="card profile-card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">Overview</button>
                </li>
              </ul>
              
              <div class="tab-content pt-2">
                <div class="tab-pane fade profile-overview active show" id="profile-overview" role="tabpanel">
                  <h5 class="card-title">Profile Details</h5>
                    
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">User ID</div>
                    <div class="col-lg-9 col-md-8">${user.userId}</div>
                  </div>
                    
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">First Name</div>
                    <div class="col-lg-9 col-md-8">${user.firstName}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Last Name</div>
                    <div class="col-lg-9 col-md-8">${user.lastName}</div>
                  </div>
 
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Gender</div>
                    <div class="col-lg-9 col-md-8">${user.gender}</div>
                  </div>
                   
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Contact Number</div>
                    <div class="col-lg-9 col-md-8">${user.contactNum}</div>
                  </div>
 
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">${user.email}</div>
                  </div>
 
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Date of Birth</div>
                    <div class="col-lg-9 col-md-8">${user.bornYear}</div>
                  </div>
 
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Role</div>
                    <div class="col-lg-9 col-md-8">${user.role}</div>
                  </div>

                </div>
              </div><!-- End Bordered Tabs -->
            </div>
          </div>
        </div>
      </div>
    </section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="UserFooter.jsp"></jsp:include>
	<!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

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