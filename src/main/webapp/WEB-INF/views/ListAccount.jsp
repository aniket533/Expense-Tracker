<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>List Accounts | Expense Manager</title>
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
        /* Custom CSS for Accounts Table - Matching Category style */
        .account-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            border-radius: 5px 5px 0 0;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
    
        .account-table thead tr {
            background-color: #4154f1;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
        }
    
        .account-table th,
        .account-table td {
            padding: 12px 15px;
        }
    
        .account-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }
    
        .account-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }
    
        .account-table tbody tr:last-of-type {
            border-bottom: 2px solid #4154f1;
        }
    
        .account-table tbody tr:hover {
            background-color: #f1f3ff;
        }
    
        .action-btn {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
    
        .delete-btn {
            background-color: #ff3d3d;
            color: white;
        }
    
        .delete-btn:hover {
            background-color: #ff0000;
            transform: translateY(-2px);
        }
    
        .add-account-btn {
            background-color: #4154f1;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            display: inline-block;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
    
        .add-account-btn:hover {
            background-color: #2a3ac7;
            transform: translateY(-2px);
        }
    
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
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
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Accounts</h5>
                            
                            <!-- Table with stripped rows -->
                            <table class="account-table">
                                <thead>
                                    <tr>
                                        <th>Account ID</th>
                                        <th>Title</th>
                                        <th>User ID</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${accountList}" var="account">
                                        <tr>
                                            <td>${account.accountId}</td>
                                            <td>${account.title}</td>
                                            <td>${account.userId}</td>
                                            <td>
                                                <a href="deleteaccount?accountId=${account.accountId}" 
                                                   class="action-btn delete-btn"
                                                   onclick="return confirm('Are you sure you want to delete this account?')">
                                                    <i class="bi bi-trash"></i> Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- End Table with stripped rows -->
                            
                            <a href="newaccount" class="add-account-btn">
                                <i class="bi bi-plus-circle"></i> Add New Account
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <jsp:include page="AdminFooter.jsp"></jsp:include>
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