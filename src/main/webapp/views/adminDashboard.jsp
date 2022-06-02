<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ace.hexa.dto.UserResponseDto"%>
<%@ page import="com.ace.hexa.dto.UserRequestDto"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- ဒီ ပေ့ချ် က အက်ဒမင်ရဲ့ ဟုမ်းပေ့ချ်  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home</title>

<!-- bootstrap -->
<c:url value="/node_modules/bootstrap/dist/css/bootstrap.min.css"
	var="bootStrapCss" />
<link href="${bootStrapCss}" rel="stylesheet" />

<!-- custom css -->
<c:url value="/css/admin_home.css" var="css" />
<link href="${css}" rel="stylesheet" />

<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">

</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("userInfo") == null) {
		response.sendRedirect("/hexa/home");
	} else {
		UserResponseDto dto = (UserResponseDto) session.getAttribute("userInfo");
		if (dto.getUser_role() != 1) {
			response.sendRedirect("/hexa/home");
		}
	}
	%>

	<!-- navbar -->
	<jsp:include page="/views/layout/nav_bar.jsp"></jsp:include>

	<!-- main-body start here -->
	<!-- ဘေးနား ဘားနဲ့ အလယ် က ဒေတာတွေ ပြဖို့အတွက် ကို မိန်းဘော်ဒီထဲထည့်ထားသလို့စဥ်းစားထားတာ -->
	<main id="main-body" class="w-100 p-0 m-0 d-flex">
		<!-- ဒါက ဘေးဘားအတွက် အလျား ၁၅ ရာခိုင်နှုန်းယူထားတယ် -->
		<jsp:include page="/views/layout/side_bar.jsp"></jsp:include>

		<!-- ဒါက နောက် ဂရပ်တွေဘာတွေ ထည့်ဖို့အတွက်  -->
		<section id="main-data" class="w-85 position-relative">

			<!-- footer -->
			<jsp:include page="/views/layout/footer.jsp"></jsp:include>
		</section>
	</main>

	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>