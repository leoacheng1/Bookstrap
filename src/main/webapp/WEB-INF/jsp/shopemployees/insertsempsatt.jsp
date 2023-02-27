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
				<h1>假單申請</h1>
			</div>
			<section class="content">
				<!-- 寫東西的地方 -->
				<form action="${contextRoot}/sempsatt/insert" method="post">
					<label for="attSempid"></label> <input type="hidden"
						id="attSempid" name="attSempid" value="${empId}">
					<br> <label for="attDate">請假日期:</label> <input type="date"
						id="attDate" name="attDate"><br>
					<br> <label for="attVacation">請假假別:</label> <input type="text"
						id="attVacation" name="attVacation"><br>
					<br> <label for="">請假事由:</label> <input type="text"
						id="attReason" name="attReason"><br>
					<br> <label for="attTime">請假時數:</label> <input type="number"
						id="attTime" name="attTime" step="1"><br>
					<br> <label for="attAgree"></label> <input type="hidden"
						id="attAgree" name="attAgree" value="已提交"> <input
						type="submit" value="提交假單">
				</form>
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