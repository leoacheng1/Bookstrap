<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Welcome</title>
<!--版型需要的css -->
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp"%>
</head>

<body
	class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
	<div class="wrapper">
		<!--上面導覽列 -->
		<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp"%>
		<!-- 左邊導覽列 -->
		<%@ include
			file="/WEB-INF/jsp/backend/layout/sidebar/employeesidebar.jsp"%>
		<div class="content-wrapper">
			<div class="content-header">
				<!-- 標題位置 -->
				<h1>我的假單</h1>
			</div>
			<section class="content">
				<!-- 寫東西的地方 -->
				<table>
					<tr>
						<th>請假起始日期</th>
						<th>請假截止日期</th>
						<th>請假假別</th>
						<th>請假事由</th>
						<th>請假時數</th>
						<th>核准狀態</th>
					</tr>
					<jstl:forEach items="${seatbyid}" var="seatbyid">
						<tr>

							<%-- 				<td>${seatbyid.attSemps.empId}</td> --%>
							<%-- 				<td>${seatbyid.attSemps.empName}</td> --%>
							<td>${seatbyid.attStartDate}</td>
							<td>${seatbyid.attEndDate}</td>
							<td>${seatbyid.attVacation}</td>
							<td>${seatbyid.attReason}</td>
							<td>${seatbyid.attTime}</td>
							<td>${seatbyid.attAgree}</td>
						</tr>

					</jstl:forEach>
				</table>
			</section>
		</div>
	</div>
	<!--右側彈跳式功能列 -->
	<%@ include
		file="/WEB-INF/jsp/backend/layout/controllsidebar/employeecontroll.jsp"%>
	<!--版型需要的js-->
	<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp"%>
</body>

</html>