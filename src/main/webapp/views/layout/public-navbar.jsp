<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="navbar" class="navbar navbar-expand sticky-top">
		<div class="container">
			<div class="navbar-brand fw-bold h2">
				<a href="/hexa/home">Hexa</a>
			</div>
			<ul class="navbar-nav gap-4 d-flex align-items-center"
				id="navbar-nav">
				<li class="nav-item active fw-bold"><a href="/hexa/home">Home</a></li>
				<!-- <li class="nav-item dropdown" id="Categories"><span
					class="dropdown-toggle" data-bs-toggle="dropdown"
					data-bs-target="#categories">Categories</span>
					<ul class="dropdown-menu p-0 my-3">
						<c:forEach var="category" items="${categories}">
							<li class="dropdown-item ">
							<a href="/hexa/searchByCategory/${category.news_category_id}">${category.news_category_name} </a></li>
						</c:forEach>
					</ul></li> -->
				<c:if test="${sessionScope.userInfo == null}">
					<li class="nav-item"><a href="/hexa/login" class="text-primary shadow-sm p-1 fw-bold">Sign In</a></li>
					<li class="nav-item"><a href="/hexa/register" class="text-success  shadow-sm p-1  fw-bold">Sign Up</a></li>
				</c:if>


				<c:if test="${sessionScope.userInfo != null}">
					<li class="nav-item text-capitalize fw-bold"><a href="/hexa/admin/home">${sessionScope.userInfo.user_name}</a></li>
					<li class="nav-item"><a href="/hexa/logout" class="text-danger p-1 shadow-sm  fw-bold">Logout</a></li>
				</c:if>
				<!-- <li class="nav-item"><i
					class="fa-solid fa-magnifying-glass btn" id="btn-search"
					data-bs-target="#search" data-bs-toggle="modal"></i></li> -->


					<!-- edited from here -->
					<li class="nav-item"><i class="fa-solid fa-magnifying-glass btn" id="btn-search" onclick="window.location.href='/hexa/search'"></i></li>
				</ul>
			<i class="fa-solid fa-bars" id="btn-menu"></i>
		</div>
		<div id="menu-layer" class=""></div>
	</section>

		<!-- model for search -->
		<!-- <section class="modal fade" id="search">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<span class="btn-close" data-bs-dismiss="modal"></span>
					</div>
					<form class="modal-body form">
						<div class="form-group">
							<input type="search" class="form-control" name="search"
								placeholder="Type to search..."/>
							<button type="submit" class="d-none"></button>
						</div>
					</form>
				</div>
			</div>
		</section> -->
	