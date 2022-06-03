
const btns = document.querySelectorAll("#btn-ban");

btns.forEach(btn => {
    btn.addEventListener("click" , () => {
       confirm(`Are you sure to ${btn.textContent}?`);

       //with backend
    //    if(confirm(`Are you sure to ${btn.textContent}?`)){
    //        window.location.href("/url");
    //    }
    })
})