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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
  <!-- <div style="position: absolute;top: 0px;left: 225px;"> -->
<div >
<div class="content-header" style="margin-left: 25px;">
  <br/>
	<h1>所有書籍</h1>
  <br/>
</div>


<div>
<table class="text-center" style="width: 1315px;">
    <thead style="background-color:#DCDCDC;">
      <tr>
        <th colspan="2" style="width: 250px;">書名</th>     
        <th ></th>     
        <th style="width: 125px;">作者</th>
        <th style="width: 125px;">譯者</th>
        <th style="width: 75px;">語言</th>
        <th style="width: 100px;">類別</th>
        <th style="width: 125px;">出版社</th>
        <th style="width: 125px;">出版日期</th>
        <th style="width: 110px;height: 50px;">封面圖片</th>
        <th style="width: 50px;">折扣</th>
        <th style="width: 50px;">定價</th>
        <th style="width: 110px;">詳細資料</th>
        <th style="width: 80px;">更新</th>
	      <th style="width: 80px;">刪除</th>
      </tr>
    </thead>
    <tbody  style="height: 100px;">
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
      <td style="width: 130px;height: 100px;"><img style="width:100px;height:120px;margin-top:5px;" src="${contextRoot}/books/id?id=${book.id}"></td>
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
</div>
<br>
<div style="font-size:larger;margin-left: 25px;">
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>