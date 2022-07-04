var newsList = [];
var max = 6;//mean 5 news per one page

$(document).ready(() => {

    fetch("http://localhost:8080/hexa/api/news")
    .then(res => res.json())
    .then(data => {
        newsList = data;

        let container = $("#news-wrapper");
        let pagination = $("#pagination");
        let page = localStorage.getItem("curPage") == null ? 1 : localStorage.getItem("curPage");
        let totalPage = Math.ceil(newsList.length/max);


        container.html(getHTML(newsList,page));
        pagination.html(getBtns(newsList));

        let btns = $(".page-link");
        for(let btn of btns){
           btn.addEventListener("click",(e) => {
                let pg = Number(e.target.innerText);
                page = pg;
                localStorage.setItem("curPage",page);
                container.html(getHTML(newsList,page));
                showCurrentPage(page);
           });
        }

        $("#prev").click((e) => {
            page = getPrevPage(page,totalPage);
            container.html(getHTML(newsList,page));
            showCurrentPage(page);
        });

        $("#next").click((e) => {
           page = getNextPage(page,totalPage);
           container.html(getHTML(newsList,page));
           showCurrentPage(page);
        })

        showCurrentPage(page);
    });
});


//(array,number,node)
function getHTML(datas,pageFrom){

    let start = (Number(pageFrom) - 1) * max;
    let end = start + max;

    let html = '';//result

    for(let i = start ; i < end ; i++){
        if(datas[i] == null) break;
        html += `
        <div class="new-box my-3 col-xl-3 col-lg-4 col-sm-10 text-light fw-bold" id="news" style="height:200px !important;">
            <a href="/hexa/details/${datas[i].news_id}"> <img
                src="/img/${datas[i].news_img}" class="new-img" alt="image" />
                <div class="new-layer">
                    <span class="new-title text-capitalize"> ${datas[i].news_name} </span> <span
                        class="new-location text-dark text-capitalize">|${datas[i].news_location}</span>
                </div>
            </a>
         </div>
        `;
    }

    return html;
}

function getBtns(datas){

    let totalPage = Math.ceil(datas.length/max);
    let html = '<li class="page-item"><span class="btn btn-primary" id="prev"><i class="fa-solid fa-angles-left"></i></span></li>';

    for(let i = 1 ; i <= totalPage ; i++){
        html += ` <li class="page-item"><span class="page-link">${i}</span></li>`
    }

    html += `<li class="page-item"><span class="btn btn-primary" id="next"><i class="fa-solid fa-angles-right"></i></span></li>`;

    return html;
}

function getPrevPage(now,total){
    let page = Number(now);
    let result ;

    page <= 1 ? result = Number(total) : result = page - 1 ;
    localStorage.setItem("curpage",result);
    return result;
}

function getNextPage(now,total){
    let page = Number(now);
    let result;

    page >= Number(total) ? result = 1 : result = page + 1;
    localStorage.setItem("curpage",result);
    return result;
}

function showCurrentPage(now){
   for(let link of $(".page-link")){
      if(link.textContent == now){
        link.classList.add("fw-bold");
      }else{
        link.classList.remove("fw-bold");
      }
    }   
}