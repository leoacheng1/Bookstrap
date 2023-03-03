<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>更新頁面</title>
			<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
		</head>

		<body>
			<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
			<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>

			<form action="${contextRoot}/blog/getParaById" method="GET" modelAttribute="updateBlog">

				<input type="hidden" id="pId" name="id" value="${updateBlog.paragraphId}"><br>

				<label for="pTitle">文章標題:</label>
				<input type="text" id="pTitle" name="pTitle" value="${updateBlog.paragraphTitle}"><br>

				<label for="pCatagory">文章類別:</label>
				<input type="text" id="pCatagory" name="pCatagory" value="${updateBlog.paragraphCatagory}"><br>

				<label for="pAuther">文章作者:</label>
				<input type="text" id="pAuther" name="pAuther" value="${updateBlog.paragraphAuther}"><br>

				<label for="pContent">文章內文:</label>
				<input type="text" id="pContent" name="pContent" value="${updateBlog.paragraphContent}"><br>
				<img src="#">
				<input type="submit" value="Submit">
			</form>

			<script>
Const id = document.






			</script>
		</body>



		</html>