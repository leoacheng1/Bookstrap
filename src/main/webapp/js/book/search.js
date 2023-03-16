////////  多條件搜尋  ////////
var submitBtn = document.getElementById('submitBtnnnn')
submitBtn.addEventListener('click',function(e){
 console.log("OKOK")
 let selectorL = ""
 let selectorC = ""
if(document.getElementById("chinese").checked == true){
  selectorL+=" ,中文 "
}
if(document.getElementById("foreign").checked == true){
  selectorL+=" ,外文 "
}

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
  const con = document.getElementById('console1')
  const con2 = document.getElementById('console2')
  con2.innerHTML=""
  con.innerHTML=""
  let daaaata=""
  data.forEach(element => {
    daaaata+=`<div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:57px;position: relative;">`
            +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
              <img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" class="card-img-top" 
              style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>`
            +`<div class="card-body">`
            +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
              <h5 class="card-title" style="text-align: center;">`+element.name+`</h5></a>`
            + `<div style="position: absolute;bottom: 25px;">`
            +`<p class="card-text" style="margin-bottom: 3px;">`+element.languages+`書</p>`
            +`<a id="selectAuthor" class="selectAuthor" data-auName="`+element.author+`" style="text-decoration: none;">
              <p class="card-text" style="margin-bottom: 3px;">`+element.author+`</p></a>`
            +`<p class="card-text" style="margin-bottom: 3px; display: none;">定價：
              <span class="priId" id="priId" class="book"><s>`+element.price+`</span>元</s></p>`
            +`<p class="card-text" style="margin-bottom: 3px;">優惠價：
              <strong class="disId" id="disId" style="color: red;font-size: large;">`+element.discount+`</strong>折,`
            +`<strong class="disPriId" id="disPriId" style="color: red;font-size: large;"></strong>元</p></p>`
            +`<a href="#" class="btn btn-primary">加入購物車</a>`
            +`</div>`
            +`</div>`
            +`</div>`
            }); 
  let pageBtn = `<div style="height: 13px; margin-right:30px;">
                 <nav aria-label="Page navigation example"><ul class="pagination justify-content-end">
                 <li class="page-item"><a class="page-link" href="#">1</a></li></ul></nav></div>`
  con2.innerHTML=pageBtn+daaaata

const selectAuthor = document.getElementsByClassName('selectAuthor')
  console.log(selectAuthor)
for(i=0;i<selectAuthor.length;i++){
  var author = selectAuthor[i].textContent
  console.log(author)  
  selectAuthor[i].addEventListener('click',function(e){
    let oneAuthor = this.getAttribute('data-auName')
    console.log('作家是'+oneAuthor)
    findAuthor(oneAuthor)
  })
}

//////// 定價*折扣=優惠價 ////////
const priId = document.getElementsByClassName('priId');//價錢
const disId = document.getElementsByClassName('disId');//折扣
const disPriId = document.getElementsByClassName('disPriId');//優惠價

for (let i = 0; i < priId.length; i++) {
let price = priId[i].textContent;
// console.log("price:"+price);

let discount = disId[i].textContent;
// console.log("discount:"+discount);

let disPrice = Math.round(price*(discount/100))
// console.log("優惠價:"+disPrice)

disPriId[i].textContent = disPrice;// 將計算結果寫回元素
}
}

//////////// 清除按鈕 ///////////////
const clearBtn = document.getElementById('clearBtnnn')
  
clearBtn.addEventListener('click',function(e){
  console.log("有抓到按鈕")
  document.getElementById("chinese").checked = false
  document.getElementById("foreign").checked = false
  document.getElementById("philosophy").checked = false
  document.getElementById("religion").checked = false
  document.getElementById("science").checked = false
  document.getElementById("appliedScience").checked = false
  document.getElementById("socialScience").checked = false
  document.getElementById("history").checked = false
  document.getElementById("geography").checked = false
  document.getElementById("foreignLan").checked = false
  document.getElementById("Art").checked = false
  document.getElementById("other").checked = false
  const con = document.getElementById('console1')
  const con2 = document.getElementById('console2')
  con2.innerHTML=""
  con.innerHTML=""
  axios({
    url:'http://localhost:8080/Bookstrap/books/api/page',
    method:'get',
    params:{
      pageNumber:1
    }
  })
  .then(res=>{
    console.log(res)
    htmlLike(res)
  })
  .catch(err=>{
    console.log(err)
  })
})

function htmlLike(res) {
  const con = document.getElementById('console1')
  const con2 = document.getElementById('console2')
  con.innerHTML = ""
  con2.innerHTML = ""
  let daaaata = ""
  let daaaata2 = ""
 
  res.data.content.forEach(element => {
    console.log(element.name)
    daaaata += `<div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:10px;position: relative;">`
      + `<a href="http://localhost:8080/Bookstrap/books/oneBook?id=` + element.id + `">
      <img src="http://localhost:8080/Bookstrap/books/id?id=`+ element.id + `" class="card-img-top" 
      style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>`
      + `<div class="card-body">`
      + `<a href="http://localhost:8080/Bookstrap/books/oneBook?id=` + element.id + `">
         <h5 class="card-title" style="text-align: center;">` + element.name + `</h5></a>`
      + `<div style="position: absolute;bottom: 25px;">`
      + `<p class="card-text" style="margin-bottom: 3px;">` + element.languages + `書</p>`
      + `<a id="selectAuthor" class="selectAuthor" data-auName="` + element.author + `" style="text-decoration: none;">
         <p class="card-text" style="margin-bottom: 3px;">` + element.author + `</p></a>`
      + `<p class="card-text" style="margin-bottom: 3px; display: none;">定價：
         <span class="priId" id="priId" class="book"><s>` + element.price + `</span>元</s></p>`
      + `<p class="card-text" style="margin-bottom: 3px;">優惠價：
         <strong class="disId" id="disId" style="color: red;font-size: large;">` + element.discount + `</strong>折,`
      + `<strong class="disPriId" id="disPriId" style="color: red;font-size: large;"></strong>元</p></p>`
      + `<a href="#" class="btn btn-primary">加入購物車</a>`
      + `</div>`
      + `</div>`
      + `</div>`
  });
  let totalPages = res.data.totalPages;
  console.log(totalPages)
  for (let i = 1; i <= totalPages; i++) {
    daaaata2 += '<li class="page-item"><a class="page-link likeBtn2" data-likeId="'+i+'" data-name="${sessionScope.name}" id="pageButton" data-page="' + i + '">' + i + '</a></li>'
  }
  let front ='<div style="height: 13px; margin-right:30px;"><nav aria-label="Page navigation example"><ul class="pagination justify-content-end">'
  let down='</ul></nav></div><br><br>'
  con2.innerHTML = front+ daaaata2+down+daaaata

  const likeBtn2 = document.getElementsByClassName('likeBtn2')

  for (i = 0; i < likeBtn2.length; i++) {
    likeBtn2[i].addEventListener('click', function (e) {
      let likeId = this.getAttribute('data-likeId')
      // let namee = this.getAttribute('data-name')
      // console.log(namee)
      console.log(likeId)
      likePage(likeId)
    })
  }

  function likePage(likeId) {
    axios({
      method: 'get',
      url: 'http://localhost:8080/Bookstrap/books/allpage?p='+likeId,
      // params: {
      //   pageNumber: likeId,
      //   // name: namee,
      // }
    })
      .then(res => {
        // console.log(res.data)
        htmlLike(res)
      })
      .catch(err => {
        console.log(err)
      })
  }

  const selectAuthor = document.getElementsByClassName('selectAuthor')
  console.log(selectAuthor)
  for (i = 0; i < selectAuthor.length; i++) {
    var author = selectAuthor[i].textContent
    console.log(author)
    selectAuthor[i].addEventListener('click', function (e) {
      let oneAuthor = this.getAttribute('data-auName')
      console.log('作家是' + oneAuthor)
      findAuthor(oneAuthor)
    })
  }

  //////// 定價*折扣=優惠價 ////////
  const priId = document.getElementsByClassName('priId');//價錢
  const disId = document.getElementsByClassName('disId');//折扣
  const disPriId = document.getElementsByClassName('disPriId');//優惠價

  for (let i = 0; i < priId.length; i++) {
    let price = priId[i].textContent;
    // console.log("price:"+price);

    let discount = disId[i].textContent;
    // console.log("discount:"+discount);

    let disPrice = Math.round(price * (discount / 100))
    // console.log("優惠價:"+disPrice)

    disPriId[i].textContent = disPrice;// 將計算結果寫回元素
  }
}
////////// 找到同作家的書籍 ///////////
const selectAuthor = document.getElementsByClassName('selectAuthor')
console.log(selectAuthor)
for(i=0;i<selectAuthor.length;i++){
  var author = selectAuthor[i].textContent
  console.log(author)  
  selectAuthor[i].addEventListener('click',function(e){
    let oneAuthor = this.getAttribute('data-auName')
    console.log('作家是'+oneAuthor)
    findAuthor(oneAuthor)
  })
}

function findAuthor(oneAuthor){
  axios({
    url:'http://localhost:8080/Bookstrap/books/author',
    method:'get',
    params:{
      author:oneAuthor
    }
  })
  .then(res=>{
    console.log(res.data)
    htmlchanger(res.data)
  })
  .catch(err=>{
    console.log(err)
  })
}

function htmlchanger(data){
  console.log("data"+data)
  const con = document.getElementById('console1')
  const con2 = document.getElementById('console2')
  con2.innerHTML=""
  con.innerHTML=""
  let dataaaa=""
    data.forEach(element => {
console.log(element.name )
  dataaaa+=`<div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:10px">`
  +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`">
    <img src="http://localhost:8080/Bookstrap/books/id?id=`+element.id+`" class="card-img-top" 
    style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>`
  +`<div class="card-body">`
  +`<a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+element.id+`" style="text-decoration: none;">
    <h5 class="card-title" style="text-align: center;">`+element.name+`</h5></a>`
  +`<p class="card-text" style="margin-bottom: 3px;">`+element.languages+`書</p>`
  +`<a id="selectAuthor" class="selectAuthor" data-auName="`+element.author+`" style="text-decoration: none;"><p class="card-text" style="margin-bottom: 3px;">`+element.author+`</p></a>`
  +`<p class="card-text" style="margin-bottom: 3px; display: none;">定價：
    <span class="priId" id="priId" class="book"><s>`+element.price+`</span>元</s></p>`
  +`<p class="card-text" style="margin-bottom: 3px;">優惠價：
    <strong class="disId" id="disId" style="color: red;font-size: large;">`+element.discount+`</strong>折,`
  +`<strong class="disPriId" id="disPriId" style="color: red;font-size: large;"></strong>元</p>`
  +`</p>`
  +`<a href="#" class="btn btn-primary">加入購物車</a>`
  +`</div>`
  +`</div>`
  }); 
  con.innerHTML=dataaaa

  const selectAuthor = document.getElementsByClassName('selectAuthor')
  console.log(selectAuthor)
for(i=0;i<selectAuthor.length;i++){
  var author = selectAuthor[i].textContent
  console.log(author)  
  selectAuthor[i].addEventListener('click',function(e){
    let oneAuthor = this.getAttribute('data-auName')
    console.log('作家是'+oneAuthor)
    findAuthor(oneAuthor)
  })
}

//////// 定價*折扣=優惠價 ////////
const priId = document.getElementsByClassName('priId');//價錢
const disId = document.getElementsByClassName('disId');//折扣
const disPriId = document.getElementsByClassName('disPriId');//優惠價

for (let i = 0; i < priId.length; i++) {
let price = priId[i].textContent;
// console.log("price:"+price);

let discount = disId[i].textContent;
// console.log("discount:"+discount);

let disPrice = Math.round(price*(discount/100))
// console.log("優惠價:"+disPrice)

disPriId[i].textContent = disPrice;// 將計算結果寫回元素
}
}



