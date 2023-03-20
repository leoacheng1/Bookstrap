<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<li class="nav-item"><a href="pages/calendar.html" class="nav-link">
		<i class="nav-icon fas fa-calendar-alt"></i>
		<p>
			首頁 <span class="badge badge-info right"></span>
		</p>

</a></li>
<li class="nav-header">個人功能</li>
	  <li class="nav-item">
		<a href="#" class="nav-link">
		  <i class="nav-icon far fa-envelope"></i>
		  <p>
			個人信箱
			<i class="fas fa-angle-left right"></i>
		  </p>
		</a>
		<ul class="nav nav-treeview">
		  <li class="nav-item">
			<a href="/Bookstrap/backend/mailpage/mailbox/folder/inbox" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>收件夾</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="/Bookstrap/backend/mailpage/composemail" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>撰寫郵件</p>
			</a>
		  </li>
		</ul>
	  </li>

<li class="nav-header">員工使用介面</li>

<li class="nav-item"><a href="#" class="nav-link"> <i
		class="nav-icon fa fa-laptop"></i>
		<p>
			系統功能 <i class="fas fa-angle-left right"></i>
		</p>
</a>
	<ul class="nav nav-treeview" style="display: none;">
		<li class="nav-item"><a href="${contextRoot}/sempsatt/insertpage"
			class="nav-link"> <i class="far fa-circle nav-icon"></i>
				<p>假單申請</p>
		</a></li>
		<li class="nav-item"><a
			href="${contextRoot}/sempsatt/myvacationpage?empId=${empId}"
			class="nav-link"> <i class="far fa-circle nav-icon"></i>
				<p>我的出勤</p>
		</a></li>
	</ul></li>