/////// delete鍵 //////
const deleteBtn = document.getElementsByClassName('delete-btn');

for (let i = 0; i < deleteBtn.length; i++) {
  deleteBtn[i].addEventListener('click', function (e) {
    let bkID = this.getAttribute('data-bkid');
    console.log(bkID)
    //delete ajax
    sendDeleteAjax(bkID)
  })
}

function sendDeleteAjax(bkID) {
  axios({
    url: "http://localhost:8080/Bookstrap/books/delete",
    method: 'delete',
    responseType: 'text',
    params: {
      id: bkID
    }
  })
    .then(res => {
      console.log(res.data)
    })
    .catch(err => {
      console.log(err)
      window.location.href = 'http://localhost:8080/Bookstrap/books/page';
    })
}


//////////////  詳細資料鍵  /////////////////
const detailBtn = document.getElementsByClassName('detail-btn');
console.log(detailBtn.length)
for( i=0 ; i<=detailBtn.length ;  i++){
  detailBtn[i].addEventListener('click',(function(e){
    let bkID = this.getAttribute('data-bkid');
    console.log(bkID)
    getDetails(bkID);
  }))
}

function getDetails(bkID){
  axios({
      url:'http://localhost:8080/Bookstrap/books/alldetails',
      method:'get',
      params:{
          id:bkID
      }
  })
  .then(res=>{
      // console.log(res)
      htmlMaker(res)
  })
  .catch(err=>{
      console.log(err)
  })
}

function htmlMaker(data){
  let bookmsg=""
  bookmsg='<tr>'
 +' <td colspan="2" id="sizeInput">尺寸</td>'
 +' <td colspan="2" id="pagesInput">頁數</td>'
 +' <td colspan="5" id="introInput">簡介</td>'
 +' <td colspan="2" id="gradeInput">分級</td>'
//  +' <td colspan="2" id="crossInput"><button type="button" data-btnId="'+data.data.id+'" class="btn-close clearBtn'+data.data.id+'" aria-label="Close"></button></td>'
 +' <td colspan="2" id="crossInput"><button data-btnId="'+data.data.id+'" class="clearBtn'+data.data.id+'"><img style="width:10px;height:10px" src="../book/cross.png"></button></td>'
 +' </tr>'
 +' <tr>'
 +' <td colspan="2" id="size">'+data.data.size+'</td>'
 +' <td colspan="2" id="pages">'+data.data.pages+'</td>'
 +' <td colspan="5" id="intro">'+data.data.intro+'</td>'
 +' <td colspan="2" id="grade">'+data.data.grade+'</td>'
 +' <td colspan="2" id="clear"></td>'
 +' </tr>'

 
 /////// 跑出詳細資料  ///////
  let detail =document.querySelector(`[body-bkid='${data.data.id}']`)
  detail.innerHTML=bookmsg
  
  ////////  叉叉按鈕  ///////
  const clearBtn = document.getElementsByClassName("clearBtn"+data.data.id);
  
    clearBtn[0].addEventListener('click',function(e){
    console.log("OK")
    let bkID = this.getAttribute('data-btnId');
    console.log(bkID)
    let cancel =document.querySelector(`[body-bkid='${data.data.id}']`)
    console.log(cancel)
    cancel.innerHTML=""

    console.log("okok")
  })
}


