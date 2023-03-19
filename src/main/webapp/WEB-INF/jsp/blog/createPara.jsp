<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>編寫文章</title>
			<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
		</head>


		<body
			class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
			<div class="wrapper">
				<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
					<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
						<div class="content-wrapper">
							<div class="content-header">
								<!-- 標題位置 -->
								<h1>創建文章</h1>
							</div>
							<section class="content">
								<form action="${contextRoot }/blog/createParagraph" method="post"
									enctype="multipart/form-data">
									<div>
										文章標題： <input type="text" name="pTitle">
									</div>
									<div>
										文章內文：<fieldset>
											<textarea name="pContent" rows="6" id="summernote" placeholder="請輸入文章..."
												required></textarea>
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
							</section>
						</div>
			</div>
			<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>






				<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
				<%-- <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script> --%>
					<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
					<script>$(document).ready(function () {
							$('#summernote').summernote({
								height: 300,
								width: 800,
							});
						});</script>
					<!--右側彈跳式功能列 -->
					<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
						<!--版型需要的js-->
		</body>

		</html>