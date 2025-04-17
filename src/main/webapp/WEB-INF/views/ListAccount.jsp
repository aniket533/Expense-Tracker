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
        .card {
            border-radius: 0.5rem;
            box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.1);
        }
        
        .table-responsive {
            overflow-x: auto;
        }
        
        .table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Nunito', sans-serif;
        }
        
        .table th {
            background-color: #4154f1;
            color: white;
            padding: 1rem;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85em;
            letter-spacing: 0.5px;
            text-align: left;
        }
        
        .table td {
            padding: 1rem;
            border-bottom: 1px solid #f0f0f0;
            font-size: 0.95em;
            vertical-align: middle;
        }
        
        .table tr:nth-child(even) {
            background-color: #f9faff;
        }
        
        .table tr:hover {
            background-color: #f1f3ff;
        }
        
        .badge {
            font-size: 0.85em;
            font-weight: 500;
            padding: 0.35em 0.65em;
        }
        
        .badge-success {
            background-color: #e2ffe5;
            color: #2ecc71;
        }
        
        .badge-danger {
            background-color: #ffe5e5;
            color: #e74c3c;
        }
        
        .action-btn {
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            transition: all 0.3s ease;
            margin-right: 0.5rem;
        }
        
        .action-btn:hover {
            text-decoration: none;
        }
        
        .btn-add {
            background-color: #4154f1;
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        
        .btn-add:hover {
            background-color: #2d3dbf;
            color: white;
        }
        
        .amount-cell {
            font-weight: 600;
            color: #4154f1;
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
            <h1>Account Management</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active">Accounts</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h5 class="card-title">All Accounts</h5>
                                <a href="newaccount" class="btn btn-add">
                                    <i class="bi bi-plus-circle"></i> Add New Account
                                </a>
                            </div>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Amount</th>
                                            <th>Default</th>
                                            <th>User ID</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${accountList}" var="account">
                                            <tr>
                                                <td>${account.title}</td>
                                                <td class="amount-cell">$${account.amount}</td>
                                                <td>
                                                    <span class="badge ${account.isDefault ? 'badge-success' : 'badge-danger'}">
                                                        ${account.isDefault ? 'Yes' : 'No'}
                                                    </span>
                                                </td>
                                                <td>${account.userId}</td>
                                                <td>
                                                    <a href="deleteaccount?accountId=${account.accountId}" 
                                                       class="action-btn text-danger"
                                                       onclick="return confirm('Are you sure you want to delete this account?')">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </a>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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