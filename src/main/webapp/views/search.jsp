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
<title>Search</title>

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

<!-- searchPage -->
<link rel="stylesheet" href="/css/searchPage.css" type="text/css">
</head>
<body>
	<!-- navbar -->
	<jsp:include page="./layout/public-navbar.jsp" />

	<!-- search -->
	<section id="search" class="container-fluid row my-4">
		<form action="/hexa/searchNewsByTitle" method="GET"
			class="form col-xl-8 col-md-12 mx-auto d-flex -justify-content-start align-items-center gap-1">
			<input type="search" class="form-control" id="search-val"
				placeholder="Search you want " name="title" autofocus/>
			<button type="submit" class="btn btn-primary btn-sm">
				<i class="fa-solid fa-magnifying-glass btn"></i>
			</button>
		</form>
	</section>
	<div class="container w-75 my-5 mx-auto gap-2 row text-start" id="search-news">
		<div id="news-wrapper" class="w-100 row d-flex align-items-center flex-column gap-1">
			<c:if test="${newsByTitle != null && newsByTitle.size() > 0 }">
				<c:forEach var="news" items="${newsByTitle}">
					<a href="/hexa/details/${news.news_id}" class="new-box row my-3 col-xl-3 col-lg-4 col-sm-10 text-light fw-bold d-flex justify-content-start flex-wrap"
						id="news">
						<div id="image" class="col-xl-3 col-md-5 p-0"> 
							<img src="/img/${news.news_img}" class="new-img" alt="image" style="width:100%;height:100%;" />
							<div class="new-layer">
								<span class="new-title text-capitalize"> ${news.news_name}
								</span> <span class="new-location text-dark text-capitalize">|${news.news_location}</span>
							</div>
						</div>
						<div id="content" class="d-flex justify-content-center align-items-center col-xl-9 col-md-7">
							<p id="news-content">
								${news.descriptions}
							</p>
						</div>
					</a>
				</c:forEach>
			</c:if>
		</div>
			<c:if test="${newsByTitle.size() == 0 && newsByTitle != null}">
				<div class="w-100 row d-flex justify-content-center align-items-center" style="height:500px;">
					<img src="/img/404.gif" class="col-xl-7 col-none-12 h-100 " alt=""/>
				</div>
			</c:if>

			<c:if test="${newsByTitle == null}">
				<div class="w-100 row d-flex justify-content-center align-items-center" style="height:500px;">
					<img src="/img/search.jpg" class="col-xl-7 col-none-12 h-100 " alt=""/>
				</div>
			</c:if>
	</div>

	<!-- footer -->
	<footer id="footer" class="w-100 p-3 m-0 " style="transform:translateY(300%);">
		<div class="container d-flex justify-content-center align-items-center mx-auto">
			<div
				class="col-lg-3 col-md-12 col-none-12 d-flex justify-content-center align-items-center flex-column gap-2">
				<div class="d-flex gap-2">
					<a href=""><i class="fa-brands fa-facebook"></i></a> <a href=""><i
						class="fa-brands fa-github"></i></a> <a href=""><i
						class="fa-brands fa-discord"></i></a>
				</div>
				<span class="h-6 text-center text-light">Created By
					Hexa_Group(Ace Inspiration) ${newsByTitle.size()}</span>
			</div>
		</div>
	</footer>


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

	<script src="/js/search_page.js" type="text/javascript"></script>
</body>
</html>