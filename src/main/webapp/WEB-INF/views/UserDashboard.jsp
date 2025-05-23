<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>User Dashboard | Expense Tracker</title>
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

<!-- =======================================================
  	* Template Name: NiceAdmin
  	* Updated: Jan 29 2024 with Bootstrap v5.3.2
  	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  	* Author: BootstrapMade.com
  	* License: https://bootstrapmade.com/license/
  	======================================================== -->
</head>

<body>

	<!-- ======= Session Validate ======= -->
	<%@include file="SessionValidate.jsp"%>
	<!-- End Session Validate -->

	<!-- ======= Header ======= -->
	<jsp:include page="UserHeader.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="UserSidebar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>User Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Home</a></li>
					<li class="breadcrumb-item active">User Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">

			<div class="row">




				<!-- Sales Card -->
				<div class="col-xxl-3 col-md-3">
					<div class="card info-card sales-card">
                         


						<div class="card-body">
							<h5 class="card-title">
								Expense <span>| Current Month</span>
							</h5>

							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-currency-rupee"></i>
								</div>
								<div class="ps-2">
									<h6>Rs ${currentMonthExp}</h6>
									<!-- <span class="text-success small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">increase</span> -->

								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- End Sales Card -->

				<!-- Revenue Card -->
				<div class="col-xxl-3 col-md-3">

					<div class="card info-card revenue-card">



						<div class="card-body">
							<h5 class="card-title">
								Expense <span>| This Year</span>
							</h5>

							<div class="d-flex align-items-center">
								<div
									class="card-icon rounded-circle d-flex align-items-center justify-content-center">
									<i class="bi bi-currency-rupee"></i>
								</div>
								<div class="ps-2">
									<h6>Rs ${currentYearExp}</h6>

								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- End Revenue Card -->

				<!-- Customers Card -->
				
		<div class="card info-card sales-card">



			<div class="card-body">
				<div>
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</div>


	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<jsp:include page="AdminFooter.jsp"></jsp:include>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Jan', 'Feb', 'March', 'April', 'May', 'June','July','Aug','Sep','Oct','Nov','Dec'],
      datasets: [{
        label: 'Month Wise Expense',
        data: [${datamap.get('1')},${datamap.get('2')},${datamap.get('3')},${datamap.get('4')},${datamap.get('5')},${datamap.get('6')},${datamap.get('7')},${datamap.get('8')},${datamap.get('9')},${datamap.get('10')},${datamap.get('11')},${datamap.get('12')}],
        borderWidth: 1
      }]
    },
    options: {
      scales: {                  
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
</body>

</html>