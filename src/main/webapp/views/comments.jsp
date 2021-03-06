<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ace.hexa.dto.user.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.user.UserRequestDto"%>
<!-- comments page from sidebar of admin dashboard  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comments</title>
     <!-- bootstrap -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" type="text/css">

     <!-- fontawesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" type="text/css">
     
 
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.css"/>

     <!-- custom css -->
     <link rel="stylesheet" href="/css/admin_home.css" type="text/css">
     <link rel="stylesheet" href="/css/user_role.css" type="text/css">
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("userInfo") == null) {
		response.sendRedirect("/hexa/home");
	} else {
		UserResponseDto dto = (UserResponseDto) session.getAttribute("userInfo");
		if (dto.getUser_role() == 3) {
			response.sendRedirect("/hexa/home");
		}
	}
	%>

	<div class="container-fluid p-0 m-0 d-flex">
            <jsp:include page="/views/layout/admin-sidebar.jsp"></jsp:include>

            <!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
            <section id="main-data" class="w-85 position-relative">
                 <!-- navbar -->
                 <jsp:include page="/views/layout/admin-navbar.jsp"></jsp:include>
        
        
                <div class="table-title my-3">
                    <h3 class="h2 text-center thm">Interaction</h3>
                </div>
                    <!-- edited here -->
                <div id="table-wrapper">
                        <table class="table-fill table table-striped" id="table">
                            <thead class="fw-bold ">
                                <tr class="fw-bold">
                                <th>Id</th>
                                <th>Comment</th>
                                <th>Commented User</th>
                                <th>Commented Date</th>
                                <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="table-hover">
                            <% int id = 1; %>
                            <c:forEach var="interactions" items="${interactions}" varStatus="stus" >
                                <tr>
                                    <td><%= id %></td>
                                    <td class="text-capitalize">${interactions.comments }</td>
                                    <td class="text-capitalize">${commenters[stus.index]}</td>
                                    <td>${interactions.commented_date }</td>
                                    <td>
                                        <span class="btn btn-danger btn-sm" id="comment-del-btn" data-target="${interactions.comment_id}" >Delete </span>
                                    </td>
                                </tr>
                                <% id++; %>
                            </c:forEach>
                            </tbody>
                        </table>
                </div>
            </section>
    </div>
    <!-- acc edit modal -->
		<jsp:include page="./layout/admin-accedit-modal.jsp" />

     <!-- bootstrap -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

     <!-- jquery -->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>

     <!-- datatable -->
     <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.js"></script>

     <script src="/js/admin-table.js"></script>

     <script src="/js/common.js"></script>

     <script src="/js/delete_confirm.js" type="text/javascript"></script>
</body>
</html>