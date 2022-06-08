<section id="sidebar" class="dark-bg p-0 m-0 position-relative">
            <h3 class="h5 text-center text-light py-3" id="dash-title"><a href="/hexa/admin/home">Admin Dashboard</a></h3>

            <h3 class="h6 text-center text m-0">Actions</h3>
            <ul id="sidebar-list" class="list-group  gap-2 w-100">
                <!-- သွားချင်တဲ့ route ကို a tagထဲမှာ ထည့်ရုံပဲ -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0 text"><a href="/hexa/admin/users" class="w-100"><i class="fa-solid fa-users"></i><span class="mx-2">Users</span></a></li>
               <li id="sidebar-item" class="list-item p-2 px-3 m-0" ><a href="/hexa/admin/news"  class="w-100"><i class="fa-brands fa-neos"></i><span class="mx-2">News</span></a></li>
               <!-- ဒီအောက်က ကောင်က သတင်း ပေ့ချ်ကိုမ‌ေရာက်ပဲ တန်း အသစ် လုပ်တဲ့ ပေ့ချ် ကို ရောက်သွားမှာ  -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/create_news"  class="w-100"><i class="fa-solid fa-circle-plus"></i><span class="mx-2">Create News</span></a></li>
               <!-- for categories -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/categories"  class="w-100"><i class="fa-solid fa-layer-group"></i><span class="mx-2">Categories</span></a></li>
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/admin/selectPost"  class="w-100"><i class="fa-solid fa-comments"></i><span class="mx-2">Comments</span></a></li>
            </ul>
            <h3 class="h6 text-center text mx-5 py-3">Page Settings</h3>

            <ul id="sidebar-list" class="list-group  gap-2 w-100">
               <!-- user home page ကို သွားဖို့။ -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/home"  class="w-100"><i class="fa-solid fa-globe"></i><span class="mx-2">Public Panel</span></a></li>
               <!-- for logout -->
               <li id="sidebar-item" class="list-item p-2 px-3 m-0"><a href="/hexa/logout" class="text-danger w-100" onclick="return confirm('Are you sure to logout?');"><i class="fa-solid fa-arrow-right-from-bracket"></i><span class="mx-2">Logout</span></a></li>
            </ul>

            <span id="sidebar-tail" class="position-absolute bottom-0 mx-2">
                Terms | Service
            </span>
        </section>