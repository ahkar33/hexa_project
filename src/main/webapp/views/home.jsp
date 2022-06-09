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
	<section id="navbar" class="navbar navbar-expand sticky-top">
		<div class="container">
			<div class="navbar-brand fw-bold h2">
				<a href="./home.html">Hexa</a>
			</div>
			<ul class="navbar-nav gap-4 d-flex align-items-center"
				id="navbar-nav">
				<li class="nav-item active fw-bold"><a href="/hexa/home">Home</a></li>
				<li class="nav-item"><a href="#news">News</a></li>
				<li class="nav-item dropdown" id="Categories"><span
					class="dropdown-toggle" data-bs-toggle="dropdown"
					data-bs-target="#categories">Categories</span>
					<ul class="dropdown-menu p-0 my-3">
						<c:forEach var="category" items="${categories}">
							<li class="dropdown-item ">
							<a href="/hexa/searchByCategory/${category.news_category_id}">${category.news_category_name} </a></li>
						</c:forEach>
					</ul></li>
				<li class="nav-item">About</li>
				<li class="nav-item"><a href="#footer">Contacts</a></li>
				<li class="nav-item"><i
					class="fa-solid fa-magnifying-glass btn" id="btn-search"
					data-bs-target="#search" data-bs-toggle="modal"></i></li>

			</ul>
			<i class="fa-solid fa-bars" id="btn-menu"></i>
		</div>
		<div id="menu-layer" class=""></div>
	</section>

	<!-- model for search -->
	<section class="modal fade" id="search">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<span class="btn-close" data-bs-dismiss="modal"></span>
				</div>
				<form class="modal-body form">
					<div class="form-group">
						<input type="search" class="form-control" name="search"
							placeholder="Type to search..." autofocus />
						<button type="submit" class="d-none"></button>
					</div>
				</form>
			</div>
		</div>
	</section>


	<!-- today news -->
	<p class="h2  text-danger p-2 w-75 m-auto my-5 fw-bold">Today's
		News</p>
	<div id="welcome" class="container w-75 my-3 gap-3 mx-auto">
		<div class="gap-2 container-fluid row mx-auto">
			<div class="new-box my-1 col-lg-5 col-none-12" id="news">
				<img src="../assets/img/img1.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. ....</span> <span class="new-location">|Global</span>
				</div>
			</div>
			<div class="new-box my-1 col-lg-5 col-none-12" id="news">
				<img src="../assets/img/img2.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem, ipsum dolor sit amet
						consectetur adipisicing elit...</span> <span class="new-location">|Myanmar</span>
				</div>
			</div>
			<div class="new-box my-1 col-lg-5 col-none-12" id="news">
				<img src="../assets/img/img3.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem ipsum dolor sit amet
						consectetur adipisicing elit...</span> <span class="new-location">|USA</span>
				</div>
			</div>
			<div class="new-box my-1 col-lg-5 col-none-12" id="news">
				<img src="../assets/img/img4.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem ipsum dolor sit amet
						consectetur adipisicing elit....</span> <span class="new-location">|Myanmar</span>
				</div>
			</div>
		</div>
	</div>

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
	<jsp:include page="./layout/footer.jsp"/>


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