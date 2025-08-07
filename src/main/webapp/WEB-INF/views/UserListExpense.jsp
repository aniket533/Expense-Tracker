<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>My Expenses | Expense Tracker</title>
    
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
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .table-container {
            padding: 20px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th {
            background-color: #4154f1;
            color: white;
            padding: 12px;
            text-align: left;
        }
        .table td {
            padding: 12px;
            border-bottom: 1px solid #e9ecef;
        }
        .table tr:hover {
            background-color: #f8f9fa;
        }
        .action-btn {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        .delete-btn:hover {
            background-color: #bb2d3b;
            color: white;
        }
        .add-btn {
            background-color: #4154f1;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            transition: all 0.3s;
        }
        .add-btn:hover {
            background-color: #2a3ac9;
            color: white;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            color: #6c757d;
            font-style: italic;
        }
        .badge {
            font-size: 0.9em;
            padding: 0.5em 0.75em;
        }
        .amount-badge {
            
            color: black;
        }
    </style>
</head>

<body>
    <%@include file="SessionValidate.jsp" %>
    <jsp:include page="UserHeader.jsp"></jsp:include>
    <jsp:include page="UserSidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>My Expenses</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="userdashboard">Home</a></li>
                    <li class="breadcrumb-item active">My Expenses</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Your Expense Records</h5>
                            
                            <c:choose>
                                <c:when test="${not empty expenseList}">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <!-- Updated Table Header -->
<thead>
    <tr>
        <th scope="col">No</th>
         <th scope="col">Account</th>
        <th scope="col">Vendor</th>  <!-- New Column -->
        <th scope="col">Category</th>
        <th scope="col">Sub-Category</th>
        <th scope="col">Amount</th>
        <th scope="col">Date</th>
        <th scope="col">Actions</th>
    </tr>
</thead>

<!-- Updated Table Body -->
<tbody>
    <c:set var="count" value="1" />
    <c:forEach items="${expenseList}" var="expense">
        <tr>
            <td>${count}</td>
            
            <td>
                <c:forEach items="${accountList}" var="account">
                    <c:if test="${account.accountId == expense.accountId}">
                        ${account.title}
                    </c:if>
                </c:forEach>
            </td>
            
            
            
            <!-- New: Vendor Name Column -->
            <td>
                <c:forEach items="${vendorList}" var="vendor">
                    <c:if test="${vendor.vendorId == expense.vendorId}">
                        ${vendor.vendorName}
                    </c:if>
                </c:forEach>
            </td>
            
            <!-- Existing Columns -->
            <td>
                <c:forEach items="${categoryList}" var="category">
                    <c:if test="${category.categoryId == expense.categoryId}">
                        ${category.categoryName}
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${subcategoryList}" var="subCategory">
                    <c:if test="${subCategory.subcategoryId == expense.subcategoryId}">
                        ${subCategory.subcategoryName}
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <span class="badge amount-badge">
                   <fmt:formatNumber value="${expense.amount}" type="number" minFractionDigits="2" />

                </span>
            </td>
            <td>
                <c:choose>
                    <c:when test="${expense.date.getClass().simpleName == 'String'}">
                        ${expense.date}
                    </c:when>
                    <c:otherwise>
                        <fmt:formatDate value="${expense.date}" pattern="dd-MMM-yyyy"/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <a href="userdeleteexpense?expenseId=${expense.expenseId}" 
                   class="action-btn delete-btn"
                   onclick="return confirm('Are you sure you want to delete this expense?')">
                    <i class="bi bi-trash"></i> Delete
                </a>
            </td>
        </tr>
        <c:set var="count" value="${count + 1}" />
    </c:forEach>
</tbody>
                                        </table>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-data">
                                        <i class="bi bi-wallet2" style="font-size: 2rem;"></i>
                                        <h5>No expenses found</h5>
                                        <p>You haven't recorded any expenses yet</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            
                            <div class="text-end">
                                <a href="usernewexpense" class="add-btn">
                                    <i class="bi bi-plus-circle"></i> Add New Expense
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="UserFooter.jsp"></jsp:include>

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