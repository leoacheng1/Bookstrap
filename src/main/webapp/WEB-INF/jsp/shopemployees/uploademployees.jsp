<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Welcome</title>
					<!--版型需要的css -->
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
										<h1>修改員工資料</h1>
									</div>
									<section class="content">
										<!-- 寫東西的地方 -->
										<form:form action="${contextRoot}/semps/upload" modelAttribute="shopemployees"
											method="put" enctype="multipart/form-data">

											<form:input type="hidden" path="empId" />

											<div class="container mt-5">
												<div class="row justify-content-center">
													<div class="col-md-6">

														<div class="form-group">
															<label for="shop-id">員工分店</label>
															<form:select id="shop-id" class="form-control"
																path="shop.id">
																<jstl:forEach items="${shopid}" var="shopid">
																	<option value="${shopid.id}">${shopid.shopName}
																	</option>
																</jstl:forEach>
															</form:select>
														</div>

														<div class="form-group">
															<label for="emp-name">員工姓名</label>
															<form:input id="emp-name" class="form-control"
																path="empName" />
														</div>

														<div class="form-group">
															<label for="emp-photo">員工照片</label>
															<div class="custom-file">
																<form:input type="file" class="custom-file-input"
																	id="emp-photo" path="empPhoto" />
																<label class="custom-file-label"
																	for="emp-photo">選擇檔案</label>
																<button id="deletePhotoBtn" type="button"
																	style="display: none;">刪除照片</button>
																<div id="preview">
																	<img id="previewImg" width="100">
																</div>
																<div id="default-photo" style="display:none;">
																	<img src="${contextRoot}/sempsphoto/id?id=${shopemployees.empId}"
																		width="100">
																</div>
																<br />
															</div>
														</div>

														<div class="form-group">
															<label for="emp-salary">員工薪資</label>
															<form:input id="emp-salary" class="form-control"
																path="empSalary" />
														</div>

														<div class="form-group">
															<label for="emp-title">員工職稱</label>
															<form:input id="emp-title" class="form-control"
																path="empTitle" />
														</div>

														<button type="submit" class="btn btn-primary">修改送出</button>

													</div>
												</div>
											</div>

										</form:form>

										<script type="text/javascript"
											src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
										<script type="text/javascript"
											src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js"></script>
										<script type="text/javascript">
											$(document).ready(function () {
												// 設置預設圖片可見
												$('#preview img').hide();
												$('#default-photo').show();

												// 當選擇檔案時顯示預覽圖像
												$('input[type=file]').change(function () {
													var file = this.files[0];
													var reader = new FileReader();
													reader.onload = function (e) {
														$('#preview img').attr('src', e.target.result);
														$('#preview img').show();
														$('#default-photo').hide();
														$('#deletePhotoBtn').show();
													}
													reader.readAsDataURL(file);
												});

												// 當按下刪除照片按鈕時清除檔案和預覽圖像
												$('#deletePhotoBtn').click(function () {
													$('input[type=file]').val('');
													$('#preview img').attr('src', '${contextRoot}/sempsphoto/id?id=${shopemployees.empId}');
													$('#preview img').hide();
													$('#default-photo').show();
												});
											});

										</script>

									</section>
								</div>
					</div>
					<!--右側彈跳式功能列 -->
					<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
						<!--版型需要的js-->
						<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
				</body>

				</html>