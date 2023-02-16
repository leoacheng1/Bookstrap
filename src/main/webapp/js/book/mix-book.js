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

//////  詳細資料鍵  //////
const detailBtn = document.getElementsByClassName('detail-btn');
console.log(detailBtn.length)
for( i=0 ; i<=detailBtn.length ;  i++){
  detailBtn[i].addEventListener('click',function(e){
    let bkID = this.getAttribute('data-bkid');
    console.log(bkID)
    getDetails(bkID);
  })
}
function getDetails(bkID){
  axios({
      url:'http://localhost:8080/Bookstrap/books/alldetails',
      method:'get',
      responseType:'text',
      params:{
          id:bkID
      }
  })
  .then(res=>{
      console.log(res.data)
      // htmlMaker(res.data)
  })
  .catch(err=>{
      console.log(err)
  })
}
function htmlMaker(data){
  console.log(data.data)
    // let table = document.createElement('table')
    // let thead = document.createElement('thead')
    // let tr = document.createElement('tr')
    // let th = document.createElement('th')
    // table.innerHTML = "<table>"
    // thead.innerHTML = "<thead>"
    // tr.innerHTML = "<tr>"
    // th.innerHTML = "<th>尺寸<th>"
    // th.innerHTML = "<th>頁數<th>"
    // th.innerHTML = "<th>簡介<th>"
    // th.innerHTML = "<th>分級<th>"
    // tr.innerHTML = "</tr>"
    // thead.innerHTML = "</thead>"
    // data.forEach((element,index)=> {
    //     let tbody = document.createElement('tbody')
    //     let td = document.createElement('td')
    //     div.innerHTML += "<div> id: "+element.id+"</div>"
    //     div.innerHTML += "<div> 名字: "+element.name+"</div>"
    //     div.innerHTML += "<div> 會員等級: "+element.level+"</div>"
    //     output.append(div)
    // });
    // table.innerHTML = "</table>"
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
