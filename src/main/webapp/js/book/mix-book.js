/////// delete鍵 //////
const deleteBtn = document.getElementsByClassName('delete-btn');

for (let i = 0; i < deleteBtn.length; i++) {
  deleteBtn[i].addEventListener('click', function (e) {
    let bkID = this.getAttribute('data-bkid');
    console.log(bkID)

    swal({
      title: "確定要刪除此筆資料?",
      icon: "warning",
      buttons: {
        Btn: false,
        cancel: {
          text: "取消",
          visible: true
        },
        danger: {
          text: "確認",
          visible: true
        }
      }
    }).then((willDelete) => {
      if (willDelete) {
        //delete ajax
        sendDeleteAjax(bkID);
      }
    });
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
      // console.log(res.data)
      htmlMaker(res)
  })
  .catch(err=>{
      console.log(err)
  })
}

function htmlMaker(data){
  let bookmsg=""
  bookmsg='<tr>'
 +' <td colspan="2" id="sizeInput" style="font-weight:bold;background-color:#DCDCDC;height: 50px;"">尺寸</td>'
 +' <td colspan="2" id="pagesInput" style="font-weight:bold;background-color:#DCDCDC;height: 50px;"">頁數</td>'
 +' <td colspan="7" id="introInput" style="font-weight:bold;background-color:#DCDCDC;height: 50px;"">簡介</td>'
 +' <td colspan="2" id="gradeInput" style="font-weight:bold;background-color:#DCDCDC;height: 50px;"">分級</td>'
//  +' <td colspan="2" id="crossInput" style="font-weight:bold;background-color:#DCDCDC;"><button data-btnId="'+data.data.id+'" class="clearBtn'+data.data.id+'"><img style="width:10px;height:10px" src="../book/cross.png"></button></td>'
 +' <td colspan="2" id="crossInput" style="font-weight:bold;background-color:#DCDCDC;height: 50px;"">'
 +' <button type="button" data-btnId="'+data.data.id+'" class="btn-close clearBtn'+data.data.id+'" aria-label="Close" ></button>'
 +' </td>'
 +' </tr>'
 +' <tr>'
 +' <td colspan="2" id="size">'+data.data.size+'</td>'
 +' <td colspan="2" id="pages">'+data.data.pages+'</td>'
 +' <td colspan="7" id="intro" class="text-center" style="text-align: center;height:100px;">'+data.data.intro+'</td>'
 +' <td colspan="2" id="grade">'+data.data.grade+'</td>'
 +' <td colspan="1" id="clear"></td>'
 +' <td></td>'
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


