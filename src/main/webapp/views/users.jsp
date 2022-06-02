<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage User</title>
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
                <h3>User Information</h3>
            </div>
                <!-- edited here -->
               <div id="table-wrapper">
                    <table class="table-fill" id="user-table">
                        <thead class="sticky-top">
                            <tr>
                            <th class="text-left">User Id</th>
                            <th class="text-left">User Name</th>
                            <th class="text-left">Email</th>
                            <th class="text-left">Option</th>
                            </tr>
                        </thead>
                        <tbody class="table-hover">
                            <tr>
                                <td class="text-left">1</td>
                                <td class="text-left">Jame</td>
                                <td class="text-left">jame2000@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">2</td>
                                <td class="text-left">Mary</td>
                                <td class="text-left">mary2004@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">3</td>
                                <td class="text-left">Jin</td>
                                <td class="text-left">jin2001@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">4</td>
                                <td class="text-left">Hattie</td>
                                <td class="text-left">hattie2003@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">5</td>
                                <td class="text-left">Erica Shin</td>
                                <td class="text-left">ericashin2000@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">5</td>
                                <td class="text-left">Erica Shin</td>
                                <td class="text-left">ericashin2000@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">5</td>
                                <td class="text-left">Erica Shin</td>
                                <td class="text-left">ericashin2000@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">5</td>
                                <td class="text-left">Erica Shin</td>
                                <td class="text-left">ericashin2000@gmail.com</td>
                                <td class="text-left">
                                    <a href="">
                                        <input type="button" value="Ban" class="button"/>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
               </div>
			
			<!-- footer -->
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	<!-- bootstrap -->
	<script src="/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		
</body>
</html>