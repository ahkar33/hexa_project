<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
<c:url value="/node_modules/bootstrap/dist/css/bootstrap.min.css"
	var="bootStrapCss" />
<link href="${bootStrapCss}" rel="stylesheet" />
</head>
<body>
	<h2 class="text-center">
		<a href="/hexa/allNews">Home</a>
	</h2>
	<h2 class="text-center">This is details page</h2>
	<div class="container">
		<h3>${newsDetails.news_name}</h3>
		<img src="/img/${newsDetails.news_img}" width="200px" height="200px">
		<h4>Location : ${newsDetails.news_location}</h4>
		<h4>Date : ${newsDetails.created_date}</h4>
		<article>${newsDetails.descriptions}</article>


		<%
			if (session.getAttribute("userInfo") != null) {
		%>
		<form:form action="/hexa/allNews/addComment/${newsDetails.news_id}"
			method="post" modelAttribute="bean">
			<form:input type="hidden" path="user_id" value="${userInfo.user_id}" />
			<form:textarea type="text" path="comments" placeholder="comment"
				rows="4" cols="50" />
			<br>
			<input type="submit" value="Submit" />
		</form:form>

		<c:if test="${interactions.size() > 0}">
			<%-- <h3>This is news id ${details.get(0).news_id}</h3> --%>
			<c:forEach var="interaction" items="${interactions}">
				<p class="h5">${interaction.user_name}
				<p>
				<p class="lead">${interaction.comments}</p>
			</c:forEach>
		</c:if>
		<%
			}
		%>



		<%-- <form:form action="/hexa/allNews/addComment/${newsDetails.news_id}"
			method="post" modelAttribute="bean">
			<form:input type="hidden" path="user_id" value="${userInfo.user_id}" />
			<form:textarea type="text" path="comments" placeholder="comment"
				rows="4" cols="50" />
			<br>
			<input type="submit" value="Submit" />
		</form:form>

		<c:if test="${interactions.size() > 0}">
			<h3>This is news id ${details.get(0).news_id}</h3>
			<c:forEach var="interaction" items="${interactions}">
				<p>user_id (${interaction.user_id}) => "${interaction.comments}"</p>
			</c:forEach>
		</c:if> --%>

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