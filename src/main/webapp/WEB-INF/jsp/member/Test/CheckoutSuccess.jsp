<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
</head>
<body>
<h1>Success checkout ${memberName}</h1>
<a type="button" href="${contextRoot}/ebook/add/purchase/before/pay?nTcId=${nTc.tcId}">checkoutDone</a>
</body>
</html>