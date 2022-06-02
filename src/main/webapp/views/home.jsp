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

<c:url value="/node_modules/bootstrap/dist/css/bootstrap.min.css"
	var="bootStrapCss" />
<link href="${bootStrapCss}" rel="stylesheet" />

<c:url value="/css/home.css" var="css" />
<link href="${css}" rel="stylesheet" />

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">


</head>

<body>
	
<%-- 	<%
	if(session.getAttribute("userInfo") == null){
		System.out.println("not a user");
	} else {
		System.out.println("user");
	}
	%> --%>	
	
	<!-- navbar -->
	<section id="navbar" class="navbar navbar-expand sticky-top">
		<div class="container">
			<div class="navbar-brand fw-bold h2">Hexa</div>
			<ul class="navbar-nav gap-4 d-flex align-items-center"
				id="navbar-nav">
				<li class="nav-item active fw-bold">Home</li>
				<li class="nav-item">News</li>
				<li class="nav-item dropdown" id="Categories"><span
					class="dropdown-toggle" data-bs-toggle="dropdown"
					data-bs-target="#categories">Categories</span>
					<ul class="dropdown-menu p-0 my-3">
						<li class="dropdown-item ">Global</li>
						<li class="dropdown-item">Local</li>
						<li class="dropdown-item ">Hot News</li>
					</ul></li>
				<li class="nav-item">Contacts</li>
				
				<%
					if(session.getAttribute("userInfo") != null) {
						out.print("<li class=\"nav-item\"><a href=\"/hexa/logout\"><input type=\"button\" value=\"Logout\"></a></li>");
					} else {
						out.print("<li class=\"nav-item\"><a href=\"/hexa/showLogin\"><input type=\"button\" value=\"Login\"></a></li>");
					}
				%>

				<li class="nav-item">

				<i class="fa-solid fa-magnifying-glass btn" id="btn-search"
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
							placeholder="Type to search..." autofocus=true />
						<button type="submit" class="d-none"></button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<!-- today news -->
	<p class="h2  text-danger p-2 w-75 m-auto my-5 fw-bold">Today's
		News</p>
	<div id="welcome" class="container w-75 my-3 gap-3">
		<div class="col" id="left">
			<div class="welcome-box my-3">
				<img src="/img/main.jpg" alt="image" id="welcome-img">
				<div class="welcome-layer">
					<span class="welcome-title">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. Id atque animi ea possimus. Aut
						maxime, quos nam cum illo rerum nulla explicabo quis ipsa, neque
						vitae eligendi saepe sint eaque...</span> <span class="welcome-location">|Global</span>
				</div>
			</div>
		</div>
		<div class="col gap-2" id="right">
			<div class="new-box my-1">
				<img src="/img/img1.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem ipsum dolor sit amet
						consectetur, adipisicing elit. ....</span> <span class="new-location">|Global</span>
				</div>
			</div>
			<div class="new-box my-1">
				<img src="/img/img2.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem, ipsum dolor sit amet
						consectetur adipisicing elit...</span> <span class="new-location">|Myanmar</span>
				</div>
			</div>
			<div class="new-box my-1">
				<img src="/img/img3.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem ipsum dolor sit amet
						consectetur adipisicing elit...</span> <span class="new-location">|USA</span>
				</div>
			</div>
			<div class="new-box my-1">
				<img src="/img/img4.jpg" class="new-img" alt="image" />
				<div class="new-layer">
					<span class="new-title">Lorem ipsum dolor sit amet
						consectetur adipisicing elit....</span> <span class="new-location">|Myanmar</span>
				</div>
			</div>
		</div>
	</div>

	<!-- <!-- news -->
	<div id="news"
		class="container w-75 my-3 gap-2 d-flex flex-wrap justify-content-between align-items-center">
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img5.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span><span class="new-date"></span><span
						class="new-location"></span>
				</div>
			</div>
		</div>

		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img6.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img7.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img8.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img8.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img9.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img5.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img1.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img2.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img3.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img4.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
		<div id="news">
			<div class="new-box">
				<img src="../assets/img/img6.jpg" alt="" class="new-img">
				<div class="new-layer">
					<span class="new-title"></span> <span class="new-date"></span> <span
						class="new-location"></span>
				</div>
			</div>
		</div>
	</div>

	<!-- bootstrap js -->
	<c:url value="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"
		var="bootstrapJs" />
	<script src="${bootstrapJs}"></script>

	<!-- jquery  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		type="text/javascript"></script>


	<!-- custom js -->
	<c:url value="/js/home" var="js" />
	<script src="${js}"></script>


</body>

</html>