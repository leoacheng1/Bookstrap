<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>假首頁</title>
</head>
<body>
	<div id="dataHome">
		<jstl:forEach items="${paraList }" var="item">
			<div>文章標題： ${item.paragraphTitle }</div>

		</jstl:forEach>

	</div>
</body>

</html>