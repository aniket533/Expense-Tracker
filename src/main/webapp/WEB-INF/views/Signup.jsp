<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    
    <!-- Primary Meta Tags -->
    <meta name="title" content="Signup Page">
    <meta name="author" content="Your Name">
    <meta name="description" content="User registration page">
    <meta name="keywords" content="signup, registration, user account">
    
    <!-- Fonts -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" 
          integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q=" crossorigin="anonymous">
    
    <!-- Third Party Plugins -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/styles/overlayscrollbars.min.css" 
          integrity="sha256-tZHrRjVqNSRyWg2wbppGnT833E/Ys0DHWGwT04GiqQg=" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" 
          integrity="sha256-9kPW/n5nn53j4WMRYAxe9c1rCY96Oogo/MKSVdKzPmI=" crossorigin="anonymous">
    
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="dist/css/adminlte.css">
    
    <!-- Custom Styles -->
    <style>
        .card-outline.card-primary {
            border-top: none !important;
            box-shadow: none !important;
        }
        
        .register-card-body {
            padding-bottom: 0 !important;
        }
        
        p.mt-2.mb-3 {
            margin-bottom: 0 !important;
        }
        
        body {
            overflow-y: auto;
        }
        
        .form-floating {
            width: 100%;
        }
    </style>
</head>
<body class="register-page bg-body-secondary">
    <div class="register-box">
        <div class="card card-outline card-primary">
            <div class="card-header">
                <a href="#" class="link-dark text-center link-offset-2 link-opacity-100" style="text-decoration: none;">
                    <h1 class="mb-0"><b>Sign Up</b></h1>
                </a>
            </div>

            <div class="card-body register-card-body">
                <p class="register-box-msg">Register a new membership</p>
                
                <form action="saveuser" method="post" enctype="multipart/form-data">
                    <!-- First Name -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="firstName" placeholder="First Name" name="firstName" required>
                            <label for="firstName">First Name</label>
                        </div>
                    </div>
                    
                    <!-- Last Name -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="lastName" placeholder="Last Name" name="lastName" required>
                            <label for="lastName">Last Name</label>
                        </div>
                    </div>
                    
                    <!-- Email -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
                            <label for="email">Email</label>
                        </div>
                    </div>
                    
                    <!-- Password -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                            <label for="password">Password</label>
                        </div>
                    </div>
                    
                    <!-- Gender -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <select name="gender" id="gender" class="form-control form-select" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                            <label for="gender">Gender</label>
                        </div>
                    </div>
                    
                    <!-- Profile Picture -->
                    <div class="input-group mb-3">
                        <input type="file" class="form-control" name="profilePic" accept="image/*" required>
                        <span class="input-group-text">Profile Picture</span>
                    </div>
                    
                    <!-- Contact Number -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="tel" class="form-control" id="contactNum" placeholder="Contact Number" name="contactNum" required>
                            <label for="contactNum">Contact Number</label>
                        </div>
                    </div>
                    
                    <!-- Date of Birth -->
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="date" class="form-control" id="bornYear" name="bornYear" required>
                            <label for="bornYear">Date of Birth</label>
                        </div>
                    </div>
                    
                    <!-- Submit Button -->
                    <div class="row">
                        <div class="col-8"></div>
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                        </div>
                    </div>
                </form>
                
                <p class="mt-3 mb-1">
                    Already have an account? 
                    <a href="login" class="link-primary" style="text-decoration: none; font-weight: bold;">Login</a>
                </p>
            </div>
        </div>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js" 
            integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" 
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" 
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    
    <!-- AdminLTE JS -->
    <script src="dist/js/adminlte.js"></script>
    
    <!-- Custom Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
            const Default = {
                scrollbarTheme: 'os-theme-light',
                scrollbarAutoHide: 'leave',
                scrollbarClickScroll: true,
            };
            
            const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
            if (sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== 'undefined') {
                OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
                    scrollbars: {
                        theme: Default.scrollbarTheme,
                        autoHide: Default.scrollbarAutoHide,
                        clickScroll: Default.scrollbarClickScroll,
                    },
                });
            }
        });
    </script>
</body>
</html>