<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html xmlns:th="http://www.thymeleaf.org">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Test</h1>
<iframe src="${contextRoot}/epub/books/1" style="width: 100%; height: 100%;"></iframe>
</body>
</html>