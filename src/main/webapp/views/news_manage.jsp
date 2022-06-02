<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage News</title>

<!-- bootstrap -->
<link href="/node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	type="text/css">

<!-- custom css -->
<link href="/css/admin_home.css" rel="stylesheet" />
<link href="/css/table.css" rel="stylesheet" />

</head>
<body>
	<!-- navbar -->
	<jsp:include page="/views/layout/nav_bar.jsp"></jsp:include>

	<!-- main-body start here -->
	<main id="main-body" class="w-100 p-0 m-0 d-flex">
		<!-- ဒါက ဘေးဘားအတွက် အလျား ၁၅ ရာခိုင်နှုန်းယူထားတယ် -->
	<jsp:include page="/views/layout/side_bar.jsp"></jsp:include>	

		<!-- Body  -->
		<section id="main-data" class="w-85 position-relative">
			<div class="table-title">
				<h3>NEWS Info.</h3>
			</div>
			
			<div id="table-wrapper" >
			<div class="container-sm">
				<table class="table-fill" id="user-table">
					<thead class="sticky-top">
						<tr>
							<th class="text-left">Id</th>
							<th class="text-left">Name</th>
							<th class="text-left">Created Date</th>
							<th class="text-left">Updated Date</th>
							<th class="text-left">Category</th>
							<th class="text-left">Description</th>
							<th class="text-left">Image</th>
							<th class="text-left">Edit/Delete</th>
						</tr>
					</thead>
					<tbody class="table-hover">
						<tr>
							<td class="text-left">1</td>
							<td class="text-left">TomorrowLand(2019)</td>
							<td class="text-left">23/1/2021</td>
							<td class="text-left">28/1/2021</td>
							<td class="text-left">Entertainment</td>
							<td class="text-left">Just4fun</td>
							<td class="text-left"><img src="/img/tmrl.jpg" class="newstbl" alt="image" /></td>
							<td class="text-left"><a href=""> <input type="button"
									value="Edit" class="button" />
							</a></td>
						</tr>
						<tr>
							<td class="text-left">2</td>
							<td class="text-left">Tornado blah blah</td>
							<td class="text-left">13/4/2022</td>
							<td class="text-left">31/5/2022</td>
							<td class="text-left">Weather</td>
							<td class="text-left">Ejukajh Blhbhil Asdfjua</td>
							<td class="text-left"><img src="/img/wthr.jpg" class="newstbl" alt="image" /></td>
							<td class="text-left"><a href=""> <input type="button"
									value="Edit" class="button" />
							</a></td>
						</tr>
						<tr>
							<td class="text-left">3</td>
							<td class="text-left">Neon Art Makeup</td>
							<td class="text-left">25/6/2020</td>
							<td class="text-left">31/1/2021</td>
							<td class="text-left">Art</td>
							<td class="text-left">ERsdfgt JHiuytf Asdfjua</td>
							<td class="text-left"><img src="/img/art.jpg" class="newstbl" alt="image" /></td>
							<td class="text-left"><a href=""> <input type="button"
									value="Edit" class="button" />
							</a></td>
						</tr>
					</tbody>
				</table>
				 </div>
			</div>
			
			<!-- footer -->
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	<!-- bootstrap -->
	<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		
</body>
</html>