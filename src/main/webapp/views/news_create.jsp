<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ace.hexa.dto.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.UserRequestDto"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create News</title>

<!-- bootstrap -->
<link href="/node_modules/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">

<!-- custom css -->
<link href="/css/admin_home.css" rel="stylesheet" />
<link href="/css/table.css" rel="stylesheet" />

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


	<!-- navbar -->
	<jsp:include page="/views/layout/nav_bar.jsp"></jsp:include>

	<!-- main-body start here -->
	<!-- ဘေးနား ဘားနဲ့ အလယ် က ဒေတာတွေ ပြဖို့အတွက် ကို မိန်းဘော်ဒီထဲထည့်ထားသလို့စဥ်းစားထားတာ -->
	<main id="main-body" class="w-100 p-0 m-0 d-flex">
		<!-- ဒါက ဘေးဘားအတွက် အလျား ၁၅ ရာခိုင်နှုန်းယူထားတယ် -->
		<jsp:include page="/views/layout/side_bar.jsp"></jsp:include>

		<!-- body  -->
		<section id="main-data" class="w-85 position-relative">
			<div class="table-title">
				<h3>NEWS Create</h3>
				<div class="text-center">
					<h4>${post_msg}</h4>
				</div>
			</div>
			<div style="max-width: 80%; padding-left: 50px;">
				<form:form action="/hexa/dashboard/createNews" method="post" modelAttribute="newsBean"
					enctype="multipart/form-data">
					<div class="mb-3 row">
						<label for="name" class="col-sm-2 col-form-label">Headline</label>
						<div class="col-sm-10">
							<form:input type="text" class="form-control" path="news_name" required="required"/>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2 col-form-label">Category</label>
						<div class="col-sm-10">
							<form:select class="form-control" id="exampleFormControlSelect1"
								path="news_category" required="required">

								<c:forEach var="category" items="${news_categories}">
									<option value="${category.news_category_id}">${category.news_category_name}</option>
								</c:forEach>

							</form:select>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="name" class="col-sm-2 col-form-label">Location</label>
						<div class="col-sm-10">
							<form:input type="text" class="form-control" path="news_location"
								required="required"/>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2 col-form-label">Description</label>
						<div class="col-sm-10">
							<form:textarea class="form-control" id="exampleFormControlTextarea1"
								path="descriptions" required="required" rows="5"></form:textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="exampleFormControlFile1">Image</label>
						<div class="col-sm-10">
							<form:input type="file" class="form-control-file" path="news_img" required="required"/>
						</div>
					</div>
					<input type="submit" value="Post News">
				</form:form>

			</div>

			<!-- footer -->
			<jsp:include page="/views/layout/footer.jsp"></jsp:include>
		</section>
	</main>
	<!-- bootstrap -->
	<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>