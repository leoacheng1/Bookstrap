<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增書籍</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
  <br/>
	<h1>新增書籍頁面</h1>
  <br/>
  <form action="${contextRoot}/books/post" method="post" enctype="multipart/form-data">
  書名:<input type="text"  name="name" id="nameInput" placeholder="請輸入書名"/><br/>
  作者:<input type="text" name="author" id="nameInput" placeholder="請輸入作者"/><br/>
  譯者:<input type="text" name="translator" id="nameInput" placeholder="請輸入譯者"/><br/>
  語言:<select name="languages" >
           <option selected value="繁體中文">繁體中文</option>
           <option value="簡體中文">簡體中文</option>
           <option value="外文">外文</option>
         </select><br/>
  類別:<select name="category" >
        <option selected value="哲學">哲學</option>
        <option value="宗教">宗教</option>
        <option value="科學">科學</option>
        <option value="應用科學">應用科學</option>
        <option value="社會科學">社會科學</option>
        <option value="歷史">歷史</option>
        <option value="地理">地理</option>
        <option value="語言文學">語言文學</option>
        <option value="藝術">藝術</option>
      </select><br/>
  出版社:<input type="text" name="publisher" id="nameInput" placeholder="請輸入出版社"/><br/>
  出版日期:<input type="date" name="date" id="nameInput"/><br/>
  封面圖片:<input type="file" name="photo" id="nameInput"/><br/>
  折扣:<input type="text" name="discount" id="nameInput" placeholder="請輸入折扣"/><br/>
  定價:<input type="text" name="price" id="nameInput" placeholder="請輸入定價"/><br/>
  <button type="submit" id="myBtn" class="my-customer-data-btn btn btn-primary">送出</button>
  </form>  
</div>
</body>
</html>