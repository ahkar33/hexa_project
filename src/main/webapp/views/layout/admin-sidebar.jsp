<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<section id="sidebar" class="dark-bg p-0 m-0 position-fixed w-15 pb-2 ">
			<h3 class="h5 text-center text-light py-3" id="dash-title"><a href="/hexa/admin/home">Dashboard</a></h3>

			<ul id="sidebar-list" class="list-group  gap-2 w-100">

				<c:choose>
					<c:when test="${userInfo.user_role == 1}">
						<h3 class="h5 text-center text-light py-3" id="dash-title">
							<a href="/hexa/admin/home">Dashboard</a>
						</h3>
					</c:when>
					<c:otherwise>
						<h3 class="h5 text-center text-light py-3" id="dash-title">
							<a href="/hexa/admin/news">Dashboard</a>
						</h3>
					</c:otherwise>
				</c:choose>

				<li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/news" class="w-100 d-block"><i
							class="fa-brands fa-neos"></i><span class="mx-2">News</span></a></li>

				<li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/create_news"
						class="w-100 d-block"><i class="fa-solid fa-circle-plus"></i><span class="mx-2">Create
							News</span></a></li>
				<!-- for categories -->

				<c:if test="${userInfo.user_role == 1 }">
					<li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/manageCategories"
							class="w-100 d-block"><i class="fa-solid fa-layer-group"></i><span
								class="mx-2">Categories</span></a></li>
				</c:if>
				<c:if test="${userInfo.user_role == 2 }">
					<li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/categories"
							class="w-100 d-block"><i class="fa-solid fa-layer-group"></i><span
								class="mx-2">Categories</span></a></li>
				</c:if>

				<li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/selectPost"
						class="w-100 d-block"><i class="fa-solid fa-comments"></i><span class="mx-2">Comments</span></a>
				</li>

				<li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/home" class="w-100 d-block"><i
							class="fa-solid fa-globe"></i><span class="mx-2">Public Panel</span></a></li>
			</ul>



			<span id="sidebar-tail" class="position-absolute bottom-0 mx-2 my-3" style="font-size:15px ;">
				Created By Hexa_Group
			</span>
		</section>