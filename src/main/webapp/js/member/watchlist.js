


let watchListBtn = document.getElementsByClassName('addToWatchlistButton');
for (btn of watchListBtn) {
    btn.addEventListener('click', addToWatchlist);
}


function addToWatchlist(event){
    event.preventDefault();
    let memberId1 = $(this).parent("div.btn-group").attr("data-memberid");
    let eBookId1 = $(this).parent("div.btn-group").attr("data-ebookid");

    console.log('=============')
    console.log(memberId1)
    console.log(eBookId1)

    let formdata = new FormData();
    formdata.append("eBookId",eBookId1);
    formdata.append("memberId",memberId1);

    let requestUrl = 'http://localhost:8080/Bookstrap/favorite/ebook/add';
    axios.post(requestUrl, 
        formdata

    )
    .then(res => {
        console.log(res);
        if (res.data == 'Y') {
            // this.classList.add("btn");
            // this.classList.add("btn-sm");
            this.classList.remove("btn-outline-secondary");
            this.classList.add("btn-danger");
            this.innerHTML = "移除追蹤"
                
                
        }else {
            // this.classList.remove("btn");
            // this.classList.remove("btn-sm");
            this.classList.add("btn-outline-secondary");
            this.classList.remove("btn-danger");
            this.innerHTML = "追蹤商品"    
            
        }
    })
    .catch(err => {
        console.log(err);
    })}

    