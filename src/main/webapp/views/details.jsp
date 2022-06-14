<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	type="text/css">

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">

<!-- custom css -->
<link rel="stylesheet" href="/css/home.css" type="text/css">

<link rel="stylesheet" href="/css/detail.css" type="text/css">
</head>
<body>
	<!-- navbar -->
	<jsp:include page="./layout/public-navbar.jsp" />


	<div class="container">
		<div id="news-wrapper"
			class="d-flex justify-content-between  gap-3 row mx-auto">
			<div id="news" class="my-5 col-xl-7   col-md-12 d-flex flex-column ">
				<h3 class="h3 text-warning fw-bold text-warning mx-auto "
					id="news-title">"${newsDetails.news_name}"</h3>
				<div id="news-image" class="my-3 w-100">
					<img src="/img/${newsDetails.news_img}">
					<div id="layer"
						class="d-flex justify-content-end align-items-start flex-column p-3">
						<div id="news-location" class="fw-bold mx-2">
							<i class="fa-solid fa-location-dot"></i>
							${newsDetails.news_location}
						</div>
						<div id="news-writer" class="fw-bold">${newsDetails.creator_name}</div>
					</div>
				</div>
				<div id="news-content" class="w-75 fw-bold"
					style="color: rgba(0, 0, 0, 0.75);">
					<p class="w-100">${newsDetails.descriptions}</p>
				</div>
			</div>

			<div id="others"
				class="my-5 d-flex flex-column align-items-center gap-3 col-xl-4 col-md-8 text-center">


				<c:forEach var="news" items="${latestNews}">
					<div id="other-news">
						<a href="/hexa/details/${news.news_id}"> <img
							src="/img/${news.news_img}" alt="">
							<div id="layer"	class="d-flex justify-content-end align-items-start flex-column p-3">
								<div id="title">${news.news_name}</div>
								<div id="location">|${news.news_location}</div>
							</div>
						</a>
					</div>

				</c:forEach>


			</div>
		</div>
		<div id="comments-wrapper"
			class="my-5 d-flex justify-content-center row flex-wrap">

			<c:if test="${interactions.size() > 0}">
				<div id="comments" class="p-3 col-xl-6 col-md-12 my-3">
					<c:forEach var="interaction" items="${interactions}">
						<div id="comment" class="my-2">
							<div id="info" class="d-flex gap-2 align-items-center">
								<div id="image">
									<img src="/img/profile.png" alt="">
								</div>
								<div id="detail">
									<div id="name">${interaction.user_name}</div>
									<div id="date">${interaction.commented_date}</div>
								</div>
							</div>
							<div id="content">${interaction.comments}</div>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<%
			if (session.getAttribute("userInfo") != null) {
			%>

			<form:form action="/hexa/details/addComment/${newsDetails.news_id}"
				method="post" class="form col-xl-6 col-md-12" modelAttribute="bean">
				<form:input type="hidden" path="user_id" value="${userInfo.user_id}" />
				<form:textarea path="comments" id="" cols="30" rows="10"
					class="form-control my-1" placeholder="Comment here"></form:textarea>
				<button type="submit" class="btn btn-primary w-100">Comment</button>
			</form:form>

			<%
			}
			%>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="./layout/public-footer.jsp" />



	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- jquery  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		type="text/javascript"></script>

	<!-- custom js -->
	<script src="/js/home.js" type="text/javascript" defer></script>

	<script src="/js/view-detail.js" type="text/javascript"></script>
</body>
</html>