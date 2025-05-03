<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Expense | Expense Tracker</title>
    <meta name="description" content="Add new expense record">
    <meta name="keywords" content="expense tracker, finance, budgeting">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        .required-field::after {
            content: " *";
            color: #dc3545;
        }
        .is-invalid {
            border-color: #dc3545 !important;
        }
        .invalid-feedback {
            display: none;
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.875em;
            color: #dc3545;
        }
        .is-invalid ~ .invalid-feedback {
            display: block;
        }
        .loading-spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
            margin-left: 10px;
        }
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>

<body>
    <%@include file="SessionValidate.jsp"%>
    
    <jsp:include page="AdminHeader.jsp"/>
    
    <jsp:include page="AdminSidebar.jsp"/>

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

        <section class="section dashboard">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add New Expense</h5>
                    
                    <form action="${pageContext.request.contextPath}/saveexpense" method="post" class="row g-3 needs-validation" id="expenseForm" novalidate>
                        <!-- Expense Title -->
                        <div class="col-md-6">
                            <label for="title" class="form-label required-field">Title</label>
                            <input type="text" class="form-control" id="title" name="title" required 
                                   placeholder="Enter expense description" maxlength="100">
                            <div class="invalid-feedback">Please provide a title for the expense.</div>
                        </div>
                        
                        <!-- Amount -->
                        <div class="col-md-6">
                            <label for="amount" class="form-label required-field">Amount</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" step="0.01" min="0.01" class="form-control" 
                                       id="amount" name="amount" required placeholder="0.00">
                            </div>
                            <div class="invalid-feedback">Please enter a valid amount greater than 0.</div>
                        </div>
                        
                        <!-- Date -->
                        <div class="col-md-6">
                            <label for="date" class="form-label required-field">Date</label>
                            <input type="date" class="form-control" id="date" name="date" required>
                            <div class="invalid-feedback">Please select a date.</div>
                        </div>
                        
                        <!-- User Selection -->
                        <div class="col-md-6">
                            <label for="userId" class="form-label required-field">User</label>
                            <select class="form-select" id="userId" name="userId" required>
                                <option value="">--- Select User ---</option>
                                <c:forEach items="${userList}" var="user">
                                    <option value="${user.userId}">
                                        ${user.firstName} ${user.lastName}
                                    </option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">Please select a user.</div>
                        </div>
                        
                        <!-- Category Selection -->
                        <div class="col-md-6">
                            <label for="categoryId" class="form-label required-field">Category</label>
                            <select class="form-select" id="categoryId" name="categoryId" required>
                                <option value="">--- Select Category ---</option>
                            </select>
                            <div class="invalid-feedback">Please select a category.</div>
                        </div>
                        
                        <!-- Subcategory Selection -->
                        <div class="col-md-6">
                            <label for="subcategoryId" class="form-label required-field">Sub-category</label>
                            <select class="form-select" id="subcategoryId" name="subcategoryId" required disabled>
                                <option value="">--- Select Sub-category ---</option>
                            </select>
                            <div class="invalid-feedback">Please select a sub-category.</div>
                        </div>
                        
                        <!-- Vendor Selection -->
                        <div class="col-md-6">
                            <label for="vendorId" class="form-label required-field">Vendor</label>
                            <select class="form-select" id="vendorId" name="vendorId" required>
                                <option value="">--- Select Vendor ---</option>
                            </select>
                            <div class="invalid-feedback">Please select a vendor.</div>
                        </div>
                        
                        <!-- Account Selection -->
                        <div class="col-md-6">
                            <label for="accountId" class="form-label required-field">Account</label>
                            <select class="form-select" id="accountId" name="accountId" required>
                                <option value="">--- Select Account ---</option>
                            </select>
                            <div class="invalid-feedback">Please select an account.</div>
                        </div>
                        
                        <!-- Form Actions -->
                        <div class="col-12 text-center mt-4">
                            <button type="submit" class="btn btn-primary px-4" id="submitBtn">
                                <i class="bi bi-save me-2"></i>Save Expense
                                <span class="loading-spinner" id="submitSpinner"></span>
                            </button>
                            <button type="reset" class="btn btn-outline-secondary px-4 ms-2">
                                <i class="bi bi-arrow-counterclockwise me-2"></i>Reset
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="AdminFooter.jsp"/>
    
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
        <i class="bi bi-arrow-up-short"></i>
    </a>

    <!-- Vendor JS Files -->
    <script src="${pageContext.request.contextPath}/assets/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/chart.umd.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/echarts/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/quill/quill.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Template Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <!-- Custom Script for Expense Form -->
    <script>
    $(document).ready(function() {
        // Set today's date as default
        $('#date').val(new Date().toISOString().split('T')[0]);
        
        // Initialize form validation
        initFormValidation();
        
        // Load dependent dropdowns when user changes
        $('#userId').on('change', function() {
            const userId = $(this).val();
            if (userId) {
                loadUserDependentData(userId);
            } else {
                resetDependentDropdowns();
            }
        });
        
        // Load subcategories when category changes
        $('#categoryId').on('change', function() {
            const categoryId = $(this).val();
            const userId = $('#userId').val();
            
            if (categoryId && userId) {
                loadSubcategories(userId, categoryId);
            } else {
                $('#subcategoryId').html('<option value="">--- Select Sub-category ---</option>')
                                 .prop('disabled', true);
            }
        });
    });
    
    function initFormValidation() {
        // Client-side validation
        $('#expenseForm').on('submit', function(e) {
            this.classList.add('was-validated');
            
            if (!this.checkValidity()) {
                e.preventDefault();
                e.stopPropagation();
                return;
            }
            
            // Show loading spinner on valid form submission
            $('#submitSpinner').show();
            $('#submitBtn').prop('disabled', true);
        });
        
        // Custom validation for amount
        $('#amount').on('input', function() {
            if (parseFloat($(this).val()) <= 0) {
                this.setCustomValidity('Amount must be greater than 0');
            } else {
                this.setCustomValidity('');
            }
        });
    }
    
    function loadUserDependentData(userId) {
        // Show loading states
        $('#categoryId').html('<option value="">Loading categories...</option>');
        $('#vendorId').html('<option value="">Loading vendors...</option>');
        $('#accountId').html('<option value="">Loading accounts...</option>');
        $('#subcategoryId').html('<option value="">Select category first</option>')
                         .prop('disabled', true);
        
        // Load categories
        $.get('${pageContext.request.contextPath}/user/' + userId + '/categories', function(data) {
            updateDropdown('#categoryId', data, 'categoryId', 'categoryName');
        }).fail(function() {
            $('#categoryId').html('<option value="">Error loading categories</option>');
        });
        
        // Load vendors
        $.get('${pageContext.request.contextPath}/user/' + userId + '/vendors', function(data) {
            updateDropdown('#vendorId', data, 'vendorId', 'vendorName');
        }).fail(function() {
            $('#vendorId').html('<option value="">Error loading vendors</option>');
        });
        
        // Load accounts
        $.get('${pageContext.request.contextPath}/user/' + userId + '/accounts', function(data) {
            updateDropdown('#accountId', data, 'accountId', 'accountName');
        }).fail(function() {
            $('#accountId').html('<option value="">Error loading accounts</option>');
        });
    }
    
    function loadSubcategories(userId, categoryId) {
        $('#subcategoryId').html('<option value="">Loading subcategories...</option>')
                         .prop('disabled', false);
        
        $.get('${pageContext.request.contextPath}/user/' + userId + '/category/' + categoryId + '/subcategories', 
            function(data) {
                updateDropdown('#subcategoryId', data, 'subcategoryId', 'subcategoryName');
            }
        ).fail(function() {
            $('#subcategoryId').html('<option value="">Error loading subcategories</option>');
        });
    }
    
    function updateDropdown(selector, data, valueField, textField) {
        const dropdown = $(selector);
        dropdown.empty().append('<option value="">--- Select ---</option>');
        
        if (data && data.length > 0) {
            $.each(data, function(index, item) {
                dropdown.append(
                    $('<option>', {
                        value: item[valueField],
                        text: item[textField]
                    })
                );
            });
        } else {
            dropdown.append('<option value="">No options available</option>');
        }
    }
    
    function resetDependentDropdowns() {
        $('#categoryId, #accountId, #vendorId').each(function() {
            $(this).html('<option value="">--- Select ---</option>');
        });
        $('#subcategoryId').html('<option value="">Select category first</option>')
                         .prop('disabled', true);
    }
    </script>
</body>
</html>