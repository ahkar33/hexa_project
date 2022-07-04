    <section id="navbar" class="w-100 bg-snow py-2 px-5  navbar navbar-expand fw-bold text shadow-sm sticky-top m-0">
        <main class="container px-2">
            <h3 class="navbar-brand fw-bold" style="color:rgba(0,0,0,0.75);"><a href="/hexa/admin/home" class="text-dark">HEXA</a></h3>
            <ul class="navbar-nav d-flex gap-3 align-items-center">
    
                <li class="nav-item text-capitalize fw-bold mx-2" style="color:rgba(0,0,0,0.75);">
                  <span class="p-2" data-bs-toggle="modal" data-bs-target="#acc-edit" >${sessionScope.userInfo.user_name} <span class="text-primary p-1 shadow-sm" style="font-size:13px;">${sessionScope.userInfo.user_role_name}</span></span>
                </li>

                <li class="nav-item fw-bold"><a href="/hexa/logout" class="text-danger shadow-sm p-2" onclick="localStorage.removeItem('countDone'); return confirm('Are you sure to logout?');">Logout</a></li>
            </ul>
        </main>
    </section>

