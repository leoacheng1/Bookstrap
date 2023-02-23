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
<title>這是請假簽核頁面</title>
</head>
<body>
<h1>這是請假簽核頁面</h1>
<body>
	<form action="${contextRoot}/sempsatt/insert" method="post">
		<label for="attSempid">員工編號:</label>
		<input type="number" id="attSempid" name="attSempid"><br><br>
			<label for="attDate">請假日期:</label>
	<input type="date" id="attDate" name="attDate"><br><br>

	<label for="attVacation">請假假別:</label>
	<input type="text" id="attVacation" name="attVacation"><br><br>
	
	<label for="">請假事由:</label>
	<input type="text" id="attReason" name="attReason"><br><br>

	<label for="attTime">請假時數:</label>
	<input type="number" id="attTime" name="attTime" step="1"><br><br>

	<label for="attAgree"></label>
	<input type="hidden" id="attAgree" name="attAgree" value="已提交">

	<input type="submit" value="提交假單">
</form>
		
</body>
</html>