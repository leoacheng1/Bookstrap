


let watchListBtn = document.getElementById('addToWatchlistButton');



watchListBtn.addEventListener('click', function(){
    
   
  
   addToWatchlist()
})

function addToWatchlist(eBookId1){
    let memberId1 = document.getElementById('memberId');
    let eBookId1 = document.getElementById('eBookId');

    console.log('=============')
    console.log(memberId1.value)
    console.log(eBookId1.value)
     let formdata = new FormData();
    formdata.append("eBookId",eBookId1.value);
    formdata.append(" memberId",memberId1.value);
    let requestUrl = 'http://localhost:8080/Bookstrap/favorite/ebook/checkfavority';
    axios.post(requestUrl, 
        formdata

    )
    .then(res => {
        
        if (res.data.response == 'Y') {
            watchListBtn.classList.add("btn");
            watchListBtn.classList.add("btn-sm");
            watchListBtn.classList.add("btn-outline-secondary");
                
                
        }else {
            watchListBtn.classList.remove("btn");
            watchListBtn.classList.remove("btn-sm");
            watchListBtn.classList.remove("btn-outline-secondary");
            
            
        }
    })
    .catch(err => {
        console.error(err);
    })}

    