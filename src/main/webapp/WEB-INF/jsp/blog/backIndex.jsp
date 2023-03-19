<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>blog後台首頁</title>
			<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
			<link rel="stylesheet" href="${contextRoot}/css/blog.css" />
			<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
		</head>

		<body
			class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
			<div class="wrapper">

				<!--上面導覽列 -->
				<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
					<!-- 左邊導覽列 -->
					<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>

						<div class="content-wrapper">
							<div class="content-header">
								<!-- 標題位置 -->
								<div style="text-align:center;">
									<h1>後台首頁</h1>
								</div>
							</div>
							<section class="content">
								<!-- 寫東西的地方 -->
								<!-- <div>
									<textarea name="searching" rows="1" id="searching" placeholder="請輸入關鍵字..."
										required></textarea>
								</div> -->
								<div id="dataHome"></div>
								<!-- Button trigger modal
								<button type="button" class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#exampleModal">Launch demo modal</button> -->
							</section>
						</div>
			</div>
			<!--右側彈跳式功能列 -->
			<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
				<!--版型需要的js-->
				<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>

					<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>








					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">新增文章</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">...</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save changes</button>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						fetch("${contextRoot}/blog/getAllBlogParagraph", { method: "POST" }).then(rs => rs.json()).then(function (data) {
							console.log(data)
							let outPutString = "";
							outPutString += "<div class=mtable>"
								+ "<table>"
								+ '<thead>'
								+ '<th class=tth>文章標題</th>'
								+ '<th class=tth>文章內文</th>'
								// + '<th>圖片</th>'
								+ '<th class=deletepara danger>刪除</th>'
								+ '<th class=tth2>修改</th>'
								+ '<th class=tth2>是否顯示</th>'
								+ '</thead>'
							for (let item of data) {

								let string = item.paragraphContent
								let index = string.indexOf("，"); // 查找逗號的位置
								let substring = index == -1 ? string.substring(0) : string.substring(0, index);
								// 提取從開頭到逗號的子串
								let showOrNot = item.isThisParaShow;
								console.log(substring);




								outPutString += "<tbody>"
									+ '<td>' + item.paragraphTitle + '</td>'
									+ '<td>' + substring + '</td>'
									// + '<td><img  src=" " '+  +'</td>'
									+ '<td><button name=delebtn  data-id=' + item.paragraphId + '>刪除</button></td>'
									+ '<td><a href= "http://localhost:8080/Bookstrap/blog/getParaById?id=' + item.paragraphId + '"><button name="updatebtn" type="button" data-id=' + item.paragraphId + '> 修改</button></a></td>'
									+ '<td><input type="checkbox" name="showOrNot"  data-id=' + item.paragraphId + ' ' + (showOrNot == 1 ? "checked" : "") + '></td>'
									+ '</tbody>'

							}
							outPutString += "</table>"
								+ "</div>"

							document.getElementById("dataHome").innerHTML = outPutString



							const delecon = document.getElementsByName("delebtn")
							for (let i = 0; i < delecon.length; i++) {
								delecon[i].addEventListener('click', function (e) {
									let id = this.getAttribute('data-id');
									console.log(id);
									deleteById(id);
								})
							}


							const checkboxcon = document.getElementsByName("showOrNot")
							for (let i = 0; i < checkboxcon.length; i++) {
								checkboxcon[i].addEventListener('click', checkboxClicked);
							}

						})


						function checkboxClicked() {
							let piD = $(this).attr("data-id");
							if (this.checked) {
								axios.put("http://localhost:8080/Bookstrap/blog/showPara/" + piD + "/1");
								console.log('Checkbox is checked!');
							} else {
								axios.put("http://localhost:8080/Bookstrap/blog/showPara/" + piD + "/0");
								console.log('Checkbox is not checked!');
							}
						}

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
		</body>



		</html>