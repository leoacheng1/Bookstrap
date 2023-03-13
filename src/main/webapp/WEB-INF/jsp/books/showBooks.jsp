<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有書籍</title>
<!--版型需要的css -->
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
<style>
  table {
  table-layout: fixed;
}
</style>
</head>
<body class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
  <div class="wrapper">
      <!--上面導覽列 -->
      <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %> 
      <!-- 左邊導覽列 -->
      <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>

<div class="content-wrapper">
<div style="margin-left: 200px;">
<div class="content-header" >
  <br/>
	<h1>所有書籍</h1>
  <br/>
</div>

<div id="output"></div>
  
<table class="text-center" style="width: 1350px;">
    <thead>
      <tr>
        <th colspan="2">書名</th>     
        <th style="width: 50px;"></th>     
        <th style="width: 75px;">作者</th>
        <th style="width: 75px;">譯者</th>
        <th style="width: 75px;">語言</th>
        <th style="width: 75px;">類別</th>
        <th style="width: 100px;">出版社</th>
        <th style="width: 100px;">出版日期</th>
        <th style="width: 110px;height: 30px;">封面圖片</th>
        <th style="width: 75px;">折扣</th>
        <th style="width: 75px;">定價</th>
        <th style="width: 100px;">詳細資料</th>
        <th style="width: 75px;">更新</th>
	      <th style="width: 75px;">刪除</th>
      </tr>
    </thead>
    <tbody>
    <jstl:forEach items="${page.content}" var="book" >
     <tr>
      <td colspan="2"><jstl:out value="${book.name}"/></td> 
      <td></td> 
      <td><jstl:out value="${book.author}"/></td> 
      <td><jstl:out value="${book.translator}"/></td>   
      <td><jstl:out value="${book.languages}"/></td>   
      <td><jstl:out value="${book.category}"/></td>   
      <td><jstl:out value="${book.publisher}"/></td>   
      <td style="width: 100px;"><jstl:out value="${book.date}"/></td>   
      <td style="width: 130px;"><img style="width:100px;height:120px;margin-top:5px;" src="${contextRoot}/books/id?id=${book.id}"></td>
      <td><jstl:out value="${book.discount}"/></td>  
      <td><jstl:out value="${book.price}"/></td> 
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
    <tbody id="bbody" class="${book.id} text-center" style="width:1500px" body-bkid="${book.id}">  
 
    </tbody>
    </jstl:forEach>

    </tbody>
   
</table>
<br>
<div style="font-size:larger;">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
  <jstl:choose>
    <jstl:when test="${page.number != pageNumber-1}">
      <li class="page-item"><a class="page-link" href="${contextRoot}/books/page?p=${pageNumber}">${pageNumber}</a></li>
    </jstl:when>
    
    <jstl:otherwise>
      <li class="page-item active"><a class="page-link">${pageNumber}</a></li>
    </jstl:otherwise>
  </jstl:choose>
  
</jstl:forEach>
    </ul>
  </nav>
</div>

</div>
</div>
</div>
<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script>

</script>
<script src="${contextRoot}/js/book/mix-book.js" type="text/javascript"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>