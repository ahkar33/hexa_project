<section id="navbar"
		class="navbar navbar-expand fw-bold text shadow-sm sticy-top">
		<main class="container px-2">
			<h3 class="navbar-brand" style="color: rgba(0, 0, 0, 0.75);">Hexa</h3>
			<ul class="navbar-nav d-flex gap-3 align-items-center">
				<li class="nav-item">
					<form action="" class="form  p-0 m-0">
						<div class="form-group d-flex align-items-center gap-2">
							<input type="search" class="form-control p-1 px-1"
								placeholder="Search you want...">
							<button type="submit" class="btn btn-primary">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</form>
				</li>
				<li class="nav-item" style="color: rgba(0, 0, 0, 0.75);">
					<!-- for user account info -->
					<div class="dropdown" id="user-info">
						<i class="fa-solid fa-user h4 toggle" data-bs-toggle="dropdown"
							data-bs-target="#user-info"></i>

						<ul class="dropdown-menu p-0 m-0"
							style="transform: translate(-18%)">
							<!-- လိုချင်သလို မီနူးကို ထပ်တိုး ထပ်လျော့ လုပ်ရုံပဲ။ ‌ယေဘုယျ ‌တော့ထားပေးထားတယ်။ -->
							<li class="dropdown-item">Username <!-- name--></li>
							<li class="dropdown-item">Admin <!-- role --></li>
							<li class="dropdown-item "><a href=""><i
									class="fa-solid fa-user-pen"></i><span class="mx-2">Edit</span></a></li>
							<!-- edit တွေဘာတွေ လုပ်ဖို့အတွက် -->
							<li class="dropdown-item bg-danger"><a href=""
								onclick="return confirm('Are you sure to logout?');"><i
									class="fa-solid fa-arrow-right-from-bracket"></i><span
									class="mx-2">Logout</span></a></li>
						</ul>
					</div>
				</li>
				<li class="nav-item"></li>
			</ul>
		</main>
	</section>