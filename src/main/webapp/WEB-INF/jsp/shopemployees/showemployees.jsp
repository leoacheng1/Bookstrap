<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>這是所有員工頁面</title>
				</head>

				<body>

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
											<h1>員工管理</h1>
										</div>
										<section class="content">
											<!-- 寫東西的地方 -->
											<div class="table-responsive">
												<table class="table table-bordered table-hover">
													<thead class="thead-dark">
														<tr>
															<th>員工編號</th>
															<th>員工分店</th>
															<th>員工姓名</th>
															<th>員工照片</th>
															<th>員工薪資</th>
															<th>員工職稱</th>
															<th>編輯</th>
															<th>刪除</th>
														</tr>
													</thead>
													<tbody>
														<jstl:forEach items="${empList}" var="showemp">
															<tr>
																<td>${showemp.empId}</td>
																<td>${showemp.shop.shopName}</td>
																<td>${showemp.empName}</td>
																<td><img width="100px" class="img-thumbnail"
																		src="${contextRoot}/sempsphoto/id?id=${showemp.empId}">
																</td>
																<td>${showemp.empSalary}</td>
																<td>${showemp.empTitle}</td>
																<td>
																	<form action="${contextRoot}/semps/upload"
																		method="get">
																		<input name="id" type="hidden"
																			value="${showemp.empId}" />
																		<button type="submit"
																			class="btn btn-info btn-sm">編輯</button>
																	</form>
																</td>
																<td>
																	<form action="${contextRoot }/semps/delete"
																		method="post"
																		onsubmit="return confirm('確定刪除此員工？');">
																		<input name="_method" type="hidden"
																			value="delete" />
																		<input name="id" type="hidden"
																			value="${showemp.empId}" />
																		<button type="submit"
																			class="btn btn-danger btn-sm">刪除</button>
																	</form>
																</td>
															</tr>
														</jstl:forEach>
													</tbody>
												</table>
											</div>
										</section>
									</div>
						</div>
						<!--右側彈跳式功能列 -->
						<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
							<!--版型需要的js-->
							<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
					</body>

				</html>