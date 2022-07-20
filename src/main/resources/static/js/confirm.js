
const doConfirm = ( msg , goTo ) => {
    console.log("do")
   swal({
    text : `Are you sure to ${msg}?`,
    icon : 'warning',
    buttons : ['No','Yes']
   }).then( yes => {

    if(yes) window.location.href = goTo;

   });
}