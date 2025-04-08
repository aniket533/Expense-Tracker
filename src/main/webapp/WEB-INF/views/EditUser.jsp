<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Edit user profile page for Expense Manager application">
    
    <title>Edit User Profile | Expense Manager</title>
    
    <!-- Favicons -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&family=Nunito:wght@300;400;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Vendor CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css">
    
    <!-- Template Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>
    <!-- Session Validation -->
    <%@include file="SessionValidate.jsp"%>
    
    <!-- Header -->
    <jsp:include page="AdminHeader.jsp"/>
    
    <!-- Sidebar -->
    <jsp:include page="AdminSidebar.jsp"/>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Edit User Profile</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                </ol>
            </nav>
        </div>

        <section class="section">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Profile Details</h5>
                            
                            <!-- Profile Edit Form -->
                            <form id="profileForm" action="updatemyprofile" method="post" class="needs-validation" novalidate enctype="multipart/form-data">
                                <!-- Hidden Fields -->
                                <input type="hidden" name="userId" value="${user.userId}">
                                <input type="hidden" name="role" value="${user.role}">
                                <input type="hidden" name="gender" value="${user.gender}">
                                <input type="hidden" name="password" value="${user.password}">
                                
                                <!-- Personal Information Section -->
                                <div class="row mb-3">
                                    <label for="firstName" class="col-sm-3 col-form-label">First Name </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="firstName" name="firstName" 
                                            value="${user.firstName}" required maxlength="50">
                                        <div class="invalid-feedback">Please enter your first name.</div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="lastName" class="col-sm-3 col-form-label">Last Name </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="lastName" name="lastName" 
                                            value="${user.lastName}" required maxlength="50">
                                        <div class="invalid-feedback">Please enter your last name.</div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label for="contactNum" class="col-sm-3 col-form-label">Phone Number </label>
                                    <div class="col-sm-9">
                                        <input type="tel" class="form-control" id="contactNum" name="contactNum" 
                                            value="${user.contactNum}" required pattern="[0-9]{10,15}">
                                        <div class="invalid-feedback">Please enter a valid phone number (10-15 digits).</div>
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <label for="bornYear" class="col-sm-3 col-form-label">Date of Birth </label>
                                    <div class="col-sm-9">
                                        <input type="date" class="form-control" id="bornYear" name="bornYear" 
                                            value="${user.bornYear}" required>
                                        <div class="invalid-feedback">Please select your date of birth.</div>
                                    </div>
                                </div>
                                
                                <!-- Account Information Section -->
                                <div class="row mb-3">
                                    <label for="email" class="col-sm-3 col-form-label">Email </label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" name="email" 
                                            value="${user.email}" required>
                                        <div class="invalid-feedback">Please enter a valid email address.</div>
                                    </div>
                                </div>
                                
                                <!-- Profile Picture Upload -->
                                <div class="row mb-3">
                                    <label for="profilePic" class="col-sm-3 col-form-label">Profile Picture</label>
                                    <div class="col-sm-9">
                                        <input type="file" class="form-control" id="profilePic" name="profilePic" accept="image/*">
                                        <small class="text-muted">Max file size: 2MB. Accepted formats: JPG, PNG </small>
                                        <c:if test="${not empty user.profilePicPath}">
                                            <div class="mt-2">
                                                <img src="${pageContext.request.contextPath}/${user.profilePicPath}" 
                                                    alt="Current Profile Picture" class="img-thumbnail" width="100">
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                
                                <!-- Form Actions -->
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Update Profile</button>
                                    <a href="myprofile" class="btn btn-outline-secondary ms-2">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <jsp:include page="AdminFooter.jsp"/>
    
    <!-- Back to Top Button -->
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
        <i class="bi bi-arrow-up-short"></i>
    </a>

    <!-- Vendor JS Files -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
    
    <!-- Form Validation Script -->
    <script>
    (function() {
        'use strict';
        
        // Fetch the form we want to apply validation to
        const form = document.getElementById('profileForm');
        const inputs = form.querySelectorAll('input, select, textarea');
        
        // Add event listeners to all inputs for real-time validation
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                if (input.checkValidity()) {
                    input.classList.remove('is-invalid');
                    input.classList.add('is-valid');
                } else {
                    input.classList.remove('is-valid');
                    input.classList.add('is-invalid');
                }
            });
        });
        
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
                
                // Add invalid class to all invalid fields
                inputs.forEach(input => {
                    if (!input.checkValidity()) {
                        input.classList.add('is-invalid');
                    }
                });
            }
            
            form.classList.add('was-validated');
        }, false);
    })();
    </script>
    
    <!-- Template Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>