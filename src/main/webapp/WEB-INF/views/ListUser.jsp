<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>List Users | Expense Manager</title>
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
  	
  	<!-- DataTables Buttons CSS -->
  	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">
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
      		<h1>List of Users</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="home">Home</a></li>
          			<li class="breadcrumb-item active">List User</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard">
			<style>
    .table-container {
        overflow-x: auto;
        background: white;
        border-radius: 0.5rem;
        box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.1);
        margin: 2rem 0;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-family: 'Nunito', sans-serif;
        color: #444444;
        margin: 0;
    }

    th {
        background-color: #4154f1;
        color: white;
        padding: 1rem 1.5rem;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.85em;
        letter-spacing: 0.5px;
    }

    td {
        padding: 1rem 1.5rem;
        border-bottom: 1px solid #f0f0f0;
        font-size: 0.95em;
    }

    tr:nth-child(even) {
        background-color: #f9faff;
    }

    tr:hover {
        background-color: #f1f3ff;
        transition: background-color 0.3s ease;
    }

    .action-links {
        display: flex;
        gap: 1rem;
    }

    .action-links a {
        color: #4154f1;
        text-decoration: none;
        padding: 0.25rem 0.5rem;
        border-radius: 4px;
        transition: all 0.3s ease;
    }

    .action-links a:hover {
        background-color: #4154f1;
        color: white;
        text-decoration: none;
    }

    @media (max-width: 768px) {
        th, td {
            padding: 0.75rem 1rem;
        }
        
        .table-container {
            border-radius: 0.25rem;
        }
    }
</style>

<div class="table-container">
    <table id="userTable" class="display">
        <!-- Table content remains the same -->
    </table>
</div>
<table id="userTable" class="display">
    <thead>
        <tr>
            <th>User Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Contact Num</th>
            <th>Email</th>
            <th>Born Year</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>  <!-- Changed from user.id -->
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.gender}</td>
                <td>${user.contactNum}</td>
                <td>${user.email}</td>
                <td>${user.bornYear}</td>
                <td>${user.role}</td>
                <td>
                    <a href="deleteUser?userId=${user.userId}">Delete</a> | 
                  <a href="editUser?userId=${user.userId}">Edit</a>    |<a href="viewUser?userId=${user.userId}">View</a>
                  

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<!-- Pagination Section (Insert Here) -->
<div class="pagination" style="margin-top: 20px;">
    <c:if test="${currentPage > 1}">
        <a href="listuser?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="listuser?page=${i}" 
           class="btn <c:if test="${i == currentPage}">btn-dark</c:if>">
            ${i}
        </a>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="listuser?page=${currentPage + 1}" class="btn btn-primary">Next</a>
    </c:if>
</div>
			<br>
			<a href="newuser">Add User</a>
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
  	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
					
	<!-- DataTables and Buttons JS -->
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>

<!-- Initialize DataTables with Buttons -->
<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    exportOptions: {
                        columns: ':not(:last-child)' // Exclude last column (Action)
                    }
                },
                {
                    extend: 'csv',
                    exportOptions: {
                        columns: ':not(:last-child)' // Exclude last column (Action)
                    }
                },
                {
                    extend: 'excel',
                    exportOptions: {
                        columns: ':not(:last-child)' // Exclude last column (Action)
                    }
                },
                {
                    extend: 'pdf',
                    exportOptions: {
                        columns: ':not(:last-child)' // Exclude last column (Action)
                    }
                },
                {
                    extend: 'print',
                    exportOptions: {
                        columns: ':not(:last-child)' // Exclude last column (Action)
                    }
                }
            ],
            "paging": true,
            "lengthMenu": [5, 10, 25, 50],
            "ordering": true,
            "info": true,
            "searching": true,
            "columnDefs": [
                {
                    "targets": -1, // Last column
                    "orderable": false // Make Action column non-orderable
                }
            ]
        });
    });
</script>
</body>

</html>