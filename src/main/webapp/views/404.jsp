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
	<jsp:include page="./layout/public-navbar.jsp" />
	
	<!-- ---- -->

	<!-- footer -->
	<footer id="footer" class="w-100 p-3 m-0 ">
        <div class="container d-flex justify-content-center align-items-center mx-auto">
    
            <div class="col-lg-3 col-md-12 col-none-12 d-flex justify-content-center align-items-center flex-column gap-2">
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