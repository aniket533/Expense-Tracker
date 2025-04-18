<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>New Income | Expense Tracker</title>
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
    /* Custom CSS for New Income Form */
    .income-form-card {
        background: #fff;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        margin-bottom: 30px;
    }
    
    .income-form-card .card-title {
        color: #4154f1;
        margin-bottom: 1.5rem;
        font-weight: 600;
        font-size: 1.25rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid #eee;
    }
    
    .form-label {
        font-weight: 600;
        color: #4154f1;
    }
    
    .form-control, .form-select {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 0.75rem;
        transition: all 0.3s;
    }
    
    .form-control:focus, .form-select:focus {
        border-color: #4154f1;
        box-shadow: 0 0 0 3px rgba(65, 84, 241, 0.1);
    }
    
    textarea.form-control {
        min-height: 100px;
        resize: vertical;
    }
    
    .btn-primary {
        background-color: #4154f1;
        border: none;
        padding: 0.75rem 1.5rem;
        font-weight: 500;
        transition: background-color 0.3s;
    }
    
    .btn-primary:hover {
        background-color: #3143c5;
    }
    
    .btn-danger {
        background-color: #dc3545;
        border: none;
        padding: 0.75rem 1.5rem;
        font-weight: 500;
        transition: background-color 0.3s;
    }
    
    .btn-danger:hover {
        background-color: #bb2d3b;
    }
    
    .btn-group {
        display: flex;
        gap: 1rem;
        margin-top: 1.5rem;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .income-form-card {
            padding: 1.5rem;
        }
        
        .row.mb-3 {
            flex-direction: column;
        }
        
        .col-sm-2, .col-sm-8 {
            width: 100%;
            max-width: 100%;
        }
        
        .col-sm-2 {
            margin-bottom: 0.5rem;
        }
    }
    
    /* Form validation styling */
    .error-message {
        color: #dc3545;
        font-size: 0.875rem;
        margin-top: 0.25rem;
    }
    
    .is-invalid {
        border-color: #dc3545 !important;
    }
    
    /* Amount input styling */
    input[name="amount"] {
        font-weight: 600;
    }
</style>
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
            <h1>New Income</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">New Income</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-8">
                    <div class="card income-form-card">
                        <div class="card-body">
                            <div class="card-title">New Income Details</div>
                            <form action="usersaveincome" method="post">

                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label form-label">Title</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="title" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label form-label">Amount</label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" name="amount" step="0.01" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label form-label">Account</label>
                                    <div class="col-sm-8">
                                        <select name="accountId" class="form-select" required>
                                            <option value="">--Select Account--</option>
                                            <c:forEach items="${accountList}" var="a">
                                                <option value="${a.accountId}">${a.title}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label form-label">Date</label>
                                    <div class="col-sm-8">
                                        <input type="date" class="form-control" name="date" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="inputText" class="col-sm-2 col-form-label form-label">Description</label>
                                    <div class="col-sm-8">
                                        <textarea name="description" class="form-control" rows="3"></textarea> 
                                    </div>
                                </div>

                                <div class="btn-group">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-save"></i> Save Income
                                    </button>
                                    <a href="userlistincome" class="btn btn-danger">
                                        <i class="bi bi-x-circle"></i> Cancel
                                    </a>
                                </div>

                            </form>
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

    <script>
        // Client-side form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const title = document.querySelector('input[name="title"]').value.trim();
            const amount = document.querySelector('input[name="amount"]').value.trim();
            const accountId = document.querySelector('select[name="accountId"]').value;
            const date = document.querySelector('input[name="date"]').value;
            
            if (!title) {
                e.preventDefault();
                alert('Please enter a title for the income');
                return;
            }
            
            if (!amount || isNaN(amount) {
                e.preventDefault();
                alert('Please enter a valid amount');
                return;
            }
            
            if (!accountId) {
                e.preventDefault();
                alert('Please select an account');
                return;
            }
            
            if (!date) {
                e.preventDefault();
                alert('Please select a date');
                return;
            }
        });
    </script>

</body>
</html>