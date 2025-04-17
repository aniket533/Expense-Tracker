<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>New Expense | Expense Manager</title>
    
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
        .card {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        .form-label {
            font-weight: 500;
        }
        .required-field::after {
            content: " *";
            color: red;
        }
    </style>
</head>

<body>
    <%@include file="SessionValidate.jsp" %>
    <jsp:include page="UserHeader.jsp"></jsp:include>
    <jsp:include page="UserSidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>New Expense</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">New Expense</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add New Expense</h5>
                            
                            <form action="usersaveexpense" method="post" class="row g-3 needs-validation" novalidate>
                                <!-- Hidden user ID field - This ensures the logged-in user's ID is passed -->
                                <input type="hidden" name="userId" value="${sessionScope.userId}">
                                
                                <div class="col-md-6">
                                    <label for="title" class="form-label required-field">Title</label>
                                    <input type="text" class="form-control" id="title" name="title" required>
                                    <div class="invalid-feedback">
                                        Please enter expense title.
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="amount" class="form-label required-field">Amount</label>
                                    <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
                                    <div class="invalid-feedback">
                                        Please enter valid amount.
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="date" class="form-label required-field">Date</label>
                                    <input type="date" class="form-control" id="date" name="date" required 
                                           max="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>">
                                    <div class="invalid-feedback">
                                        Please select expense date.
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="categoryId" class="form-label required-field">Category</label>
                                    <select class="form-select" id="categoryId" name="categoryId" required>
                                        <option value="" selected disabled>--- Select Category ---</option>
                                        <c:forEach items="${categoryList}" var="category">
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">
                                        Please select a category.
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="subcategoryId" class="form-label required-field">Sub-category</label>
                                    <select class="form-select" id="subcategoryId" name="subcategoryId" required>
                                        <option value="" selected disabled>--- Select Sub-category ---</option>
                                        <c:forEach items="${subcategoryList}" var="subcategory">
                                            <option value="${subcategory.subcategoryId}">${subcategory.subcategoryName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">
                                        Please select a sub-category.
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="vendorId" class="form-label required-field">Vendor</label>
                                    <select class="form-select" id="vendorId" name="vendorId" required>
                                        <option value="" selected disabled>--- Select Vendor ---</option>
                                        <c:forEach items="${vendorList}" var="vendor">
                                            <option value="${vendor.vendorId}">${vendor.vendorName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">
                                        Please select a vendor.
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label for="accountId" class="form-label required-field">Account</label>
                                    <select class="form-select" id="accountId" name="accountId" required>
                                        <option value="" selected disabled>--- Select Account ---</option>
                                        <c:forEach items="${accountList}" var="account">
                                            <option value="${account.accountId}">${account.title}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">
                                        Please select an account.
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                </div>
                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="bi bi-save"></i> Save Expense
                                    </button>
                                    <button type="reset" class="btn btn-secondary">
                                        <i class="bi bi-arrow-counterclockwise"></i> Reset
                                    </button>
                                </div>
                            </form>
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
    
    <!-- Form Validation Script -->
    <script>
    (function () {
        'use strict'
        
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
        
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    
                    form.classList.add('was-validated')
                }, false)
            })
    })()
    </script>
</body>
</html>