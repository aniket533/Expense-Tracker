<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Expense | Expense Tracker</title>
    <meta name="description" content="Add new expense record">
    <meta name="keywords" content="expense tracker, finance, budgeting">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #4154f1;
            --danger-color: #dc3545;
            --secondary-color: #6c757d;
        }
        
        .required-field::after {
            content: " *";
            color: var(--danger-color);
        }
        
        .is-invalid {
            border-color: var(--danger-color) !important;
        }
        
        .invalid-feedback {
            display: none;
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.875em;
            color: var(--danger-color);
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
        
        .form-select {
            cursor: pointer;
        }
        
        .card {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        /* Loading indicator for dropdowns */
        .dropdown-loading {
            color: var(--secondary-color);
            font-style: italic;
        }
        
        .dropdown-error {
            color: var(--danger-color);
            font-style: italic;
        }
    </style>
</head>

<body>
    <%@include file="SessionValidate.jsp"%>
    
    <jsp:include page="UserHeader.jsp"/>
    
    <jsp:include page="UserSidebar.jsp"/>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>New Expense</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">New Expense</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Add New Expense</h5>
                    
                    <form action="${pageContext.request.contextPath}/usersaveexpense" method="post" 
                          class="row g-3 needs-validation" id="expenseForm" novalidate>
                        
                        <!-- Amount -->
                        <div class="col-md-6">
                            <label for="amount" class="form-label required-field">Amount</label>
                            <div class="input-group has-validation">
                                <input type="number" step="0.01" min="0.01" class="form-control" 
                                       id="amount" name="amount" required placeholder="0.00">
                                <div class="invalid-feedback">Please enter a valid amount greater than 0.</div>
                            </div>
                        </div>
                        
                        <!-- Date -->
                        <div class="col-md-6">
                            <label for="date" class="form-label required-field">Date</label>
                            <input type="date" class="form-control" id="date" name="date" required
                                   max="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>">
                            <div class="invalid-feedback">Please select a valid date (not in the future).</div>
                        </div>
                        
                        <!-- Category Selection -->
                        <div class="col-md-6">
                            <label for="categoryId" class="form-label required-field">Category</label>
                            <select class="form-select" id="categoryId" name="categoryId" required>
                                <option value="" disabled selected>--- Select Category ---</option>
                                <c:forEach var="category" items="${categoryList}">
                                    <option value="${category.categoryId}">${category.categoryName}</option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">Please select a category.</div>
                        </div>
                        
                        <!-- Subcategory Selection -->
                        <div class="col-md-6">
                            <label for="subcategoryId" class="form-label required-field">Subcategory</label>
                            <select class="form-select" id="subcategoryId" name="subcategoryId" required disabled>
                                <option value="" disabled selected>--- Select Subcategory ---</option>
                            </select>
                            <div class="invalid-feedback">Please select a subcategory.</div>
                        </div>
                        
                        <!-- Vendor Selection -->
                        <div class="col-md-6">
                            <label for="vendorId" class="form-label required-field">Vendor</label>
                            <select class="form-select" id="vendorId" name="vendorId" required>
                                <option value="" disabled selected>--- Select Vendor ---</option>
                                <c:forEach var="vendor" items="${vendorList}">
                                    <option value="${vendor.vendorId}">${vendor.vendorName}</option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">Please select a vendor.</div>
                        </div>
                        
                        <!-- Account Selection -->
                        <div class="col-md-6">
                            <label for="accountId" class="form-label required-field">Account</label>
                            <select class="form-select" id="accountId" name="accountId" required>
                                <option value="" disabled selected>--- Select Account ---</option>
                                <c:forEach items="${accountList}" var="account">
                                    <option value="${account.accountId}">${account.title}</option>
                                </c:forEach>
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

    <jsp:include page="UserFooter.jsp"/>
    
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
        <i class="bi bi-arrow-up-short"></i>
    </a>

    <!-- Vendor JS Files -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Template Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <!-- Custom Script for Expense Form -->
    <script>
    $(document).ready(function() {
        // Set today's date as default
        const today = new Date().toISOString().split('T')[0];
        $('#date').val(today);
        
        // Initialize form validation
        initFormValidation();
        
        // Load subcategories when category changes
        $('#categoryId').on('change', function() {
            const categoryId = $(this).val();
            const userId = '${sessionScope.user.userId}';
            
            if (categoryId && userId) {
                loadSubcategories(userId, categoryId);
            } else {
                resetSubcategoryDropdown();
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
            const amount = parseFloat($(this).val());
            if (isNaN(amount)) {
                this.setCustomValidity('Please enter a valid number');
            } else if (amount <= 0) {
                this.setCustomValidity('Amount must be greater than 0');
            } else {
                this.setCustomValidity('');
            }
        });
    }

    function loadSubcategories(userId, categoryId) {
        setDropdownLoadingState('#subcategoryId', 'Loading subcategories...');
        
        $.get({
            url: '${pageContext.request.contextPath}/user/' + userId + '/category/' + categoryId + '/subcategories',
            success: function(data) {
                if (data && data.length > 0) {
                    updateDropdown('#subcategoryId', data, 'subcategoryId', 'subcategoryName');
                    $('#subcategoryId').prop('disabled', false);
                } else {
                    setDropdownErrorState('#subcategoryId', 'No subcategories available');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error loading subcategories:', error);
                setDropdownErrorState('#subcategoryId', 'Error loading subcategories');
            }
        });
    }

    function updateDropdown(selector, data, valueField, textField) {
        const dropdown = $(selector);
        dropdown.empty().append('<option value="" disabled selected>--- Select ---</option>');
        
        if (data && data.length > 0) {
            $.each(data, function(index, item) {
                dropdown.append(
                    $('<option>', {
                        value: item[valueField],
                        text: item[textField]
                    })
                );
            });
            dropdown.prop('disabled', false);
        } else {
            setDropdownErrorState(selector, 'No options available');
        }
    }

    function setDropdownLoadingState(selector, message) {
        $(selector).empty()
                   .append(`<option value="" disabled selected class="dropdown-loading">${message}</option>`)
                   .prop('disabled', true);
    }

    function setDropdownErrorState(selector, message) {
        $(selector).empty()
                   .append(`<option value="" disabled selected class="dropdown-error">${message}</option>`)
                   .prop('disabled', true);
    }

    function resetSubcategoryDropdown() {
        setDropdownLoadingState('#subcategoryId', 'Select category first');
    }
    </script>
</body>
</html>