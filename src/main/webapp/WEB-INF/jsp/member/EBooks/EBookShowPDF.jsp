<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show PDF</title>
</head>
<body>

<embed src="${contextRoot}/ebook/get/pdf?eBookId=${eBookId}" type="application/pdf" width="100%" height="1500px" />


</body>
</html>