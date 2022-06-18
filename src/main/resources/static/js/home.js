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
    $("#btn-menu").css({"transform" : "translateX(-100%)"});
}

const handleCloseMenu = function(e){
    $("#navbar-nav")[0].classList.remove("show");
    $("#menu-layer")[0].classList.remove("active");
    $("#btn-menu").css({"transform" : "translateX(600%)"});
}