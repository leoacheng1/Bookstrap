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

				<label for="pPhoto">文章圖片:</label>
				<input type="file" id="pPhoto" multiple name="pPhoto" value=""><br>

				<input type="submit" value="送出更新" id="updatebtn" class="updatebtn">
			</form>

			<script>
				const updatecon = document.getElementsByClassName("updatebtn")

				for (i = 0; i < updatecon.length; i++) {
					updatecon[i].addEventListener('click', function (e) {
						e.preventDefault()

						const id = document.getElementById('pId').value
						const Title = document.getElementById('pTitle').value
						const Catagory = document.getElementById('pCatagory').value
						const Auther = document.getElementById('pAuther').value
						const Content = document.getElementById('pContent').value
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
		</body>



		</html>