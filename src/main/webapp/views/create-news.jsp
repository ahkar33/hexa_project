<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ace.hexa.dto.user.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.user.UserRequestDto"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<!-- for creating news -->

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create News</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	type="text/css">

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">

<!-- custom css -->
<link rel="stylesheet" href="/css/admin_home.css" type="text/css">

<link rel="stylesheet" href="/css/create-news.css" type="text/css">
</head>

<body data-collaboration="false" data-revision-history="false">
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
	<section id="navbar"
		class="navbar navbar-expand fw-bold text shadow-sm sticy-top">
		<main class="container px-2">
			<h3 class="navbar-brand" style="color: rgba(0, 0, 0, 0.75);">Hexa</h3>
			<ul class="navbar-nav d-flex gap-3 align-items-center">
				<!-- <li class="nav-item">
                    <form action="" class="form  p-0 m-0">
                        <div class="form-group d-flex align-items-center gap-2">
                            <input type="search" class="form-control p-1 px-1" placeholder="Search you want...">
                            <button type="submit" class="btn btn-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </form>
                </li> -->
				<li class="nav-item" style="color: rgba(0, 0, 0, 0.75);">
					<!-- for user account info -->
					<div class="dropdown" id="user-info">
						<i class="fa-solid fa-user h4 toggle" data-bs-toggle="dropdown"
							data-bs-target="#user-info"></i>

						<ul class="dropdown-menu p-0 m-0"
							style="transform: translate(-18%)">
							<!-- လိုချင်သလို မီနူးကို ထပ်တိုး ထပ်လျော့ လုပ်ရုံပဲ။ ‌ယေဘုယျ ‌တော့ထားပေးထားတယ်။ -->
							<li class="dropdown-item">Username <!-- name-->
							</li>
							<li class="dropdown-item">Admin <!-- role -->
							</li>
							<li class="dropdown-item "><a href=""><i
									class="fa-solid fa-user-pen"></i><span class="mx-2">Edit</span></a></li>
							<!-- edit တွေဘာတွေ လုပ်ဖို့အတွက် -->
							<li class="dropdown-item bg-danger"><a href=""
								onclick="return confirm('Are you sure to logout?');"><i
									class="fa-solid fa-arrow-right-from-bracket"></i><span
									class="mx-2">Logout</span></a></li>
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
	<main data-editor="ClassicEditor" id="main-body"
		class="w-100 p-0 m-0 d-flex">
		
		<!-- sidebar -->
		<jsp:include page="./layout/admin-sidebar.jsp" />

		<!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
		<section id="main-data"
			class="w-85 position-relative d-flex justify-content-center align-items-center">

			<main id="form-wrapper" class="w-100  d-flex justify-content-center">
				<div class="w-75 ">
					<h3 class="h2 card-title text-center">CREATE NEWS</h3>
					<div class="text-center text-success">
						<h4>${post_msg}</h4>
					</div>
					<!-- error & msg twl pya poh -->
					<span class="alert-primary p-2 d-none" id="msg">Something
						messages</span>
					<form:form action="/hexa/admin/create_news" method="post"
						class="card-body form" modelAttribute="newsBean"
						enctype="multipart/form-data">
						<!-- <div class="w-100 text-end">
							<button class="btn btn-danger text-end" type="reset">Clear</button>
						</div> -->
						<div class="form-group my-2">
							<label for="" class="form-label my-1 fw-bold">News Title</label>
							<form:input type="text" class="form-control" path="news_name"
								placeholder="eg. Something happened" required="required"
								autofocus="autofocus" />
						</div>

						<div class="form-group my-2">
							<label for="" class="form-label my-1 fw-bold">News
								Categories</label>
							<form:select name="" id="" path="news_category"
								class="form-select" required="required">
								<option value="" selected disabled>Choose your news
									categories</option>
								<c:forEach var="category" items="${news_categories}">
									<option value="${category.news_category_id}">${category.news_category_name}</option>
								</c:forEach>
							</form:select>
						</div>


						<div class="form-group my-2">
							<label for="" class="form-label my-1 fw-bold"> News'
								Location </label>
							<form:input type="text" class="form-control" path="news_location"
								placeholder="e.g Yangon" required="required" />
						</div>

						<div class="form-group my-2" data-editor="ClassicEditor">
							<label for="" class="form-label my-1 fw-bold">News
								Content</label>
							<form:textarea name="" cols="30" rows="4" class="form-control"
								id="editor" placeholder="e.g details about something happened"
								path="descriptions" required="required"></form:textarea>
						</div>

						<div class="form-group my-2">
							<label for="" class="form-label my-1 fw-bold">News Image</label>
							<form:input type="file" name="" id="" class="form-control"
								path="news_img" placeholder="Choose Image" />
						</div>

						<!-- for user id , will get from session -->
						<form:input type="hidden" name="" value="${userInfo.user_id}"
							path="creator_id" />

						<button class="btn btn-success w-100 my-1" type="submit">Create</button>
					</form:form>
				</div>
			</main>

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
</body>

</html>