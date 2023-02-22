<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<!-- <button id="showAllBooks">所有書籍</button> -->
<div id="output"></div>
  
<table class="text-center" style="width:1200px">
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
        <th>詳細資料</th>
        <th>更新</th>
	      <th>刪除</th>
      </tr>
    </thead>
    <tbody>
    <jstl:forEach items="${page.content}" var="book" >
     <tr>
      <td>${book.name}</td>  
      <td>${book.author}</td>  
      <td>${book.translator}</td>  
      <td>${book.languages}</td>  
      <td>${book.category}</td>  
      <td>${book.publisher}</td>  
      <td>${book.date}</td>  
      <td><img style="width:100px;height:120px" src="${contextRoot}/books/id?id=${book.id}"></td>
      <td>${book.discount}</td>  
      <td>${book.price}</td>  
      <td>
        <button id="detail-btn" class="detail-btn btn btn-info" data-bkid="${book.id}">詳細資料</button>
      </td> 
      <td>
        <a href="${contextRoot}/books/edit?id=${book.id}">
          <button id="edit-btn" class="edit-btn btn btn-primary" data-bkid="${book.id}">更新</button>
        </a>
       
      </td>     
      <td>
        <button class="delete-btn btn btn-danger"  data-bkid="${book.id}">刪除</button>
      </td>
    </tr>
    <tbody id="bbody" class="${book.id}" body-bkid="${book.id}">  
 
    </tbody>
    </jstl:forEach>

    </tbody>
   
</table>
<div id="bbody" class="${book.id}" >  

</div>

<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
  <jstl:choose>
    <jstl:when test="${page.number != pageNumber-1}">
      <a href="${contextRoot}/books/page?p=${pageNumber}">${pageNumber}</a>
    </jstl:when>
    
    <jstl:otherwise>
      ${pageNumber}
    </jstl:otherwise>
  </jstl:choose>
  
  <jstl:if test="${pageNumber != page.totalPages}">
     | 
  </jstl:if>
</jstl:forEach>
</div>


<script>

</script>
<script src="${contextRoot}/js/book/mix-book.js" type="text/javascript"></script>
</body>
</html>