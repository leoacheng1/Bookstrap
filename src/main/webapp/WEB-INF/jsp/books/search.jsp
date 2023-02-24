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

<link rel="stylesheet" type="text/css" href="css/slick.css" />
<link rel="stylesheet" type="text/css" href="css/slick-theme.css" />

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
    border: 1px dotted #E0E0E0
  }
  .card{
    
    float: left;

  }
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container">
 <br/>  
 <fieldset>
  <legend>請選擇條件</legend>
  <div class="st1">
      <div class="st1">
          <br>
          <label for="" class="t1">語言:</label>
          <label>
              <input type="checkbox" name="hobby" value="全部" id="allL">全部
          </label>
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
          <label>
              <input type="checkbox" name="hobby" value="全部" id="allC">全部
          </label>
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
<div class="sub">
  <input type="submit" id="submitBtnnnn" value="送出">
  <input type="reset" value="清除">
</div> 
</div>
<div id="console"> 

</div>
<script>
  
  
  
</script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="js/slick.js"></script>
<script src="${contextRoot}/js/book/search.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>