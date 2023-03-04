

// axios({
//   method:'get',
//   url:'http://localhost:8080/Bookstrap/books/allpage'
// })
// .then(res=>{
//   console.log(res.data)
//   allHtmlMaker(res)
// })
// .catch(err=>{
// console.log(err)
// })

// function allHtmlMaker(res){
//   const con = document.getElementById('console')
//   let daaata=""
//   con.innerHTML=""
//   res.data.content.forEach(element=>{
//     console.log(element.name )
//     daaata+=`<div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:10px">`
//   +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
//     <img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" class="card-img-top" 
//     style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>`
//   +`<div class="card-body">`
//   +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`"><h6 class="card-title">`+element.name+`</h6></a>`
//   +`<p class="card-text" style="margin-bottom: 3px;">語言：`+element.languages+`書</p>`
//   +`<p class="card-text" style="margin-bottom: 3px;">作者：`+element.author+`</p>`
//   +`<p class="card-text" style="margin-bottom: 3px;">售價：`+element.price+`元</p>`
//   +`<p class="card-text" style="margin-bottom: 3px;">優惠價：`+element.discount+`折</p>`
//   +`<a href="#" class="btn btn-primary">加入購物車</a>`
//   +`</div>`
//   +`</div>`

//   }); 

//   let totalPages = res.data.totalPages;
//   console.log(totalPages)
//   for (let i = 1; i <= totalPages; i++) {
//     daaata += '<button class="pageBtn btn btn-outline-info" style="position: absolute;bottom: 0;" id="pageButton" data-page="' + i + '">' + i + '</button>'
//   }
//   con.innerHTML=daaata    


//   let buttonsArray = document.getElementsByClassName('pageBtn');
//   for (i = 0; i <= buttonsArray.length; i++) {
//     buttonsArray[i].addEventListener('click', function (e) {

//       let pageNumber = this.getAttribute('data-page');

//       console.log('pageNumber:' + pageNumber)
//       loadThatPage(pageNumber)
//     })
   
//   }
//   function loadThatPage(pageNumber) {

//     axios({
//       url: 'http://localhost:8080/Bookstrap/books/allpage',
//       method: 'get',
//       params: {
//         p: pageNumber
//       }
//     })
//       .then(res => {
//         console.log(res)
//         allHtmlMaker(res)
//       })
//       .catch(err => {
//         console.log(err)
//       })
//   }


// }
  
////////  多條件搜尋  ////////
var submitBtn = document.getElementById('submitBtnnnn')
submitBtn.addEventListener('click',function(e){
 console.log("OKOK")
 let selectorL = ""
 let selectorC = ""
// if(document.getElementById("allL").checked == true){
   
//  }
if(document.getElementById("chinese").checked == true){
  selectorL+=" ,中文 "
}
if(document.getElementById("foreign").checked == true){
  selectorL+=" ,外文 "
}
// if(document.getElementById("allC").checked == true){
   
// }
if(document.getElementById("philosophy").checked == true){
  selectorC+=" ,哲學"
}
if(document.getElementById("religion").checked == true){
  selectorC+=" ,宗教 "
}
if(document.getElementById("science").checked == true){
  selectorC+=" ,科學 "
}
if(document.getElementById("appliedScience").checked == true){
  selectorC+=" ,應用科學 "
}
if(document.getElementById("socialScience").checked == true){
  selectorC+=" ,社會科學 "
}
if(document.getElementById("history").checked == true){
  selectorC+=" ,歷史 "
}
if(document.getElementById("geography").checked == true){
  selectorC+=" ,地理 "
}
if(document.getElementById("foreignLan").checked == true){
  selectorC+=" ,語言文學 "
}
if(document.getElementById("Art").checked == true){
  selectorC+=" ,藝術 "
}
if(document.getElementById("other").checked == true){
  selectorC+=" ,其他 "
}
console.log("selectorL:"+selectorL)
console.log("selectorC:"+selectorC)
const str1 = selectorL.substring(2,selectorL.length)
const str2 = selectorC.substring(2,selectorC.length)
console.log("str1:"+str1)
console.log("str2:"+str2)
getbook(str1,str2);
})

function getbook(str1,str2){
axios({
  url: "http://localhost:8080/Bookstrap/books/getbook",
  method:'get',
  params:{
    languages:str1,
    category:str2
}
})
.then(res=>{
  console.log("res:"+res.data)
  htmlmaker(res.data)
})
.catch(err=>{
  console.log("跳頁失敗")
})
}

function htmlmaker(data){
  const con = document.getElementById('console')
  con.innerHTML=""
  let daaaata=""
    data.forEach(element => {
console.log(element.name )
    daaaata+=`<div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:10px">`
  +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
    <img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" class="card-img-top" 
    style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>`
  +`<div class="card-body">`
  +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`"><h6 class="card-title">`+element.name+`</h6></a>`
  +`<p class="card-text" style="margin-bottom: 3px;">語言：`+element.languages+`書</p>`
  +`<p class="card-text" style="margin-bottom: 3px;">作者：`+element.author+`</p>`
  +`<p class="card-text" style="margin-bottom: 3px;">售價：`+element.price+`元</p>`
  +`<p class="card-text" style="margin-bottom: 3px;">優惠價：`+element.discount+`折</p>`
  +`<a href="#" class="btn btn-primary">加入購物車</a>`
  +`</div>`
  +`</div>`
  }); 
  con.innerHTML=daaaata
}

//////////  模糊搜尋  ///////////
// var sendOutBtn = document.querySelector(`[data-btnid="sendOutBtn"]`)
// sendOutBtn.addEventListener('click',function(e){
//   console.log("有抓到")
//   let searchField = ""
//   let searchArea = document.querySelector(`[data-search="searchArea"]`).value
//   if(searchArea != null){
//     searchField += searchArea
//   }
//   console.log("searchField:"+searchField)
//   likebook(searchField)
// })


// function likebook(searchField){
//   axios({
//     url:"http://localhost:8080/Bookstrap/books/like",
//     method:'get',
//     params:{
//       name:searchField
//     }
//   })
//   .then(res=>{
//     console.log("好耶")
//     console.log("res:"+res.data)
//     // window.location.href = 'http://localhost:8080/Bookstrap/books/search';
    
//   }).then(res=>{
//     htmlmaker(res.data)
//   })
//   .catch(err=>{
//     console.log("哭阿")
//   })
// }

