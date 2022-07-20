const newsDelBtns = document.querySelectorAll("#news-del-btn");
const categoryDelBtns = document.querySelectorAll("#category-del-btn");
const commentDelBtns = document.querySelectorAll("#comment-del-btn");

if( newsDelBtns != null){
    newsDelBtns.forEach( btn => {
        btn.addEventListener("click" , e => {
            let data = btn.getAttribute('data-target').split(",")
           doConfirm('delete this news ? ' , `../admin/delete_news/${data[0]}/${data[1]}`);
        })
    });
}

if( categoryDelBtns != null ){
    categoryDelBtns.forEach( btn => {
        btn.addEventListener("click"  , e => {
            doConfirm('delete this category ? ' , `../admin/deleteCategory/${btn.getAttribute('data-target')}`);
        });
    })
}

if( commentDelBtns != null ){
    commentDelBtns.forEach( btn => {
        btn.addEventListener( "click" , e => {
            doConfirm('delete this comment ? ' , `../../admin/delete/${btn.getAttribute('data-target')}`);
        })
    } )
}