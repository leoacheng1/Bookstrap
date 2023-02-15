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
<title>新增員工資料</title>
</head>
<body>
<form action="${contextRoot}/semps/insertemployee" method="post" enctype="multipart/form-data">
	
	<label>員工店鋪編號:</label><input type="text" name="empShopid" ><br>
	<label>員工姓名:</label><input type="text" name="empName" ><br>
	<label>上傳員工照片:</label><input type="file" name="empPhoto" accept="image/*"><br>
	<label>員工薪資:</label><input type="text" name="empSalary" ><br>
	<label>員工職稱:</label><input type="text" name="empTitle" ><br>
	<input type="submit" value="上傳">
</form>
</body>
</html>