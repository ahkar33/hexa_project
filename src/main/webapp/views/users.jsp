<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.ace.hexa.dto.user.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.user.UserRequestDto"%>
<!-- users page from sidebar of admin dashboard  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Users</title>
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
	if(session.getAttribute("userInfo") == null) {
		response.sendRedirect("/hexa/home");
	} else {
		UserResponseDto dto = (UserResponseDto) session.getAttribute("userInfo");
		if (dto.getUser_role() != 1) {
			response.sendRedirect("/hexa/home");
		}
	}
	%>
	
	<!-- navbar -->
	<jsp:include page="./layout/admin-navbar.jsp" />

	<!-- main-body start here -->
	<main id="main-body" class="w-100 p-0 m-0 d-flex">
		<!-- sidebar -->
		<jsp:include page="./layout/admin-sidebar.jsp" />

		
		<!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
		<section id="main-data" class="w-85 position-relative">
			<div class="table-title my-3">
				<h3>User Information</h3>
			</div>
			<!-- edited here -->
			<div id="table-wrapper">
				<table class="table-fill table table-striped" id="table">
					<thead class="sticky-top fw-bold ">
						<tr class="fw-bold">
							<th>User ID</th>
							<th>Username</th>
							<th>Email Address</th>
							<th>Role</th>
							<!-- status ka ban tr twt role user ko pl ban loh ya ml -->
							<th>Action</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<c:forEach var="user" items="${users}">
							<tr>
								<td>${user.user_id}</td>
								<td class="text-capitalize">${user.user_name}</td>
								<td>${user.user_email}</td>
								<td class="text-capitalize">${user.user_role_name}</td>
								<td>
									<c:choose>
										<c:when test="${user.user_status == 0}">
											<a href="/hexa/admin/status/${user.user_id}" class="btn btn-sm btn-danger text-dark" onclick="return confirm('Are you sure to ban?');">Ban</a>
										</c:when>	
										<c:otherwise>
											<a href="/hexa/admin/status/${user.user_id}" class="btn btn-sm btn-warning text-dark" onclick="return confirm('Are you sure to unban?');">Unban</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<!-- footer -->
            <jsp:include page="./layout/admin-footer.jsp" />
		</section>
	</main>
	<!-- main body end here -->

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

	<script src="/js/common.js"></script>
</body>
</html>