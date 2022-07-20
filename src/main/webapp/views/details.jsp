<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Details</title>

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

		<div class="container py-3 d-flex justify-content-end">
			<span id="google-ele"></span>
		</div>


		<div id="news-wrapper" class="container d-flex justify-content-between gap-3 row mx-auto">
			<div id="news" class="my-5 col-xl-7  col-md-12 d-flex flex-column ">
				<h3 class="h3 text-warning fw-bold text-warning mx-auto text-capitalize "
					id="news-title">"${newsDetails.news_name}"</h3>
				<div id="news-image" class="my-3 w-100">
					<img src="/img/${newsDetails.news_img}">
					<div id="layer"
						class="d-flex justify-content-end align-items-start flex-column p-3">
						<div id="news-location" class="fw-bold mx-2 thm">
							<i class="fa-solid fa-location-dot"></i>
							${newsDetails.news_location}
						</div>
						<div id="news-writer" class="fw-bold">${newsDetails.creator_name}</div>
					</div>
				</div>
				<div id="news-content" class="w-100 fw-bold"
					style="color: rgba(0, 0, 0, 0.75);">
					<p class="w-100" style="letter-spacing: 1.3px;line-height:1.5;">${newsDetails.descriptions}</p>
				</div>
			</div>

			<div id="others" class="my-5 d-flex flex-column align-items-center gap-3 col-xl-4 col-md-8 text-center">
				<h3 class="h3 text-danger fw-bold text-start">Latest News</h3>
				<c:forEach var="news" items="${latestNews}">
					<c:if test="${news.news_id != newsDetails.news_id}">
						<div id="other-news">
							<a href="/hexa/details/${news.news_id}"> <img
								src="/img/${news.news_img}" alt="">
								<div id="layer"	class="d-flex justify-content-end align-items-start flex-column p-3">
									<div id="title" class="txt-snow">${news.news_name}</div>
									<div id="location">|${news.news_location}</div>
									<div class="thm created-date">${news.created_date}</div>
								</div>
							</a>
						</div>
					</c:if>
				</c:forEach>


			</div>
		</div>
		<div id="comments-wrapper"
			class="my-5 d-flex justify-content-center row flex-wrap w-75 mx-auto">

			<%
			if (session.getAttribute("userInfo") != null) {
			%>
				<form id="comment-form" class="form col-xl-6 col-md-12">
					<input type="hidden" id="user-id" value="${userInfo.user_id}" />
					<textarea id="comment"  cols="30" rows="10"
						class="form-control my-1" placeholder="Comment here"></textarea>
					<button type="submit" class="btn btn-primary w-100">Comment</button>
				</form>

			<%
				}
			%>

			<div id="comments-container" class="p-3 col-xl-6 col-md-12 my-3">
				<div id="comments" class="w-100">

				</div>
				<span class="text-decoration-underline" id="btn-view" data-show=false></span>
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

	<script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate">
	</script>

	<!-- google translate -->
	<script>
		function loadGoogleTranslate(){
			new google.translate.TranslateElement("google-ele");
		}
	</script>

	<!-- comment_script.js -->
	<script src="/js/comment_script.js" type="text/javascript"></script>

	<script src="/js/getPeriod.js" type="text/javascript"></script>

	<!-- date_period_dom.js -->
	<script src="/js/date_period_dom.js" type="text/javascript"></script>

	<script src="/js/delete_confirm.js"></script>
</body>
</html>