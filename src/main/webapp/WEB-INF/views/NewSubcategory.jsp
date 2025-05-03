<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Sub-category | Expense Manager</title>
    <meta name="description" content="Create new sub-category for expense management">
    <meta name="keywords" content="expense manager, subcategory, finance">

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
        .form-container {
            background: #fff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.125rem 0.625rem rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #4154f1;
        }

        .form-control {
            width: 100%;
            padding: 0.625rem 0.9375rem;
            border: 1px solid #dee2e6;
            border-radius: 0.375rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4154f1;
            box-shadow: 0 0 0 0.1875rem rgba(65, 84, 241, 0.1);
            outline: none;
        }

        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
        }

        .btn-primary {
            background-color: #4154f1;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0.375rem;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #2a3ab9;
            transform: translateY(-2px);
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1);
        }

        .btn-icon {
            margin-right: 0.5rem;
        }

        .form-title {
            color: #4154f1;
            margin-bottom: 1.875rem;
            padding-bottom: 0.625rem;
            border-bottom: 2px solid #f6f9ff;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 1.25rem;
            }
        }
    </style>
</head>

<body>
    <%@include file="SessionValidate.jsp"%>
    
    <jsp:include page="AdminHeader.jsp"/>
    
    <jsp:include page="AdminSidebar.jsp"/>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>New Sub-category</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item active">New Sub-category</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="form-container">
                        <h3 class="form-title">Create New Sub-category</h3>
                        <form action="savesubcategory" method="post" id="subcategoryForm">
                            <div class="form-group">
                                <label for="subcategoryName" class="form-label">Sub-category Name</label>
                                <input type="text" id="subcategoryName" name="subcategoryName" class="form-control" required 
                                       placeholder="Enter sub-category name" maxlength="50">
                            </div>
                            
                            <div class="form-group">
                                <label for="userId" class="form-label">User</label>
                                <select id="userId" name="userId" class="form-control form-select" required 
                                        onchange="fetchCategoriesByUser()">
                                    <option value="">--- Select User ---</option>
                                    <c:forEach var="user" items="${userList}">
                                        <option value="${user.userId}">
                                            ${user.firstName} ${user.lastName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="categoryId" class="form-label">Category</label>
                                <select id="categoryId" name="categoryId" class="form-control form-select" required>
                                    <option value="">--- Select Category ---</option>
                                    <c:forEach items="${categoryList}" var="category">
                                        <option value="${category.categoryId}">
                                            ${category.categoryName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <button type="submit" class="btn-primary">
                                <i class="bi bi-save btn-icon"></i>Save Sub-category
                            </button>
                        </form>
                    </div>
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
    
    <!-- Template Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
    function fetchCategoriesByUser() {
        const userId = document.getElementById("userId").value;
        const categorySelect = document.getElementById("categoryId");
        
        if (!userId) {
            categorySelect.innerHTML = '<option value="">--- Select Category ---</option>';
            return;
        }

        fetch(`${pageContext.request.contextPath}/getcategoriesbyuser?userId=\${userId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                let options = '<option value="">--- Select Category ---</option>';
                data.forEach(category => {
                    options += `<option value="\${category.categoryId}">\${category.categoryName}</option>`;
                });
                categorySelect.innerHTML = options;
            })
            .catch(error => {
                console.error('Error fetching categories:', error);
                categorySelect.innerHTML = '<option value="">Error loading categories</option>';
            });
    }

    // Form validation
    document.getElementById('subcategoryForm').addEventListener('submit', function(event) {
        const subcategoryName = document.getElementById('subcategoryName').value.trim();
        const userId = document.getElementById('userId').value;
        const categoryId = document.getElementById('categoryId').value;
        
        if (!subcategoryName || !userId || !categoryId) {
            event.preventDefault();
            alert('Please fill all required fields');
        }
    });
    </script>
</body>
</html>