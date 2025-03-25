
<header id="header" class="header fixed-top d-flex align-items-center">
   	
   	<div class="d-flex align-items-center justify-content-between">
    	
    	<a  class="logo d-flex align-items-center">
       		<img src="assets/img/logo.png" alt="">
       		<span class="d-none d-lg-block">ExpenseTracker</span>
   		</a>
   		
   	</div><!-- End Logo --> 
   		
   		<i class="bi bi-list toggle-sidebar-btn"></i>
   		
   		<nav class="header-nav ms-auto">
      		
      		<ul class="d-flex align-items-center">
        		
        		<li class="nav-item dropdown">
          			<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            			<i class="bi bi-bell"></i>
            			<span class="badge bg-primary badge-number"></span>
          			</a><!-- End Notification Icon -->
				</li>
					
        		<li class="nav-item dropdown">
          			<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            			<i class="bi bi-chat-left-text"></i>
            			<span class="badge bg-success badge-number"></span>
          			</a><!-- End Messages Icon -->
        		</li>
				
				<li class="nav-item dropdown pe-3 m-0 p-0">
    <a class="nav-link nav-profile d-flex align-items-center pe-0" 
       href="#" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="${user.profilePicPath}" alt="Profile" 
             class="rounded-circle" 
             style="width: 40px; height: 40px; object-fit: cover;">
        <span class="d-none d-md-block dropdown-toggle ps-2">${user.firstName} ${user.lastName}</span>
    </a>
    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow mt-0">
        <li><a class="dropdown-item" href="myprofile">My Profile</a></li>
        <li><a class="dropdown-item" href="editprofile">Edit Profile</a></li>
         <li><a class="dropdown-item" href="logout">Log Out</a></li>
    </ul>
</li>

            		
            			
   	
</header>
