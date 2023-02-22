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
 +' <td colspan="2" id="crossInput"><button type="button" class="btn-close" aria-label="Close"></button></td>'
//  +' <td colspan="2" id="crossInput"><buttom><img style="width:15px;height:15px" src="../book/cross.png"></button></td>'
 +' </tr>'
 +' <tr>'
 +' <td colspan="2" id="size">'+data.data.size+'</td>'
 +' <td colspan="2" id="pages">'+data.data.pages+'</td>'
 +' <td colspan="5" id="intro">'+data.data.intro+'</td>'
 +' <td colspan="2" id="grade">'+data.data.grade+'</td>'
 +' <td colspan="2" id="clear"></td>'
 +' </tr>'

  let cancel =document.querySelector(`[body-bkid='${data.data.id}']`)
  cancel.innerHTML=bookmsg
  
  const clearBtn = document.getElementById('crossInput');
  clearBtn.addEventListener('click',function(e){
    console.log("crossInput get")
  cancel.innerHTML=""
  
  })
}


/////  所有書籍鍵  ////
// const output = document.getElementById('output');
// const showAllBooks = document.getElementById('showAllBooks')

// showAllBooks.addEventListener('click',function(e) {
//   console.log("OKOK")
//   axios({
//     url: 'http://localhost:8080/Bookstrap/books/page',
//     method: 'get',
//   })
//     .then(res => {
//       console.log(res)
//       console.log("yes")
//       htmlMaker(res)
//     })
//     .catch(err => {
//       console.log('err1:' + err)
//     })
// })

// function htmlMaker(data) {
//   console.log(data)
//   bk_data = '<table class="text-center" style="width:1200px">'
//     + '<thead>'
//     + '<tr>'
//     + '<th>書名</th>'
//     + '<th>作者</th>'
//     + '<th>譯者</th>'
//     + '<th>語言</th>'
//     + '<th>類別</th>'
//     + '<th>出版社</th>'
//     + '<th>出版日期</th>'
//     + '<th>封面圖片</th>'
//     + '<th>折扣</th>'
//     + '<th>定價</th>'
//     + '<th>詳細資料</th>'
//     + '<th>更新</th>'
//     + '<th>刪除</th>'
//     + '</tr>'
//     + '</thead>'
//     + '<tbody>'
//     data.content.forEach(element => {
//     bk_data += '<tr>'
//     bk_data += '<td>' + element.name + '</td>'
//     bk_data += '<td>' + element.author + '</td>'
//     bk_data += '<td>' + element.translator + '</td>'
//     bk_data += '<td>' + element.languages + '</td>'
//     bk_data += '<td>' + element.category + '</td>'
//     bk_data += '<td>' + element.publisher + '</td>'
//     bk_data += '<td>' + element.date + '</td>'
//     bk_data += '<td><img style="width:100px;height:120px" src="${contextRoot}/books/id?id=' + element.id + '"/></td>'
//     bk_data += '<td>' + element.discount + '</td>'
//     bk_data += '<td>' + element.price + '</td>'
//     bk_data += '<td><button class="detail-btn btn btn-info" data-bkid=' + element.id + '>詳細資料</button></td>'
//     bk_data += '<td><button class="edit-btn btn btn-primary" data-bkid=' + element.id + '>更新</button></td> '
//     bk_data += '<td><button class="delete-btn btn btn-danger"  data-bkid=' + element.id + '>刪除</button></td>'
//     bk_data += '</tr>'
//   })
//   bk_data += '</tbody></table>';
//   console.log('data.totalPages', totalPages)

//   let totalPages = data.data.totalPages;
//   for (let i = 1; i <= totalPages; i++) {
//     bk_data += '<button class="pageBtn" data-page="' + i + '">' + i + '</button>'
//   }
//   output.innerHTML = bk_data;
//     let buttonsArray = document.getElementsByClassName('pageBtn');
//     console.log('buttonsArray',buttonsArray);

//     for(i=0;i<=buttonsArray.length;i++){
//       buttonsArray[i].addEventListener('click',function(e){
//         let pageNumber = this.getAttribute('data-page');
//         console.log('pageNumber:'+pageNumber)
//         // loadThatPage(pageNumber);
//       })
//    }
  
// }

// function loadThatPage(pageNumber) {
//   axios({
//     url: 'http://localhost:8080/Bookstrap/books/page',
//     method: 'get',
//     params: {
//       p: pageNumber
//     }
//   })
//     .then(res => {
//       console.log(res.data)
//       htmlMaker(res.data)
//     })
//     .catch(err => {
//       console.log('err2:' + err)
//     })
// }

////////// 更新資料鍵  ////////////
// const editBtn = document.getElementsByClassName('edit-btn')
 
//  for(let i=1;i<editBtn.length;i++){
//     editBtn[i].addEventListener('click',function(e){
//       console.log("OK")
//       let bkID = this.getAttribute('data-bkid');
//       editBook(bkID)
//     })
//  }
