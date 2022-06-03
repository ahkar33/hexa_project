<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ace.hexa.dto.user.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.user.UserRequestDto"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
     <!-- bootstrap -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" type="text/css">

     <!-- fontawesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" type="text/css">
 
     <!-- custom css -->
     <link rel="stylesheet" href="/css/admin_home.css" type="text/css">
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("userInfo") == null) {
		response.sendRedirect("/hexa/home");
	} else {
		UserResponseDto dto = (UserResponseDto) session.getAttribute("userInfo");
		if (dto.getUser_role() != 1) {
			response.sendRedirect("/hexa/home");
		}
	}
	%>
    <!-- top navbar start here -->
    <section id="navbar" class="navbar navbar-expand fw-bold text shadow-sm sticy-top">
        <main class="container px-2">
            <h3 class="navbar-brand" style="color:rgba(0,0,0,0.75);">Hexa</h3>
            <ul class="navbar-nav d-flex gap-3 align-items-center">
                <li class="nav-item">
                    <form action="" class="form  p-0 m-0">
                        <div class="form-group d-flex align-items-center gap-2">
                            <input type="search" class="form-control p-1 px-1" placeholder="Search you want...">
                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </li>
                <li class="nav-item" style="color:rgba(0,0,0,0.75);">
                    <!-- for user account info -->
                    <div class="dropdown" id="user-info"> 
                        <i class="fa-solid fa-user h4 toggle" data-bs-toggle="dropdown" data-bs-target="#user-info"></i>

                        <ul class="dropdown-menu p-0 m-0" style="transform:translate(-18%)">
                            <!-- လိုချင်သလို မီနူးကို ထပ်တိုး ထပ်လျော့ လုပ်ရုံပဲ။ ‌ယေဘုယျ ‌တော့ထားပေးထားတယ်။ -->
                            <li class="dropdown-item">Username <!-- name--></li>
                            <li class="dropdown-item">Admin <!-- role --></li>
                            <li class="dropdown-item "><a href=""><i class="fa-solid fa-user-pen"></i><span class="mx-2">Edit</span></a></li><!-- edit တွေဘာတွေ လုပ်ဖို့အတွက် -->
                            <li class="dropdown-item bg-danger"><a href="" onclick="return confirm('Are you sure to logout?');"><i class="fa-solid fa-arrow-right-from-bracket"></i><span class="mx-2">Logout</span></a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item"></li>
            </ul>
        </main>
    </section>
    <!-- top navbar end here -->

    <!-- main-body start here -->
     <!-- ဘေးနား ဘားနဲ့ အလယ် က ဒေတာတွေ ပြဖို့အတွက် ကို မိန်းဘော်ဒီထဲထည့်ထားသလို့စဥ်းစားထားတာ -->
    <main id="main-body" class="w-100 p-0 m-0 d-flex">
        <!-- ဒါက ဘေးဘားအတွက် အလျား ၁၅ ရာခိုင်နှုန်းယူထားတယ် -->
        <section id="sidebar" class="dark-bg p-0 m-0 position-relative">
            <h3 class="h5 text-center text-light py-3" id="dash-title"><a href="./home.html">Admin Dashboard</a></h3>

            <h3 class="h6 text-center text m-0">Actions</h3>
            <ul id="sidebar-list" class="list-group  gap-2 w-100">
                <!-- သွားချင်တဲ့ route ကို a tagထဲမှာ ထည့်ရုံပဲ -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0 text"><a href="/hexa/admin/users" class="w-100"><i class="fa-solid fa-users"></i><span class="mx-2">Users</span></a></li>
               <li id="sidebar-item" class="list-item p-2 px-3 m-0" ><a href="/hexa/admin/news"  class="w-100"><i class="fa-brands fa-neos"></i><span class="mx-2">News</span></a></li>
               <!-- ဒီအောက်က ကောင်က သတင်း ပေ့ချ်ကိုမ‌ေရာက်ပဲ တန်း အသစ် လုပ်တဲ့ ပေ့ချ် ကို ရောက်သွားမှာ  -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/create_news"  class="w-100"><i class="fa-solid fa-circle-plus"></i><span class="mx-2">Create News</span></a></li>
               <!-- for categories -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/categories"  class="w-100"><i class="fa-solid fa-layer-group"></i><span class="mx-2">Categories</span></a></li>
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/comments"  class="w-100"><i class="fa-solid fa-comments"></i><span class="mx-2">Comments</span></a></li>
            </ul>
            <h3 class="h6 text-center text mx-5 py-3">Page Settings</h3>

            <ul id="sidebar-list" class="list-group  gap-2 w-100">
               <!-- user home page ကို သွားဖို့။ -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/home"  class="w-100"><i class="fa-solid fa-globe"></i><span class="mx-2">Public Panel</span></a></li>
               <!-- for logout -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/logout" class="text-danger w-100" onclick="return confirm('Are you sure to logout?');"><i class="fa-solid fa-arrow-right-from-bracket"></i><span class="mx-2">Logout</span></a></li>
            </ul>

            <span id="sidebar-tail" class="position-absolute bottom-0 mx-2">
                Terms | Service
            </span>
        </section>

        <!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
        <section id="main-data" class="w-85 position-relative">
    
            <main id="main-contents" class="my-5">
                <!-- name from session   -->
                <div class="fw-bold d-flex justify-content-between align-items-center alert-success py-2 px-5 my-3 mx-5">
                    <span class="h3 ">Welcome Name!</span>
                    <span class="h6"><span id="year" class="mx-1"></span><span id="day-name"  class="mx-1"></span>,<span id="day"  class="mx-1"></span></span>
                </div>
                <div class="container row gap-2 d-flex justify-content-center my-2">
                    <div class="col-3 data-box d-flex justify-content-start align-items-start gap-2 flex-column p-5">
                        <span class="h3 fw-bold text-light">Reporters</span>
                        <i class="fa-solid fa-bullhorn text-light" style="font-size:20px !important;"></i>
                        <span class="h6 text" id="count">10</span>
                    </div>
                    <div class="col-3 data-box d-flex justify-content-start align-items-start gap-2 flex-column p-5">
                        <span class="h3 fw-bold text-light">Users</span>
                        <i class="fa-solid fa-users text-light" style="font-size:20px !important;"></i>
                        <span class="h6 text" id="count">100</span>
                    </div>
                    <div class="col-3 data-box d-flex justify-content-start align-items-start gap-2 flex-column p-5">
                        <span class="h3 fw-bold text-light">Total News</span>
                        <i class="fa-solid fa-newspaper text-light" style="font-size:20px !important;"></i>
                        <span class="h6 text" id="count">1000</span>
                    </div>
                </div>
            </main>
            

            <!-- for footer -->
                <footer id="footer" class="d-flex justify-content-between align-items-center p-2 px-4 dark w-100 position-absolute bottom-0">
                    <span class="text-light">Created By Hexa_Group(Ace Inspiration)</span>
                    
                    <ul id="footer-links" class="d-flex gap-3 align-items-center p-0 m-0 text-light">
                        <li><a href="" onclick="return confirm('Are you sure to follow this link?');" target="_blank"><i class="fa-brands fa-facebook"></i></a></li>
                        <li><a href="" onclick="return confirm('Are you sure to follow this link?');" target="_blank"><i class="fa-brands fa-github"></i></a></li>
                        <li><a href="" onclick="return confirm('Are you sure to follow this link?');" target="_blank"><i class="fa-brands fa-discord"></i></a></li>
                    </ul>
                </footer>
        </section>
    </main>
    <!-- main body end here -->

     <!-- bootstrap -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

      <!-- jquery -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>

     <script src="../assets/js/admin-home.js" type="text/javascript"></script>
</body>
</html>