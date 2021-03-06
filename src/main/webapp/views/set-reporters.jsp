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
<title>Set Reporters</title>
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
<script type="text/javascript">
	function handleSelect(elm) {
		if (confirm("Are you sure to change?")) {
			window.location = "/hexa/admin/role/" + elm.value;
		}
	}
</script>
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
					<h3 class="thm h2">User Information</h3>
				</div>
				<!-- edited here -->
				<div  class="my-5">
					<table class="table-fill table table-striped" id="table">
						<thead class="fw-bold ">
							<tr class="fw-bold">
								<th>No.</th>
								<th>Username</th>
								<th>Email Address</th>
								<th>Role</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody class="table-hover">
							<c:set var="count" value="0" scope="page" />
							<c:forEach var="user" items="${users}">
								<tr>
									<c:set var="count" value="${count + 1}" scope="page" />
									<td class="text-capitalize">${count}</td>
									<td class="text-capitalize">${user.user_name}</td>
									<td>${user.user_email}</td>
									<td class="text-capitalize dropdown" id="dropdown">
										<button
											class="btn btn-sm btn-danger dropdown-toggle text-capitalize"
											data-bs-toggle="dropdown" data-bs-target="#dropdown">${user.user_role_name}</button>
										<div class="dropdown-menu p-0 m-0">
											<c:forEach var="roles" items="${roles}">
												<c:if test="${roles.name != user.user_role_name}">
													<span 
														class="dropdown-item h6 text-dark"
														id="role-ch-btn" data-target="${user.user_id},${roles.id}">${roles.name}</span>
												</c:if>
											</c:forEach>
										</div>
									</td>
									<td><c:choose>
											<c:when test="${user.user_status == 0}">
												<p
													class="btn btn-sm btn-danger px-3" data-target="${user.user_id}" id="ban">Ban</p>
											</c:when>
											<c:otherwise>
												<p
													class="btn btn-sm btn-success "  data-target="${user.user_id}" id="unban">Unban</p>
											</c:otherwise>
										</c:choose></td>
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

	<script src="/js/common.js"></script>

	<script src="/js/toggle_user_status.js" type="text/javascript"></script>

	<script src="/js/role_change_confirm.js" type="text/javascript"></script>
</body>

</html>