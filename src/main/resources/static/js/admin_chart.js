const months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
var datas = [];
var year = new Date().getFullYear();//present year will be default for fetching , meant to be dynamic 
var newsChart;

window.addEventListener('afterprint',() => {
    newsChart.resize();
})

$(document).ready( () => {

    /*
        year is to fetch with that value
        eg. to show datas for 2020 ,year will be 2020
    */
   renderChart(year);

    $("#year-btns").html(getYearBtns(year));


    $(".year-btn").each( (index,btn) => {
        btn.addEventListener("click",() => {
            let target = btn.textContent;
            setActiveYearBtn(target);
            newsChart.destroy();
            renderChart(target);
        })
    })

});

//target stands for year target
function renderChart( target ){
    fetch(`http://localhost:8080/hexa/api/news/years?y=${target}`)
    .then( res => res.json())
    .then( news => {
        datas = getNewsCounts( news , target );

       newsChart = new Chart(
            document.getElementById("newsPerMonthChart"),
            {
                type : 'line',
                data : {
                    labels : months,
                    datasets : [
                        {   label : "News Count Per Month's Datas",
                            backgroundColor: 'rgba(245, 197, 125,1)',
                            borderColor: 'rgba(0,0,0,0.55)',
                            data : datas,
                        }
                    ]
                }
            }
        );
    });
}

function getNewsCounts( datas = [] , year ){
    let results = [];
    let news = [];
    //m stands for month
    for( let m = 1 ; m <= 12 ; m++ ){
        let search = '';
        search += `${year}-`
        search += m < 10 ? `0${m}` : m ; 
        news = datas.filter( d => {
            return d.created_date.includes(search);
        });
        results.push(news.length);
    }

    results.push(Math.max(...results) + 20);//to take y-axis more amount than maximum in array

    return results;
}

/*
    to get btns for control chart, 
    e.g if now is 2022, we will able to see for last  two years
*/
function getYearBtns( now ){
    let html = "";

    for(let cur = now - 2 ; cur <= now ; cur++){
        let isActive = cur == now ? "active" : "";

        html += `
             <button id="year-btn" class="year-btn btn btn-sm fw-bold ${isActive}">${cur}</button>
             `
    }
   return html;
}

function setActiveYearBtn( target ){
    $('.year-btn').each( (index,btn) => {
        btn.textContent == target ? btn.classList.add("active") : btn.classList.remove("active");
    })
}

