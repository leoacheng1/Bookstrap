<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Search Page</title>
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />


<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap" rel="stylesheet" />

<style>
.top_search_table {
padding-left: 50px;
}

.searchBar {
padding-left: 500px;
}

.w-10 {
width: 10%;
}

.ms-45 {
margin-left: 30px;
}

.logoFont {
font-family: 'Roboto', sans-serif;
}

.nav-link {
position: relative;
}

.nav-link::after {
content: '';
opacity: 0;
transition: all 0.3s;
height: 3px;
width: 100%;
background-color: black;
position: absolute;
bottom: 0;
left: 0;
}

.nav-link:hover::after {
content: '';
opacity: 1;
}

.slick-prev:before {
color: black;
}

.slick-next::before {
color: black;
}

body {
font-family: 'Noto Sans TC', sans-serif;
}

.icon-text {
text-decoration: none;
color: black;
}

.icon-text:hover {
color: black;
}

.slider-title-en {
font-family: 'Roboto Slab', serif;
}

.bg-custom {
background-color: #5ea0cc;
}

legend {
padding: 3px 6px;
}


.card {
float: left;
}

a:link {
text-decoration: none;
}

a:hover {
text-decoration: underline;
}

th {
border: 1px solid silver;
padding: 15px;
background-color: silver;
}

td {
border: 1px solid silver;
padding: 15px;
}
</style>
</head>

<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div style="width:1300px;margin: 0 auto">
<br />
<table style="width:1255px;border: 1px solid silver;margin-left: 15px;">
 <tbody style="border: 1px solid  silver;font-size: large;padding: 15px;">
  <tr>
   <th style="text-align: center;width: 100px;background-color:#F0F0F0;border: 1px solid  silver;padding: 15px;">
    <label>語言：</label>
   </th>
   <td>
    <label>
      <input type="checkbox" name="hobby" value="中文" id="chinese">中文
    </label>
    <label>
      <input type="checkbox" name="hobby" value="外文" id="foreign">外文
    </label>
   </td>
  </tr>
  <tr style="border: 1px solid silver;">
   <th style="text-align: center;width: 100px;background-color:#F0F0F0;border: 1px solid  silver;">
    <label>類別：</label>
   </th>
   <td>
    <label>
      <input type="checkbox" name="hobby" value="哲學" id="philosophy">哲學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="宗教" id="religion">宗教
    </label>
    <label>
      <input type="checkbox" name="hobby" value="科學" id="science">科學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="應用科學" id="appliedScience">應用科學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="社會科學" id="socialScience">社會科學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="歷史" id="history">歷史
    </label>
    <label>
      <input type="checkbox" name="hobby" value="地理" id="geography">地理
    </label>
    <label>
      <input type="checkbox" name="hobby" value="語言文學" id="foreignLan">語言文學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="藝術" id="Art">藝術
    </label>
    <label>
      <input type="checkbox" name="hobby" value="其他" id="other">其他
    </label>
   </td>
  </tr>
 </tbody>
 <tbody>
  <tr style="background-color:#F0F0F0;font-size: large;">
   <td></td>
   <td style="text-align: right;padding: 10px;" colspan="2">
<div style="width:1125px;">
  <button type="button" id="clearBtnnn" class="clearBtnnn btn btn-info" 
          style="margin-right: 5px;">清除篩選</button>
  <button type="button" id="submitBtnnnn" class="submitBtnnnn btn btn-info"
          style="margin-right: 5px;">確認送出</button>
</div>
   </td>
  </tr>
 </tbody>
</table>
</div>
<br>

<!-- 模糊搜尋結果+分頁按鈕 (還須再做調整)-->
<fieldset>
<div id="console1" class="container" style="position: relative;">
<!-- 您現在搜尋的關鍵字是:${sessionScope.name} -->

<div style="height: 13px; margin-right:30px;">
  <nav aria-label="Page navigation example" >
    <ul class="pagination justify-content-end">
<jstl:forEach var="pageNumber" begin="1" end="${book.totalPages}">
  <li class="page-item"><a class="page-link likeBtn" data-likeId="${pageNumber}" data-name="${sessionScope.name}">${pageNumber}</a></li>
</jstl:forEach>  
    </ul>
  </nav>
</div>

<jstl:forEach var="book" items="${book.content}">
  <div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:57px;position: relative;">
    <a href='http://localhost:8080/Bookstrap/books/oneBook?id=${book.id}'>
      <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" class="card-img-top"
      style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>
  <div class="card-body">
    <a href="http://localhost:8080/Bookstrap/books/oneBook?id=${book.id}" style="text-decoration: none;">
      <h5 class="card-title" style="text-align: center;">${book.name}</h5>
    </a>
  <div style="position: absolute;bottom: 25px;">
    <p class="card-text" style="margin-bottom: 3px;">${book.languages}書</p>
    <a id="selectAuthor" class="selectAuthor" data-auName="${book.author}" style="text-decoration: none;">
      <p class="card-text" style="margin-bottom: 3px;">${book.author}</p>
    </a>
    <p class="card-text" style="margin-bottom: 3px;display: none;">定價：<span class="priId" id="priId"
      class="book"><s>${book.price}</span>元</s></p>
      <p class="card-text" style="margin-bottom: 3px;">優惠價：<strong class="disId" id="disId"
        style="color: red;font-size: large;">${book.discount}</strong>折,
        <strong class="disPriId" id="disPriId" style="color: red;font-size: large;"></strong>元
      </p>
    </p>
    <a href="#" class="btn btn-primary">加入購物車</a>
  </div>

  </div>
