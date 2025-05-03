<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | Expense Tracker</title>
    <meta name="description" content="User profile page for Expense Tracker application">
    
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&family=Nunito:wght@300;400;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    
    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    
    <style>
        /* Profile Card Styling */
        .profile-card {
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            border: none;
        }
        
        .profile-img-container {
            width: 150px;
            height: 150px;
            margin: 0 auto 1rem;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid #f8f9fa;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        
        .profile-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        /* Profile Details Styling */
        .profile-detail-row {
            padding: 1rem 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .profile-detail-row:last-child {
            border-bottom: none;
        }
        
        .detail-label {
            font-weight: 600;
            color: #4154f1;
        }
        
        /* Tab Styling */
        .nav-tabs-bordered {
            border-bottom: 2px solid #dee2e6;
        }
        
        .nav-tabs-bordered .nav-link {
            margin-bottom: -2px;
            border: none;
            color: #6c757d;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
        }
        
        .nav-tabs-bordered .nav-link.active {
            color: #4154f1;
            border-bottom: 3px solid #4154f1;
            background-color: transparent;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .profile-detail-row {
                flex-direction: column;
            }
            
            .detail-label {
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>

<body>
    <!-- Session Validation -->
    <%@include file="SessionValidate.jsp"%>
    
    <!-- Header -->
    <header id="header" class="header fixed-top d-flex align-items-center">
        <div class="d-flex align-items-center justify-content-between">
            <a class="logo d-flex align-items-center">
                <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="">
                <span class="d-none d-lg-block">ExpenseTracker</span>
            </a>
        </div><!-- End Logo --> 
            
        <i class="bi bi-list toggle-sidebar-btn"></i>
            
        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">
                <li class="nav-item dropdown">
                    <a class="nav-link nav-icon" href="adminnotification" data-bs-toggle="dropdown">
                        <i class="bi bi-bell"></i>
                        <span class="badge bg-primary badge-number"></span>
                    </a><!-- End Notification Icon -->
                </li>
                    
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item dropdown pe-3">
                        <a class="nav-link nav-profile d-flex align-items-center pe-0 show" href="#" data-bs-toggle="dropdown" aria-expanded="true">
                            <img src="${sessionScope.user.profilePicPath}" class="rounded-circle">
                            <span class="d-none d-md-block dropdown-toggle ps-2">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                        </a><!-- End Profile Image Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                            <li class="dropdown-header">
                                <h6>${sessionScope.user.firstName} ${sessionScope.user.lastName}</h6>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="myprofile">
                                    <i class="bi bi-person"></i>
                                    <span>My Profile</span>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="editadminprofile">
                                    <i class="bi bi-pencil-square"></i>
                                    <span>Edit Profile</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="/logout">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Log Out</span>
                                </a>
                            </li>
                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->
                </c:if>
            </ul>
        </nav><!-- End Icons Navigation -->
    </header>
    
    <!-- Sidebar -->
    <jsp:include page="AdminSidebar.jsp"/>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>User Profile</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">User Profile</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section profile">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card profile-card">
                        <div class="card-body pt-4">
                            <!-- Bordered Tabs -->
                            <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" data-bs-toggle="tab" 
                                        data-bs-target="#profile-overview" aria-selected="true" role="tab">
                                        Profile Overview
                                    </button>
                                </li>
                            </ul>
                            
                            <div class="tab-content pt-3">
                                <div class="tab-pane fade show active" id="profile-overview" role="tabpanel">
                                    <!-- Profile Picture -->
                                    <div class="text-center mb-4">
                                    <div class="col-lg-1 col-md-4 detail-label">Profile Pic</div>
                                        <div class="profile-img-container">
                                            <img src="${user.profilePicPath}" 
                                                alt="Profile Picture" class="profile-img"
                                                onerror="this.src='${pageContext.request.contextPath}/assets/img/default-profile.png'">
                                                <div class="col-lg-9 col-md-8"></div>
                                        </div>
                                    </div>
                                    
                                    <!-- Profile Details -->
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">User ID</div>
                                        <div class="col-lg-9 col-md-8">${user.userId}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">First Name</div>
                                        <div class="col-lg-9 col-md-8">${user.firstName}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">Last Name</div>
                                        <div class="col-lg-9 col-md-8">${user.lastName}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">Gender</div>
                                        <div class="col-lg-9 col-md-8">${user.gender}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">Contact Number</div>
                                        <div class="col-lg-9 col-md-8">${user.contactNum}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">Email</div>
                                        <div class="col-lg-9 col-md-8">${user.email}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">Date of Birth</div>
                                        <div class="col-lg-9 col-md-8">${user.bornYear}</div>
                                    </div>
                                    
                                    <div class="row profile-detail-row">
                                        <div class="col-lg-3 col-md-4 detail-label">Role</div>
                                        <div class="col-lg-9 col-md-8">${user.role}</div>
                                    </div>
                                    
                                    <!-- Edit Profile Button -->
                                    <div class="text-center mt-4">
                                        <a href="editUser?userId=${user.userId}" class="btn btn-primary">
                                            <i class="bi bi-pencil-square me-1"></i>Edit Profile
                                        </a>
                                    </div>
                                </div>
                            </div><!-- End Bordered Tabs -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- End #main -->

    <!-- Footer -->
    <jsp:include page="UserFooter.jsp"/>
    
    <!-- Back to Top Button -->
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
        <i class="bi bi-arrow-up-short"></i>
    </a>

    <!-- Vendor JS Files -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- Template Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>