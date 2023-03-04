<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

>>>>>>> 3788dcbefa42de2030c5cdecfd9bc4ed20661aca
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
	<li class="nav-item">
	  <a href="${contextRoot}/backend/index" class="nav-link">
		<i class="nav-icon fas fa-calendar-alt"></i>
		<p>
		  首頁
		  <span class="badge badge-info right"></span>
		</p>

	  </a>
	</li>
	<li class="nav-header">商城管理</li>
	<li class="nav-item">
		<a href="pages/calendar.html" class="nav-link">
		  <i class="nav-icon fas fa-calendar-alt"></i>
		  <p>
			功能
			<span class="badge badge-info right"></span>
		  </p>
  
		</a>
	  </li>	
	<li class="nav-item">
	  <a href="#" class="nav-link">
		<i class="nav-icon fas fa-table"></i>
		<p>
		  商城管理
		  <i class="fas fa-angle-left right"></i>
		</p>
	  </a>
	  <ul class="nav nav-treeview" style="display: none;">
		<li class="nav-item">
		  <a href="${contextRoot}/books/page" class="nav-link">
			<i class="far fa-circle nav-icon"></i>
			<p>所有書籍</p>
		  </a>
		</li>
		<li class="nav-item">
		  <a href="${contextRoot}/books/add" class="nav-link">
			<i class="far fa-circle nav-icon"></i>
			<p>新增書籍</p>
		  </a>
		</li>
		<li class="nav-item">
		  <a href="pages/tables/jsgrid.html" class="nav-link">
			<i class="far fa-circle nav-icon"></i>
			<p>功能3</p>
		  </a>
		</li>
	  </ul>
	</li>
	<li class="nav-header">會員管理</li>
	<li class="nav-item">
		<a href="pages/calendar.html" class="nav-link">
		  <i class="nav-icon fas fa-calendar-alt"></i>
		  <p>
			功能
			<span class="badge badge-info right"></span>
		  </p>
  
		</a>
	  </li>	
	<li class="nav-item">
		<a href="#" class="nav-link">
		  <i class="nav-icon fas fa-table"></i>
		  <p>
			會員管理
			<i class="fas fa-angle-left right"></i>
		  </p>
		</a>
		<ul class="nav nav-treeview" style="display: none;">
		  <li class="nav-item">
			<a href="pages/tables/simple.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>功能1</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="pages/tables/data.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>功能2</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="pages/tables/jsgrid.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>功能3</p>
			</a>
		  </li>
		</ul>
	</li>
	<li class="nav-header">個人功能</li>
	<li class="nav-item">
		<a href="pages/calendar.html" class="nav-link">
		  <i class="nav-icon fas fa-calendar-alt"></i>
		  <p>
			功能
			<span class="badge badge-info right"></span>
		  </p>
  
		</a>
	  </li>	
	<li class="nav-item">
		<a href="#" class="nav-link">
		  <i class="nav-icon fas fa-table"></i>
		  <p>
			個人功能
			<i class="fas fa-angle-left right"></i>
		  </p>
		</a>
		<ul class="nav nav-treeview" style="display: none;">
		  <li class="nav-item">
			<a href="pages/tables/simple.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>功能1</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="pages/tables/data.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>功能2</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="pages/tables/jsgrid.html" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>功能3</p>
			</a>
		  </li>
		</ul>
	  </li>
	  <li class="nav-header">後台排班請假系統</li>
<!-- 	<li class="nav-item"> -->
<!-- 		<a href="pages/calendar.html" class="nav-link"> -->
<!-- 		  <i class="nav-icon fas fa-calendar-alt"></i> -->
<!-- 		  <p> -->
<!-- 			功能 -->
<!-- 			<span class="badge badge-info right"></span> -->
<!-- 		  </p> -->
  
<!-- 		</a> -->
<!-- 	  </li>	 -->
	<li class="nav-item">
		<a href="#" class="nav-link">
		  <i class="nav-icon fas fa-table"></i>
		  <p>
			系統功能
			<i class="fas fa-angle-left right"></i>
		  </p>
		</a>
		<ul class="nav nav-treeview" style="display: none;">
		  <li class="nav-item">
			<a href="${contextRoot}/semps/insertpage" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>新增分店員工</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="${contextRoot}/semps/all" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>分店員工管理</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="${contextRoot}/sempsatt/all" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>請假簽核</p>
			</a>
		  </li>
		  <li class="nav-item">
			<a href="${contextRoot}/sempsche/showpage" class="nav-link">
			  <i class="far fa-circle nav-icon"></i>
			  <p>排班</p>
			</a>
		  </li>
		</ul>
	  </li>