</div>
</jstl:forEach>


</div>

</fieldset>

<!-- 全部書籍+分頁按鈕-->
<fieldset>
<div id="console2" class="container" style="position: relative;">

  <div style="height: 13px; margin-right:30px;">
    <nav aria-label="Page navigation example" >
      <ul class="pagination justify-content-end">
        <jstl:forEach var="pageNumber" begin="1" end="${allbook.totalPages}">
          <jstl:choose>
            <jstl:when test="${page.number != pageNumber-1}">
              <li class="page-item"><a class="page-link" href="${contextRoot}/books/allpage2?p=${pageNumber}">${pageNumber}</a></li>
            </jstl:when>
      
            <jstl:otherwise>
              <li class="page-item active"><a class="page-link">${pageNumber}</a></li>
            </jstl:otherwise>
          </jstl:choose>
        </jstl:forEach>
      </ul>
    </nav>
  </div>
  
<br>
<br>
<jstl:forEach var="allbook" items="${allbook.content}">
 <div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:10px;position: relative;">
  <a href='http://localhost:8080/Bookstrap/books/oneBook?id=${allbook.id}'>
    <img src="http://localhost:8080/Bookstrap/books/id?id=${allbook.id}" class="card-img-top"
         style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>
  <div class="card-body" style="margin: 0;">
   <a href="http://localhost:8080/Bookstrap/books/oneBook?id=${allbook.id}">
    <h5 class="card-title" style="text-align: center;">${allbook.name}</h5>
   </a>
  
  <div style="position: absolute;bottom: 25px;">
   <p class="card-text" style="margin-bottom: 3px;">${allbook.languages}書</p>
   <a id="selectAuthor" class="selectAuthor" data-auName="${allbook.author}"
     style="text-decoration: none;">
    <p class="card-text" style="margin-bottom: 3px;">${allbook.author}</p>
   </a>
   <p class="card-text" style="margin-bottom: 3px;display: none;">定價：<span class="priId" id="priId" class="book"><s>${allbook.price}</span>元</s></p>
   <p class="card-text" style="margin-bottom: 3px;">優惠價：<strong class="disId" id="disId" style="color: red;font-size: large;">${allbook.discount}</strong>折,
   <strong class="disPriId" id="disPriId" style="color: red;font-size: large;"></strong>元</p>
   </p>
   <a href="#" class="btn btn-primary" >加入購物車</a>
  </div>

  </div>
 </div>
</jstl:forEach>



</div>
</fieldset>

<footer class="text-muted mt-5 border border-2 border-bottom-0 border-start-0 border-end-0">
<div class="container">
<p class="float-right justify-content-center">
##########Test only############ 客戶服務專線：02-26535588
傳真：02-27885008 服務時間：週一~五 8:00~19:00，週六~日、例假日
9:00~18:00，365天全年無休 Bookstrap數位科技股份有限公司 統編 : 96922355
地址：臺灣 115 台北市南港區八德路四段768巷1弄18號B1之1
食品業者登陸字號：A-196922355-00000-9 Copyright © since 1995
books.com.tw All Rights Reserved.
</p>
<div class="d-flex justify-content-center">
<a href="">服務條款</a>
<a href="" class="ms-2">隱私全政策</a>
</div>
</div>
</footer>
<script>
//////////  模糊搜尋的分頁按鈕  /////////
const likeBtn = document.getElementsByClassName('likeBtn')

for (i = 0; i < likeBtn.length; i++) {
likeBtn[i].addEventListener('click', function (e) {
let likeId = this.getAttribute('data-likeId')
let namee = this.getAttribute('data-name')
console.log(namee)
console.log(likeId)
likePage(likeId, namee)
})
}

function likePage(likeId, namee) {
axios({
method: 'get',
url: 'http://localhost:8080/Bookstrap/books/ajax/like',
params: {
pageNumber: likeId,
name: namee,
}
})
.then(res => {
// console.log(res.data)
htmlLikes(res)
})
.catch(err => {
console.log(err)
})
}

function htmlLikes(res) {
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
let namee = this.getAttribute('data-name')
console.log(namee)
console.log(likeId)
likePage(likeId, namee)
})
}

function likePage(likeId, namee) {
console.log()
axios({
method: 'get',
url: 'http://localhost:8080/Bookstrap/books/ajax/like',
params: {
pageNumber: likeId,
name: namee,
}
})
.then(res => {
// console.log(res.data)
htmlLikes(res)
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

</script>
<script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/book/search.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>

</html>