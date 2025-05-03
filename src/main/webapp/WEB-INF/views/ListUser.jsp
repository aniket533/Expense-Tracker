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
  	
  	<!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css">
    
   <style>
    /* Simplified action buttons */
    .action-btns {
        display: flex;
        gap: 8px;
    }
    
    .action-btns a {
        color: #6c757d;
        text-decoration: none;
        font-size: 0.9rem;
        padding: 4px 8px;
        border-radius: 4px;
        transition: all 0.2s ease;
    }
    
    .action-btns a:hover {
        background-color: #f8f9fa;
        text-decoration: none;
    }
    
    .action-btns .delete {
        color: #dc3545;
    }
    
    .action-btns .edit {
        color: #28a745;
    }
    
    .action-btns .view {
        color: #17a2b8;
    }
    
    .action-btns a:hover.delete {
        background-color: rgba(220, 53, 69, 0.1);
    }
    
    .action-btns a:hover.edit {
        background-color: rgba(40, 167, 69, 0.1);
    }
    
    .action-btns a:hover.view {
        background-color: rgba(23, 162, 184, 0.1);
    }
</style>

<!-- In the table body -->
<td class="action-btns">
    <a href="deleteUser?userId=${user.userId}" 
       class="delete" 
       onclick="return confirm('Are you sure you want to delete this user?')">
       Delete
    </a>
    <a href="editUser?userId=${user.userId}" class="edit">
       Edit
    </a>
    <a href="viewUser?userId=${user.userId}" class="view">
       View
    </a>
</td>
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
            <div class="row">
                <div class="col-lg-12">
                    <div class="card user-card">
                        <div class="card-body">
                            <h5 class="card-title">Users</h5>
                            
                            <div class="table-responsive">
                                <table id="userTable" class="table user-table">
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
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${userList}">
                                            <tr>
                                                <td>${user.userId}</td>
                                                <td>${user.firstName}</td>
                                                <td>${user.lastName}</td>
                                                <td>${user.gender}</td>
                                                <td>${user.contactNum}</td>
                                                <td>${user.email}</td>
                                                <td>${user.bornYear}</td>
                                                <td>${user.role}</td>
                                                <td class="action-btns">
                                                    <a href="deleteUser?userId=${user.userId}" 
                                                       class="btn btn-delete" 
                                                       onclick="return confirm('Are you sure you want to delete this user?')">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </a>
                                                    <a href="editUser?userId=${user.userId}" 
                                                       class="btn btn-edit">
                                                        <i class="bi bi-pencil"></i> Edit
                                                    </a>
                                                    <a href="viewUser?userId=${user.userId}" 
                                                       class="btn btn-view">
                                                        <i class="bi bi-eye"></i> View
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="text-end mt-3">
                                <a href="newuser" class="add-user-btn">
                                    <i class="bi bi-plus-circle"></i> Add New User
                                </a>
                            </div>
                        </div>
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
  	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
					
	<!-- DataTables and Buttons JS -->
	<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>

<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
            dom: '<"top"<"row"<"col-sm-12 col-md-6"B><"col-sm-12 col-md-6"f>>>rt<"bottom"<"row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-6"p>>>',
            buttons: [
                {
                    extend: 'copy',
                    className: 'btn btn-primary',
                    text: '<i class="bi bi-files"></i> Copy'
                },
                {
                    extend: 'excel',
                    className: 'btn btn-primary',
                    text: '<i class="bi bi-file-earmark-excel"></i> Excel'
                },
                {
                    extend: 'pdf',
                    className: 'btn btn-primary',
                    text: '<i class="bi bi-file-earmark-pdf"></i> PDF'
                },
                {
                    extend: 'print',
                    className: 'btn btn-primary',
                    text: '<i class="bi bi-printer"></i> Print'
                }
            ],
            lengthMenu: [[5, 10, 20, -1], [5, 10, 20, "All"]],
            pageLength: 10,
            responsive: true,
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search users...",
                lengthMenu: "Show _MENU_ entries",
                info: "Showing _START_ to _END_ of _TOTAL_ entries",
                paginate: {
                    first: "First",
                    last: "Last",
                    next: "Next",
                    previous: "Previous"
                }
            },
            columnDefs: [
                {
                    targets: -1, // Last column (Actions)
                    orderable: false,
                    searchable: false
                }
            ]
        });
    });
</script>
</body>
</html>