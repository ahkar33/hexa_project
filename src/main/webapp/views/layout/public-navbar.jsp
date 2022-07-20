<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section id="navbar" class="navbar navbar-expand sticky-top">
		<div class="container justify-content-between align-items-center">
			<div class="navbar-brand fw-bold h2">
				<a href="/hexa/home">HEXA</a>
			</div>
			<ul class="navbar-nav gap-4 d-flex align-items-center" id="navbar-nav">
				<li class="nav-item active fw-bold"><a href="/hexa/home">Home</a></li>

				<c:if test="${sessionScope.userInfo == null}">
					<li class="nav-item"><a href="/hexa/login" class="text-primary shadow-sm p-1 fw-bold bulb">Sign In</a>
					</li>
					<li class="nav-item"><a href="/hexa/register" class="text-success  shadow-sm p-1  fw-bold bulb">Sign
							Up</a></li>
				</c:if>


				<c:if test="${sessionScope.userInfo != null}">
					<li class="nav-item text-capitalize fw-bold">

						<c:if test="${sessionScope.userInfo.user_role == 3 }">
							<span data-bs-toggle="modal" id="user-name"
								data-bs-target="#acc-edit">${sessionScope.userInfo.user_name}</span>
						</c:if>
						<c:if test="${sessionScope.userInfo.user_role == 1 }">
							<a href="/hexa/admin/home">${sessionScope.userInfo.user_name}</a>
						</c:if>
						<c:if test="${sessionScope.userInfo.user_role == 2}">
							<a href="/hexa/admin/news">${sessionScope.userInfo.user_name}</a>
						</c:if>

					</li>
					<li class="nav-item d-none" id="user-id" data-target="${sessionScope.userInfo.user_id}">
						${sessionScope.userInfo.user_id}</li>
					<li class="nav-item"><p  class="text-danger p-1 shadow-sm  fw-bold d-inline bulb" id="logout">Logout</p></li>
				</c:if>

				<!-- edited from here -->
				<li class="nav-item"><i class="fa-solid fa-magnifying-glass btn" id="btn-search"
						onclick="window.location.href='/hexa/search'"></i></li>
			</ul>
			<i class="fa-solid fa-bars" id="btn-menu" style="transform:translateX(600%)"></i>
			<div id="menu-layer" class=""></div>
	</section>

	<!-- for account edit -->
	<div class="modal fade" id="acc-edit">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<header class="modal-header">
					<div class="w-100 d-flex justify-content-between">
						<h6 class="h4 text-danger">Edit Info</h6>
						<span class="btn-close" data-bs-dismiss="modal" data-bs-target="#acc-edit"></span>
					</div>
				</header>
				<form action="/hexa/editUser" method="POST" class="modal-body">
					<div class="form-group my-1">
						<!-- for id -->
						<input type="hidden" name="id" value="${sessionScope.userInfo.user_id}" /> <label for=""
							class="form-label fw-bold text-danger">Username</label> <input type="text" name="name"
							class="form-control" value="${sessionScope.userInfo.user_name}" />
					</div>
					<div class="form-group my-1">
						<label for="" class="form-label fw-bold text-danger">Email
							Address</label> <input type="email" name="email" class="form-control"
							value="${sessionScope.userInfo.user_email}" />
					</div>
					<div class="form-group my-1">
						<label for="" class="form-label fw-bold text-danger">Password</label>
						<input type="password" name="psw" class="form-control" minlength="6" />
					</div>
					<div class="form-group my-1 d-flex justify-content-end align-items-center gap-1">
						<a href="" class="btn btn-warning text-light" data-bs-dismiss="modal"
							data-bs-target="#acc-edit">Cancel</a>
						<button type="submit" class="btn btn-success text-light">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- sweet -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- confirm.js -->
<script src="/js/confirm.js" type="text/javascript"></script>

<script src="/js/logout_confirm.js" type="text/javascript"></script>