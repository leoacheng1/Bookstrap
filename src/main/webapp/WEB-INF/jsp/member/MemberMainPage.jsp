<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member main</title>
</head>
<body>
<h1>Member main</h1>
<p>Hi ${memberName}</p>

<form action="${contextRoot}/member/logout" method="get">
<button type="submit">Log out</button>
</form>

</body>
</html>