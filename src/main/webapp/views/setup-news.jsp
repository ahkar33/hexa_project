<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page import="com.ace.hexa.dto.user.UserResponseDto" %>
			<%@ page import="com.ace.hexa.dto.user.UserRequestDto" %>
				<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
					<!DOCTYPE html>
					<!-- for creating news -->

					<html lang="en">

					<head>
						<meta charset="UTF-8">
						<meta http-equiv="X-UA-Compatible" content="IE=edge">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title>Setup News</title>
						<!-- bootstrap -->
						<link rel="stylesheet"
							href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
							type="text/css">

						<!-- fontawesome -->
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
							type="text/css">

						<!-- custom css -->
						<link rel="stylesheet" href="/css/admin_home.css" type="text/css">

						<link rel="stylesheet" href="/css/create-news.css" type="text/css">
					</head>

					<body data-collaboration="false" data-revision-history="false">
						<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate" ); if
							(session.getAttribute("userInfo")==null) { response.sendRedirect("/hexa/home"); } else {
							UserResponseDto dto=(UserResponseDto) session.getAttribute("userInfo"); if
							(dto.getUser_role()==3) { response.sendRedirect("/hexa/home"); } } %>

							<div class="container-fluid p-0 m-0 d-flex">
								<jsp:include page="./layout/admin-sidebar.jsp" />

								<!-- main-body start here -->
								<main data-editor="ClassicEditor" id="main-data" class="w-85">

									<!-- top navbar start here -->
									<jsp:include page="./layout/admin-navbar.jsp" />

									<main id="form-wrapper" class="w-75 mx-auto my-5">
										<div class="w-75 ">
											<h3 class="h2 card-title text-center">UPDATE NEWS</h3>
											<div class="text-center text-success">
												<h4>${post_msg}</h4>
											</div>
											<!-- error & msg twl pya poh -->
											<span class="alert-primary p-2 d-none" id="msg">Something
												messages</span>
											<form:form action="/hexa/admin/update_news" method="post"
												class="card-body form" modelAttribute="newsBean"
												enctype="multipart/form-data">
												<!-- <div class="w-100 text-end">
									<button class="btn btn-danger text-end" type="reset">Clear</button>
								</div> -->
												<input type="hidden" value="${news_img}" name="news_img">
												<div class="form-group my-2">
													<label for="" class="form-label my-1 fw-bold">News Title</label>
													<form:input type="text" class="form-control" path="news_name"
														placeholder="eg. Something happened" required="required" />
												</div>
												<form:input type="hidden" path="news_id" />
												<div class="form-group my-2">
													<label for="" class="form-label my-1 fw-bold">News
														Categories</label>
													<form:select name="" id="" path="news_category" class="form-select"
														required="required">
														<option value="${selectedCategory.news_category_id}">
															${selectedCategory.news_category_name}</option>
														<c:forEach var="category" items="${updatenews_categories}">
															<c:if
																test="${category.news_category_name != selectedCategory.news_category_name}">
																<option value="${category.news_category_id}">
																	${category.news_category_name}</option>
															</c:if>
														</c:forEach>
													</form:select>
												</div>


												<div class="form-group my-2">
													<label for="" class="form-label my-1 fw-bold"> News'
														Location </label>
													<form:input type="text" class="form-control" path="news_location"
														placeholder="e.g Yangon" required="required" />
												</div>

												<div class="form-group my-2" data-editor="ClassicEditor">
													<label for="" class="form-label my-1 fw-bold">News
														Content</label>
													<form:textarea name="" cols="30" rows="15" class="form-control"
														id="editor" placeholder="e.g details about something happened"
														path="descriptions" required="required"></form:textarea>
												</div>

												<div class="form-group my-2 d-flex gap-1 flex-column">
													<img src="/img/${news_img}" style="width:400px;height:200px;"
														alt="">
													<label for="" class="form-label my-1 fw-bold">News Image</label>
													<form:input type="file" name="" id="" class="form-control"
														path="news_img" placeholder="Choose Image" />
												</div>

												<!-- for user id , will get from session -->


												<button class="btn btn-success w-100 my-1" type="submit"
													onclick="alert('successfully created');">Update</button>
											</form:form>
										</div>
									</main>
								</main>
							</div>


							<!-- acc edit modal -->
							<jsp:include page="./layout/admin-accedit-modal.jsp" />

							<!-- bootstrap -->
							<script
								src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

							<!-- jquery -->
							<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
								type="text/javascript"></script>
					</body>

					</html>