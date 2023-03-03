<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編寫文章</title>
</head>
<body>
	<form action="${contextRoot }/blog/createParagraph" method="post"
		enctype="multipart/form-data">
		<div>
			文章標題： <input type="text" name="pTitle">
		</div>
		<div>
			文章內文： <input type="text" name="pContent">
		</div>
		<div>
			文章作者： <input type="text" name="pAuther">
		</div>
		<div>
			文章分類： <input type="text" name="pCatagory">
		</div>

		<div>
			<button>送出</button>
		</div>
	</form>
</body>
</html>