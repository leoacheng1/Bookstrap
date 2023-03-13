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
											<form id="event-form">
												<div class="form-row">
													<div class="form-group col-md-4">
														<label for="employee-name">員工名稱</label>
														<select class="form-control" id="employee-name"
															name="employee-name"></select>
													</div>
													<div class="form-group col-md-4">
														<label for="start-date">起始日期</label>
														<input class="form-control" type="date" id="start-date"
															name="start-date">
													</div>
													<div class="form-group col-md-4">
														<label for="start-time">起始時間</label>
														<select class="form-control" id="start-time"
															name="start-time"></select>
													</div>

												</div>
												<div class="form-row">

													<div class="form-group col-md-4">
														<label for="end-date">截止日期</label>
														<input class="form-control" type="date" id="end-date"
															name="end-date">
													</div>
													<div class="form-group col-md-4">
														<label for="end-time">截止時間</label>
														<select class="form-control" id="end-time"
															name="end-time"></select>
													</div>
													<div class="form-group col-md-4">
														<label for="is-leave-requested">是否申請假別？</label>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																id="is-leave-requested-yes" name="is-leave-requested"
																value="yes">
															<label class="form-check-label"
																for="is-leave-requested-yes">是</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																id="is-leave-requested-no" name="is-leave-requested"
																value="no" checked>
															<label class="form-check-label"
																for="is-leave-requested-no">否</label>
														</div>
													</div>
												</div>
												<div class="form-row" id="leave-type" style="display:none;">
													<div class="form-group col-md-6">
														<label for="leave-type-select">假別</label>
														<select class="form-control" id="leave-type-select"
															name="leave-type-select">
															<option selected="selected" value=""></option>
															<option value="休假">休假</option>
															<option value="病假">病假</option>
															<option value="特休">特休</option>
														</select>
													</div>
												</div>
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
								document.querySelectorAll('input[name="is-leave-requested"]').forEach(function (el) {
									el.addEventListener('change', function () {
										if (document.getElementById('is-leave-requested-yes').checked) {
											document.getElementById('leave-type').style.display = 'block';
										} else {
											document.getElementById('leave-type').style.display = 'none';
										}
									});
								});
								// $('input[name="is-leave-requested"]').change(function () {
								// 	// 如果選擇否
								// 	if ($(this).val() == "no") {
								// 		// 將假別選擇框的值設為空
								// 		$('#leave-type-select').val("");
								// 		console.log($('#leave-type-select').val(""));
								// 	}
								// });
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
										// defaultDate: new Date(),
										defaultDate: "2023-04-01",
										// 日历配置部分
										locale: 'zh-cn', //配置语言
										firstDay: 1,
										timezone: 'local',//时区
										displayEventEnd: true, //所有视图显示结束时间
										dayMaxEvents: true,
										aspectRatio: 1.5,//设置日历单元格宽度与高度的比例。
										editable: true,

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
											var popupContent = 'Title: ' + calEvent.title + '<br>' +
												'Start: ' + moment(calEvent.start).format('YYYY-MM-DD hh:mm:ss') + '<br>' +
												'End: ' + moment(calEvent.end).format('YYYY-MM-DD hh:mm:ss') + '<br>' +
												'Schedule ID: ' + calEvent.scheduleId + '<br>' +
												'Employee ID: ' + calEvent.scheduleEmpid + '<br>' +
												'Employee Name: ' + calEvent.scheduleEmpname + '<br>' +
												'All Day: ' + calEvent.allDay;

											// 建立 modal
											var modal = $('<div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label" aria-hidden="true">' +
												'<div class="modal-dialog" role="document">' +
												'<div class="modal-content">' +
												'<div class="modal-header">' +
												'<h5 class="modal-title" id="event-modal-label">詳細資訊</h5>' +
												'<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
												'<span aria-hidden="true">×</span>' +
												'</button>' +
												'</div>' +
												'<div class="modal-body">' +
												popupContent +
												'</div>' +
												'<div class="modal-footer">' +
												'<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>' +
												'<button type="button" class="btn btn-danger" id="delete-event-btn">刪除</button>' +
												'</div>' +
												'</div>' +
												'</div>' +
												'</div>');

											// 註冊刪除按鈕的點擊事件
											modal.find('#delete-event-btn').on('click', function () {
												// 發送 GET 請求
												alert('您即將刪除這筆資料');
												var deleteurl = "http://localhost:8080/Bookstrap/sempsche/deletesemp?scheduleId=" + calEvent.scheduleId
												$.ajax({
													url: deleteurl,
													type: 'GET',
													success: function (response) {
														// 成功刪除事件
														alert(response)
														$('#calendar').fullCalendar('refetchEvents'); // 重新載入日曆資料
														modal.modal('hide'); // 關閉 modal
													},
													error: function (xhr, status, error) {
														// 刪除事件失敗
														alert('刪除失敗');
													}
												});
											});

											// 顯示 modal
											modal.modal('show');
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
														width: 500,   // 設置寬度為500像素
														height: 400,   // 設置高度為400像素
														close: function () {
															$('#event-form')[0].reset();
														},
														buttons: {
															"確定": function () {

																// 取得選擇的員工名稱和起始截止時間
																var employeeName = $('#employee-name').val();
																var startDate777 = $('#start-date').val();
																var endDate777 = $('#end-date').val();
																var scheduleVacation = $('#leave-type-select').val();



																var startDate1 = $('#start-date').val() + ' ' + $('#start-time').val();
																var endDate1 = $('#end-date').val() + ' ' + $('#end-time').val();

																console.log(employeeName);
																console.log(startDate777);
																console.log(endDate777);
																console.log(startDate1);
																console.log(endDate1);
																console.log('靠杯阿' + scheduleVacation);
																var url = "http://localhost:8080/Bookstrap/sempsche/addsemp?scheduleEmpid=" + employeeName
																	+ "&scheduleStartdate=" + startDate1 + "&scheduleEnddate=" + endDate1 + "&scheduleVacation=" + scheduleVacation;

																console.log(url);
																$('#event-form')[0].reset();
																// 發送GET請求
																$.ajax({
																	url: url,
																	type: 'GET',
																	success: function (response) {
																		// 請求成功後，重新載入事件
																		alert(response)
																		$('#event-form')[0].reset();
																		$('#calendar').fullCalendar('refetchEvents');
																	},
																	error: function () {
																		// 請求失敗時的處理
																		$('#event-form')[0].reset();
																	}
																});

																// 關閉對話框
																$(this).dialog("close");
																$('#event-form')[0].reset();
															},
															"取消": function () {
																$(this).dialog("close");
																$('#event-form')[0].reset();
															}
														}
													});
												}
											});
										},


									});
								});



							</script>
				</body>


				</html>