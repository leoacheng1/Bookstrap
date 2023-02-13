const deleteBtn = document.getElementsByClassName('delete-btn');

for(i=0;i<deleteBtn.length;i++){
    deleteBtn[i].addEventListener('click',function(e){
      let bkID = this.getAttribute('data-bkid');
      console.log(bkID)
      //delete ajax
      sendDeleteAjax(bkID)
    })
}

function sendDeleteAjax(bkID){
    axios({
        url: "http://localhost:8080/bookstrap/books/delete",
        method:'delete',
        responseType:'text',
        params:{
            id:bkID
        }
    })
    .then(res=>{
        console.log(res.data)
    })
    .catch(err=>{
        console.log(err)
        window.location.href='http://localhost:8080/bookstrap/books/all';
    })
}