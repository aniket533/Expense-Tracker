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
    
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    <style>
        .expense-table {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .no-expenses {
            text-align: center;
            padding: 2rem;
            color: #6c757d;
        }
        .action-btns .btn {
            margin-right: 5px;
        }
        .badge {
            font-size: 0.9em;
            padding: 0.5em 0.75em;
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

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card expense-table">
                        <div class="card-body">
                            <h5 class="card-title">Your Expense Records</h5>
                            
                            <c:choose>
                                <c:when test="${not empty expenseList}">
                                    <div class="table-responsive">
                                        <table class="table table-hover align-middle">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Category</th>
                                                    <th scope="col">Amount</th>
                                                    <th scope="col">Date</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="count" value="1" />
                                                <c:forEach items="${expenseList}" var="expense">
                                                    <tr>
                                                        <th scope="row">${count}</th>
                                                        <td>${expense.title}</td>
                                                        <td>
                                                            <c:forEach items="${categoryList}" var="category">
                                                                <c:if test="${category.categoryId == expense.categoryId}">
                                                                    ${category.categoryName}
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">
                                                                <fmt:formatNumber value="${expense.amount}" type="currency"/>
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${expense.date.getClass().simpleName == 'String'}">
                                                                    ${expense.date} <!-- Display as plain string -->
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatDate value="${expense.date}" pattern="dd-MMM-yyyy"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                         
   
                                                        <td class="action-btns">
                                                           
                                                            <a href="userdeleteexpense?expenseId=${expense.expenseId}" 
                                                               class="btn btn-sm btn-outline-danger"
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
                                    <div class="no-expenses">
                                        <i class="bi bi-wallet2" style="font-size: 3rem;"></i>
                                        <h5>No expenses found</h5>
                                        <p>You haven't recorded any expenses yet</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            
                            <div class="text-end mt-3">
                                <a href="usernewexpense" class="btn btn-primary">
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
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
</body>
</html>