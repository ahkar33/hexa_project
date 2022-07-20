<section id="navbar" class="w-100 bg-snow py-2 px-5  navbar navbar-expand fw-bold text shadow-sm sticky-top m-0">
    <main class="container px-2">
        <h3 class="navbar-brand fw-bold" style="color:rgba(0,0,0,0.75);"><a href="/hexa/admin/home"
                class="text-dark">HEXA</a></h3>
        <ul class="navbar-nav d-flex gap-3 align-items-center">

            <li class="nav-item text-capitalize fw-bold mx-2" style="color:rgba(0,0,0,0.75);">
                <span class="p-2" data-bs-toggle="modal" data-bs-target="#acc-edit">${sessionScope.userInfo.user_name}
                    <span class="text-primary p-1 shadow-sm bulb"
                        style="font-size:13px;">${sessionScope.userInfo.user_role_name}</span></span>
            </li>

            <li class="nav-item fw-bold"><p class="text-danger shadow-sm p-1 d-inline bulb" id="logout">Logout</p>
            </li>
        </ul>
    </main>
</section>

<style>
    .bulb{
        border-radius: 20px !important;
		padding:5px 10px !important;
    }

    .thm{
        color:rgba(245, 197, 125,1) !important;
    }
</style>

<!-- sweet -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- confirm.js -->
<script src="/js/confirm.js" type="text/javascript"></script>

<script src="/js/logout_confirm.js" type="text/javascript"></script>