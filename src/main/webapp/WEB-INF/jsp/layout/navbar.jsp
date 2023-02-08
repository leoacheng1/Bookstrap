<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>


<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextRoot}/css/index.css">

</head>
<body>


	<nav class="navbar navbar-expand-lg" style="background-color: #DDD0C8">
		<div class="container-fluid">
			<a class="navbar-brand" href="${contextRoot}">商城後台</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${contextRoot}/">首頁</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/books/add">新增書籍</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextRoot}/books/all">所有書籍</a>
					</li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<script type="text/javascript"
		src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>

</body>
</html>