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
							<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/employeesidebar.jsp" %>
								<div class="content-wrapper">
									<div class="content-header">
										<!-- 標題位置 -->
										<h1>假單申請</h1>
									</div>
									<section class="content">
										<!-- 寫東西的地方 -->
										<div class="container mt-5">
											<div class="row justify-content-center">
												<div class="col-md-6">
													<form action="${contextRoot}/sempsatt/insert" method="post">
														<div class="form-group">
															<label for="attStartDate">請假起始日期:</label>
															<input type="date" class="form-control" id="attStartDate"
																name="attStartDate">
														</div>
														<div class="form-group">
															<label for="attEndDate">請假截止日期:</label>
															<input type="date" class="form-control" id="attEndDate"
																name="attEndDate">
														</div>
														<div class="form-group">
															<label for="attVacation">請假假別:</label>
															<select class="form-control" id="attVacation"
																name="attVacation">
																<option selected value="特休">特休</option>
																<option value="事假">事假</option>
																<option value="病假">病假</option>
																<option value="喪假">喪假</option>
																<option value="生理假">生理假</option>
															</select>
														</div>
														<div class="form-group">
															<label for="attReason">請假事由:</label>
															<input type="text" class="form-control" id="attReason"
																name="attReason">
														</div>
														<div class="form-group">
															<label for="attTime">請假時數:</label>
															<input type="number" class="form-control" id="attTime"
																name="attTime" step="1">
														</div>
														<input type="hidden" id="attSempid" name="attSempid"
															value="${empId}">
														<input type="hidden" id="attAgree" name="attAgree" value="已提交">
														<button type="submit" class="btn btn-primary">提交假單</button>
													</form>
												</div>
											</div>
										</div>
									</section>
								</div>
					</div>
					<!--右側彈跳式功能列 -->
					<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/employeecontroll.jsp" %>
						<!--版型需要的js-->
						<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
				</body>

				</html>