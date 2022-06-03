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
	<section id="navbar" class="navbar navbar-expand sticky-top">
		<div class="container">
			<div class="navbar-brand fw-bold h2">
				<a href="./home.html">Hexa</a>
			</div>
			<ul class="navbar-nav gap-4 d-flex align-items-center"
				id="navbar-nav">
				<li class="nav-item active fw-bold"><a href="/hexa/home">Home</a></li>
				<li class="nav-item"><a href="./home.html#news">News</a></li>
				<li class="nav-item dropdown" id="Categories"><span
					class="dropdown-toggle" data-bs-toggle="dropdown"
					data-bs-target="#categories">Categories</span>
					<ul class="dropdown-menu p-0 my-3">
						<li class="dropdown-item ">Global</li>
						<li class="dropdown-item">Local</lsi>
						<li class="dropdown-item ">Hot News</li>
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

	<div class="container">
		<div id="news-wrapper"
			class="d-flex justify-content-between align-items-center gap-5">
			<div id="news" class="my-5 w-75">
				<h3 class="h3 text-dark fw-bold my-2" id="news-title">
					${newsDetails.news_name}</h3>
				<div id="news-image" class="my-3 w-100">
					<img src="/img/${newsDetails.news_img}">
					<div id="layer" class="d-flex justify-content-end align-items-start flex-column p-3">
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
			<div id="others" class="my-5 d-flex flex-column gap-3">
				<div id="other-news">
					<img src="../assets/img/main.jpg" alt="">
					<div id="layer"
						class="d-flex justify-content-end align-items-start flex-column p-3">
						<div id="title">Lorem ipsum, dolor sit amet consectetur
							adipisicing elit. Qui, obcaecati!</div>
						<div id="location">|Global</div>
					</div>
				</div>

				<div id="other-news">
					<img src="../assets/img/img5.jpg" alt="">
					<div id="layer"
						class="d-flex justify-content-end align-items-start flex-column p-3">
						<div id="title">Lorem ipsum, dolor sit amet consectetur
							adipisicing elit. Qui, obcaecati!</div>
						<div id="location">|Global</div>
					</div>
				</div>


				<div id="other-news">
					<img src="../assets/img/img2.jpg" alt="">
					<div id="layer"
						class="d-flex justify-content-end align-items-start flex-column p-3">
						<div id="title">Lorem ipsum, dolor sit amet consectetur
							adipisicing elit. Qui, obcaecati!</div>
						<div id="location">|Global</div>
					</div>
				</div>


				<div id="other-news">
					<img src="../assets/img/img8.jpg" alt="">
					<div id="layer"
						class="d-flex justify-content-end align-items-start flex-column p-3">
						<div id="title">Lorem ipsum, dolor sit amet consectetur
							adipisicing elit. Qui, obcaecati!</div>
						<div id="location">|Global</div>
					</div>
				</div>
			</div>
		</div>
		<div id="comments-wrapper" class="my-5 d-flex justify-content-center">
		
			
		<%
			if (session.getAttribute("userInfo") != null) {
		%>	

			<form:form action="/hexa/details/addComment/${newsDetails.news_id}"
				method="post" class="form w-50" modelAttribute="bean">
				<form:input type="hidden" path="user_id" value="${userInfo.user_id}" />
				<form:textarea name="" id="" cols="30" rows="10"
					class="form-control my-1" placeholder="Comment here"
					path="comments"></form:textarea>
				<button type="submit" class="btn btn-primary w-100">Comment</button>
			</form:form>

		<%
			}	
		%>	
			<c:if test="${interactions.size() > 0}">	
			<div id="comments" class="w-50 p-3">
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
		</div>
	</div>



	<footer id="footer" class="w-100 p-5 m-0">
		<div
			class="container d-flex justify-content between align-items-center row">
			<div
				class="col-3 d-flex justify-content-between align-items-start flex-column gap-2">
				<h3 class="h3 fw-bold text-center text-light">Short Links</h3>
				<a href="./home.html"><i class="fa-solid fa-house mx-1"></i>Home</a>
				<a href="./home.html#welcome"><i class="fa-brands fa-neos mx-1"></i>Today's
					News</a> <a href="./login.html"><i
					class="fa-solid fa-right-to-bracket mx-1"></i>Sign In</a> <a
					href="./register.html"><i class="fa-solid fa-user-plus mx-1"></i>Sign
					Up</a>
			</div>

			<div
				class="col-3 d-flex justify-content-between align-items-start flex-column gap-2">
				<h3 class="h3 fw-bold text-center text-light">Contact Infos</h3>
				<a href="mailto:hexa@gmail.com"><i class="fa-solid fa-envelope"></i>
					- hexa@gmail.com</a> <a href="tel:0912345"><i
					class="fa-solid fa-mobile "></i> - 09 12345</a> <a href=""><i
					class="fa-solid fa-map-location-dot"></i> - No.(100),Baker
					Street,London.</a> <a href=""></a>
			</div>

			<div
				class="col-3 d-flex justify-content-between align-items-start flex-column gap-2">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3818.6015410613113!2d96.12325231469516!3d16.84611208840508!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30c194e97475a301%3A0x82c1943b3489933!2sACE%20Inspiration%20Professional%20Development%20Center!5e0!3m2!1sen!2smm!4v1654162852459!5m2!1sen!2smm"
					width="600" height="450" style="border: 0;" allowfullscreen=""
					loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>

			<div
				class="col-3 d-flex justify-content-between align-items-start flex-column gap-2">
				<h3 class="h3 fw-bold text-center text-light">Other Medias</h3>
				<div class="d-flex gap-2">
					<a href=""><i class="fa-brands fa-facebook"></i></a> <a href=""><i
						class="fa-brands fa-github"></i></a> <a href=""><i
						class="fa-brands fa-discord"></i></a>
				</div>
				<span class="h-6 text-center text-light">Created By
					Hexa_Group(Ace Inspiration)</span>
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
</body>
</html>