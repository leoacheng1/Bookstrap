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
<!-- 加入fullcalendar的CSS -->
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<!-- 加入moment.js和fullcalendar.js庫 -->

</head>

<body
	class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
	<div class="wrapper">
		<!--上面導覽列 -->
		<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp"%>
		<!-- 左邊導覽列 -->
		<%@ include
			file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp"%>
		<div class="content-wrapper">
			<div class="content-header">
				<!-- 標題位置 -->
				<h1>這是排班頁面</h1>
			</div>
			<section class="content">
				<!-- fullcalendar container -->
				<!-- 				<div id="calendar"></div> -->
				<table>
					<tr>
						<th>排班編號</th>
						<th>員工編號</th>
						<th>起始</th>
						<th>結束</th>
						<th>假期</th>
					</tr>
					<jstl:forEach items="${sempsche}" var="sempsche">
						<tr>
							<td>${sempsche.scheduleId}</td>
							<td>${sempsche.scheduleEmpid}</td>
							<td>${sempsche.scheduleStartdate}</td>
							<td>${sempsche.scheduleEnddate}</td>
							<td>${sempsche.scheduleVacation}</td>
						</tr>

					</jstl:forEach>
				</table><br/>
				<table>
					<tr>
						<th>排班編號</th>
						<th>員工編號</th>
						<th>起始</th>
						<th>結束</th>
						<th>假期</th>
					</tr>
					<jstl:forEach items="${sempsche}" var="sempsche">
						<tr>
							<td>${sempsche.scheduleId}</td>
							<td>${sempsche.scheduleSemps.empId}</td>
							<td>${sempsche.scheduleStartdate}</td>
							<td>${sempsche.scheduleEnddate}</td>
							<td>${sempsche.scheduleVacation}</td>
						</tr>

					</jstl:forEach>
				</table>
			</section>
		</div>
	</div>
	<!--右側彈跳式功能列 -->
	<%@ include
		file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp"%>
	<!--版型需要的js-->
	<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp"%>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>

	<script>
		// 初始化 fullcalendar
		$(document).ready(function() {
			$('#calendar').fullCalendar({
				// 設定日曆樣式
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,basicWeek,basicDay'
				},
				defaultDate : new Date(),
				// 日历配置部分
				locale : 'zh-cn', //配置语言
				firstDay : 1,
				timezone : 'local',//时区
				displayEventEnd : true, //所有视图显示结束时间
				editable : true,
				// 开启更多链接/
				eventLimit : true,
				eventLimitText : "更多",
				dayMaxEvents : true,
				contentHeight : 750, //设置日历主体内容的高度，不包括header部分，默认未设置，高度根据aspectRatio值自适应。
				aspectRatio : 1.5,//设置日历单元格宽度与高度的比例。
				editable : false,// 不允许拖动
				eventClick : function(event) {
					//单击已有日程安排
				},
				// 事件資料
				events : [ {
					title : 'Event 1',
					start : '2023-03-05T12:30:00',
					end : '2023-03-05T14:30:00',
				}, {
					title : 'Event 2',
					start : '2023-03-08T14:30:00',
					end : '2023-03-08T16:30:00',
				} ]
			});
		});
	</script>
</body>


</html>