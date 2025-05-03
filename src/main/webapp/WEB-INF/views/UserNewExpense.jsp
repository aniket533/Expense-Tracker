<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Create new expense record">
    <meta name="keywords" content="expense manager, finance, budgeting">
    <title>New Expense | Expense Manager</title>
    
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    
    <!-- Vendor CSS -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    
    <!-- Main CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        .card {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            border-radius: 0.5rem;
        }
        .form-label.required:after {
            content: " *";
            color: #dc3545;
        }
        .btn-action {
            min-width: 150px;
        }
        #subcategoryId[disabled] {
            background-color: #e9ecef;
            opacity: 1;
        }
        @media (max-width: 768px) {
            .btn-action {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="SessionValidate.jsp" %>
    <jsp:include page="UserHeader.jsp"/>
    <jsp:include page="UserSidebar.jsp"/>

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
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add New Expense</h5>
                            
                            <form id="expenseForm" action="usersaveexpense" method="post" class="row g-3 needs-validation" novalidate>
                                <input type="hidden" name="userId" value="${sessionScope.userId}">
                                
                                <!-- Title -->
                                <div class="col-md-6">
                                    <label for="title" class="form-label required">Title</label>
                                    <input type="text" class="form-control" id="title" name="title" 
                                           required placeholder="Enter expense title">
                                    <div class="invalid-feedback">Please provide a valid title.</div>
                                </div>
                                
                                <!-- Amount -->
                                <div class="col-md-6">
                                    <label for="amount" class="form-label required">Amount</label>
                                    <div class="input-group">
                                        
                                        <input type="number" step="0.01" min="0.01" class="form-control" 
                                               id="amount" name="amount" required placeholder="0.00">
                                    </div>
                                    <div class="invalid-feedback">Please enter a valid amount (minimum $0.01).</div>
                                </div>
                                
                                <!-- Date -->
                                <div class="col-md-6">
                                    <label for="date" class="form-label required">Date</label>
                                    <input type="date" class="form-control" id="date" name="date" required
                                           max="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='yyyy-MM-dd'/>">
                                    <div class="invalid-feedback">Please select a valid date (not in the future).</div>
                                </div>
                                
                                <!-- Category -->
                                <div class="col-md-6">
                                    <label for="categoryId" class="form-label required">Category</label>
                                    <select class="form-select" id="categoryId" name="categoryId" required>
                                        <option value="" selected disabled>Select Category</option>
                                        <c:forEach items="${categoryList}" var="category">
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Please select a category.</div>
                                </div>
                                
                                <!-- Subcategory (Dynamic) -->
                                <div class="col-md-6">
                                    <label for="subcategoryId" class="form-label required">Subcategory</label>
                                    <select class="form-select" id="subcategoryId" name="subcategoryId" required disabled>
                                        <option value="" selected disabled>First select a category</option>
                                    </select>
                                    <div class="invalid-feedback">Please select a subcategory.</div>
                                </div>
                                
                                <!-- Vendor -->
                                <div class="col-md-6">
                                    <label for="vendorId" class="form-label required">Vendor</label>
                                    <select class="form-select" id="vendorId" name="vendorId" required>
                                        <option value="" selected disabled>Select Vendor</option>
                                        <c:forEach items="${vendorList}" var="vendor">
                                            <option value="${vendor.vendorId}">${vendor.vendorName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Please select a vendor.</div>
                                </div>
                                
                                <!-- Account -->
                                <div class="col-md-6">
                                    <label for="accountId" class="form-label required">Account</label>
                                    <select class="form-select" id="accountId" name="accountId" required>
                                        <option value="" selected disabled>Select Account</option>
                                        <c:forEach items="${accountList}" var="account">
                                            <option value="${account.accountId}">${account.title}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Please select an account.</div>
                                </div>
                                
                                <!-- Description -->
                                
                                
                                <!-- Form Actions -->
                                <div class="col-12 text-center mt-4">
                                    <button type="submit" class="btn btn-primary btn-action me-2">
                                        <i class="bi bi-save me-1"></i> Save Expense
                                    </button>
                                    <button type="reset" class="btn btn-outline-secondary btn-action">
                                        <i class="bi bi-arrow-counterclockwise me-1"></i> Reset
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="UserFooter.jsp"/>
    
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
        <i class="bi bi-arrow-up-short"></i>
    </a>

    <!-- Vendor JS -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
    $(document).ready(function() {
        // Form validation
        (function() {
            'use strict';
            var form = document.getElementById('expenseForm');
            
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
            
            // Set today's date as default
            document.getElementById('date').valueAsDate = new Date();
        })();
        
        // Dynamic subcategory loading
        $('#categoryId').change(function() {
            var categoryId = $(this).val();
            var $subcategorySelect = $('#subcategoryId');
            
            $subcategorySelect.empty().prop('disabled', true)
                .append($('<option>', {
                    value: '',
                    text: categoryId ? 'Loading...' : 'First select a category',
                    disabled: true,
                    selected: true
                }));
            
            if (categoryId) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/subcategories/by-category',
                    method: 'GET',
                    data: { categoryId: categoryId },
                    dataType: 'json',
                    success: function(data) {
                        $subcategorySelect.empty();
                        if (data && data.length > 0) {
                            $.each(data, function(i, subcat) {
                                $subcategorySelect.append(
                                    $('<option>', {
                                        value: subcat.subcategoryId,
                                        text: subcat.subcategoryName
                                    })
                                );
                            });
                            $subcategorySelect.prop('disabled', false);
                        } else {
                            $subcategorySelect.append(
                                $('<option>', {
                                    value: '',
                                    text: 'No subcategories found',
                                    disabled: true,
                                    selected: true
                                })
                            );
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error loading subcategories:', error);
                        $subcategorySelect.empty().append(
                            $('<option>', {
                                value: '',
                                text: 'Error loading subcategories',
                                disabled: true,
                                selected: true
                            })
                        );
                    }
                });
            }
        });
    });
    </script>
</body>
</html>