const dates = document.querySelectorAll(".created-date");

dates.forEach(d => {
    let date = d.textContent;
    d.textContent= getPeriod(date,'yy-mm-dd');
})