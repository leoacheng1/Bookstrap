<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextRoot}/css/bootstrap.min.css"
	rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
<h1>this is shopInsert</h1>

<form>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">店名</label>
    <input type="text" class="form-control" id="shopName" >
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">地址</label>
    <input type="text" class="form-control" id="shopAddress" >
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">電話</label>
    <input type="text" class="form-control" id="shopPhone" >
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">營業時間</label>
    <input type="text" class="form-control" id="shopOpenHour" >
  </div>
  

  <button type="submit" class="btn btn-primary">送出</button>
</form>
</body>
</html>