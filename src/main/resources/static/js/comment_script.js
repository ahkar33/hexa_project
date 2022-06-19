const commentContainer = $("#comments");
const  route = window.location.href.split("/");
const userName = $("#user-name").html();
const commentForm = $("#comment-form");
var status = "See More";
var comments = [];//to control see more or see less

window.onload = () => {
    let newsId = route[route.length -1];
    getComments(newsId);
    $("#btn-view").html(status);
}

$(document).ready(() => {
    commentForm.on("submit", handleComment);

    $("#btn-view").click(() => {
       if(status == "See More" && comments.length > 2){
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

        comments = data;

        data.length  <= 2 ? $("#btn-view").hide() : $("#btn-view").show();

        let html = ``;
        for(let i = 0 ; i < data.length ; i++){
    
            let extraHTML = '';
            let hide = "";

            if(i > 1  && $("#btn-view").html() != "See Less" )   hide = "hide" ; 

            if($("#user-id").html() == data[i].user_id){
                extraHTML = `
                    <div class="dropdown" id="dropdown-${data[i].comment_id}">
                        <span id="cmt-control" data-bs-toggle="dropdown" data-bs-target="#dropdown-${data[i].comment_id}"><i class="fa-solid fa-ellipsis-vertical"></i></span>
                        <div class="dropdown-menu p-0 m-0 w-25">
                            <a class="dropdown-item w-100  text-decoration-none text-dark m-0 btn-edit"  data-bs-toggle="modal" data-bs-target="#modal-${data[i].comment_id}">Edit</a>
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
						<form  class="modal-body form p-3" data-target="${data[i].comment_id}" >
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
        </div>`;
        }

        renderComments(html);

    })
}

function renderComments(html){
    commentContainer.html(html);

    //catched event  from here  cuz dom isn't rdy for other states
    document.querySelectorAll("#comments form").forEach(form => {
        form.addEventListener("submit",(e) => {
            handleCommentEdit(e);

            //finding equal id modal with data-target attr val from form
            $(`#comments #modal-${e.target.dataset.target}`).modal("hide");
        })
    });
    
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
                if(xhr.responseText == "Success"){
                    getComments(news_id);
                }
            }
        }
        xhr.send(params);
    
        $("#comment").val("");
    }
}

function handleCommentEdit(e){
    
    e.preventDefault();
    
    let newsId = route[route.length -1];
    let cmtId = e.srcElement[1].value;
    
    let xhr = new XMLHttpRequest();
    xhr.open("PUT",`http://localhost:8080/hexa/api/news/${newsId}/comments/${cmtId}`,true);

    xhr.setRequestHeader("Content-type","application/json");

    xhr.onload = () => {
        if(xhr.status == 200){
            if(xhr.responseText == "Success"){
                console.log("h")
                getComments(newsId)
            }
        }
    }

    xhr.send(JSON.stringify({"comments" : e.srcElement[0].value , "comment_id" : cmtId}));

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