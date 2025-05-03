<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>List Expenses | Expense Manager</title>
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
    
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css">
    
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <style>
        /* Custom table styling */
        .expense-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95em;
        }
    
        .expense-table thead tr {
            background-color: #4154f1;
            color: #ffffff;
        }
    
        .expense-table th {
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
        }
    
        .expense-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }
    
        .expense-table tbody tr:last-child td {
            border-bottom: none;
        }
    
        .expense-table tbody tr:hover {
            background-color: #f6f9ff;
        }
    
        /* Card styling */
        .expense-card {
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            border: none;
        }
    
        .expense-card .card-body {
            padding: 25px;
        }
    
        .expense-card .card-title {
            color: #4154f1;
            margin-bottom: 20px;
        }
    
        /* Add expense button */
        .add-expense-btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #4154f1;
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }
    
        .add-expense-btn:hover {
            background-color: #2a3ab9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: white;
        }
    
        .add-expense-btn i {
            margin-right: 8px;
        }
    
        /* Amount styling */
        .amount-cell {
            font-weight: 600;
            color: #dc3545;
        }
    
        /* Responsive table */
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }
        
        /* Search and entries filter */
        .dataTables_filter input {
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 5px 10px;
        }
        
        .dataTables_length select {
            border: 1px solid #dee2e6;
            border-radius: 4px;
            padding: 5px;
        }
        
        /* Button styling */
        .dt-buttons .btn {
            margin-right: 5px;
            padding: 5px 10px;
            font-size: 0.85rem;
        }
        
        .dt-buttons .btn-primary {
            background-color: #4154f1;
            border-color: #4154f1;
        }
        
        .dt-buttons .btn-primary:hover {
            background-color: #2a3ab9;
            border-color: #2a3ab9;
        }
        
        /* Action buttons */
        .action-btns .btn {
            padding: 5px 10px;
            font-size: 0.85rem;
            margin-right: 5px;
        }
        
        .action-btns .btn-edit {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
        }
        
        .action-btns .btn-edit:hover {
            background-color: #218838;
            border-color: #218838;
        }
        
        .action-btns .btn-delete {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
        }
        
        .action-btns .btn-delete:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        
        /* Pagination styling */
        .dataTables_paginate .paginate_button {
            padding: 5px 10px;
            margin-left: 5px;
            border: 1px solid #dee2e6;
            border-radius: 4px;
        }
        
        .dataTables_paginate .paginate_button.current {
            background-color: #4154f1;
            color: white !important;
            border-color: #4154f1;
        }
        
        .dataTables_paginate .paginate_button:hover {
            background-color: #f6f9ff;
        }
        
        /* Info text */
        .dataTables_info {
            padding-top: 10px;
        }

        @media (max-width: 992px) {
            .expense-table {
                font-size: 0.85em;
            }
            .expense-table th, 
            .expense-table td {
                padding: 8px 10px;
            }
            .action-btns .btn {
                padding: 3px 6px;
                font-size: 0.75rem;
                margin-right: 3px;
            }
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
            <h1>List of Expenses</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">List Expense</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card expense-card">
                        <div class="card-body">
                            <h5 class="card-title">Expenses</h5>
                            
                            <div class="table-responsive">
                                <table id="expensesTable" class="table expense-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Amount</th>
                                            <th>Date</th>
                                            <th>User ID</th>
                                            <th>Account</th>
                                            <th>Vendor</th>
                                            <th>Category</th>
                                            <th>Sub-category</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${expenseList}" var="expense">
                                            <tr>
                                                <td>${expense.expenseId}</td>
                                                <td>${expense.expenseTitle}</td>
                                                <td class="amount-cell">${expense.amount}</td>
                                                <td>${expense.date}</td>
                                                <td>${expense.userId}</td>
                                                <td>${expense.accountTitle}</td>
                                                <td>${expense.vendorName}</td>
                                                <td>${expense.categoryName}</td>
                                                <td>${expense.subCategoryName}</td>
                                                <td class="action-btns">
                                                    
                                                    <a href="deleteexpense?expenseId=${expense.expenseId}" 
                                                       class="btn btn-delete" 
                                                       onclick="return confirm('Are you sure you want to delete this expense?')">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="text-end mt-3">
                                <a href="newexpense" class="add-expense-btn">
                                    <i class="bi bi-plus-circle"></i> Add New Expense
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

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    
    <!-- DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#expensesTable').DataTable({
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
                    searchPlaceholder: "Search expenses...",
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