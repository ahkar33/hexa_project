    <section id="navbar" class="navbar navbar-expand fw-bold text shadow-sm sticy-top">
        <main class="container px-2">
            <h3 class="navbar-brand" style="color:rgba(0,0,0,0.75);"><a href="/hexa/admin/home" class="text-dark">HEXA</a></h3>
            <ul class="navbar-nav d-flex gap-3 align-items-center">
    
                <li class="nav-item text-capitalize fw-bold mx-2" style="color:rgba(0,0,0,0.75);">
                  <span class="p-2" data-bs-toggle="modal" data-bs-target="#acc-edit" >${sessionScope.userInfo.user_name}(${sessionScope.userInfo.user_role_name})</span>
                </li>

                <li class="nav-item fw-bold"><a href="/hexa/logout" class="text-danger shadow-sm p-2" onclick="return confirm('Are you sure to logout?');">Logout</a></li>
            </ul>
        </main>

         <!-- for account edit -->
         <div class="modal fade" id="acc-edit">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <header class="modal-header">
                        <div class="w-100 d-flex justify-content-between">
                            <h6 class="h4 text-danger">Edit Info</h6>
                            <span class="btn-close" data-bs-dismiss="modal" data-bs-target="#acc-edit"></span>
                        </div>
                    </header>
                    <form action="/hexa/editUser" method="POST" class="modal-body">
                        <div class="form-group my-1">
                            <!-- for id -->
                            <input type="hidden" name="id" value="${sessionScope.userInfo.user_id}"/>
                            <label for="" class="form-label fw-bold text-danger">Username</label>
                            <input type="text" name="name" class="form-control" value="${sessionScope.userInfo.user_name}" />
                        </div>
                        <div class="form-group my-1">
                            <label for="" class="form-label fw-bold text-danger">Email Address</label>
                            <input type="email" name="email" class="form-control" value="${sessionScope.userInfo.user_email}" />
                        </div>
                        <div class="form-group my-1">
                            <label for="" class="form-label fw-bold text-danger">Password</label>
                            <input type="password" name="psw" class="form-control" value="${sessionScope.userInfo.user_password}" />
                        </div>
                        <div class="form-group my-1 d-flex justify-content-end align-items-center gap-1">
                            <a href="" class="btn btn-warning text-danger" data-bs-dismiss="modal" data-bs-target="#acc-edit">Cancel</a>
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

