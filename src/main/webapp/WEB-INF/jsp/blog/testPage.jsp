<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>blog後台首頁</title>
			<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script type="text/javascript">
				function showTable() {
					$.ajax({
						type: "POST",
						url: "table.php",
						success: function (data) {
							$('#tableContainer').html(data);
						}
					});
				}
			</script>
		</head>

		<body>
			<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
			<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
			<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
			<div id="dataHome">
			</div>

			<script type="text/javascript">
				fetch("${contextRoot}/blog/getAllBlogParagraph", { method: "POST" }).then(rs => rs.json()).then(function (data) {

					let outPutString = "";
					outPutString += "<table>文章標題："
						+ '<thead>'
						+ '<th>文章標題</th>'
						+ '<th>文章內文</th>'
						// + '<th>圖片</th>'
						+ '<th>刪除</th>'
						+ '<th>修改</th>'
						+ '</thead>'
					for (let item of data) {

						let string = item.paragraphContent
						let index = string.indexOf("，"); // 查找逗號的位置
						let substring = string.substring(0, index); // 提取從開頭到逗號的子串
						console.log(substring);




						outPutString += "<tbody>"
							+ '<td>' + item.paragraphTitle + '</td>'
							+ '<td>' + substring + '</td>'
							// + '<td><img  src=" " '+  +'</td>'
							+ '<td><button name=delebtn  data-id=' + item.paragraphId + '>刪除</button></td>'
							+ '<td><a href= "http://localhost:8080/Bookstrap/blog/getParaById?id=' + item.paragraphId + '"><button name="updatebtn" type="button" data-id=' + item.paragraphId + '> 修改</button></a></td>'
							+ '</tbody>'


					}

					document.getElementById("dataHome").innerHTML = outPutString
					const delecon = document.getElementsByName("delebtn")
					for (let i = 0; i < delecon.length; i++) {
						delecon[i].addEventListener('click', function (e) {
							let id = this.getAttribute('data-id');
							console.log(id);
							deleteById(id);
						})
					}
				})


				function deleteById(id) {
					axios({
						url: "http://localhost:8080/Bookstrap/blog/deleteParaById",
						method: "delete",

						params: { id: id }
					})
						.then(res => {
							console.log('delete成功')
							window.location.href = 'http://localhost:8080/Bookstrap/blog/backIndex'
						})

						.catch(err => {
							console.log(err)
						})
				}
			</script>

			<!--table test-->
			<button onclick="showTable()">Show Table</button>
			<div id="tableContainer"></div>




			<!--table test end-->










			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				Launch demo modal
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">新增文章</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							...
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
				</div>
			</div>
		</body>



		</html>