<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>這是所有員工頁面</title>
</head>
<body>
	<h1>這是所有員工頁面</h1>
	<table>
		<tr>
			<th>員工編號</th>
			<th>員工店鋪編號</th>
			<th>員工姓名</th>
			<th>員工照片</th>
			<th>員工薪資</th>
			<th>員工職稱</th>
		</tr>
		<jstl:forEach items="${empList}" var="showemp">
			<tr>
				<td>${showemp.empId}</td>
				<td>${showemp.empShopid}</td>
				<td>${showemp.empName}</td>
				<td><img width="100px"
					src="${contextRoot}/sempsphoto/id?id=${showemp.empId}"></td>
				<td>${showemp.empSalary}</td>
				<td>${showemp.empTitle}</td>
			</tr>

		</jstl:forEach>
	</table>
</body>
</html>