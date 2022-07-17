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
    <title>Dashboard</title>
     <!-- bootstrap -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" type="text/css">

     <!-- fontawesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" type="text/css">
 
     <!-- custom css -->
     <link rel="stylesheet" href="/css/admin_home.css" type="text/css">
</head>
<body >
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("userInfo") == null) {
		response.sendRedirect("/hexa/home");
	} else {
		UserResponseDto dto = (UserResponseDto) session.getAttribute("userInfo");
		if (dto.getUser_role() == 3){
			response.sendRedirect("/hexa/home");
		}
		if (dto.getUser_role() == 2){
			response.sendRedirect("/hexa/admin/news");
		}
	}
	%>
    <!-- Hi everything -->
   <section class="container-fluid p-0 m-0 d-flex">
    <!-- sidebar -->
    <jsp:include page="./layout/admin-sidebar.jsp" />

   <!-- main-body start here -->
       <!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
       <section id="main-data" class="w-85 position-relative p-0">
          <!-- navbar -->
          <jsp:include page="./layout/admin-navbar.jsp" />

   
           <main id="main-contents" class="my-5 w-100">
               <!-- name from session   -->
               <div class="fw-bold d-flex justify-content-between align-items-center dark py-2 px-5 my-4 mx-5" id="box">
                   <span class="h3 text-light">Welcome <span class="text-capitalize">${sessionScope.userInfo.user_name}!</span></span>
                   <span class="h6 text-light"><span id="year" class="mx-1"></span><span id="day-name"  class="mx-1"></span>,<span id="day" class="mx-1"></span></span>
               </div>
               <div class="container row gap-2 d-flex justify-content-center my-2" >
                   <div class="col-3 data-box d-flex justify-content-start align-items-start gap-2 flex-column p-5" id="box">
                       <span class="h3 fw-bold text-light">Reporters</span>
                       <i class="fa-solid fa-bullhorn text-light" style="font-size:20px !important;"></i>
                       <span class="h6 text" id="count">${reportersCount}</span>
                   </div>
                   <div class="col-3 data-box d-flex justify-content-start align-items-start gap-2 flex-column p-5" id="box">
                       <span class="h3 fw-bold text-light">Users</span>
                       <i class="fa-solid fa-users text-light" style="font-size:20px !important;"></i>
                       <span class="h6 text" id="count">${usersCount}</span>
                   </div>
                   <div class="col-3 data-box d-flex justify-content-start align-items-start gap-2 flex-column p-5" id="box">
                       <span class="h3 fw-bold text-light">Total News</span>
                       <i class="fa-solid fa-newspaper text-light" style="font-size:20px !important;"></i>
                       <span class="h6 text" id="count">${newsCount}</span>
                   </div>

                   <div class="p-5 my-5" id="chart-wrapper" style="height:500px;">
                       <canvas id="newsPerMonthChart" class="w-100" style="height:400px;"></canvas>

                       <div class="d-flex justify-content-start align-items-center p-3 gap-3" id="year-btns">
                            <!-- chart control button will be here  -->
                       </div>
                   </div>
               </div>
           </main>
       
       </section>
   <!-- main body end here -->
   </section>

    <!-- acc edit modal -->
	<jsp:include page="./layout/admin-accedit-modal.jsp" />

     <!-- bootstrap -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

      <!-- jquery -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>

      <!-- chart js -->
      <script src="https://cdn.jsdelivr.net/npm/chart.js" type="text/javascript"></script>

      <!-- custom -->
      <script src="/js/admin-home.js" type="text/javascript"></script>

      <!-- custom chart -->
      <script src="/js/admin_chart.js" type="text/javascript"></script>
</body>
</html>