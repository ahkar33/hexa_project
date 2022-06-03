
const newsBoxes = document.querySelectorAll("#news");

newsBoxes.forEach(box => {
    box.addEventListener("click",() => {
        //will get id from box element and go to detail page with get method
        window.location.href = "./detail.html";
    })
})