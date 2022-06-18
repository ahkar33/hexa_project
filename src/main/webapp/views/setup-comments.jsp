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
<title>Setup comments</title>
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

	<!-- navbar -->
	<jsp:include page="/views/layout/admin-navbar.jsp"></jsp:include>


	<!-- main-body start here -->
	<!-- ဘေးနား ဘားနဲ့ အလယ် က ဒေတာတွေ ပြဖို့အတွက် ကို မိန်းဘော်ဒီထဲထည့်ထားသလို့စဥ်းစားထားတာ -->
	<main id="main-body" class="w-100 p-0 m-0 d-flex">
		<!-- sidebar -->
		<jsp:include page="/views/layout/admin-sidebar.jsp"></jsp:include>

		<!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
		<section id="main-data" class="w-85 position-relative">
			<div class="table-title my-3">
				<h3>Interaction</h3>
			</div>
			<!-- edited here -->
			<div id="table-wrapper">
				<table class="table-fill table table-striped" id="table">
					<thead class="sticky-top fw-bold ">
						<tr class="fw-bold">
							<th>No.</th>
							<th>News Title</th>
							<th>Commnter Count</th>
							<th>Comment Count</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody class="table-hover">

						<c:set var="count" value="0" scope="page" />
						<c:forEach var="news" items="${news}">
							<tr>
								<c:set var="count" value="${count + 1}" scope="page" />
								<td scope="row">${count}</td>
								<td class="text-capitalize">${news.title}</td>
								<td>${news.commenters_count}</td>
								<td>${news.comments_count}</td>
								<td><a href="/hexa/admin/comments/${news.id}"
									class="btn btn-success text-dark btn-sm">Detail</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<!-- footer -->
			<jsp:include page="/views/layout/admin-footer.jsp"></jsp:include>
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