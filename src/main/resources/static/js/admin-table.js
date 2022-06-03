

$(document).ready(() => {
    $("#table").DataTable();
    $("#table_info").css("display","none");
    $("#table_length").css("transform","translateX(50%)");
    $("#table_filter").css("transform","translateX(-50%)");
    $("#table_paginate").css("transform","translateX(-50%)");
})