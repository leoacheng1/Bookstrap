<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>編寫文章</title>
			<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		</head>

		<body>
			<form action="${contextRoot }/blog/createParagraph" method="post" enctype="multipart/form-data">
				<div>
					文章標題： <input type="text" name="pTitle">
				</div>
				<div>
					文章內文：<fieldset>
						<textarea name="pContent" rows="6" id="summernote" placeholder="請輸入文章..." required></textarea>
					</fieldset>
				</div>
				<div>
					文章作者： <input type="text" name="pAuther">
				</div>
				<div>
					文章分類： <input type="text" name="pCatagory">
				</div>
				<div>
					文章圖片： <input type="file" multiple name="pPhoto">
				</div>
				<div>
					<button>送出</button>
				</div>
			</form>
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
			<script>$(document).ready(function () {
					$('#summernote').summernote({
						height: 300,
						width: 800,
					});
				});</script>
		</body>

		</html>