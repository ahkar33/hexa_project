//custom js
$(document).ready(() => {
    $("#btn-menu").click(handleShowMenu);
    $("#navbar-nav").click(handleCloseMenu);
    $("#menu-layer").click(handleCloseMenu);
});

//handling for menu button
const handleShowMenu = function(e){
    $("#navbar-nav")[0].classList.add("show");
    $("#menu-layer")[0].classList.add("active");
}

const handleCloseMenu = function(e){
    $("#navbar-nav")[0].classList.remove("show");
    $("#menu-layer")[0].classList.remove("active");
}