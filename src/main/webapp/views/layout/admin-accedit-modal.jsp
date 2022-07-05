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
                    <a href="" class="btn btn-warning text-light" data-bs-dismiss="modal" data-bs-target="#acc-edit">Cancel</a>
                    <button type="submit" class="btn btn-success txt-light">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>