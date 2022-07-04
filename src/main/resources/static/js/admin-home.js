

const counts = document.querySelectorAll("#count");
const date = new Date();


$(document).ready(() => {

    $("#year").html(date.getFullYear());
    $("#day-name").html(getDayName(date.getDay()));
    $("#day").html(date.getDate());

    
    if(!localStorage.getItem("countDone") || localStorage.getItem("countDone") == null){
        counts.forEach(count => {
            let realVal = Number(count.textContent);//real value
            let start = 0;
            count.textContent = start;
        
            const counter = setInterval(() => {
                let currentVal = Number(count.textContent);
                currentVal += 1 ;
                if(currentVal == realVal) clearInterval(counter)
                count.textContent = currentVal;
            },10);
            
        })    
    }
    localStorage.setItem("countDone",true);
})

function getDayName(day){
    let result = "";
    switch(day){
        case 0 : result = "Sunday";break;
        case 1 : result = "Monday";break;
        case 2 : result = "Tuesday";break;
        case 3 : result = "Wednesday";break;
        case 4 : result = "Thursday";break;
        case 5 : result = "Friday";break;
        case 6 : result = "Saturday";break;
        default : result = "error";
    }
    return result;
}