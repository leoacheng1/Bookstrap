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
										文章標題： <input type="text" id="pTitle" name="pTitle">
									</div>
									<div>
										文章內文：<fieldset>
											<textarea name="pContent" id="summernote" placeholder="請輸入文章..."
												required></textarea>
										</fieldset>
									</div>
									<div>
										文章作者： <input type="text" id="pAuther" name="pAuther">
									</div>
									<div>
										文章分類： <input type="text" id="pCatagory" name="pCatagory">
									</div>
									<div>
										文章圖片： <input type="file" multiple id="pPhoto" multiple name="pPhoto">
									</div>
									<div>
										<button type="submit">送出</button>
									</div>

								</form>
								<div>
									<button id="farmPara" onclick="fillIt()">生成農場文章</button>
								</div>
							</section>
						</div>
			</div>
			<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
				<!--右側彈跳式功能列 -->
				<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
					<!--版型需要的js-->
					<script>
						function fillIt() {
							var field1 = document.getElementById("pTitle"); // 取得欄位1的 DOM 元素
							// var field2 = document.getElementById("summernote"); // 取得欄位2的 DOM 元素
							// var field2 = document.querySelector(".note-editable")
							// 取得其他欄位的 DOM 元素...
							$("#summernote").summernote("code", '<p>這是一篇超讚的農場文章<br><img src="https://i.imgur.com/MUHat4D.png" style="width: 185px;"></p>');
							var field3 = document.getElementById("pAuther");
							var field4 = document.getElementById("pCatagory");

							var fieldValue1 = "範例農場文章"; // 取得欄位1的內容
							var fieldValue2 = "<p>這是一篇超讚的農場文章<br></p>"; // 取得欄位2的內容
							// 取得其他欄位的內容...
							var fieldValue3 = "作者超讚";
							var fieldValue4 = "好書指南";

							field1.value = fieldValue1; // 將欄位1的值設為 fieldValue1
							// field2.innerHTML = fieldValue2; // 將欄位2的值設為 fieldValue2
							// 設定其他欄位的值...
							field3.value = fieldValue3;
							field4.value = fieldValue4;
						}

					</script>




					<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
					<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
					<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
					<%-- <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script> --%>
						<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
						<script>$(document).ready(function () {
								$('#summernote').summernote({
									height: 600,
									width: 1000,
								});
							});</script>


		</body>

		</html>