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
<title>Login</title>

<!-- <c:url value="/node_modules/bootstrap/dist/css/bootstrap.min.css"
	var="bootStrapCss" />
<link href="${bootStrapCss}" rel="stylesheet" /> -->

<c:url value="/css/login_register.css"
	var="css" />
<link href="${css}" rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	type="text/css">

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">

</head>

<body
	class="d-flex  flex-column justify-content-center align-items-center">
	<section class="card p-3 " id="container">
		<header class="card-title text-center text">
			<span class="h3 w-100 text">Hexa</span>
		</header>
		<div class="text-danger fw-bolb text-center"><span style="font-size:18px !important;">${error}</span></div>
		<form:form action="/hexa/login" class="card-body form" name="login"
			method="post" modelAttribute="bean">
			<div class="form-group my-3">
				<label for="email" class="form-label fw-bold text">Email
					Address</label>
				<form:input type="email"  id="email" class="input" path="user_email" required="required"
					placeholder="Your Email Address" autofocus="true" />
				<i class="fa-solid fa-envelope text"></i>
			</div>
			<div class="form-group my-3">
				<label for="password" class="form-label fw-bold text">Password</label>
				<form:input type="password" id="password" class="input" required="required"
					path="user_password" placeholder="Your Password" />
					<i class="fa-solid fa-lock text"></i>
			</div>
			<div class="form-group">
				<input class="w-100 btn btn-primary" type="submit" value="Login" />
 				<div class="w-100 d-flex justify-content-between my-1">
					<a href="/hexa/home" class="text-danger">Back</a>
					 <a href="/hexa/register">Create?</a>
				</div> 
			</div>
		</form:form>
	</section>

	<footer class="w-100 p-2 m-0">
		<div
			class="container d-flex justify-content-between align-items-center"
			id="wrapper">
			<div class=" fw-bold text">Created By Hexa_Group(Ace
				Inspiration)</div>
			<div class="">
				<a href="" class="mx-1 h5 text"><i class="fa-brands fa-facebook"></i></a>
				<a href="" class="mx-1 h5 text"><i class="fa-brands fa-github"></i></a>
				<a href="" class="mx-1 h5 text"><i class="fa-brands fa-discord"></i></a>
			</div>
		</div>
	</footer>
</body>

</html>