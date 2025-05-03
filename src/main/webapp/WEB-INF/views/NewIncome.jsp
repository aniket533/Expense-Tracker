<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Income creation page for Expense Manager">
    <meta name="keywords" content="expense manager, income, finance">

    <title>New Income | Expense Manager</title>

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
        /* Custom CSS for Income Form */
        .income-form {
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #4154f1;
        }

        .form-control {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4154f1;
            box-shadow: 0 0 0 3px rgba(65, 84, 241, 0.1);
            outline: none;
        }

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 16px 12px;
        }

        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }

        .submit-btn {
            background-color: #4154f1;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 10px rgba(65, 84, 241, 0.2);
        }

        .submit-btn:hover {
            background-color: #2a3ac7;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(65, 84, 241, 0.3);
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-col {
            flex: 1;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
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
    </style>
</head>

<body>
    <!-- ======= Session Validation ======= -->
    <%@include file="SessionValidate.jsp" %>
    <!-- End Session Validation -->

    <!-- ======= Header ======= -->
    <jsp:include page="AdminHeader.jsp"></jsp:include>
    <!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <jsp:include page="AdminSidebar.jsp"></jsp:include>
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
        </div><!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Income Details</h5>
                            
                            <form action="saveincome" method="post" class="income-form">
                                <div class="form-group">
                                    <label for="title">Title</label>
                                    <input type="text" id="title" name="title" class="form-control" required>
                                </div>
                
                                <div class="form-row">
                                    <div class="form-col">
                                        <div class="form-group">
                                            <label for="accountId">Account</label>
                                            <select id="accountId" name="accountId" class="form-control" required>
                                                <option value="">--- Select Account ---</option>
                                                <c:forEach items="${accountList}" var="account">
                                                    <option value="${account.accountId}">${account.title}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-col">
                                        <div class="form-group">
                                            <label for="userId">User</label>
                                            <select id="userId" name="userId" class="form-control" required>
                                                <option value="">--- Select User ---</option>
                                                <c:forEach items="${userList}" var="user">
                                                    <option value="${user.userId}">
                                                        ${user.userId} ${user.firstName} ${user.lastName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                
                                <div class="form-row">
                                    <div class="form-col">
                                        <div class="form-group">
                                            <label for="amount">Amount</label>
                                            <input type="number" id="amount" name="amount" class="form-control" 
                                                   step="0.01" min="0" required>
                                        </div>
                                    </div>
                                    <div class="form-col">
                                        <div class="form-group">
                                            <label for="date">Date</label>
                                            <input type="date" id="date" name="date" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                
                                <button type="submit" class="submit-btn">
                                    <i class="bi bi-save"></i> Save Income
                                </button>
                            </form>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <script>
        $(document).ready(function() {
            $('#userId').change(function() {
                var userId = $(this).val();
                $('#accountId').empty().append('<option value="">--- Select Account ---</option>');

                if (userId) {
                    // AJAX call to get accounts for selected user
                    $.getJSON('getAccountsByUser', { userId: userId }, function(data) {
                        $.each(data, function(index, account) {
                            $('#accountId').append(
                                $('<option></option>').val(account.accountId).text(account.title)
                            );
                        });
                    }).fail(function() {
                        console.error('Error loading accounts');
                    });
                }
            });

            // Set default date to today
            var today = new Date().toISOString().split('T')[0];
            $('#date').val(today);
        });
    </script>
</body>
</html>