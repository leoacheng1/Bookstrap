<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show Books Page</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
  <br/>
	<h1>所有書籍頁面</h1>
  <br/>
  <table class="text-center" width="1200px">
    <thead>
      <tr>
        <th>書名</th>
        <th>作者</th>
        <th>譯者</th>
        <th>語言</th>
        <th>類別</th>
        <th>出版社</th>
        <th>出版日期</th>
        <th>封面圖片</th>
        <th>折扣</th>
        <th>定價</th>
        <th>更新</th>
	    <th>刪除</th>
      </tr>
    </thead>
  <jstl:forEach items="${list}" var="book">
    <tr>
      <td>${book.name}</td>  
      <td>${book.author}</td>  
      <td>${book.translator}</td>  
      <td>${book.languages}</td>  
      <td>${book.category}</td>  
      <td>${book.publisher}</td>  
      <td>${book.date}</td>  
      <td><img style="width:200px;height:250px" src="${contextRoot}/books/id?id=${book.id}"></td>
      <td>${book.discount}</td>  
      <td>${book.price}</td>  
      <td><a href="/HomeWork/GetBookByIDToUpdate?bookid=${bk.bookid}"><button class="btn btn-primary">更新</button></a>
      <td><a href="/HomeWork/DeleteBookByID?bID=${bk.bookid}"><button class="btn btn-danger">刪除</button></a>     
    </tr>
  </jstl:forEach>
</table>
</div>
</body>
</html>