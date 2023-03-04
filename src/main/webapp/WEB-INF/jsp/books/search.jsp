<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
  fieldset{
    border: 1px dotted black
  }
  .card{   
    float: left;
  }
  a:link{
    text-decoration: none;
  }
  a:hover {
    text-decoration:underline;
  }
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div style="margin-left:350px;">
 <br/>  
 <fieldset>
  <legend>請選擇條件</legend>
  <div class="st1">
      <div class="st1">
          <br>
          <label for="" class="t1">語言:</label>
          <!-- <label>
              <input type="checkbox" name="hobby" value="全部" id="allL">全部
          </label> -->
          <label>
              <input type="checkbox" name="hobby" value="中文" id="chinese">中文
          </label>
          <label>
              <input type="checkbox" name="hobby" value="外文" id="foreign">外文
          </label>
      </div>
      <br>
      <div class="st1">
          <label for="" class="t1">類別:</label>
          <!-- <label>
              <input type="checkbox" name="hobby" value="全部" id="allC">全部
          </label> -->
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
      </div>
  </div>
</fieldset>
<br />
<!-- <div class="sub"> -->
  <input type="submit" id="submitBtnnnn" class="submitBtnnnn" value="送出">
  <input type="reset" value="清除">
<!-- </div>  -->
</div>
<br>




<fieldset>
<div id="console" class="container" style="position: relative;"> 
 
    <!-- 全部書籍、模糊搜尋結果(用同一個forEach接)+分頁按鈕 (按鈕會變成全部書籍的分頁，還須再做調整)-->
    <jstl:forEach var="book" items="${book.content}" >
        <div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:10px;">
        <a href='http://localhost:8080/Bookstrap/books/oneBook?id=${book.id}'>
        <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" class="card-img-top" 
        style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>
        <div class="card-body">
        <a href="http://localhost:8080/Bookstrap/books/oneBook?id=${book.id}"><h5 class="card-title">${book.name}</h5></a>
        <p class="card-text" style="margin-bottom: 3px;">語言：${book.languages}書</p>
        <p class="card-text" style="margin-bottom: 3px;">作者：${book.author}</p>
        <p class="card-text" style="margin-bottom: 3px;">售價：${book.price}元</p>
        <p class="card-text" style="margin-bottom: 3px;">優惠價：${book.discount}折</p>
        <a href="#" class="btn btn-primary">加入購物車</a>
        </div>
        </div>
    </jstl:forEach>
 
    <jstl:forEach var="pageNumber" begin="1" end="${book.totalPages}">
  
        <a href="${contextRoot}/books/allpage2?p=${pageNumber}"><button class="btn btn-info">${pageNumber}</button></a>
      
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
  


  
</script>
<script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/book/search.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>