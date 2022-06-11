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
</head>
<body>
	<!-- navbar -->
	<jsp:include page="./layout/public-navbar.jsp" />

	<!-- today news -->
		<c:if test="${todayNews.size() > 0 }">
		<p class="h2  text-danger p-2 w-75 m-auto my-5 fw-bold">Today's
			News</p>
		<div id="welcome" class="container w-75 my-3 gap-3 mx-auto">
			<div class="gap-2 container-fluid row mx-auto">

				<c:forEach var="news" items="${todayNews}">
					<div class="new-box my-1 col-lg-5 col-none-12" id="news">
						<a href="/hexa/details/${news.news_id}"> <img
							src="/img/${news.news_img}" class="new-img" alt="image" />
							<div class="new-layer">
								<span class="new-title"> ${news.news_name} </span> <span
									class="new-location">|${news.news_location}</span>
							</div>
						</a>
					</div>
				</c:forEach>

			</div>
		</div>
	</c:if>

	<!-- news -->
	<div class="container w-75 my-5 mx-auto gap-2 row text-start">
		<p class="h2 text-danger p-2 w-75 fw-bold" id="title">News</p>
		<div id="news-wrapper"
			class="w-100 row d-flex justify-content-around flew-wrap">
			<c:forEach var="news" items="${newsList}">
				<div
					class="new-box my-1 col-xl-3 col-lg-4 col-sm-10 text-light fw-bold"
					id="news">
					<a href="/hexa/details/${news.news_id}"> <img
						src="/img/${news.news_img}" class="new-img" alt="image" />
						<div class="new-layer">
							<span class="new-title"> ${news.news_name} </span> <span
								class="new-location">|${news.news_location}</span>
						</div>
					</a>
				</div>

			</c:forEach>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="./layout/public-footer.jsp"/>


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