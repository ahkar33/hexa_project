const roleChangeBtns = document.querySelectorAll('#role-ch-btn');

roleChangeBtns.forEach( btn => {
    btn.addEventListener("click" , e => {
        let data = btn.getAttribute("data-target").split(",");

       doConfirm( 'change role for this user?' , `../admin/role/${data[0]}/${data[1]}`);
    })
})