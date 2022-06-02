<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>News</title>
<c:url value="/node_modules/bootstrap/dist/css/bootstrap.min.css"
	var="bootStrapCss" />
<link href="${bootStrapCss}" rel="stylesheet" />
</head>
<body>

	<h1 class="text-center">This is news page</h1>
	<div class="container">
		<div class="row justify-content-center">
			<c:forEach var="news" items="${newsList}">
				<div class="col-3">
					<a href="/hexa/allNews/${news.news_id}">
					<h2>${news.news_name}</h2>
					<img class="text-center" src="/img/${news.news_img}" width="200px" height="200px">
					</a>
				</div>
			</c:forEach>
		</div>
	</div>


	<!-- bootstrap js -->
	<c:url value="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"
		var="bootstrapJs" />
	<script src="${bootstrapJs}"></script>
	<!-- jquery  -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		type="text/javascript">
	</script>
</body>
</html>