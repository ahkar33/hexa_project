const logoutBtn = document.querySelector("#logout");

if(logoutBtn != null ){
    logoutBtn.onclick = () => {
        localStorage.removeItem('curPage');
       
        doConfirm('logout','../../hexa/logout');
    }
}