<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body, html {
        height: 100%;
        width: 100%;
        font-family: Arial, sans-serif;
    }

    /* Header with Glass Morphism Effect */
    .header {
        width: 100%;
        height: 70px;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
        background: rgba(255, 255, 255, 0.4);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
        padding: 0 30px;
        transition: all 0.3s ease;
    }


    /* Header Content */
    .header-content {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
    }

    /* Logo Group */
    .logo-group {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .logo-img {
        height: 35px;
        width: auto;
        filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
    }

    .brand-name {
        color: rgba(245, 245, 245, 0.9); /* Dark white */
        font-weight: 700;
        font-size: 1.4rem;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    /* Navigation */
    .nav-list {
        display: flex;
        gap: 25px;
        list-style: none;
    }

    .nav-item {
        position: relative;
    }

    .nav-link {
        color: rgba(245, 245, 245, 0.9); /* Default dark white */
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 8px;
        font-weight: 500;
        padding: 8px 15px;
        border-radius: 8px;
        transition: all 0.3s ease;
    }

    /* Blue "Log In" link */
    .nav-list .nav-link[href="/login"] {
        color: #3498db; /* Blue */
    }

    .nav-list .nav-link[href="/login"]:hover {
        color: #2980b9; /* Darker blue on hover */
        background: rgba(52, 152, 219, 0.1); /* Light blue hover background */
    }

    /* Other links hover */
    .nav-link:hover {
        color: rgba(255, 255, 255, 1);
        background: rgba(255, 255, 255, 0.15);
    }

    .nav-item.active .nav-link {
        color: rgba(255, 255, 255, 1);
        background: rgba(255, 255, 255, 0.8);
    }

    /* Background */
    .background-container {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        overflow: hidden;
        z-index: -1;
    }

    .background-container img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* Main Content */
    .main-content {
        padding-top: 100px;
        min-height: calc(100vh - 70px);
        position: relative;
        z-index: 1;
        color: white;
        padding: 100px 50px 50px;
    }
</style>
</head>
<body>

    <!-- Glassmorphism Header -->
    <header class="header">
        <div class="header-content">
            <div class="logo-group">
                <img src="assets/img/logo.png" alt="ExpenseTracker Logo" class="logo-img">
                <span class="brand-name">ExpenseTracker</span>
            </div>
            
            <nav>
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="/login" class="nav-link">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Log In</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Background Image -->
    <div class="background-container">
        <img src="assets/img/Home2.png" alt="Background Image">
    </div>

    <!-- Main Content -->
    <main class="main-content">
        <h1>Welcome to ExpenseTracker</h1>
        <p>Manage your finances with ease</p>
    </main>

</body>
</html>