<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../layout/AdminCss.jsp" />
<title>MemberAdmiMain</title>
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
</head>

<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %> 
<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>

<body
	class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">


	<div class="wrapper">

		<div class="content-wrapper">
			<div class="content-header">
				<!-- 標題位置 -->
				<h1>Hello World</h1>
			</div>
			<section class="content">
				<!-- 寫東西的地方 -->
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">Monthly Recap Report</h5>
						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse">
								<i class="fas fa-minus"></i>
							</button>
							<div class="btn-group">
								<button type="button" class="btn btn-tool dropdown-toggle"
									data-toggle="dropdown">
									<i class="fas fa-wrench"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right" role="menu">
									<a href="#" class="dropdown-item">Action</a> <a href="#"
										class="dropdown-item">Another action</a> <a href="#"
										class="dropdown-item">Something else here</a> <a
										class="dropdown-divider"></a> <a href="#"
										class="dropdown-item">Separated link</a>
								</div>
							</div>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>

					<div class="card-body">
						<div class="row">
							<div class="col-md-8">
								<p class="text-center">
									<strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
								</p>
								<div class="chart">
									<div class="chartjs-size-monitor">
										<div class="chartjs-size-monitor-expand">
											<div class=""></div>
										</div>
										<div class="chartjs-size-monitor-shrink">
											<div class=""></div>
										</div>
									</div>

									<canvas id="salesChart" height="225"
										style="height: 180px; display: block; width: 488px;"
										width="610" class="chartjs-render-monitor"></canvas>
								</div>

							</div>

							<div class="col-md-4">
								<p class="text-center">
									<strong>Goal Completion</strong>
								</p>
								<div class="progress-group">
									Add Products to Cart <span class="float-right"><b>160</b>/200</span>
									<div class="progress progress-sm">
										<div class="progress-bar bg-primary" style="width: 80%"></div>
									</div>
								</div>

								<div class="progress-group">
									Complete Purchase <span class="float-right"><b>310</b>/400</span>
									<div class="progress progress-sm">
										<div class="progress-bar bg-danger" style="width: 75%"></div>
									</div>
								</div>

								<div class="progress-group">
									<span class="progress-text">Visit Premium Page</span> <span
										class="float-right"><b>480</b>/800</span>
									<div class="progress progress-sm">
										<div class="progress-bar bg-success" style="width: 60%"></div>
									</div>
								</div>

								<div class="progress-group">
									Send Inquiries <span class="float-right"><b>250</b>/500</span>
									<div class="progress progress-sm">
										<div class="progress-bar bg-warning" style="width: 50%"></div>
									</div>
								</div>

							</div>

						</div>

					</div>

					<div class="card-footer">
						<div class="row">
							<div class="col-sm-3 col-6">
								<div class="description-block border-right">
									<span class="description-percentage text-success"><i
										class="fas fa-caret-up"></i> 17%</span>
									<h5 class="description-header">$35,210.43</h5>
									<span class="description-text">TOTAL REVENUE</span>
								</div>

							</div>

							<div class="col-sm-3 col-6">
								<div class="description-block border-right">
									<span class="description-percentage text-warning"><i
										class="fas fa-caret-left"></i> 0%</span>
									<h5 class="description-header">$10,390.90</h5>
									<span class="description-text">TOTAL COST</span>
								</div>

							</div>

							<div class="col-sm-3 col-6">
								<div class="description-block border-right">
									<span class="description-percentage text-success"><i
										class="fas fa-caret-up"></i> 20%</span>
									<h5 class="description-header">$24,813.53</h5>
									<span class="description-text">TOTAL PROFIT</span>
								</div>

							</div>

							<div class="col-sm-3 col-6">
								<div class="description-block">
									<span class="description-percentage text-danger"><i
										class="fas fa-caret-down"></i> 18%</span>
									<h5 class="description-header">1200</h5>
									<span class="description-text">GOAL COMPLETIONS</span>
								</div>

							</div>
						</div>

					</div>

				</div>
			</section>
		</div>
	</div>



	<!-- ///////////////////////js//////////////// -->
		<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>