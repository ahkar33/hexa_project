
document.querySelectorAll("#news-content").forEach(news => {
    let origin = news.textContent;

    news.textContent = origin.substring(0,150) + "...";
})