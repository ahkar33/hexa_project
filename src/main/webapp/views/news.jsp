<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.ace.hexa.dto.user.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.user.UserRequestDto"%>
<!-- news page from sidebar of admin dashboard  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>News</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	type="text/css">

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">


<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.css" />

<!-- custom css -->
<link rel="stylesheet" href="/css/admin_home.css" type="text/css">
<link rel="stylesheet" href="/css/user_role.css" type="text/css">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("userInfo") == null) {
		response.sendRedirect("/hexa/home");
	} else {
		UserResponseDto dto = (UserResponseDto) session.getAttribute("userInfo");
		if (dto.getUser_role() == 3) {
			response.sendRedirect("/hexa/home");
		}
	}
	%>

	<div class="container-fluid p-0 m-0">
		<!-- sidebar -->
		<jsp:include page="./layout/admin-sidebar.jsp" />

			<!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
			<section id="main-data" class="w-85 position-relative">
				<!-- navbar -->
				<jsp:include page="./layout/admin-navbar.jsp" />
				<div class="table-title my-3">
					<h3 class="h2 thm .text-center">News Information</h3>
				</div>
				<!-- edited here -->
				<div id="table-wrapper" class="my-5">
					<table class="table-fill table table-striped" id="table">
						<thead class="fw-bold ">
							<tr class="fw-bold">
								<th>No.</th>
								<th>Title</th>
								<th>Category</th>
								<th>Creater</th>
								<!-- status ka ban tr twt role user ko pl ban loh ya ml -->
								<th>Created Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="table-hover">
							<c:set var="count" value="0" scope="page" />
							<c:forEach var="news" items="${news}">
								<tr>
									<c:set var="count" value="${count + 1}" scope="page" />
									<td scope="row">${count}</td>
									<td class="text-capitalize">${news.news_name}</td>
									<td class="text-capitalize">${news.news_category_name}</td>
									<td class="text-capitalize">${news.creator_name }</td>
									<td>${news.created_date}</td>
									<td>
									<a href="/hexa/admin/update_news/${news.news_id }" class="btn btn-primary  btn-sm" style="color:#fff;">Update</a>
									<span class="btn btn-danger btn-sm " id="news-del-btn" data-target="${news.news_id},${news.news_img}">Delete</span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
	</div>
	<!-- acc edit modal -->
	<jsp:include page="./layout/admin-accedit-modal.jsp" />

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- jquery -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		type="text/javascript"></script>

	<!-- datatable -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.js"></script>

	<script src="/js/admin-table.js"></script>

	<script src="/js/delete_confirm.js" type="text/javascript"></script>
</body>
</html>