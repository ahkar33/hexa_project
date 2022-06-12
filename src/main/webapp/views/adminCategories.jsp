<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.ace.hexa.dto.user.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.user.UserRequestDto"%>
<!-- categories page from sidebar of admin dashboard  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Categories</title>
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
		if (dto.getUser_role() != 1) {
			response.sendRedirect("/hexa/home");
		}
	}
	%>
	<!-- top navbar start here -->
	<jsp:include page="./layout/admin-navbar.jsp" />
	<!-- top navbar end here -->

	<!-- main-body start here -->
	<main id="main-body" class="w-100 p-0 m-0 d-flex">
			
		<!-- sidebar -->
		<jsp:include page="./layout/admin-sidebar.jsp" />

		<section id="main-data" class="w-85 position-relative">
			<div class="table-title my-3">
				<h3 class="h2">Categories</h3>
			</div>

			<div class="w-100 text-end">
				<button class="btn btn-success my-2" data-bs-toggle="modal"
					data-bs-target="#modal" style="transform: translate(-150%)">
					<i class="fa-solid fa-circle-plus mx-1"></i>Create
				</button>
			</div>
			<!-- edited here -->
			<div id="table-wrapper">
				<table class="table-fill table table-striped" id="table">
					<thead class="sticky-top fw-bold ">
						<tr class="fw-bold">
							<th>Id</th>
							<th>Category Name</th>
							<th>No Of News</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<c:forEach var="category" items="${categories}">
							<tr>
								<td class="text-capitalize">${category.news_category_id}</td>
								<td class="text-capitalize">${category.news_category_name}</td>
								<td class="text-capitalize">${category.news_count}</td>
								<td>
								<c:choose>
										<c:when test="${category.news_count == 0}">
											<a href="/hexa/admin/deleteCategory/${category.news_category_id}" class="btn btn-sm btn-danger text-dark" onclick="return confirm('Are you sure to delete?');">Delete</a>
										</c:when>	
										<c:otherwise>
											-
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


	<!-- modal box -->
	<section id="modal" class="modal fade">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content p-2">
				<div class="modal-header">
					<div class="modal-title w-100 text-end">
						<span class="btn btn-close" data-bs-dismiss="modal"
							data-bs-target="#modal"></span>
					</div>
				</div>
				<form action="/hexa/admin/add_category" method="POST"
					class="modal-body">
					<div class="form-group">
						<label for="" class="form-label my-1 fw-bold">Category
							Name</label>
						<!-- should be unique from this input value -->
						<input type="text" class="form-control" name="category"
							placeholder="e.g Sports" required autofocus>
					</div>
					<div class="form-group my-2 d-flex justify-content-end gap-2">
						<button class="btn btn-warning" data-bs-dismiss="modal"
							data-bs-target="#modal">Cancel</button>
						<button class="btn btn-success" type="submit">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</section>

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
</body>
</html>