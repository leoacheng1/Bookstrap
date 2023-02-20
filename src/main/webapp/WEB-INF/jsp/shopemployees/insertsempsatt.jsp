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
		<label for="attSempid">Employee ID:</label>
		<input type="number" id="attSempid" name="attSempid"><br><br>
			<label for="attDate">Attendance Date:</label>
	<input type="date" id="attDate" name="attDate"><br><br>

	<label for="attVacation">Vacation:</label>
	<input type="text" id="attVacation" name="attVacation"><br><br>

	<label for="attTime">Attendance Time:</label>
	<input type="number" id="attTime" name="attTime" step="0.01"><br><br>

	<label for="attAgree">Agree:</label>
	<input type="text" id="attAgree" name="attAgree"><br><br>

	<input type="submit" value="Add Attendance">
</form>
		
</body>
</html>