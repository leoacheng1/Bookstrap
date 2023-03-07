<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Book Page</title>
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
  /* fieldset {
    height: 300px;
    margin: 20px 20px 25px 25px;
    float: left;
    width: 450px;
    border: 1px dotted black
  } */
  figure {
    float: right;
    margin: 10px;
  }
  p{
    margin-top: 20px;
    margin-bottom: 20px;
    font-size: medium;
  }
  
  
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div style="margin-left: 180px;">
<br>
<div style="margin-top: 20px;">
<form action="http://localhost:8080/Bookstrap/books/oneBook" enctype="multipart/form-data" modelAttribute="book">
<fieldset style="width: 450px;height: 470px;margin: 20px 40px 25px 120px;float: left;border: 1px solid silver">
    <figure>
        <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" width="375px" height="450px" style="margin: 7px 30px 7px 10px;">
    </figure>
</fieldset>
<div>
<br>
<p style="margin-bottom: 3px;"><h4>${book.name}</h4></p>
<br>
<br>

<br>
<p style="margin-bottom: 5px;font-size: large;" class="book">作者：${book.author}</p>
<p style="margin-bottom: 5px;font-size: large;" class="book">譯者：${book.translator}</p>
<p style="margin-bottom: 5px;font-size: large;" class="book">出版社：${book.publisher}</p>
<p style="margin-bottom: 5px;font-size: large;" class="book">出版日期：${book.date}</p>
<p style="margin-bottom: 5px;font-size: large;" class="book">語言：${book.languages}</p>
<p style="margin-bottom: 5px;font-size: large;">定價：<span class="priId" id="priId" class="book"><s>${book.price}</span>元</s><br></p>
<p style="margin-bottom: 5px;font-size: large;">優惠價：<strong class="disId" id="disId" style="color: red;font-size: larger;">${book.discount}</strong>折,
<strong class="disPriId" id="disPriId" style="color: red;font-size: larger;"></strong>元</p>
</div>

</form>
</div>

<br>
<br><hr style="width: 350px;">
<button type="button" class="btn btn-info" style="margin-right: 20px;margin-left: 10px;font-size: large;"><i class="fa-solid fa-cart-shopping"></i>立刻結帳</button>
<button type="button" class="btn btn-secondary" style="margin-right: 20px;margin-left: 10px;font-size: large;"><i class="fa-solid fa-cart-shopping"></i>加入購物車</button>
<br>
<br>
<br>

<div style="width: 850px;margin-left: 120px;">
<form action="http://localhost:8080/Bookstrap/books/oneBook" modelAttribute="detail">
<div>
<p><h4>內容簡介</h4></p><hr>
<p style="font-size: large;">${detail.intro}</p>
</div>
<br>
<div>
<br>
<h4>詳細資料</h4><hr>
<p style="margin-bottom: 5px;">尺寸：${detail.size}</p>
<p style="margin-bottom: 5px;">頁數：${detail.pages}頁</p>
<p style="margin-bottom: 5px;">分級：${detail.grade}</p>
</div>
</form>
</div>
<br>
<div style="width: 850px;margin-left: 120px;">
<form action="http://localhost:8080/Bookstrap/books/oneBook" enctype="multipart/form-data" modelAttribute="book">
<p><h4>買了此商品的人，也買了...</h4></p><hr>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" class="d-block w-100" width="70px" height="125px" alt="...">
      </div>
      <div class="carousel-item">
        <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" class="d-block w-100" width="70px" height="125px" alt="...">
      </div>
      <div class="carousel-item">
        <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" class="d-block w-100" width="70px" height="125px" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</form>
</div>
<br>
<div style="width: 850px;margin-left: 120px;">
<p><h4>會員評論</h4></p><hr>

</div>

</div>
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
////////// 計算原價*折扣=優惠價 /////////
  const priId = document.getElementsByClassName('priId');//價錢
  const disId = document.getElementsByClassName('disId');//折扣
  const disPriId = document.getElementsByClassName('disPriId');//優惠價

for (let i = 0; i < priId.length; i++) {
  let price = priId[i].textContent;
  console.log("price:"+price);

  let discount = disId[i].textContent;
  console.log("discount:"+discount);
  
  let disPrice = Math.round(price*(discount/100))
  console.log("優惠價:"+disPrice)

  disPriId[i].textContent = disPrice;// 將計算結果寫回元素
}

</script>
<script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>          
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>

</body>
</html>