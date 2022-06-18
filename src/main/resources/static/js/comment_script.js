const commentContainer = $("#comments");
const  route = window.location.href.split("/");
const userName = $("#user-name").html();
const commentForm = $("#comment-form");
var status = "See More";

window.onload = () => {
    let newsId = route[route.length -1];
    getComments(newsId);
    $("#btn-view").html(status);
}

$(document).ready(() => {
    commentForm.on("submit", handleComment);

    $("#btn-view").click(() => {
       if(status == "See More"){
        $("#comments #comment").each((idx,e) => {
            e.classList.remove("hide");
        });
        status = "See Less";
        $("#btn-view").html(status);
       }else{
        $("#comments #comment").each((idx,e) => {
            if(idx > 1){
                e.classList.add("hide");
            }
        })
        status = "See More";
        $("#btn-view").html(status);
       }
    });
});

function getComments(newsId){
    fetch(`http://localhost:8080/hexa/api/news/${newsId}/comments`)
    .then(res => res.json())
    .then(data => {
        let html = ``;
        for(let i = 0 ; i < data.length ; i++){
    
            let extraHTML = '';
            let hide = "";

            if(i > 1) hide = "hide";

            if(userName == data[i].user_name){
                extraHTML = `
                    <div class="dropdown" id="dropdown-${data[i].comment_id}">
                        <span id="cmt-control" data-bs-toggle="dropdown" data-bs-target="#dropdown-${data[i].comment_id}"><i class="fa-solid fa-ellipsis-vertical"></i></span>
                        <div class="dropdown-menu p-0 m-0 w-25">
                            <a class="dropdown-item w-100  text-decoration-none text-dark m-0" data-bs-toggle="modal" data-bs-target="#modal-${data[i].comment_id}">Edit</a>
                            <a class="dropdown-item w-100 text-decoration-none text-dark m-0" onclick="handleCommentDelete(${data[i].comment_id})">Delete</a>
                        </div>
                    </div>`
            }
            html += `
            <div id="comment" class="my-2 cmt ${hide}">
                ${extraHTML}
                <div id="info" class="d-flex gap-2 align-items-center">
                    <div id="image">
                        <img src="/img/profile.png" alt="">
                    </div>
                    <div id="detail">
                        <div id="name" class="text-capitalize">${data[i].user_name}</div>
                        <div id="date">${data[i].commented_date}</div>
                    </div>
                </div>
                <div id="content">${data[i].comments}</div>
                <div class="modal fade" id="modal-${data[i].comment_id}">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content p-3">
						<header class="modal-header p-1">
							<div class="w-100 d-flex justify-content-center">
									<h3 class="h6">Edit Comment</h3>
									<a href="" class="btn-close" data-bs-dismiss="modal" data-bs-target="modal-${data[i].comment_id}" ></a>
							</div>
						</header>
						<form action="/hexa/editComment/${data[i].news_id}" class="modal-body form p-3" method="post">
										<div class="form-group my-1">
											<input type="text" name = "cmt" class="form-control" value="${data[i].comments}" placeholder="Comment">
											<input type="hidden" name = "cmt_id" class="form-control" value="${data[i].comment_id}">
										</div>
										<div class="form-group my-1 d-flex justify-content-end gap-1">
											<a class="btn btn-warning" data-bs-dismiss="modal" data-bs-target="#modal-${data[i].comment_id}">Cancel</a>
											<button type="submit" class="btn btn-success">Update</button>
										</div>
						</form>
					</div>
				</div>
		</div>
        </div>`
        }

        renderComments(html);

    })
}

function renderComments(html){
    commentContainer.html(html);
}

function handleComment(e){

    e.preventDefault();

    let xhr = new XMLHttpRequest();
    let news_id = route[route.length -1];


    let params = JSON.stringify({
        "news_id" : news_id,
        "user_id" : $("#user-id").html(),
        "comments" : $("#comment").val()
    });
    

    if(news_id != "" && $("#user-id") != "" && $("#comment").val() != ""){
        xhr.open("POST",`http://localhost:8080/hexa/api/news/${news_id}/addcomment`,true);
        xhr.setRequestHeader("Content-type","application/json");
    
        xhr.onload = () =>{
            if(xhr.status == 200){
                if(xhr.responseText == "Success") getComments(news_id);
            }
        }
        xhr.send(params);
    
        $("#comment").val("");
    }
}

function handleCommentEdit(){
    
    // event.preventDefault();

    console.log("hello")

    // let xhr = new XMLHttpRequest();

}

function handleCommentDelete(comment_id){
   let xhr = new XMLHttpRequest();
   let newsId = route[route.length -1];

   xhr.open("DELETE",`http://localhost:8080/hexa/api/news/newsId/comments/${comment_id}`,true);

   xhr.onload = () => {
    if(xhr.status == 200){
        if(xhr.responseText == "Success"){
            getComments(newsId);
        }
    }
   }

   xhr.send();
}