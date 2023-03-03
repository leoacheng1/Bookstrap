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
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
<style>
  input,select,button{
    margin-top: 5px;
    margin-bottom: 5px;
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
<div class="container">
<div class="content-header">
  <br/>
	<h1>新增書籍</h1>
  <br/>
  <form action="${contextRoot}/books/post" method="post" enctype="multipart/form-data">
  書名：<input type="text"  name="name" id="nameInput" placeholder="請輸入書名"/><br/>
  作者：<input type="text" name="author" id="authorInput" placeholder="請輸入作者"/><br/>
  譯者：<input type="text" name="translator" id="translatorInput" placeholder="請輸入譯者"/><br/>
  語言：<select name="languages" id="languagesInput">
           <option selected value="中文">中文</option>
           <option value="外文">外文</option>
         </select><br/>
  類別：<select name="category" id="categoryInput">
        <option selected value="哲學">哲學</option>
        <option value="宗教">宗教</option>
        <option value="科學">科學</option>
        <option value="應用科學">應用科學</option>
        <option value="社會科學">社會科學</option>
        <option value="歷史">歷史</option>
        <option value="地理">地理</option>
        <option value="語言文學">語言文學</option>
        <option value="藝術">藝術</option>
        <option value="其他">其他</option>
      </select><br/>
  出版社：<input type="text" name="publisher" id="publisherInput" placeholder="請輸入出版社"/><br/>
  出版日期：<input type="date" name="date" id="dateInput"/><br/>
  封面圖片：<input type="file" name="photo" id="photoInput"/><br/>
  折扣：<input type="text" name="discount" id="discountInput" placeholder="請輸入折扣"/><br/>
  定價：<input type="text" name="price" id="priceInput" placeholder="請輸入定價"/><br/>
  尺寸：<input type="text" name="size" id="sizeInput" placeholder="請輸入尺寸"/><br/>
  頁數：<input type="text" name="pages" id="pagesInput" placeholder="請輸入頁數"/><br/>
  簡介：<textarea cols="max" rows="max" name="intro" id="introInput" placeholder="請輸入簡介" style="width:350px;height:150px;"></textarea><br/>
  分級：<select name="grade" id="gradeInput">
        <option selected value="普通級">普通級</option>
        <option value="限制級">限制級</option>
      </select><br/>
  <button type="submit" id="myBtn" class="my-customer-data-btn btn btn-info">送出</button>
  </form>  
</div>
</div>
</div>
</div>
<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>