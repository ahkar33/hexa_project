const banBtns = document.querySelectorAll("#ban");
const unbanBtns = document.querySelectorAll("#unban");

if(banBtns != null){
    banBtns.forEach( btn => {
        btn.addEventListener('click' , e => {
            
            doConfirm( 'ban this user?' , `../../hexa/admin/status/${btn.getAttribute('data-target')}` );
        })
    });
}

if( unbanBtns != null ){
    unbanBtns.forEach( btn => {
        btn.addEventListener('click' , e => {
            doConfirm( 'unban this user?' , `../../hexa/admin/status/${btn.getAttribute('data-target')}` );
        })
    })
}