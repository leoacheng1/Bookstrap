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
						<!-- 加入fullcalendar的CSS -->
						<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css'
							rel='stylesheet' />
						<link
							href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.print.min.css'
							rel='stylesheet' media='print' />
						<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
						<!-- 加入moment.js和fullcalendar.js庫 -->

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
										<h1>這是排班頁面</h1>
									</div>
									<section class="content">
										<!-- fullcalendar container -->
										<div id="calendar"></div>
										<div id="dialog" title="新增員工事件" style="display:none;">
											<form>
												<label for="employee-name">員工名稱</label>
												<select id="employee-name" name="employee-name"></select><br>
												<label for="start-date">起始日期</label>
												<input type="date" id="start-date" name="start-date"><br>
												<label for="start-time">起始時間</label>
												<select id="start-time" name="start-time"></select><br>
												<label for="end-date">截止日期</label>
												<input type="date" id="end-date" name="end-date"><br>
												<label for="end-time">截止時間</label>
												<select id="end-time" name="end-time"></select><br>
											</form>
										</div>




									</section>
								</div>
					</div>
					<!--右側彈跳式功能列 -->
					<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
						<!--版型需要的js-->
						<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>

							<script
								src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
							<script
								src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>

							<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

							<script>
								// 起始時間的下拉式選單
								var start_time_select = document.getElementById("start-time");
								for (var hour = 0; hour < 24; hour++) {
									for (var minute = 0; minute < 60; minute += 30) {
										var option = document.createElement("option");
										option.value = hour + ":" + (minute === 0 ? "00" : "30");
										option.text = hour + ":" + (minute === 0 ? "00" : "30");
										start_time_select.add(option);
									}
								}

								// 截止時間的下拉式選單
								var end_time_select = document.getElementById("end-time");
								for (var hour = 0; hour < 24; hour++) {
									for (var minute = 0; minute < 60; minute += 30) {
										var option = document.createElement("option");
										option.value = hour + ":" + (minute === 0 ? "00" : "30");
										option.text = hour + ":" + (minute === 0 ? "00" : "30");
										end_time_select.add(option);
									}
								}


								// 初始化 fullcalendar
								$(document).ready(function () {
									$('#calendar').fullCalendar({
										// 設定日曆樣式
										header: {
											left: 'prev,next today',
											center: 'title',
											right: 'month,basicWeek,basicDay'
										},
										defaultDate: new Date(),
										// 日历配置部分
										locale: 'zh-cn', //配置语言
										firstDay: 1,
										timezone: 'local',//时区
										displayEventEnd: true, //所有视图显示结束时间
										editable: true,
										// 开启更多链接/
										// eventLimit: true,
										// eventLimitText: "更多",
										dayMaxEvents: true,
										// contentHeight : 750, //设置日历主体内容的高度，不包括header部分，默认未设置，高度根据aspectRatio值自适应。
										aspectRatio: 1.5,//设置日历单元格宽度与高度的比例。
										editable: false,// 不允许拖动

										events: function (start, end, timezone, callback) {
											// 使用AJAX請求從後端獲取資料
											$.ajax({
												url: 'http://localhost:8080/Bookstrap/sempsche/showsche',
												dataType: 'json',
												success: function (response) {
													var events = response.map(function (schedule) {
														var eventObj = {
															start: schedule.startDate,
															end: schedule.endDate,
															scheduleId: schedule.scheduleId,
															scheduleEmpid: schedule.scheduleEmpid,
															scheduleEmpname: schedule.scheduleEmpname
														};
														if (schedule.vacation !== null) {
															eventObj.title = schedule.scheduleEmpname + '-' + schedule.vacation;
															eventObj.allDay = true;
															eventObj.color = 'red';
														} else {
															eventObj.title = schedule.scheduleEmpname;
														}
														return eventObj;
													});
													callback(events);
												}
											});
										},
										eventClick: function (calEvent, jsEvent, view) {
											// 將事件物件中的詳細資料顯示在彈出視窗或側邊欄中
											var popupContent = 'Title: ' + calEvent.title + '\n' +
												'Start: ' + moment(calEvent.start).format('YYYY-MM-DD hh:mm:ss') + '\n' +
												'End: ' + moment(calEvent.end).format('YYYY-MM-DD hh:mm:ss') + '\n' +
												'Schedule ID: ' + calEvent.scheduleId + '\n' +
												'Employee ID: ' + calEvent.scheduleEmpid + '\n' +
												'Employee Name: ' + calEvent.scheduleEmpname + '\n' +
												'All Day: ' + calEvent.allDay;
											alert(popupContent);
										},

										dayClick: function (date, jsEvent, view) {
											// 設定起始和截止時間的值為當天的日期
											var startDate = moment(date).format('YYYY-MM-DD');
											var endDate = moment(date).format('YYYY-MM-DD');

											// 將起始和截止時間的 input 標籤加上 readonly 屬性
											$('#start-date').attr('readonly', true).val(startDate);
											$('#end-date').attr('readonly', true).val(endDate);
											// 透過 AJAX 取得資料
											$.ajax({
												url: 'http://localhost:8080/Bookstrap/sempsche/showsemp',
												type: 'GET',
												dataType: 'json',
												success: function (data) {
													// 轉換成選項的 HTML 字串
													var optionsHtml = '';
													for (var i = 0; i < data.length; i++) {
														optionsHtml += '<option value="' + data[i].sempId + '">' + data[i].sempName + '</option>';
													}

													// 彈出對話框前，先清空下拉式選單的選項
													$('#employee-name').empty();

													// 將選項 HTML 字串加入到下拉式選單中
													$('#employee-name').html(optionsHtml);

													// 彈出對話框
													$('#dialog').dialog({
														title: '新增員工事件',
														modal: true,
														buttons: {
															"確定": function () {
																// 取得選擇的員工名稱和起始截止時間
																var employeeName = $('#employee-name').val();
																var startDate777 = $('#start-date').val();
																var endDate777 = $('#end-date').val();



																var startDate1 = new Date($('#start-date').val() + ' ' + $('#start-time').val());
																var endDate1 = new Date($('#end-date').val() + ' ' + $('#end-time').val());

																// var startDate1 = moment($('#start-date').val() + 'T' + $('#start-time').val(), 'YYYY-MM-DDTHH:mm').toDate();
																// var endDate1 = moment($('#end-date').val() + 'T' + $('#end-time').val(), 'YYYY-MM-DDTHH:mm').toDate();

																console.log(employeeName);
																console.log(startDate777);
																console.log(endDate777);
																console.log(startDate1);
																console.log(endDate1);
																var url = "http://localhost:8080/Bookstrap/sempsche/addsemp?scheduleEmpid=1&scheduleStartdate=" + encodeURIComponent(startDate1.toISOString()) + "&scheduleEnddate=" + encodeURIComponent(endDate1.toISOString());

																console.log(url);
																// 發送GET請求
																$.ajax({
																	url: url,
																	type: 'GET',
																	success: function (response) {
																		// 請求成功後，重新載入事件
																		$('#calendar').fullCalendar('refetchEvents');
																	},
																	error: function () {
																		// 請求失敗時的處理
																	}
																});

																// 關閉對話框
																$(this).dialog("close");
															},
															"取消": function () {
																$(this).dialog("close");
															}
														}
													});
												}
											});
										}

									});
								});



							</script>
				</body>


				</html>