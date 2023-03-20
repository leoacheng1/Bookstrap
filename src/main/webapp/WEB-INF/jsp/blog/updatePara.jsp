<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>更新頁面</title>


			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
				<link rel="stylesheet" href="${contextRoot}/css/blog.css" />
		</head>

		<body
			class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">


			<!--上面導覽列 -->
			<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
				<!-- 左邊導覽列 -->
				<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
					<div class="wrapper">
						<div class="content-wrapper">
							<div class="content-header">
								<!-- 標題位置 -->

							</div>
							<section class="content">
								<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
								<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
								<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>

								<form action="${contextRoot}/blog/getParaById" method="GET" modelAttribute="updateBlog">

									<input type="hidden" id="pId" name="id" value="${updateBlog.paragraphId}"><br>

									<label for="pTitle">文章標題:</label>
									<input type="text" id="pTitle" name="pTitle"
										value="${updateBlog.paragraphTitle}"><br>

									<label for="pCatagory">文章類別:</label>
									<input type="text" id="pCatagory" name="pCatagory"
										value="${updateBlog.paragraphCatagory}"><br>

									<label for="pAuther">文章作者:</label>
									<input type="text" id="pAuther" name="pAuther"
										value="${updateBlog.paragraphAuther}"><br>


									<div>
										文章內文：<fieldset>
											<textarea name="pContent" rows="6"
												id="summernote">${updateBlog.paragraphContent}</textarea>
										</fieldset>
									</div>
									<!-- <label for="pContent">文章內文:</label>
				<input type="text" id="pContent" name="pContent" value="${updateBlog.paragraphContent}"><br> -->

									<label for="pPhoto">文章圖片:</label>
									<input type="file" id="pPhoto" multiple name="pPhoto" value=""><br>

									<input type="submit" value="送出更新" id="updatebtn" class="updatebtn">
								</form>
							</section>
						</div>
					</div>




					<script>
						const updatecon = document.getElementsByClassName("updatebtn")
						for (i = 0; i < updatecon.length; i++) {
							updatecon[i].addEventListener('click', function (e) {
								e.preventDefault()
								const id = document.getElementById('pId').value
								const Title = document.getElementById('pTitle').value
								const Catagory = document.getElementById('pCatagory').value
								const Auther = document.getElementById('pAuther').value
								const Content = document.getElementsByClassName('note-editable')[0].innerHTML;
								const Photo = document.getElementById('pPhoto').files
								console.log(id, Title, Catagory, Auther, Content, Photo)
								let form = new FormData()
								form.append("id", id)
								form.append("pTitle", Title)
								form.append("pCatagory", Catagory)
								form.append("pAuther", Auther)
								form.append("pContent", Content)
								for (let i = 0; i < Photo.length; i++) {
									form.append("pPhoto", Photo[i])
								}
								axios({
									url: "http://localhost:8080/Bookstrap/blog/updatePara",
									method: "put",
									data: form,
									headers: { "Content-Type": "multipart/form-data" }
								})
									.then(res => {
										console.log('更新成功')
										window.location.href = 'http://localhost:8080/Bookstrap/blog/backIndex'
									})
									.catch(err => {
										console.log(err)
									})
							})
						}
					</script>
					<!--右側彈跳式功能列 -->
					<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
						<!--版型需要的js-->
						<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
							<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>



							<script
								src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
							<script>$(document).ready(function () {
									$('#summernote').summernote({
										height: 300,
										width: 800,
									});
								});</script>




		</body>



		</html>